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
     background:red;
   }
  </style>
   
  <script>
   $(function()
   {
	   $(window).scroll(function()
	   {
		   var chk=$(window).scrollTop();
	       $("#aa").text(chk+"px");	
	       if(chk>=160)
	       {
	    	   $("#pkc").css("position","fixed");
	    	   $("#pkc").css("top","140px");
	       }
	       else
	       {
	    	   $("#pkc").css("position","absolute");
	    	   $("#pkc").css("top","300px");
	       }	   
	   });
   
 
	   $(window).resize(function()
	   {
		    var w=$(window).width();
	      	w=w-1100; // 웹페이지 공간을 제외한 브라우저의 가로크기
	      	if(w>0) // pkc의 left값을 변경시켜준다..
	      	{
	      		w=w/2;
	      		$("#pkc").css("left",(w+1100)+"px");
	      	}	
	   });
 
   });
  </script>
  <div id="pkc">
     따라다니기!! <span id="aa"></span>
  </div>