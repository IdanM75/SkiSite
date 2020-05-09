<%@ page contentType="text/html" pageEncoding="UTF-8" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>תמונות</title>
    	<link rel="stylesheet" type="text/css" href="myStyle.css"/>
    	
    	<script language="javascript">	
                        <!--     

                        var picName1=new Image();
                        var picName2=new Image();       
                        var picName3=new Image(); 
                        var picName4=new Image();
	                    var picName5=new Image();
	                    var picName6=new Image();
	                    var picName7=new Image();
	                    var picName8=new Image();
                     	var picName9=new Image();
	                    var picName10=new Image();
      

	                    var picName=new Array();

                        picName1.src="images/show/show1.jpg";
                        picName2.src="images/show/show2.jpg";
                        picName3.src="images/show/show3.jpg";
                        picName4.src="images/show/show4.jpg";
                        picName5.src="images/show/show5.jpg";
	                    picName6.src="images/show/show6.jpg";
                        picName7.src="images/show/show7.jpg";
	                    picName8.src="images/show/show8.jpg";
	                    picName9.src="images/show/show9.jpg";
	                    picName10.src="images/show/show10.JPG";
	
 	
                        var picArray=new Array();

	                    picArray[0]=picName1.src;
	                    picArray[1]=picName2.src;
                    	picArray[2]=picName3.src;
                    	picArray[3]=picName4.src;
                    	picArray[4]=picName5.src;
                    	picArray[5]=picName6.src;
                      	picArray[6]=picName7.src;
                    	picArray[7]=picName8.src;
                     	picArray[8]=picName9.src;
                       	picArray[9]=picName10.src;
	

	                    var i=0;
                            //var x;
                        function animation(option)
                               {    
                                if (option==2)
                                  {
		                             clearTimeout(x);	//  stop the animation and return!
		                             return;
                                  }
             
                               else if (option==1)     // start the animation again.
                                  {
                                	x=setTimeout('animation(1)',1800);                                                  
                                  }
                       else // option==3
		               {
		                    clearTimeout(x);	//  stop the animation and continue to the next lines.
                       }
                             // -----------------------------------------------------
                             // do the next lines either when option==1 or option==3
                             // -----------------------------------------------------
		              document.picture.src=picArray[i];  //after 'stop' - one by one           
	                  i++;
                      i=i%10; 		
                                    
	                  }  // end  function animation(option)


                      //-->
                      </script>
    	
    	
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
        	</tr>	
		
			<tr style="height:500px">            
            	<td  id="main"  style="width: 88%; border:2px solid blue;" dir="rtl">
                	<center>                  		
                    <h1>תמונות!</h1>
                    <br />
          
                     <table border=8 >
                       <tr >
                         <td>
		     	           <img width=400 height=300 src="images/show/showm.jpg" name="picture"  >
                        </td> 
                      </tr>
     	            </table> 
                    <br />        
                    <input type="button" name="stop" value="Stop "  width="85px" onclick="animation(2)">
	                <input type="button" name="start" value="Next Picture" width="85px" onclick="animation(3)">
                    <input type="button" name="Auto" value="Picture Show" width="85px" onclick="animation(1)">	
                  	<br />
                  		      	 	                
                	</center>
                	
         		</td>
				<td  id ="menu" style="width: 110px; height:535px; border:2px solid blue;" dir="rtl">
		
					<jsp:include page="menu.jsp"></jsp:include>
					
				</td>
        	</tr>
    	</table>
	</body>
</html>