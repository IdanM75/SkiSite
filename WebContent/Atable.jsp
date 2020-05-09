<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>טבלת חברים</title>
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

      %>
         &nbsp
         <br />
     	<div align="center">
      		<b><font size="5">
       		 חיפוש רשומים במסד הנתונים לפי שם משפחה מלא או לפי האות הראשונה של שם המשפחה 
      		</font></b>
      		<hr width="65%" color="blue" />      
     <%		 	 
		 													// the first time the page is sent to the user
		 													// the SUBMIT button was not pressed yet.		 												
			if(request.getParameter("submit1") == null )	//it means that the form is seen the first time
		 	{
     %>
      		<form name="detailsForm" 
           		  action="Atable.jsp"
                  method="post">
       		 שם משפחה או חלק ממנו	:
        		<input type="text" name="lname" />
        		&nbsp 
        		<input type="submit" value="חפש" name="submit1"/>
      		</form>
 <%
		 	}
			else  // connect to db
			{
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
					
					// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
					
					
					//שלב ד: יצירת שאילתה עבור מסד הנתונים
					String mySQL = "SELECT * FROM idanT  WHERE lname LIKE '" + request.getParameter("lname") +"%'";
			  		System.out.println("mySQL ="+ mySQL);
					
			  		
					//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
			  		ResultSet oRS = st.executeQuery(mySQL);				
					
			  		//=====================סוף ההתחברות למסד הנתונים======================
			  		
			  		int numColumns = oRS.getMetaData().getColumnCount();
	 	
	 				oRS.last();				
	 				int numRows = oRS.getRow();
	 	
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

	 			if(result.length==0)
		     	{	
		     		out.print("<center><h3>");
		    	 	out.print("לא נמצא משתמש עם שם משפחה זה ");
		    	 	out.print("</h3><br />");
		     		out.print("<a href='Atable.jsp'>חפש שוב</a> ");
		     		out.print("</center>");
		     	}
	 			else
	 			{
	 				out.print( "תוצאות החיפוש");
	 				out.print( "<br />" );

	 				out.print( "<table border='1' cellpadding='4'>");
	 					out.print("<tr bgcolor='yellow'>");
	 						out.print("<td>");
	 							out.print("שם פרטי");
	 						out.print("</td>");
	 						out.print("<td>");
	 		   		       		out.print("שם משפחה");
	 		   		    	out.print("</td>");
	 		   		    	out.print("<td>");
	 		   		    		out.print(" שנת לידה");
	 		   		    	out.print("</td>");
	 		   		    	out.print("<td>");
	 		   		    		out.print("דואר אלקטרוני");
	 		   		    	out.print("</td>");
	 		   		    out.print("</tr>");
	 		   		for(int row=0;row<result.length;row++)
	  				{
	     				out.println("<tr>");
	     				
	     				//for (int col=0; col<result[row].length; col++)
	     				//{
		 				//	out.print("<td>"+result[row][col]+"</td>");
	     				//}
	     				
	     				out.print("<td>"+result[row][0]+"</td>");	// fname
	     				out.print("<td>"+result[row][1]+"</td>");	// lname
	     				out.print("<td>"+result[row][4]+"</td>");	// bYeear
	     				out.print("<td>"+result[row][2]+"</td>");	// email
	     				out.println("</tr>");
	  				}// end for
	  	 			out.print("</table>");
	  	 			out.print("<br /><br />");
	  	 			out.print("<br />");
	 				
	  	 			out.print("<a href='Atable.jsp'>חיפוש נוסף</a> ");
	 			}// end else some one was found
			}// end connect to db
      %>     		
      </div>

			<h1><font color='blue'>לפניך כל הרשומים במסד הנתונים </font></h1>
    	     <table border="1" cellpadding="4" bgcolor="#3333ff">
  				<tr bgcolor="#ffff4d">
   	    	  		<td>
   						 שם פרטי
   	    	  		</td>
	    	  		<td>
   						 שם משפחה 
   	    	  		</td>
   	    	  		<td>
  		 				 דוא"ל
   	    	  		</td>
   	    	  		<td>
  						 סיסמא
   	    	  		</td>
   	    	 		 <td>
   						שנת לידה 
   	    	  		</td>
   	    	  		<td>
  					  	חודש לידה
   	    	  		</td>
					<td>
   						 יום לידה
   	    	  		</td>
	    	  		<td>
   					      מין
   	    	 	    </td>
   	    	 		<td>
  						סוג גלישה
   	    	  		</td>
   	    	  		<td>
   	    	  		     אדמין 	
   	    	  		</td>			    	 
  				</tr>
		
	
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
				String mySQL = "SELECT * FROM idanT";
		  		
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		  		ResultSet oRS = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  		
		  		oRS.beforeFirst();
				while (oRS.next() )
					{
					    out.print("<tr>");
				 	    for (int i = 1; i <= 10; i++ )
				 	    {
					         out.print( "<td>"+oRS.getString(i)+"</td>");
					         //System.out.println(oRS.getString(i));
				 	    }	
				 	   out.print("</tr>");
					}	
				
				oRS.close();
				st.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				//e.printStackTrace();
				System.out.println("Error in connecting-SELECT");
				
			} // the connection is closed	  		
		%>
    	</table>
    	
    	<br />
    	
    	<form method="post" action="AtableD.jsp">
				<h3><font color='blue'> 
            	או ל הקלד דוא"ל של המשתמש אותו תרצה למחוק
				</font></h3>
				<input type="text" name="e-mail" size="20" />
				<br />
            	<input type="submit" value="מחק" name="send"/>            
        </form>
        
        <form method="post" action="AtableU.jsp">
				<h3><font color='blue'> 
            	 הקלד דוא"ל של המשתמש אותו תרצה לעדכן
				</font></h3>
				<input type="text" name="email" size="20" />
				<br /><br />
            	<input type="submit" value="עדכן" name="send"/>            
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