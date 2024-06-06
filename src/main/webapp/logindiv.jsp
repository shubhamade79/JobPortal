<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 mx-2 my-5">
                <div class="reg_div_design">
                    <form method="POST" action="Login" >
                        <br> <h2> Login Here </h2> <br>
                        <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" /> <br> <br>
                        <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" /> <br> <br>
                        <input type="checkbox" name="rememberme1" value="rememberme" /> Remember Me <br> <br>
                        <input type="submit" value="Login" class="btn btn-primary" /> <br> <br> <br>
                    </form>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </body>
</html>