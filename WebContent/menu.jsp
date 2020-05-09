<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
%>
<br />
<script language="javascript">	
	    function clock1()
	     {
		var d=new Date();

		var times1=d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
		document.form1.text1.value = times1;
		window.status=times1;	
	     }	 
        </script>


<center>

          
          <form name=form1 >
	         <b>השעה היא:</b>
	         <input type=text name=text1 size=5>
	      </form>
	      <br />
          
          <img src="images/ski.jpg" width="160" height="140" align="top">
          <hr width="100%" size="2" color="blue" />
          <br />
    
             <%
               if ((session.getAttribute("Registered")== null)|| !session.getAttribute("Registered").equals("OK") )
               {
               out.print("<font size='4'><u><b>התחברות</b></u></font>");
               out.print("<form name='connect' method='post' action='login.jsp' >");
               out.print("<br />");
               out.print("<b>הכנס  אימייל:</b>");
               out.print("<br />");
               out.print("<input type='text' name='e-mailR' />");
               out.print("<br />");
               out.print("<b>הכנס סיסמא:</b>");
               out.print("<br />");
               out.print("<input type='password' name='passwordR' />");
               out.print("<br /><br />");
               out.print("<input type='submit' value='להתחברות' />");
               out.print("&nbsp &nbsp");
               out.print("<a href='register.jsp'>להרשמה</a>");
               out.print("</form>");
               }
               else
               {
            	   out.print("<b><font size='4'>welcome " +session.getAttribute("fName")+"</font></b>");
            	   out.print("<br /><br />");
                   out.print("<font size='4'><u><b>התנתקות</b></u></font>");
                   out.print("<form name='disconnect' method='post' action='logout.jsp' >");
                   out.print("<br />");  
                   out.print("<input type='submit' value='להתנתקות' />");
                   out.print("<br />");
               }
             %>
             
             <br />
               <hr width="100%" size="2" color="blue" />
                <br />
                 <div>
                    <a href="main.jsp">לדף הבית</a>
                    
                    <% 
		              // בכדי שיראו עיברית
	  	                	request.setCharacterEncoding("windows-1255");
	                   		response.setCharacterEncoding("windows-1255");
	              	 // בכדי שיראו עיברית
 
                	if ((session.getAttribute("ADMIN")== null)|| !session.getAttribute("ADMIN").equals("OK") )
                	{}
                	else
                	{
					out.print("<br /><br />");
                    out.print("<a href='Atable.jsp'>לטבלת החברים</a>");
                	}
                    %>
                    
                    <% 
		              // בכדי שיראו עיברית
	  	                	request.setCharacterEncoding("windows-1255");
	                   		response.setCharacterEncoding("windows-1255");
	              	 // בכדי שיראו עיברית
 
                	if ((session.getAttribute("Registered")== null)|| !session.getAttribute("Registered").equals("OK") )
                	{}
                	else
                	{
					out.print("<br /><br />");
                    out.print("<a href='sites.jsp'>לרשימת אתרי הסקי</a>");
                	}
                    %>
                    
					<br /><br />
					<a href="images.jsp">לתמונות</a>
					<br /><br />
					<a href="video.jsp">לסרטונים</a>
                    <br /><br />


                </div>   
              </center> 
            