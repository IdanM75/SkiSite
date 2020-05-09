<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>עדכון בטבלת חברים</title>
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
                	                 		
                  		<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
  
			String emailToUpdate = request.getParameter("email");
			
			
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
							
				String mySQL = "Select * FROM idanT WHERE email='" + emailToUpdate  + "'";
				
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		  		ResultSet oRS = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
	
		  			
		  		oRS.beforeFirst();
		  		oRS.next();
	%>	  		
	
	<center>
        <h2>עדכן את פרטי המשתמש ושלח לעדכון במסד הנתונים </h2>
		<br />
		<form 	name="frm" 
			onreset="return confirm('All data will be lost')"   
			action = "AtableUIN.jsp"   
			method="post">
			
     <table border="1">
     	
	   <tr>
		<td> first name</td>		
		<td><input type="text" name="fname" value=<%= oRS.getString("fname") %>></td>		
	   </tr>
	   <tr>
		<td> last name</td>		
		<td><input type="text" name="lname" value=<%= oRS.getString("lname")%>></td>		
	   </tr>
	   <tr>
		<td> e-mail</td>		
		<td><input type="text" name="e-mail"  readonly    value=<%=oRS.getString("email") %>></td>				
	   <tr>
		<td> password</td>		
		<td><input type="text" name="password" value=<%=oRS.getString("password") %>></td>		
	   </tr>
	   
	   <tr>
	   <td> birthday </td>
	   <td> &nbsp <%=oRS.getString("bornyear") %> &nbsp &nbsp &nbsp &nbsp
	              <%=oRS.getString("bornmonth") %> &nbsp &nbsp &nbsp &nbsp
	              <%=oRS.getString("bornday") %>
	   </tr>
	   
       <td>born year</td>
       <td>
       
		     <select name="year"> 
	         <script language=javascript>
		     for (var i=1933;i<=2010;i++)
		    	 if (i==2000)
			 document.write("<option  value='"+i+"' selected >"+i+"</option>");
		    	 else
		     document.write("<option  value='"+i+"' >"+i+"</option>");
            </script>
		     </select>
		     <select name="month" >
	         <script language=javascript>
		     for (var i=1;i<=12;i++)
			 document.write("<option  value='"+i+"' >"+i+"</option>");
            </script>
		     </select>
		     <select name="day"> 
	         <script language=javascript>
		     for (var i=1;i<=31;i++)
			 document.write("<option  value='"+i+"' >"+i+"</option>");
            </script>
		     </select>
	        </td>
	   
	   <tr>
		<td>male</td>		
		<td><input type="radio" name="gender" value="male" <%if (oRS.getString("gender").equals("male")) { %> checked <%} %>></td>		
	   </tr>
	   <tr>
		<td>female</td>		
		<td><input type="radio" name="gender" value="female" <%if (oRS.getString("gender").equals("female")) { %> checked <%} %>></td>		
	   </tr>
	   	<tr>
		<td>ski</td>		
		<td><input type="radio" name="surf" value="ski" <%if (oRS.getString("surftype").equals("ski")) { %> checked <%} %>></td>		
	   </tr>
	   <tr>
		<td>snowboard</td>		
		<td><input type="radio" name="surf" value="snowboard" <%if (oRS.getString("surftype").equals("snowboard")) { %> checked <%} %>></td>		
	   </tr>	

	   
	   <tr>
		<td align="center"><input type="Reset" value="Reset"  ></td>		
		<td><input type="submit" value="Update" ></td>		
	   </tr>
      </table>		
    </form>
    </center>
			
	<% 	  			
		  			
				oRS.close();	 
				st.close();
				
							} 
	  		catch (Exception e) 
	  		{
	  			
				//e.printStackTrace();
				System.out.println("Error in connecting-Update-1");
				
			} // the connection is closed	
			
	  	%>       
	  	          	 	                
                	
                </td>
				<td  id ="menu" style="width: 110px; height:535px; border:2px solid blue;" dir="rtl">
		
					<jsp:include page="menu.jsp"></jsp:include>
					
				</td>
        	</tr>
    	</table>
	</body>
</html>