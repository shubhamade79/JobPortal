import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/GetUserData")

public class GetUserData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req, resp);
    }
    
    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String email2;
        try
        {
            email2=req.getParameter("email1");
            if(email2==null || email2.equals("null"))
            {
                email2=(String)req.getAttribute("email1");
            }
        }
        catch(Exception e)
        {
            email2=(String)req.getAttribute("email1");
        }
        
        System.out.println("i am on GetUserData page : "+email2);
        
        String name2="", gender2="", city2="", field2="";
        
        
        try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
			PreparedStatement ps=con.prepareStatement("select * from register where email=?");
            ps.setString(1, email2);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                name2=rs.getString("name");
                gender2=rs.getString("gender");
                city2=rs.getString("city");
                field2=rs.getString("field");
                
                HttpSession session=req.getSession();
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                session.setAttribute("session_fields", field2);
                
                String title="", skills="";
                PreparedStatement ps2=con.prepareStatement("select * from about_user where email=?");
                ps2.setString(1, email2);
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                {
                    title=rs2.getString("about");
                    skills=rs2.getString("skills");
                }
                
                session.setAttribute("session_title", title);
                session.setAttribute("session_skills", skills);
                
                String filename="";
                PreparedStatement ps3=con.prepareStatement("select * from profile_pics where email=?");
                ps3.setString(1, email2);
                ResultSet rs3=ps3.executeQuery();
                while(rs3.next())
                {
                    filename=rs3.getString("path");
                }
                session.setAttribute("session_profilepic", filename);
                
                resp.sendRedirect("profile.jsp");
            }
        }
        catch(Exception e)
        {
        	e.printStackTrace();
			out.print("Error: " + e.getMessage()); // Print error message to the response
        }
    }

}
