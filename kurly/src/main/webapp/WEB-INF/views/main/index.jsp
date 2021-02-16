<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="fifth">
	<img src="../resources/img/5f.png" width="1100">
</div>
<div id="sixth">
	<img src="../resources/img/6f.png" width="1100">
</div>
<div id="seventh">
	<img src="../resources/img/7f.png" width="1100">
</div>
<style>
#pkc {
	position:absolute;
	left:1150px;
	top:300px;
	width:100px;
	height:100px;
	background: red;
}
</style>
<script>
	function change()
	{
		var chk = document.documentElement.scrollTop
		document.getElementById('aa').innerText=chk+"px"
		
		if(chk>=160)
		{
			document.getElementById('pkc').style.position="fixed";
			document.getElementById('pkc').style.top="140px";
		}
		else
		{
			document.getElementById('pkc').style.position="absolute";
			document.getElementById('pkc').style.top="300px";
		}
		
	}
	function change2()
	{
		var w=window.innerWidth;
		w = w-1100
		if(w>0)
		{
			w = w/2
			document.getElementById('pkc').style.left=w+1100+"px";	
		}
		
	}
	window.onscroll = change;
	window.onload = change2;
	window.onresize = change2;
</script>
<div id="pkc">
따라다니기!<span id="aa"></span>
</div>