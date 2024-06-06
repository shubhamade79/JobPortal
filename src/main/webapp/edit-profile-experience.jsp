<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:include page="CheckCookie"></jsp:include>
 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:declaration>
String company="", location="", year="", job_title="", description="", id="";
</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String id=request.getParameter("id");
    try
    { 
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
		PreparedStatement ps1=con1.prepareStatement("select * from experience where id=?");
        ps1.setString(1, id);
        ResultSet rs1=ps1.executeQuery();
        while(rs1.next())
        {
            company=rs1.getString("company");
            location=rs1.getString("location");
            year=rs1.getString("year");
            job_title=rs1.getString("job_title");
            description=rs1.getString("description");
        }

    }
    catch(Exception e)
    {
        out.print(e);
    }
    </jsp:scriptlet>
<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Profile </title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript">
   	function submitFunction(val)
   	{
   		if(val=='update'){
   			 document.editexpform.action="EditExperienceDetails";
   			 document.editexpform.submit();
   		}
   		if(val=='delete'){
  			 document.editexpform.action="DeleteExperienceDetails";
   			 document.editexpform.submit();

   		}
   	}
   </script>
        
    </head>
    <body>
        <jsp:include page="profileheader.jsp" />
        <jsp:include page="menubar.jsp" />

        <div class="row py-4">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-2">
                        <img class="logo" style="border: 2px solid black;" src="img/logo.jpg" height="100"/>
                    </div>
                    <div class="col-md-10">
                        <h2>Edit Experience Details</h2> <br>
                    	<b> <jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("session_email") </jsp:expression>) <br> <br>
                         <form name="editexpform" method="POST">
                                <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
                            Company : <br> <input type="text" name="company1" class="textfield_design" value="<jsp:expression>company</jsp:expression>"/> <br> <br>
                            Location : <br> <input type="text" name="location1" placeholder="Eg. delhi" class="textfield_design" value="<jsp:expression>location</jsp:expression>"/> <br> <br>
                            Year : <br> <input type="text" name="year1" placeholder="Eg. 2004-2005" class="textfield_design" value="<jsp:expression>year</jsp:expression>"/> <br> <br>
                            Job Title : <br> <input type="text" name="job_title1" placeholder="Eg. Sr. Java Developer" class="textfield_design" value="<jsp:expression>job_title</jsp:expression>"/> <br> <br>
                            Description : <br> <textarea placeholder="Your certifications, Activities and societies" name="description1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"><jsp:expression>description</jsp:expression></textarea> <br> <br>
                       <input type="submit" value="Update Experience" class="btn btn-danger" onclick="submitFunction('update')" />
                       <input type="submit" value="Delete Experience" class="btn btn-danger" onclick="submitFunction('delete')" />
                            
                        </form>
                        </div>
                </div>
            </div>
            <div class="col-md-2"> </div>
        </div>
        <jsp:include page="footer'.jsp" />
    </body>
</html>
