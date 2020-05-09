<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>סרטונים</title>
    	<link rel="stylesheet" type="text/css" href="myStyle.css"/>
 	</head>
 	<body bgcolor="#ebebeb" vlink="blue" alink="yellow" onload="setInterval('clock1()',1000)">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
 %>	
 		<table style="width:100%; height:100%; border:2px solid blue; border-collapse:collapse;";>        
        	<tr style="height: 110px; vertical-align: middle; text-align:center "  >
            	<td colspan="2" style="height: 89px; border:2px solid blue;" dir="rtl">
            	
					<jsp:include page="title.jsp"></jsp:include>
			
				</td>
        	</tr>	
		
			<tr style="height:500px">            
            	<td  id="main"  style="width: 88%; border:2px solid blue;" dir="rtl">
                	<center>                  		
                  		<h1 align="center" style="color:blue"> סרטונים </h1>   
                  		
                  		<iframe width="640" height="360" src="http://www.youtube.com/embed/XWzYOpWi65E" frameborder="0" allowfullscreen></iframe>
                        <br /><br />
                        <iframe width="640" height="360" src="http://www.youtube.com/embed/kh29_SERH0Y" frameborder="0" allowfullscreen></iframe>
                        <br /><br />
                        <iframe width="640" height="360" src="http://www.youtube.com/embed/o9psb36zfRU" frameborder="0" allowfullscreen></iframe>
                        <br /><br />
                  		<iframe width="640" height="360" src="http://www.youtube.com/embed/3MxLZORMymQ" frameborder="0" allowfullscreen></iframe>
                        <br /><br />
                  		 
                  		<%
                  //		out.print("<br />");
                  //		out.print(session.getAttribute("Registered"));
                  // 		out.print("<br />");
                  // 		out.print(session.getAttribute("ADMIN"));
                  		%>              	 	                
                	</center>                	
         		</td>
				<td  id ="menu" style="width: 110px; height:535px; border:2px solid blue;" dir="rtl">
		
					<jsp:include page="menu.jsp"></jsp:include>
					
				</td>
        	</tr>
    	</table>
	</body>
</html>