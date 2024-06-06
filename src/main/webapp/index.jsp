<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
</jsp:scriptlet>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Portal Website</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script></head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
 <div class="container-fluid ">
  <jsp:scriptlet>
                if(email == null ? email == null : email.trim().equals("null"))
                {
            </jsp:scriptlet>
                <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
                else
                {
            </jsp:scriptlet>
                    <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
	<jsp:include page="menubar.jsp"></jsp:include>
	<div class="row py-2" style="border:2px solid black;">
		<img style="display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;" alt="" src="img/image.jpeg">
	</div>
	<!-- ==============search job div starts================= -->
			 <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 job_search_div">
                        <h3> Find A Job at India's No.1 Job Site </h3>
                        <form action="search-jobs-result.jsp" method="POST">
                            <input type="text" name="technology1" placeholder="Position..." class="textfield_design" />
                            <input type="text" name="location1" placeholder="Location..." class="textfield_design" />
                            <input type="submit" value="Search" class="btn btn-primary" />
                        </form>
                    </div>
                    <div class="col-md-2"></div>
                </div>
	<!-- ==============search job div ends================= -->
			
			<div class="row mb-4">
				<div class="col-md-3">
					<ul>
						<li> <a href=""> Infosys </a> </li>
						<li> <a href=""> Wipro </a> </li>
						<li> <a href=""> IBM </a> </li>
						<li> <a href=""> Google </a> </li>
					</ul>
				</div>
				<div class="col-md-6">
				<div class=row>
				<jsp:scriptlet>
				 String id,job_profile, company, experience, description, date1, time1;
                            try
                            {
					Class.forName("com.mysql.cj.jdbc.Driver");
            		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
          	                                
                                PreparedStatement ps=con.prepareStatement("select * from jobs");
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    id=rs.getString("id");
                                    job_profile=rs.getString("job_profile");
                                    company=rs.getString("company");
                                    experience=rs.getString("experience");
                                    description=rs.getString("description");
                                    date1=rs.getString("date1");
                                    time1=rs.getString("time1");
                                    </jsp:scriptlet>
                                    <div class="col-md-12 display_job_div py-2">
                                <b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br>
                            <span class="glyphicon glyphicon-home"></span> <span style="color: #9f9d9d"> Company : </span> <jsp:expression>company</jsp:expression> </span> <br>
                                <span> <span class="glyphicon glyphicon-book"></span> <span style="color: #9f9d9d"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                                <span> <span class="glyphicon glyphicon-file"></span>  <span style="color: #9f9d9d"> Job Description : </span> <jsp:expression>description</jsp:expression> </span> <br>
                                <br><a href="job-description.jsp?id=<jsp:expression>id</jsp:expression>"> See Full Details </a>
                            </div>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                        </jsp:scriptlet>
								
					</div>
				</div>
				<div class="col-md-3">
					<ul>
						<li> <a href=""> Infosys </a> </li>
						<li> <a href=""> Wipro </a> </li>
						<li> <a href=""> IBM </a> </li>
						<li> <a href=""> Google </a> </li>
					</ul>
				</div>
			</div>
			
	<jsp:include page="footer'.jsp"></jsp:include>
	
</div>
</body>
</html>