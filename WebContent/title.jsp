<%@ page language="java" contentType="text/html; charset=windows-1255"

    pageEncoding="windows-1255"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
%>

	             	
          <span style="font-size:xx-large; font-family:Arial; font-weight:bolder; font-style:oblique; color:black " >
               <font size="7">SurfSki </font><font size="4"> the best skiing web</font>
              
               <font size="2">
               <table border="4" align="right" height="50" width="160" bordercolor="#FFFF00">
               <tr>
               <td>
                so far we had 
                </td>
                </tr>
                <tr>
                <td>                 
               <%						
				  if ( session.getAttribute("beenHere")== null )				// ?מתי זה קורה
				  {
					if (application.getAttribute("numVisitors") == null)	// ?מתי זה קורה		
						application.setAttribute("numVisitors", 1);
					else													// ?מתי זה קורה
					{
						Integer counter = (Integer)application.getAttribute ("numVisitors");
						counter = counter + 1;
						application.setAttribute("numVisitors", counter);
					}
					session.setAttribute("beenHere", "yes");				// ?מתי זה קורה	
				}					
	   		
	   			out.print( "<b>" + application.getAttribute ("numVisitors"));
	   			out.print("&nbsp;&nbsp; visits </b><br />");	
		       %>
		       </td>
		       </tr>
               </table>
               </font>
          </span>

          
          
         

               
               	
            		