<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <jsp:include page="CheckCookie"></jsp:include>
   
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String fields = (String) session.getAttribute("session_fields");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    if(fields==null || fields.equals(""))
    {
        fields="--- Not Available ---";
    }
    String title = (String) session.getAttribute("session_title");
    String skills = (String) session.getAttribute("session_skills");
</jsp:scriptlet>

<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<!DOCTYPE html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Profile :<jsp:expression> name.toUpperCase()</jsp:expression></title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <jsp:include page="profileheader.jsp" />
        <jsp:include page="menubar.jsp" />
	
			<div class="row mt-5 mb-4">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="row py-2 px-2" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                
                    <div class="col-md-2 mt-5">
                        <img class="logo " style="border: 2px solid black;" src="img/profilepic.png" height="100"/>
                    </div>
                    <div class="col-md-10">
                     <h3 style="color: blue"> <jsp:expression> name.toUpperCase()</jsp:expression><span style="font-size: 12px; float:right;"> <a href="edit-profile-about.jsp">  <span class="glyphicon glyphicon-pencil"></span></a></span></h3>
						<jsp:expression>title</jsp:expression> <br>
                        <span style="color: #acaaaa"> Skills : </span> <jsp:expression>skills</jsp:expression> <br> 
                        <span style="color: #acaaaa"> Gender : </span> <jsp:expression> gender</jsp:expression> <br>
                        <span style="color: #acaaaa"> City : </span> <jsp:expression> city</jsp:expression> <br>
                        <span style="color: #acaaaa"> Fields : </span> <jsp:expression> fields</jsp:expression> <br>
                                                </div>
                </div><br><br>
                        <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                            <div class="col-md-12 py-2">
                            <h4> Education Details <a href="add-profile-education.jsp" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-plus"></span> </a> </h4>
                            <%
                        String school="", degree="", grade="", year="",id="";
                        String email=(String)session.getAttribute("session_email");
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
                       		PreparedStatement ps=con.prepareStatement("select * from education where email=?");
                            ps.setString(1, email);
                            ResultSet rs=ps.executeQuery();
                            while(rs.next()) {
                            	id=rs.getString("id");
                                school=rs.getString("school");
                                degree=rs.getString("degree");
                                grade=rs.getString("grade");
                                year=rs.getString("year");
                                %>
                                 <div class="row mt-2" style="background-color: #eeecec">
                                <div class="col-md-2 py-2"> &nbsp;&nbsp;&nbsp; <img style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px"class="logo" src="img/school.jpg" height="80" /> </div>
                                <div class="col-md-10 py-2">
                                    <a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                    <b> <span class="glyphicon glyphicon-home mt-3">&nbsp;</span> <jsp:expression>school</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book py-2"></span> &nbsp; <jsp:expression> degree </jsp:expression> <span style="color: #858585">(<jsp:expression> year </jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file py-2"></span> &nbsp; <jsp:expression> grade </jsp:expression>% <br>
                                </div>
                        </div> <br>
                                  <%
                            }
                        } 
                        
                    
                        catch(Exception e) {
                            e.printStackTrace();
                            out.print("Error: " + e.getMessage()); // Print error message to the response
                        }
                    %>

                        </div>
                        </div><br><br>
                        <div class="row"  style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        
                        <div class="col-md-12">
                            <h4> Experience Details <a href="add-profile-experience.jsp" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-plus"></span> </a> </h4>
                        <jsp:scriptlet>
                            String company1="", location1="", jobtitle1="", year1="", id1="";
                            try
                            {
                                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
                           		PreparedStatement ps1=con1.prepareStatement("select * from experience where email=?");
                                 ps1.setString(1, email);
                                 ResultSet rs1=ps1.executeQuery();
                                while(rs1.next())
                                {
                                    id1=rs1.getString("id");
                                    company1=rs1.getString("company");
                                    location1=rs1.getString("location");
                                    jobtitle1=rs1.getString("job_title");
                                    year1=rs1.getString("year");
                        </jsp:scriptlet>
                            
                            <div class="row " style="background-color: #eeecec">
                                <div class="col-md-2 py-2"> &nbsp;&nbsp;&nbsp; <img style="border: 1px solid gray; box-shadow: 0px 0px 2px black; border-radius: 3px"class="logo" src="img/images.png" height="80" /> </div>
                                <div class="col-md-10 py-3">
                                    <a href="edit-profile-experience.jsp?id=<jsp:expression>id1</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                    <b> <span class="glyphicon glyphicon-home">&nbsp;</span> <jsp:expression>company1</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book"></span> &nbsp; <jsp:expression>location1</jsp:expression> <span style="color: #858585">(<jsp:expression> year1 </jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression>jobtitle1</jsp:expression><br>
                                </div>
                        </div> <br>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                out.print(e);
                            }
                        </jsp:scriptlet>
                        </div>
                    </div> <br> <br>
                    <div class="row"  style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        
                        
                    
               </div>
                <div class="col-md-2"> </div>
            </div>
			</div>

        <jsp:include page="footer'.jsp" />
    </body>
</html>
