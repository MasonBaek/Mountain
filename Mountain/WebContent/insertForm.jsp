<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/mountain.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;&display=swap" rel="stylesheet">
<script src="js/jquery-3.6.0.js"></script>
<link rel=”stylesheet” href=”css/jquery-ui.css”>
<script src=”js/jquery.js”></script>
<script src=”js/jquery-ui.js”></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<style>
.body{font-family:Nanum Gothic, sans-serif;
}
#bg {  position: fixed;   top: -50%;   left: -50%;   width: 200%;   height: 200%; }
#bg img { position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto; min-width: 50%;min-height: 50%; }
form {background-color: rgb(0, 150, 125, 0.5); margin:1% 25% 0% 25%;padding:0; position:relative;
top:50%; width: 50%; height: 700px; border: 3px solid #f1f1f1;}
.head_container {width:50%; height:5vw; text-align:center; justify-content: center; align-items: center; border-radius: 1vw 3vw 3vw 3vw;
 margin: 5% 25% 2% 25%; padding:1vh 1vh 1vh 1vh ; border : 2px solid #cf0; background-color: rgb(255, 255, 255, 0.5); font-size:4vw; }
input[type=text], input[type=password]{ width: 100%; display: block; height : 30px;
 border: 1px solid #ccc; box-sizing: border-box; font-weight: 200; border-radius: 5px; }
input[type=password] not:placeholder { width: 100%; margin: 0; display: block; border: 1px solid #ccc;
 box-sizing: border-box; font-weight: 300; letter-spacing: 3px; }
.container { width:75%; height:70% }
.insert_inner_container { width: 100%; margin-left:15%; margin-right:15%; margin-bottom:1%; }
.container_etc { height : 20%; text-align: center; }
.insert_button{ float:left; border:3px solid #000; background-color: #e0e0e0; }
.cancel_button{ float:right; border:3px solid #f00; background-color: #fcbbd0; }
.insert_button:hover { cursor: pointer; color: #ffffff; background-color: #000000; }
.cancel_button:hover { cursor: pointer; color: #ffffff; background-color: #f00; }
.button_base { color: #000000; padding: 10px; margin: 2vw 5px 50px 5px; font-size: 2.5vw; font-weight:900;
 width: 15vw; height: 7vw; border-radius:3px 10px 10px 10px; vertical-align: center; box-sizing: border-box;
 -webkit-box-sizing: border-box; -moz-box-sizing: border-box; -webkit-user-select: none; cursor: default; }
i {font-size: 0.8vw; background-color: rgb(255, 255, 255, 0.5);}
.inner_5{ border:2px solid #000; border-radius: 5px; text-align: center; }
.inner_6{ border:2px solid #000; border-radius: 5px; }
#search_address { float:right; font-size:1.2vw; font-weight:900; height:3vw; width: 18% }
.wrong_caution {display:none; font-size: 1vw; color: red; }
</style>
<script type="text/javascript">
	$(document).ready(function() {
		 $('#fr').submit(function(){
			 if($('#id').val() == ""){
				 alert('아이디 입력하시오!');
				 $('#id').focus();
				 // document.myfm.id.focus();  (자바스크립트)
				 return false;
			 }
			 if($('.error').val() == ""){
				 alert('비밀번호를 입력하시오!');
				 $('#insert_pass').focus();
				 return false;
			 }
			 if($("input:checkbox[name=is_check]:checked").length==0){
				 alert('산을 하나 이상 선택해주세요 !');
				 $('#inner_6').focus();
				 // document.myfm.id.focus();  (자바스크립트)
				 return false;
				}
		 }); 	
		 $('#insert_pass').on('blur', function(){
			var pw = $('#insert_pass').val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@#$%^&*()]/gi);
			if(pw.length < 8 || pw.length > 20){
				alert('8자리 ~ 20자리 이내로 입력해주세요.');
				setTimeout(function(){ $('#insert_pass').focus(); }, 10);
				return false;
			} else if(pw.search(/\s/) != -1){
				alert('비밀번호는 공백 없이 입력해주세요.');
				setTimeout(function(){ $('#insert_pass').focus(); }, 10);
				return false;
			} else if(num < 0 || eng < 0 || spe < 0 ){
				alert('영문,숫자, 특수문자를 혼합하여 입력해주세요.');
				setTimeout(function(){ $('#insert_pass').focus(); }, 10);
				return false;
			}else {
				return true;
			}
		 });
		 $('#insert_pass_check').on('blur', function(){
			var pw = $('#insert_pass').val();
			var pwck = $('#insert_pass_check').val();
			if(pw != pwck){
				$('.error').css('border','2px solid #F00');
				$('.error').effect('shake',700);
				$('.wrong_caution').show();
				$('.basic_caution').hide();
			}
			if(pw == pwck){
				$('.error').css('border','1px solid #ccc');
				$('.wrong_caution').hide();
				$('.basic_caution').show();
			}
		 });
		 
	});
	
</script>
</head>
<body>
<div id="bg">
  <img src="img/fruits.png">
</div>
<form action="login_pro.jsp" method="post" id="fr">
	<div class="head_container">
		회원가입
	</div>

	<div class="container">
		<div class="insert_inner_container inner_1">
			<label for="id"><b>아이디</b></label><br>
			<input type="text" placeholder="아이디" name="id" required>
		</div>
		<div class="insert_inner_container inner_2">
			<label for="pass"><b>비밀번호</b> <i class="basic_caution">8~20자리 영문,숫자, 특수문자 </i><i class="wrong_caution">서로 같은 비밀번호를 입력하세요 </i> </label><br>
			<input type="password" placeholder="비밀번호" name="pass" id="insert_pass" class="error" required>
			<label for="pass_chk" ><b>비밀번호 재입력</b></label><br>
			<input type="password" placeholder="비밀번호 확인"  name="pass_chk" id="insert_pass_check" class="error" required>
			<span></span>
		</div>
		<div class="insert_inner_container inner_3">
			<label for="address"><b>주소</b></label><br>
			<input type="text" placeholder="주소" name="address" id="address" readonly="readonly">
			<input type="button" onclick="execDaumPostcode();" name="address" id="search_address" value="주소검색"><br>
		</div>
		<div class="insert_inner_container inner_4">
			<label for="email"><b>e-Mail</b></label><br>
			<input type="text" placeholder="이메일" name="email" required>
		</div>
		<div class="insert_inner_container inner_5">
			<br>
			<input type="radio" name="gender" value="m" required> 남 &nbsp; &nbsp;
			<label for="gender"><b>성별</b></label> &nbsp; &nbsp;
			 여 <input type="radio" name="gender" value="f" required>
			<br>
		</div>
		<br>
		<div class="insert_inner_container inner_6">
			<label for="fab_mt"><b>&nbsp;&nbsp;즐겨 찾는 산</b></label><br>&nbsp;&nbsp;
			<input type="checkbox" name="fab_mt" value="baek_du" required> 백두산&nbsp;
			<input type="checkbox" name="fab_mt" value="halla" required> 한라산 &nbsp;
			<input type="checkbox" name="fab_mt" value="jili" required> 지리산<br>&nbsp;&nbsp;
			<input type="checkbox" name="fab_mt" value="yeom" required> 염산 &nbsp; &nbsp;
			<input type="checkbox" name="fab_mt" value="bingcho" required> 빙초산
		</div>
	</div>
	
	<div class="container_etc" style="background-color:#f1f1f1">
    	<div class="back">
            <div class="button_base insert_button" onsubmit="">회원가입</div>
        </div>
        <div class="back">
            <div class="button_base cancel_button" onclick="location.href='index.jsp'">취소</div>
        </div>
	</div>
</form>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
				
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                }
                document.getElementById("address").value = addr+"_"+data.zonecode+"_"+extraAddr;
           }
        }).open();
    }
</script>	
</body>
</html>
