<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>דף הרשמה</title>
    	<link rel="stylesheet" type="text/css" href="myStyle.css"/>
 	</head>
 	<body bgcolor="#ebebeb"  vlink="blue" alink="yellow" onload="setInterval('clock1()',1000)">
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
                  		 <% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
    	 
	  		String fname     =  request.getParameter("fname");
	  		String lname     =  request.getParameter("lname");	
	  		String email     =  request.getParameter("email");
	  		String password  =  request.getParameter("password");
	  		int    year      =  Integer.parseInt(request.getParameter("year"));
	  		int   month      =  Integer.parseInt(request.getParameter("month"));
	  		int     day      =  Integer.parseInt(request.getParameter("day"));
	  		String gender    =  request.getParameter("gender");
	  		String surf      =  request.getParameter("surf");
	  		
		     String  result [][]= null;	
			 	
		 	 try 
		 		{
		 		// שלב א: טעינת המתפעל - דרייבר
		 		Class.forName("com.mysql.jdbc.Driver").newInstance();	
		 	
		 	
		 		//שלב ב:חיבור למסד הנתונים
		 		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/idanproject","root","");
		 	
		 	
		 	
		 		//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
		 		Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		             						       ResultSet.CONCUR_UPDATABLE);
		 		  		
		 		// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרקורדסט
		 	
		 		
		 		
		 		
		 		//שלב ד: יצירת שאילתה עבור מסד הנתונים
		 		String mySQL = "SELECT * FROM idanT WHERE email='" + email +"'"; 
		 		System.out.println(mySQL);
		 		
		 		
		 		//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים		  		
		 		ResultSet oRS = st.executeQuery(mySQL);				
		 	
		 	
		 		//=====================סוף ההתחברות למסד הנתונים======================
		 		
		 		System.out.println("1");
		 		
		 		int numColumns = oRS.getMetaData().getColumnCount();
		 		
		 		System.out.println("2 - " + numColumns);
		 		
		 		oRS.last();				
		 		int numRows = oRS.getRow();
		 	
		 		System.out.println("3 - " + numRows);
		 		result = new String[numRows][numColumns];	
		 		
		 		oRS.beforeFirst();
		 		int i = 0;
		 		while (oRS.next())
		 			{
		 				for(int j = 0; j < numColumns; j++ )
		 					result[i][j]=oRS.getString(j+1);				
		 				i++;
		 			}		
		 		
		 		oRS.close();	
		 		st.close();	
		 		
		 		} 
		 	 catch (Exception e) 
		 		{	  			
		 		//e.printStackTrace();
		 		System.out.println("1- Error in connecting");
		 	
		 		} //======================= the connection is closed

		     	if(result.length>0)
		     	{	
		     		out.print("<center><h3>");
		    	 	out.print("קיים כבר משתמש עם אימייל הזה ");
		    	 	out.print("</h3><br />");
		     		out.print("<a href='register.jsp'>חזרה לטופס ההרשמה</a> ");
		     		out.print("</center>");
		     	}
		     	else
		     	{
			//================
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
				String mySQL = "INSERT INTO idanT(fname, lname, email, password, bornyear, bornmonth, bornday, gender, surftype) values ('"+ fname +"','"+lname+"' ,'"+email+"' ,'"+password+"','"+year+"','"+month+"','"+day+"','"+gender+"','"+surf+"')";
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
	  		
	  		
			out.print("<center><h3><font color='blue'>פרטיך נרשמו במסד הנתונים  </font></h3> ");

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