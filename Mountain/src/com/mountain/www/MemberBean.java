package com.mountain.board;

import java.sql.Timestamp;
import java.util.Date;

public class MemberBean {
	
	private int num;
	private String id;
	private String pass;
	private String email;
	private String address;
	private double sw;
	private double ne;
	private String gender;
	private String fab_mt;
	private Timestamp reg_date;
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getSw() {
		return sw;
	}
	public void setSw(double sw) {
		this.sw = sw;
	}
	public double getNe() {
		return ne;
	}
	public void setNe(double ne) {
		this.ne = ne;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getFab_mt() {
		return fab_mt;
	}
	public void setFab_mt(String fab_mt) {
		this.fab_mt = fab_mt;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "MemberBean [num=" + num + ", id=" + id + ", pass=" + pass + ", email=" + email + ", address=" + address
				+ ", sw=" + sw + ", ne=" + ne + ", gender=" + gender + ", fab_mt=" + fab_mt + ", reg_date=" + reg_date
				+ "]";
	}
	
	
	
}
