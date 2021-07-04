<html>
<head>
<style type="text/css">
.main_map {float:left;
width:50%;height:100%; border-right:1px solid #b8b8b8;
margin-right:-1px; overflow-y:fixed;}
.centre_line {float:left;width:4px;height:100%;background-color:#888888;border-left-color: white;border-left-width:1px;border-right-color: white;border-right-width: 1px; }
.timeline_board {float:left;width:49%;height:100%;overflow-y:scroll;}

#vertical_line {cursor:e-resize;}
</style>
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
  var width = window.body.innerWidth/2;
  if (diffpos > -(width-range) && diffpos < (width-range)) {
   document.getElementById("main_map").style.width = width - diffpos + "px";
   document.getElementById("timeline_board").style.width = width - 20 + diffpos + "px"; 
  }
 }
}

function init() {
 document.getElementById("vertical_ilne").onmousedown = on_mouse_down;
 document.onmouseup = on_mouse_up;
 document.onmousemove = on_mouse_move;
}
</script>
</head>
<body onload="init()">

</body>
</html>
