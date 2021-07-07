<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/mountain.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;&display=swap" rel="stylesheet">
<script src="../js/jquery-3.6.0.js"></script>
<style>
.body{font-family:Nanum Gothic, sans-serif;
}
#bg {
  position: fixed; 
  top: -50%; 
  left: -50%; 
  width: 200%; 
  height: 200%;
}
#bg img {
  position: absolute; 
  top: 0; 
  left: 0; 
  right: 0; 
  bottom: 0; 
  margin: auto; 
  min-width: 50%;
  min-height: 50%;
}
form {background-color: rgb(255, 255, 0, 0.5);
margin:10% 25% 0% 25%;padding:0;
position:relative;
top:50%;
width: 50%;
height: 600px;
border: 3px solid #f1f1f1;}
.head_container {width:50%;
    height:7.5vw;
    text-align:center;
    justify-content: center;
    align-items: center;
    border-radius: 1vw 3vw 3vw 3vw;
    margin: 5% 25% 7% 25%;
    padding:1vh 1vh 1vh 1vh ;
    border : 2px solid #cf0;
    background-color:white;
    font-size:5vw;}
input[type=text], input[type=password] {
  width: 100%;
  display: block;
  height : 35px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  font-weight: 200;
}
input[type=password] not:placeholder {
  width: 100%;
  margin: 0;
  display: block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  font-weight: 300;
  letter-spacing: 3px;
}
.container {
    width:75%;
    height:60%
}
.insert_inner_container {
	width: 100%;
    margin-left:15%;
    margin-right:15%;
}
.container_etc {
    height : 20%;
    text-align: center;
}
.insert_button{
    float:left;
    border:3px solid #000;
    background-color: #e0e0e0;
}
.cancel_button{
    float:right;
    border:3px solid #f00;  
    background-color: #fcbbd0;
}

.insert_button:hover {
    cursor: pointer;
    color: #ffffff;
    background-color: #000000;
}
.cancel_button:hover {
    cursor: pointer;
    color: #ffffff;
    background-color: #f00;
}
.button_base {
    color: #000000;
    padding: 10px;
    margin: 2vw 5px 50px 5px;
    font-size: 2.5vw;
    font-weight:900;
    width: 15vw;
    height: 7vw;
    border-radius:3px 10px 10px 10px;
    vertical-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}

</style>
</head>
<body>
<div id="bg">
  <img src="img/fruits.png">
</div>
<form action="login_pro.jsp" method="post">
	<div class="head_container">
		회원가입
	</div>

	<div class="container">
		<div class="insert_inner_container inner_1">
			<label for="id"><b>아이디</b></label><br>
			<input type="text" placeholder="아이디" name="id" required>
		</div>
		<div class="insert_inner_container inner_2">
			<label for="pass"><b>비밀번호</b></label><br>
			<input type="password" placeholder="비밀번호" name="pass" id="insert_pass" class="error"required>
			<label for="pass"><b>비밀번호 재입력</b></label><br>
			<input type="password" placeholder="비밀번호 확인" name="pass" id="insert_pass_repeat" required>
			<span></span>
		</div>
		<div class="insert_inner_container inner_3">
			<label for="add"><b>주소</b></label><br>
			<input type="text" placeholder="주소" name="add" required>
		</div>
		<div class="insert_inner_container inner_4">
			<label for="email"><b>e-Mail</b></label><br>
			<input type="text" placeholder="이메일" name="email" required>
		</div>
	</div>
	
	<div class="container_etc" style="background-color:#f1f1f1">
    	<div class="back">
            <input type="submit" class="button_base insert_button" value="회원가입">
        </div>
        <div class="back">
            <div class="button_base cancel_button" onclick="location.href='index.jsp'">취소</div>
        </div>
	</div>
</form>
	
</body>
</html>
