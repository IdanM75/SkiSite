<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>מחיקה מטבלת חברים</title>
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
                  		<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
 
			String nameToDelete = request.getParameter("e-mail");
		
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
				String mySQL = "DELETE FROM idanT WHERE email='" + nameToDelete  + "'";
				// במידה ויש כמה חברים רשומים עם אותו שם משפחה, כולם יימחקו
				System.out.println(mySQL);
				
				//שלב ה: עדכון מסד הנתונים
		  		int n = st.executeUpdate(mySQL);	// מכיל את מספר הרשומות שהושפעו מהפעלת השאילתה n המשתנה  				
				
		  		System.out.println("number of records affected =" + n );
		  		
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  		if (n > 0) // כלומר נמצא מישהו ואולי נמצאו יותר מ- 1
                  	{                       	
                     	
                    	response.sendRedirect("Atable.jsp");
                     
                  	}
                  else 
                  	{
                	  out.print("<h2>");
                      out.print("המשתמש לא נמצא") ;
                      out.print("</h2>");
                      out.print("<br />");		
              		  out.print("<h3><font color='blue'><a href ='Atable.jsp' >למחיקת משתמש לחץ כאן </a></font></h3>");
                  	}	
		  			
				//oRS.close();	- במקרה זה לא יוצרים רזלטסט
				st.close();
				con.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				//e.printStackTrace();
				System.out.println("Error in connecting-2");
				
			} // the connection is closed	
			
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