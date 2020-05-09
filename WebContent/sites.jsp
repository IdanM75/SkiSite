<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>אתרי סקי</title>
    	<link rel="stylesheet" type="text/css" href="myStyle.css"/>
 	</head>
 	<body bgcolor="#ebebeb" vlink="blue" alink="yellow" onload="setInterval('clock1()',1000)">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
 
  if ((session.getAttribute("Registered")== null)|| !session.getAttribute("Registered").equals("OK") )
			response.sendRedirect ("nomember.jsp");
 
 %>	
 		<table style="width:100%; height:100%; border:2px solid blue; border-collapse:collapse;";>        
        	<tr style="height: 110px; vertical-align: middle; text-align:center "  >
            	<td colspan="2" style="height: 89px; border:2px solid blue;" dir="rtl">
            	
					<jsp:include page="title.jsp"></jsp:include>
			
				</td>

			<tr style="height:500px">            
            	<td  id="main"  style="width: 88%; border:2px solid blue;" dir="rtl">
                	<center>  
                	<h2>אתרי סקי בעולם</h2>
                	 <% 
		              // בכדי שיראו עיברית
	  	                	request.setCharacterEncoding("windows-1255");
	                   		response.setCharacterEncoding("windows-1255");
	              	 // בכדי שיראו עיברית
 
                	if ((session.getAttribute("ADMIN")== null)|| !session.getAttribute("ADMIN").equals("OK") )
                	{}
                	else
                	{
					out.print("<a href='sitesR.jsp'>להכנסת אתר לרשימה</a>");
                    out.print("<br />");

                    out.print("<form method='post' action='sitesD.jsp'>");
                    out.print("<h3><font color='blue'>");
                    out.print(" הקלד את שם האתר אותו תרצה למחוק ");
                    out.print("</font></h3>");
                    out.print("<input type='text' name='name' size='20' />");
                    out.print("<br />");
                    out.print("<input type='submit' value='מחק' name='send'/>");            
                    out.print("</form>");     
                    out.print("<br /><br />");      		


                	}
                    %>
                  		<% 
	  		try 
	  		{
	  			// שלב א: טעינת המתפעל - דרייבר
				Class.forName("com.mysql.jdbc.Driver").newInstance();	
	  		
	  		
				//שלב ב:חיבור למסד הנתונים
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/idanproject","root","");
				
	  		
				//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
				Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		                						   ResultSet.CONCUR_UPDATABLE);
				
				// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
				
				
				//שלב ד: יצירת שאילתה עבור מסד הנתונים
				String mySQL = "SELECT * FROM idanS";
		  		
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		  		ResultSet myResultSet = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  						
				int numColumns = myResultSet.getMetaData().getColumnCount();
				
				
				myResultSet.last();			// המצביע מצביע על הרשומה האחרונה		
				int numRows = myResultSet.getRow();
				
				
				
				if (numRows == 0)	// אין רשומות
				{
					out.print ( "לא נמצאו נתונים" );					
				}
				else
				{
					myResultSet.beforeFirst();
					while (myResultSet.next() )
					{
						out.print("<table style='width:547px; height:150px; border:2px solid yellow; border-collapse:collapse;'>");	
						out.print("<tr>");
						out.print("<td style='width:286px; height:150px; border:2px solid yellow;'>");
						out.print("<table border='1' bordercolor='blue'>");
						out.print("<tr>");
						out.print("<td> שם האתר: </td>");
						out.print("<td width='151'>" + myResultSet.getString("name") + " </td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td> מדינה: </td>");
						out.print("<td>" + myResultSet.getString("country") + " </td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td> גובה מקסימלי: </td>");
						out.print("<td>" + myResultSet.getInt("maxheight") + " מ' </td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td> גובה מינימלי: </td>");
						out.print("<td>" + myResultSet.getInt("minheight") + " מ' </td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td> אורך מסלולים: </td>");
						out.print("<td>" + myResultSet.getInt("length") + " מ' </td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td><font color='blue'> מסלולים כחולים: </font></td>");
						out.print("<td>" + myResultSet.getInt("blue") + " </td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td><font color='red'> מסלולים אדומים: </font></td>");
						out.print("<td>" + myResultSet.getInt("red") + " </td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td> מסלולים שחורים: </td>");
						out.print("<td>" + myResultSet.getInt("black") + " </td>");
						out.print("</tr>");
						out.print("</table>");
						out.print("</td>");
						out.print("<td style='width:312px; height:210px; border:2px solid yellow;'>");
						out.print("<a href=" + myResultSet.getString("href") + " target='*_blank'><img src=images/" + myResultSet.getString("img") + " style=' width:100%; height:100%;' /></a>");
						out.print("</td>");
						out.print("</tr>");
						out.print("</table> ");
						out.print("<br /><br />");
					}
					
				}
				myResultSet.close();
				st.close();
				
			} 
	  		catch (Exception e) 
	  		{	  			
				//e.printStackTrace();
				System.out.println("page1-Error in connecting");				
			} // the connection is closed	  		
		%>    	 	                
                	</center>
                	
         		</td>
				<td  id ="menu" style="width: 110px;  border:2px solid blue;" dir="rtl">
		
					<jsp:include page="menu.jsp"></jsp:include>
					
				</td>
        	</tr>
    	</table>
	</body>
</html>