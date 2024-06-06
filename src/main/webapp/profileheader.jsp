
<jsp:scriptlet>
    String name=(String)session.getAttribute("session_name");
    String gender=(String)session.getAttribute("session_gender");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Welcome : <jsp:expression> name </jsp:expression> </title>
    </head>
    <body>
        <div class="row header_bg">
            <div class="col-md-9">
                <a href="index.jsp">
                    <img class="logo" src="img/logo.jpg" height="50" style="border: 2px solid black;"/>
                <span class="logo_text_design"> Job Portal </span>
            </a>
            </div>
            <div class="col-md-3 my-2" >
                <span style="color: yellow"> Welcome : <img class="logo " style="border: 2px solid black;" src="img/profilepic.png" height="30"/> <a href="profile.jsp" style="text-decoration:none;color:white;font-size:10px">                        
                <jsp:expression> name </jsp:expression> </a> </span>/<a href="Logout" style="text-decoration:none;color:white;font-size:10px" class="hyperlinks_design"> Logout </a>
                
            </div>
        </div>
    </body>
</html>