package com.mountain.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";

	//getCon()
	private Connection getCon() throws Exception{ 
		Context initCTX = new InitialContext();
		DataSource ds
		= (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		System.out.println("DAO : getCon 성공 ");
		return con;
	}
	public void closeDB(){
		try {
			if(rs != null )rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void insertBoard(BoardBean bb) {
		int board_num = 0;
		try {	
			Connection con = getCon();
			String sql = "select max(board_num) from mountain_board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				board_num = rs.getInt(1)+1;
			}
			System.out.println("DAO : 글번호 : "+board_num);
			sql = "insert into mountain_board (board_num, name,pass,subject,content,"
					+"readcount,re_ref,re_lev,re_seq,date,ip,file)"
					+"values(?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, 0); // 조회수 0
			pstmt.setInt(5, board_num); // re_ref 답글 그룹번호 / 일반글번호 == 그룹번호
			pstmt.setInt(6, 0);  // re_lev 답글 들여쓰기 / 일반글 들여쓰기없음(0)
			pstmt.setInt(7, 0); // re_seq 답글 순서 / 일반글 0
			pstmt.setString(8, bb.getIp());
			pstmt.setString(9, bb.getFile());
			
			pstmt.executeUpdate();
			System.out.println("DAO : 게시글 작성 완료 ! ");
			
		} catch (ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("DAO : 드라이버 로드 실패 ! ");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO : 디비 연결 실패 ! ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();		
		}
	}
	// getBoardCount() ---------
	public int getBoardCount() {
		int cnt = 0;
		
		try {
			con = getCon();
			
			sql = "select count(board_num) from mountain_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt=rs.getInt(1);
			}
			System.out.println("DAO : 글 개수 확인" + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return cnt;
	}
	// getBoardCount() ---------

	// getBoardList()
	public ArrayList<BoardBean> getBoardList(){
		ArrayList<BoardBean> boardList = null;
		try {
			con = getCon();
			sql = "select * from mountain_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bb = new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setWrite_date(rs.getTimestamp("Write_date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setId(rs.getString("id"));
				bb.setBoard_num(rs.getInt("board_num"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;
	}
	// getBoardList()
	
	// getBoardList(startRow, pageSize)
	public ArrayList<BoardBean> getBoardList(int startRow, int pageSize){
		ArrayList<BoardBean> boardList = null;
		try {
			con = getCon();
			sql = "select * from mountain_board order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bb = new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setWrite_date(rs.getTimestamp("Write_date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setId(rs.getString("id"));
				bb.setBoard_num(rs.getInt("board_num"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
								
				boardList.add(bb);
			}
			System.out.println("DAO : 게시판글 저장완료(페이징처리)");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;
	}
	// getBoardList(startRow, pageSize)
	
	// updateReadcount(board_num)
		public void updateReadcount(int board_num){
			try {
				con = getCon();
				sql = "update mountain_board set readcount=readcount+1 where board_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				pstmt.executeUpdate();
				System.out.println("DAO : 글 조회수 1증가 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	// updateReadcount(board_num)
	// getBoard(board_num)
		public BoardBean getBoard(int board_num){
			BoardBean bb = null;
			try {
				con = getCon();
				sql = "select * from mountain_board "
						+ "where board_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bb = new BoardBean();
					bb.setContent(rs.getString("content"));
					bb.setWrite_date(rs.getTimestamp("write_date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					bb.setId(rs.getString("id"));
					bb.setBoard_num(rs.getInt("board_num"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));
				}
				System.out.println("DAO : 글 정보 불러오기 완료");
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return bb;
		}
	// getBoard(board_num)
	// updateBoard(bb)
		public boolean updateBoard(BoardBean bb){
			boolean check = false ;
			try {
				con = getCon();
				sql = "select id from mountain_board "
						+ "where board_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bb.getId());
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(bb.getId().equals(rs.getString("id"))){
						sql = "update mountain_board set subject=?, content=? "
								+ "where board_num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bb.getSubject());
						pstmt.setString(2, bb.getContent());
						pstmt.setInt(3, bb.getBoard_num());
						pstmt.executeUpdate();
						check = true;
						System.out.println("DAO : 글 수정 완료");
					}
				}else {
					check = false;// 글 정보 없음
				}
				System.out.println("DAO : 글 수정");
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return check;
		}
	// updateBoard(bb);
	// deleteBoard(bb)
		public int deleteBoard(int board_num , String pass){
			int check = -1 ;
			try {
				con = getCon();
				sql = "select pass from mountain_board where board_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(pass.equals(rs.getString("pass"))){
						sql = "delete from mountain_board where board_num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, board_num);
						pstmt.executeUpdate();
						check = 1;
						System.out.println("DAO : 글 삭제 완료");
					}else{
						System.out.println("비밀번호 오류");
						check=0;
					}
				}else{
					System.out.println("해당정보없음");
					check=-1;
				}
			} catch (Exception e) {

				e.printStackTrace();
			}finally{
				closeDB();
			}
			return check;
		}
	// deleteBoard(bb)
	// reWriteBoard(bb)
		public void reInsertBoard(BoardBean bb){
			int board_num = 0;
			try {
				con = getCon();
				sql = "select max(board_num) from mountain_board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					board_num = rs.getInt(1)+1;
				}
				System.out.println("DAO : 답글 번호 계산" + board_num);
				////답글 순서 재배치
				sql = "update mountain_board set re_seq = (re_seq + 1) "
						+ "where re_ref=? and re_seq>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bb.getRe_ref());
				pstmt.setInt(2, bb.getRe_seq());
				pstmt.executeUpdate();
				////답글 저장
				sql = "insert into mountain_board values(?,?,?,?,?,"
						+ "?,?,?,?,now(),"
						+ "?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				pstmt.setString(2, bb.getId());
				pstmt.setString(3, bb.getSubject());
				pstmt.setString(4, bb.getContent());
				pstmt.setInt(5, bb.getReadcount());
				pstmt.setInt(6, bb.getRe_ref()); // re_ref : 원글의 그룹번호와 동일
				pstmt.setInt(7, bb.getRe_lev()+1); // re_lev : 원글의 들여쓰기 +1; 
				pstmt.setInt(8, bb.getRe_seq()+1); // re_seq : 순서대로 기존의값 +1;
				pstmt.setString(9, bb.getIp());
				pstmt.setString(10, bb.getFile());
				pstmt.executeUpdate();
				System.out.println("DAO : 답글 작성완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				closeDB();
			}
		}
	// reWriteBoard(bb)
}
