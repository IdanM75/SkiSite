<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>הכנסת אתר סקי</title>
    	<link rel="stylesheet" type="text/css" href="myStyle.css"/>
 	</head>
 	<body bgcolor="#ebebeb" vlink="blue" alink="yellow" onload="setInterval('clock1()',1000)">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
 
 if ((session.getAttribute("ADMIN")== null)|| !session.getAttribute("ADMIN").equals("OK") )
			response.sendRedirect ("noadmin.jsp");
 
 %>	
 		<table style="width:100%; height:100%; border:2px solid blue; border-collapse:collapse;";>        
        	<tr style="height: 110px; vertical-align: middle; text-align:center "  >
            	<td colspan="2" style="height: 89px; border:2px solid blue;" dir="rtl">
            	
					<jsp:include page="title.jsp"></jsp:include>
			
				</td>

			<tr style="height:500px">            
            	<td  id="main"  style="width: 88%; border:2px solid blue;" dir="rtl">
                	<center>                  		
                	    <form name="frms" method="get"   action="sitesRIN.jsp" > 
                  		<table  border="3" bordercolor="blue">  
  	      <tr>
    		<td>שם האתר:</td>
    		<td><input  type="text" name="name" /></td>
	      </tr>
  	      <tr>
    		<td>מדינה:</td>
    		<td><input type="text" name="country" /></td>
	      </tr>
	      <tr>
    		<td>גובה מקסימלי:</td>
    		<td><input  type="text" name="maxheight" size="6" /><font color="#0066cc" dir="ltr"> *int &nbsp &nbsp &nbsp
    		&nbsp &nbsp &nbsp </font></td>
	      </tr>
  	      <tr>
    		<td>גובה מינימלי:</td>
    		<td><input  type="text" name="minheight" size="6" /><font color="#0066cc" dir="ltr"> *int &nbsp &nbsp &nbsp
    		&nbsp &nbsp &nbsp </font></td>
	      </tr>
	      <tr>
    		<td>אורך מסלולים:</td>
    		<td><input  type="text" name="length" size="3" /><font color="#0066cc" dir="ltr"> *int &nbsp &nbsp &nbsp
    		&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp </font></td>
	      </tr>
	      <tr>
    		<td>כתובת התמונה:</td>
    		<td><input  type="text" name="img" /></td>
	      </tr>
	      <tr>
    		<td>קישור לדף הבית :</td>
    		<td><input  type="text" name="href" /></td>
	      </tr>
	      
	      <tr>
    		<td><font color="blue"> מסלולים כחולים: </font></td>
    		<td><input  type="text" name="blue" size="3" /><font color="#0066cc" dir="ltr"> *int &nbsp &nbsp &nbsp
    		&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp </font></td>
	      </tr>
	      <tr>
    		<td><font color="red"> מסלולים אדומים: </font></td>
    		<td><input  type="text" name="red" size="3" /><font color="#0066cc" dir="ltr"> *int &nbsp &nbsp &nbsp
    		&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp </font></td>
	      </tr>
	      <tr>
    		<td>מסלולים שחורים:</td>
    		<td><input  type="text" name="black" size="3" /><font color="#0066cc" dir="ltr"> *int &nbsp &nbsp &nbsp
    		&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp </font></td>
	      </tr>
	      
          <tr>
    		<td><input type="reset" value="לאיפוס" /></td>
    		<td><input type="submit" value="להכנסה" /></td>
  	      </tr>

  	      

	 </table>
       </form>                  	 	                
                	</center>
                	
         		</td>
				<td  id ="menu" style="width: 110px; height:535px; border:2px solid blue;" dir="rtl">
		
					<jsp:include page="menu.jsp"></jsp:include>
					
				</td>
        	</tr>
    	</table>
	</body>
</html>