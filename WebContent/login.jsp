<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>התחברות</title>
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
                  		<br />
                          <% 
             
                          
             
             
       		String eMail = request.getParameter("e-mailR");
	  		String pass  = request.getParameter("passwordR");	  		
	  		
	  		
	  		if ((eMail != null)&&(pass != null))
	  		{
	  		try 
	  		{
	  			// שלב א: טעינת המתפעל - דרייבר
				Class.forName("com.mysql.jdbc.Driver").newInstance();	
				
	  		
				//שלב ב:חיבור למסד הנתונים
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/idanproject","root","");
				
	  		
				//שלב ב:חיבור למסד הנתונים
				Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		                						   ResultSet.CONCUR_UPDATABLE);
				
				// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרקורדסט
				
				
				
				//שלב ד: יצירת שאילתה עבור מסד הנתונים
				String mySQL = "SELECT * FROM idanT WHERE eMail='" + eMail + "' AND password ='" + pass + "'" ;
		  		// mySQL = "SELECT * FROM tClients WHERE eMail = 'edna@ronen.com' AND Pwd ='333333'" ;
				
		  		
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים	
		  		ResultSet oRS = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  		
		  		session.setAttribute("Registered", "NotOk");			
				
		  		
				oRS.last();				
				int numRows = oRS.getRow();
				System.out.println("numRows = " + numRows);
				
				
				// למעשה יש שתי אפשרויות
				//======================
				// א.ייתכן והריזלטסט מכיל 0 רשומות כי אין מנהל עם סיסמא ושם משתמש כמו שרשמנו
				// ב. ייתכן והריזלטסט מכיל רשומה אחת בלבד, כי יש רק מנהל אחד עם סיסמא כזו ושם משתמש כזה
				
				// למעשה הלולאה הרשומה בהמשך מיותרת, ניתן לראות תיקון בדוגמא מספר 4
				
				if (numRows > 0)
				{
					oRS.beforeFirst();
		  		  		
					while (oRS.next() && !session.getAttribute("Registered").equals("OK") )
					{
						System.out.println("no. = "+ oRS.getRow()+  "   eMail = " + oRS.getString("eMail")+ "    password= "+ oRS.getString("password"));
					
						if ( eMail.equals(oRS.getString("eMail")) && pass.equals(oRS.getString("password")) )
						{
							session.setAttribute("Registered", "OK");
							session.setAttribute("fName" , oRS.getString("fname") );
							session.setAttribute("bYear" , oRS.getString("bornyear"));
							session.setAttribute("bMonth", oRS.getString("bornmonth"));
							
						}
						
					}
				}
				
				oRS.last();
                session.setAttribute("ADMIN", "NotOk");			
			    String ans="yes";
						if ( ans.equals(oRS.getString("admin")))
						{
							session.setAttribute("ADMIN", "OK");
							
						}
				
				
				oRS.close();
				st.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				e.printStackTrace();
				
			} // the connection is closed	  		
			
	  		
			
			
			if ( session.getAttribute("Registered").equals("OK") )
				response.sendRedirect ("main.jsp");
			else
				response.sendRedirect ("nomember.jsp");
	  		}
			
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