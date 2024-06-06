import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Login")
public class Login extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		
		String email2=req.getParameter("email1");
		String pass2=req.getParameter("pass1");
		String remme2=req.getParameter("rememberme1");
		
		String name2="",gender2="",city2="",field2="";
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
			PreparedStatement ps=con.prepareStatement("select * from register where email=? and password=?");
			ps.setString(1,email2);
			ps.setString(2,pass2);
				
			ResultSet re=ps.executeQuery();
			if(re.next()) {if(remme2==null || remme2.equals("null"))
            {
                remme2="";
            }
            if(remme2.equals("rememberme"))
            {
                Cookie ck1=new Cookie("cookie_email", email2);
                ck1.setMaxAge(60*60*24*365);
                resp.addCookie(ck1);
                
                Cookie ck2=new Cookie("cookie_status", "true");
                ck2.setMaxAge(60*60*24*365);
                resp.addCookie(ck2);
            }
            
            RequestDispatcher rd=req.getRequestDispatcher("GetUserData");
            rd.include(req, resp);
            
            resp.sendRedirect("profile.jsp");
        }
        else
        {
//            resp.sendRedirect("login.jsp");
            RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
            rd1.include(req, resp);
            
            RequestDispatcher rd2=req.getRequestDispatcher("menubar.jsp");
            rd2.include(req, resp);
            req.setAttribute("error_message", "Invalid email id and password...!!");

            RequestDispatcher rd3=req.getRequestDispatcher("error.jsp");
            rd3.include(req, resp);
            
            RequestDispatcher rd4=req.getRequestDispatcher("logindiv.jsp");
            rd4.include(req, resp);
            
            RequestDispatcher rd5=req.getRequestDispatcher("footer'.jsp");
            rd5.include(req, resp);
        }
    }
    catch(Exception e)
    {
        out.print("Exception : "+e);
    }
		}
			
	}


