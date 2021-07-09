<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;&display=swap" rel="stylesheet">
<link href="css/mountain.css" rel="stylesheet">
<link href=”css/jquery-ui.css” rel=”stylesheet”>
<link href=”css/jquery-ui.structure.css” rel=”stylesheet”>
<link href=”css/jquery-ui.theme.css” rel=”stylesheet”>
<script src="js/jquery-3.6.0.js"></script>
<script src=”js/jquery.js”></script>
<script src=”js/jquery-ui.js”></script>
<style>
.body{font-family:Nanum Gothic, sans-serif;}
#bg {  position: fixed;   top: -50%;   left: -50%;   width: 200%;   height: 200%; }
#bg img { position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto; min-width: 50%;min-height: 50%; }
form {background-color: rgb(0, 150, 125, 0.5); margin:1% 25% 0% 25%;padding:0; position:relative;
top:50%; width: 50%; height: 700px; border: 3px solid #a1a1a1;border-radius: 0.5vw 4.5vw 4.5vw 4.5vw;}
.head_container {width:50%; height:5vw; text-align:center; justify-content: center; align-items: center; border-radius: 0.5vw 4.5vw 4.5vw 4.5vw;
 margin: 5% 25% 2% 25%; padding:1vh 1vh 1vh 1vh ; border : 2px solid #cf0; background-color: rgb(255, 255, 255, 0.5); font-size:4vw; }
input[type=text], input[type=password]{ width: 100%; display: block; height : 30px;
 border: 1px solid #ccc; box-sizing: border-box; font-weight: 200; border-radius: 5px; }
input[type=password] not:placeholder { width: 100%; margin: 0; display: block; border: 1px solid #ccc;
 box-sizing: border-box; font-weight: 300; letter-spacing: 3px; }
.container { width:75%; height:70% }
.insert_inner_container { width: 100%; margin-left:15%; margin-right:15%; margin-bottom:1%; }
.container_etc { height : 20%; text-align: center; vertical-align:center; background-color: a1a1a1;padding-bottom: 3%}
.insert_button_div{margin-left: 10%}
.cancel_button_div{margin-right: 12%}
.insert_button{ float:left; border:2px solid #000; background-color: #e0e0e0;}
.cancel_button{ float:right; border:2px solid #f00; background-color: #fcbbd0;}
.insert_button:hover { cursor: pointer; color: #ffffff; background-color: #000000;}
.cancel_button:hover { cursor: pointer; color: #ffffff; background-color: #f00; }
.button_base { color: #000000; padding: 10px; margin: 2vw 5px 50px 5px; font-size: 2.5vw; font-weight:900;
 width: 15vw; height: 7vw; border-radius:2px 10px 10px 10px; vertical-align: center; box-sizing: border-box;
 -webkit-box-sizing: border-box; -moz-box-sizing: border-box; -webkit-user-select: none; cursor: default; }
i {font-size: 1.2vw; background-color: rgb(255, 255, 255, 0.5);}
.inner_5{ margin-top:20px; border:2px solid #000; border-radius: 5px; text-align: center; padding: 10px 0 10px 0; }
.inner_6{ border:2px solid #000; border-radius: 5px; }
#search_address { float:right; font-size:1.2vw; font-weight:900; height:3vw; width: 18% }
.caution {display:none; font-size: 1.2vw; color: red; }
</style>
<script type="text/javascript">
	function check_pass(){
		var pw = $('#pass').val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@#$%^&*()]/gi);
		if(pw.length < 8 || pw.length > 20){
			alert('8자리 ~ 20자리 이내로 입력해주세요.');
			setTimeout(function(){ $('#pass').focus(); }, 3);
			return false;
		} else if(pw.search(/\s/) != -1){
			alert('비밀번호는 공백 없이 입력해주세요.');
			setTimeout(function(){ $('#pass').focus(); }, 3);
			return false;
		} else if(num < 0 || eng < 0 || spe < 0 ){
			alert('영문,숫자, 특수문자를 혼합하여 입력해주세요.');
			setTimeout(function(){ $('#pass').focus(); }, 3);
			return false;
		}
		return true;
	}
	function check_pass_both(){	
		var pw = $('#pass').val();
		var pwck = $('#pass_check').val();
		if(pw != pwck){
			$('.error').css('border','2px solid #F00');
			$('.wrong_caution').show();
			$('.basic_caution').hide();
			return false;
		}else if(pw == pwck){
			$('.error').css('border','1px solid #ccc');
			$('.wrong_caution').hide();
			$('.basic_caution').show();
			return false;
		}
		return true;
	}
	function check_id(){
		if($('#id').val() == ""){
			$('#id').css('border','2px solid #F00'); 
			$('.id_caution').show();
			return false;
		}else if($('#id').val() != ""){
			$('#id').css('border','1px solid #ccc');
			$('.id_caution').hide();
			return false;
		}
		return true;
	}
	function check_email_format(str) {                                                 
		var reg_email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(!reg_email.test(str)) { return false;}                            
		else { return true; }                            
	}
	function check_email(){
		var mail= document.getElementById("email");
		if(!mail.value){
			$('.email_caution').show();
			$('#email').css('border','2px solid #F00');
			return false;
		}else if(mail.value){
			$('.email_caution').hide();
			$('#email').css('border','1px solid #ccc');
			if(!check_email_format(mail.value)){
				$('.format_caution').show();
				$('#email').css('border','2px solid #F00');
				return false;
			}else if(check_email_format(mail.value)){
				$('.format_caution').hide();
				$('#email').css('border','1px solid #ccc');
				return true;
			}
		}
		return true;
	}
	$(document).ready(function() {
		$('#id').on('blur', function(){
			check_id();
		});
		$('#pass').on('blur', function(){
			check_pass();
		});
		$('#pass_check').on('blur', function(){
			check_pass_both();
		});
		$('#email').on('blur', function(){
			check_email();
		});
	});
	
</script>
</head>
<body>

<div id="bg">
  <img src="img/fruits.png">
</div>

<form action="insert_pro.jsp" method="post" id="fr">
	<div class="head_container">
		회원가입
	</div>

	<div class="container">
		<div class="insert_inner_container inner_1">
			<label for="id"><b>아이디</b><i class="id_caution caution">아이디를 입력하세요 </i></label><br>
			<input type="text" placeholder="아이디" name="id" id="id" class="insert_id" required>
		</div>
		<div class="insert_inner_container inner_2">
			<label for="pass"><b>비밀번호</b> <i class="basic_caution">8~20자리 영문,숫자, 특수문자 </i>
			<i class="wrong_caution caution">서로 같은 비밀번호를 입력하세요 </i> </label><br>
			<input type="password" placeholder="비밀번호" name="pass" id="pass" class="error" required>
			<label for="pass_chk" ><b>비밀번호 재입력</b></label><br>
			<input type="password" placeholder="비밀번호 확인"  name="pass_check" id="pass_check" class="error" required>
		</div>
		<div class="insert_inner_container inner_4">
			<label for="email"><b>e-Mail</b><i class="email_caution caution">이메일을 입력하세요 </i>
			<i class="format_caution caution">e-Mail형식이 잘못되었습니다. </i></label><br>
			<input type="text" placeholder="이메일" name="email" id="email" required>
		</div>
		<div class="insert_inner_container inner_3">
			<label for="address"><b>주소</b></label><br>
			<input type="text" placeholder="주소" name="address" id="address" readonly="readonly">
			<input type="button" onclick="execDaumPostcode();" id="search_address" value="주소검색"><br>
		</div>
		
		<div class="insert_inner_container inner_5">
			<label for="gender"><b>성별</b></label>
			<input type="radio" name="gender" value="m" class="box" required>남
			<input type="radio" name="gender" value="f" class="box" required>여
			<br>
		</div>
		<br>
		<div class="insert_inner_container inner_6">
			<p><b>&nbsp;&nbsp;즐겨 찾는 산&nbsp;&nbsp;</b></p>
			<label for="fab_mt_1">백두산<input type="checkbox" name="fab_mt" id="fab_mt_1" class="box" value="baek_du" required></label>
			<label for="fab_mt_2">한라산<input type="checkbox" name="fab_mt" id="fab_mt_2" class="box" value="halla" required></label>
			<label for="fab_mt_3">지리산<input type="checkbox" name="fab_mt" id="fab_mt_3" class="box" value="jili" required></label><br>
			<label for="fab_mt_4">염 산<input type="checkbox" name="fab_mt" id="fab_mt_4" class="box" value="yeom" required></label>
			<label for="fab_mt_5">빙초산<input type="checkbox" name="fab_mt" id="fab_mt_5" class="box" value="bingcho" required></label>
		</div>
	</div>
	
	<div class="container_etc">
    	<div class="insert_button_div" onclick="check_go();">
            <div class="button_base insert_button">회원가입</div>
        </div>
        <div class="cancel_button_div">
            <div class="button_base cancel_button" onclick="location.href='index.jsp'">취소</div>
        </div>
	</div>
</form>
<script type="text/javascript">
function check_go() {
	check_id();
	check_pass();
	check_pass_both();
	check_email();
	var addr = document.getElementById("address");
	if(!addr.value){
		alert("주소입력 해주세요");
		$(function(){execDaumPostcode();});
		return false;
	}
	if($(':radio[name="gender"]:checked').length < 1){
		alert('자웅동체이신가요? 그냥 아무거나 선택해 주세요');
		return false;
	}
	if($(':checkbox[name="fab_mt"]:checked').length < 1){
		alert('좋아하는 산이 없으신가요? 그래도 예의상 하나 체크해주세요'); 
		return false;
	}
	$('form[id="fr"]').submit();
}

</script>	
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