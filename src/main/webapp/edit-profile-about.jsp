<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="CheckCookie"></jsp:include>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String fields = (String) session.getAttribute("session_fields");
    String title = (String) session.getAttribute("session_title");
    if(title==null || title.equals(""))
    {
        title="";
    }
    String skills = (String) session.getAttribute("session_skills");
    if(skills==null || skills.equals(""))
    {
        skills="";
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
           <script>
            function changeGender()
            {
                document.getElementById('changegender1').value = document.getElementById('changegen').value;
            }
            function changeCity()
            {
                document.getElementById('chngcitytf').value = document.getElementById('changecity').value;
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
                        <h2> Edit Personal Details </h2> <br>
                        <form action="EditProfileAbout" method="POST">
                            <b> <jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("session_email") </jsp:expression>) <br> <br>
                            <input type="text" value="<jsp:expression> name</jsp:expression>" name="name1" class="textfield_design" placeholder="Enter Name"/> <br> <br>
                            <input id="changegender1" type="text" value="<jsp:expression> gender</jsp:expression>" name="gender1" class="textfield_design" placeholder="Select Gender" readonly="" />
                                <select id="changegen" onchange="changeGender()">
                                    <option disabled=""> Select Gender </option>
                                    <option> Male </option>
                                    <option> Female </option>
                                </select>
                                <br> <br>
                                <input id="chngcitytf" type="text" value="<jsp:expression> city</jsp:expression>" name="city1" class="textfield_design" placeholder="Select City" readonly=""/>
                                <select id="changecity" onchange="changeCity()">
                                    <option disabled=""> Select City </option>
                                    <option value="Pune"> Pune </option>
                                    <option value="Mumbai"> Mumbai </option>
                                    <option value="Nashik"> Nashik </option>
                                </select>
                                <br> <br>
                                <input type="text" value="<jsp:expression> title</jsp:expression>" name="title1" class="textfield_design" placeholder="Profile Title" /> <br> <br>
                            <textarea placeholder="Skills" name="skills1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"><jsp:expression>skills</jsp:expression></textarea> <br> <br>
                                <input type="submit" value="Update" class="btn btn-danger" />
                            </form>
                        </div>
                </div>
            </div>
            <div class="col-md-2"> </div>
        </div>
        <jsp:include page="footer'.jsp" />
    </body>
</html>
