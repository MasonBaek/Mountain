<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title> &#127748; 산 </title>
<link href="css/mountain.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@700&display=swap" rel="stylesheet">
<script src="../js/jquery-3.6.0.js"></script>
<%
	String id = request.getParameter("id");
%>
<script type="text/javascript">
var startpos, diffpos=0, range=50;
var isEnable = false;
function on_mouse_down(e) {
 startpos = event.clientX + diffpos;
 isEnable = true;
 return false;
}
function on_mouse_up(e) {
 isEnable = false;
 return false;
}
function on_mouse_move(e) {
 if (isEnable) {
  pos = event.clientX;
  diffpos = startpos-pos;
  var width = window.innerWidth/2;
  if (diffpos > -(width-range) && diffpos < (width-range)) {
   document.getElementById("left_map").style.width = width - diffpos + "px";
   document.getElementById("timeLine").style.width = width -20 + diffpos + "px"; 
  } 
 }
}
function init() {
 document.getElementById("vertical_line").onmousedown = on_mouse_down;
 document.onmouseup = on_mouse_up;
 document.onmousemove = on_mouse_move;
}
</script>
</head>
<body onload="init();">
	<header class="header">
	 	<div class="head_left" style="border:none;">
	 		<jsp:include page="mountain.jsp"/>
	 	</div>
	 	<div class="head_right" style="border:none;">
	 		
	 		<div id="search_con">
				<input type="text" id="search_text" placeholder="검색어입력">
				<input type="button" id="search_btn" value="검색">
			</div>
	 		
	 		<%if(id==null) {%>
	 		<div id="login_insert">
				<button type="button" name="login" id="login">로그인</button>
					
				<button type="button" name="insert" id="insert">회원가입</button>
			</div>
	 		<%} else {%>
				<%--<jsp:include page="welcome.jsp"/> --%>
	 		<%} %>
	 	
	 		
	 	</div>
	 	
	</header>
	<article>
	<div id="contents">
		<div id="left_map"><jsp:include page="map.jsp"/></div>
		<div id="vertical_line"></div>
		<div id="timeLine"><jsp:include page="timeLine.jsp"/></div>
	</div>
	</article>
</body>
</html>

