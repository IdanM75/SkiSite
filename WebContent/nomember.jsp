<%@ page contentType="text/html" pageEncoding="UTF-8" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>לא חבר</title>
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

			<tr style="height:500px">            
            	<td  id="main"  style="width: 88%; border:2px solid blue;" dir="rtl">
                	<center>                  		
        	 	    <h2>הסיסמא או האימייל אינם נכונים</h2>          
        	 	    <font size="5"><a href="main.jsp">חזרה לדף הבית</a></font>
                	</center>
                	
         		</td>
				<td  id ="menu" style="width: 110px; height:535px; border:2px solid blue;" dir="rtl">
		
					<jsp:include page="menu.jsp"></jsp:include>
					
				</td>
        	</tr>
    	</table>
	</body>
</html>