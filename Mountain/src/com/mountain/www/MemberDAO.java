package com.mountain.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	//Data Access Object => mountain_member 테이블에 관련된 정보처리객체
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
	//getCon()

	//closeDB()
	public void closeDB(){
		try {
			if(rs != null )rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//closeDB()
	
	//insertMember
	public void insertMember(MemberBean mb) {
		int member_num = 0; // 계산된 글번호 저장
		try {	

			Connection con = getCon();
			String sql = "select max(member_num) from mountain_member";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				member_num = rs.getInt(1)+1;
			}
			System.out.println("DAO : 글번호 : "+member_num);
	
			sql = "insert into mountain_member (member_num, id, pass, email, address, sw, ne, gender, fab_mt, reg_date) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, reg_date)";
					
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setString(2, mb.getId());
			pstmt.setString(3, mb.getPass());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getAddress());
			pstmt.setDouble(6, mb.getSw());
			pstmt.setDouble(7, mb.getNe());
			pstmt.setString(8, mb.getGender());
			pstmt.setString(9, mb.getFab_mt());
			
			pstmt.executeUpdate();
			System.out.println("DAO : 회원가입 완료 ! ");
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

	// checkId() ---------
	public boolean checkId(MemberBean mb) {
		boolean check = false;
		try {
			con = getCon();
			
			sql = "select id from mountain_member where=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			rs = pstmt.executeQuery();
			if(rs.next()){
				check=true;
			}
			System.out.println("DAO : 가입된 id 확인" + check);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	// checkId()
	
	// checkEmail() ---------
	public boolean checkEmail(MemberBean mb) {
		boolean check = false;
		try {
			con = getCon();
			sql = "select email from mountain_member where=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			rs = pstmt.executeQuery();
			if(rs.next()){
				check=true;
			}
			System.out.println("DAO : 가입된 email 확인" + check);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	// checkEmail()
	
	
	// getBoardList(startRow, pageSize)
	/*
	 * public ArrayList getBoardList(int startRow, int pageSize){ ArrayList
	 * boardList = new ArrayList(); try { con = getCon(); sql =
	 * "select * from mountain_member order by re_ref desc, re_seq asc limit ?,?";
	 * pstmt = con.prepareStatement(sql); pstmt.setInt(1, startRow-1);
	 * pstmt.setInt(2, pageSize); rs = pstmt.executeQuery();
	 * 
	 * while(rs.next()){ BoardBean mb = new BoardBean();
	 * mb.setContent(rs.getString("content")); mb.setDate(rs.getDate("date"));
	 * mb.setFile(rs.getString("file")); mb.setIp(rs.getString("ip"));
	 * mb.setName(rs.getString("name")); mb.setNum(rs.getInt("num"));
	 * mb.setPass(rs.getString("pass")); mb.setRe_lev(rs.getInt("re_lev"));
	 * mb.setRe_ref(rs.getInt("re_ref")); mb.setRe_seq(rs.getInt("re_seq"));
	 * mb.setReadcount(rs.getInt("readcount"));
	 * mb.setSubject(rs.getString("subject"));
	 * 
	 * boardList.add(mb); } System.out.println("DAO : 게시판글 저장완료(페이징처리)"); } catch
	 * (Exception e) { e.printStackTrace(); }finally{ closeDB(); } return boardList;
	 * }
	 */
	// getBoardList(startRow, pageSize)
	
	// pre_updateMember(mb)-------------------------------------------------------------------------
	public boolean pre_updateMember(MemberBean mb){
		boolean check = false ;
		try {
			con = getCon();
			sql = "select pass from mountain_member where=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getPass());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = true;
			}
			System.out.println("DAO : 비밀번호 확인 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	// pre_updateMember(mb);
	
	// updateMember(mb)-------------------------------------------------------------------------
	public boolean updateMember(MemberBean mb){
		boolean check = false ;
		try {
			con = getCon();
			sql = "update mountain_member set where=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getPass());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = true;
			}
			System.out.println("DAO : 비밀번호 확인 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	// updateMember(mb);
		
	// pre_changePass()
	public boolean pre_changePass(MemberBean mb) {
		boolean check = false ;
		try {
			
		} catch (Exception e) {
			
		}
		return check;
	}
	// pre_changePass()
	// changePass()
	public boolean changePass(MemberBean mb) {
		boolean check = false ;
		try {
			
		} catch (Exception e) {
			
		}
		return check;
	}
	public void deleteMember(MemberBean mb) {
		
	}
}
