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
                  		<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
    	 
	  		String name       =  request.getParameter("name");
	  		String country    =  request.getParameter("country");
	  		int   maxheight       =  Integer.parseInt(request.getParameter("maxheight"));
	  		int   minheight       =  Integer.parseInt(request.getParameter("minheight"));
            int     length        =  Integer.parseInt(request.getParameter("length"));
            String img        =  request.getParameter("img");
            String href        =  request.getParameter("href");
            int     blue        =  Integer.parseInt(request.getParameter("blue"));
            int     red        =  Integer.parseInt(request.getParameter("red"));
            int     black        =  Integer.parseInt(request.getParameter("black"));           
            
            
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
				String mySQL = "INSERT INTO idanS(name, country, maxheight, minheight, length, img, href, blue, red, black) values ('"+ name +"','"+ country +"' ,'"+ maxheight +"' ,'"+ minheight +"','"+ length +"','"+ img +"','"+ href +"','"+ blue +"','"+ red +"','"+ black +"')";
				System.out.println("mySQL = " + mySQL );
				//שלב ה: עדכון מסד הנתונים
		  		int n = st.executeUpdate(mySQL);	// מכיל את מספר הרשומות שהושפעו מהפעלת השאילתה n המשתנה  				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  				  						
				//oRS.close();	- במקרה זה לא יוצרים רזלטסט
				st.close();
				con.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				e.printStackTrace();
				
			} // the connection is closed	  		
	  		
	  		
			out.print("<center><h3><font color='blue'>האתר נרשם במסד הנתונים  </font></h3> ");
			out.print("<a href='sites.jsp'>חזרה לרישמת אתרי הסקי</a>");
		     	
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