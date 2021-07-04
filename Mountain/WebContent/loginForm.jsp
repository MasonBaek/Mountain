<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@700&display=swap" rel="stylesheet">
<style type="text/css">
body {	font-family: 'Sunflower', sans-serif;
}
form {
width :60%;
height: 80;
position:absolute; 
display : block;
justify-content:center;
align-items: center;
border: 3px solid #f1f1f1;
margin:5% 20% 5% 20%;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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
  width:50%;
  text-align: center;
  margin: 24px 0 12px 0;
}
.container {
  width:50%;
  padding: 16px;
}
.container_etc{
  padding: 16px;
}
span.pw {
  float: right;
  padding-top: 16px;
  padding-right: 100px;
}
.inner_container{
	align-items: center;
	display : block;
	justify-content: center;
}
b{
font-size: 1.5em;}
</style>
</head>
<body>
	

<form action="login_pro.jsp" method="post">
	<div class="imgcontainer">
		<img src="img/mountain.png">
	</div>

	<div class="container">
		<div class="inner_container">
			<label for="uname"><b>아이디</b></label>
			<input type="text" placeholder="아이디" name="uname" required>
		</div>
		<div class="inner_container">
			<label for="pw"><b>비밀번홍</b></label>
			<input type="password" placeholder="비밀번호" name="pw" required>
		</div>
		<div class="inner_container">    
			<button type="submit">로그인</button>
			<label><input type="checkbox" checked="checked" name="cookie"> 자동 로그인</label>
		</div>
	</div>
		<hr>
	<div class="container_etc" style="background-color:#f1f1f1">
		<button type="button" class="cancelbtn" onclick="location.href='index.jsp';">취소</button>
		<span class="pw">비밀번호 <a href="#">까먹었잖슴?</a></span>
	</div>
</form>

</body>
</html>