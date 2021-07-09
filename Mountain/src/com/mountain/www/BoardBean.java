package com.mountain.board;

import java.sql.Timestamp;

public class BoardBean {
	
	private int num;
	private String id;
	private String subject;
	private String content;
	private int readcount;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private String ip;
	private String file;
	private Timestamp write_date;
	
	
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "BoardBean [num=" + num + ", id=" + id + ", subject=" + subject + ", content=" + content + ", readcount="
				+ readcount + ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", re_seq=" + re_seq + ", write_date="
				+ write_date + ", ip=" + ip + ", file=" + file + "]";
	}


	
	
	
		
	
}
