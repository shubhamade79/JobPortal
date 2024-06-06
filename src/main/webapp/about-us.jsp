<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:include page="CheckCookie"></jsp:include>


<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>About Us</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <div class="container-fluid">
            
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
            
                <div class="container">
        <h1>About Us</h1>
        <p>Welcome to our job portal, where we strive to connect job seekers with employers in an efficient and user-friendly manner.</p>
        <br>
        <h2>Our Mission</h2>
        <p>Our mission is to simplify the job search process for both job seekers and employers. We aim to provide a platform where talented individuals can find meaningful employment opportunities, and where employers can efficiently recruit the best candidates for their organizations.</p>
        <br>
        <h2>Our Team</h2>
        <p>Behind our job portal is a dedicated team of professionals passionate about bridging the gap between job seekers and employers. From developers to designers, from customer support to marketing experts, we work together to ensure the success of our platform.</p>
        <br>
        <h2>Contact Us</h2>
        <p>If you have any questions, feedback, or suggestions, please don't hesitate to <a href="contact-us.jsp">contact us</a>. We value your input and are always looking for ways to improve our services.</p>
    <br></div>
            <jsp:include page="footer'.jsp"></jsp:include>
        </div>
    </body>
</html>