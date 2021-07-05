<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<%
String id = "root";
String pass = "1234";
String PORTNO = "3306";
String DBNAME = "sakila";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:"+PORTNO+"/"+DBNAME, id, pass);
if(conn!=null){
	out.println("연결");
	conn.close();
	out.println("연결 종료");
}else {
	out.println("연결 불가");
}


%>