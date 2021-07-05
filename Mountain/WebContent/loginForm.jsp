<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@700&display=swap" rel="stylesheet">
<style type="text/css">
body {	font-family: 'Nanum Gothic', sans-serif; float: center;}
form {
width :70%;
height: 80;
position:absolute; 
border: 3px solid #f1f1f1;
margin:10% 20% 10% 20%;
}
input[type=text], input[type=password] {
  width: 60%;
  padding: 12px 20px;
  margin: 0;
  display: block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  font-weight: 300;
}
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
button:hover {
  opacity: 0.8;
}
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}
.imgcontainer {
  width:60%;
  text-align: center;
  margin: 24px 0 12px 0;
}
.container {
  width:60%;
  padding: 16px;
  align-items: center;
}
.container_etc{
	border-top: 1px solid #e6e6e6;
  padding: 16px;
}
span.forgot_pass {
  float: right;
  padding-top: 16px;
  padding-right: 70px;
}
.inner_container{
	float:none;
	align-items: center;
	display : block;
	justify-content: center;
	position:relative;
}
b {font-size: 1.2em;}

</style>
</head>
<body>
	
<form action="login_pro.jsp" method="post">
	<div class="imgcontainer">
		<img src="img/mountain.png">
	</div>

	<div class="container">
		<div class="inner_container">
			<label for="id"><b>아이디</b></label><br>
			<input type="text" placeholder="아이디" name="id" required>
		</div>
		<div class="inner_container">
			<label for="pass"><b>비밀번홍</b></label><br>
			<input type="password" placeholder="비밀번호" name="pass" required>
		</div>
		<div class="inner_container">    
			<button type="submit">로그인</button><br>
			<label><input type="checkbox" checked="checked" name="cookie"> 자동 로그인</label>
		</div>
	</div>
		
	<div class="container_etc" style="background-color:#f1f1f1">
		<button type="button" class="cancelbtn" onclick="location.href='index.jsp';">취소</button>
		<span class="forgot_pass">비밀번호 <a href="#">까먹었슴둥?</a></span>
	</div>
</form>

</body>
</html>