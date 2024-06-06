
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteMyJobApplication")

@SuppressWarnings("serial")
public class DeleteMyJobApplication extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session=req.getSession();
        String email=(String) session.getAttribute("session_email");
        
        String jid=req.getParameter("jobid");
        
        try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
            
            PreparedStatement ps=con.prepareStatement("delete from applied_job where email=? and jobid=?");
            ps.setString(1, email);
            ps.setString(2, jid);
            int i=ps.executeUpdate();
            if(i>0)
            {
              
                resp.sendRedirect("my-applied-jobs.jsp");
            }
            else
            {
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                RequestDispatcher rd2=req.getRequestDispatcher("job-description.jsp?jid="+jid);
                rd2.include(req, resp);
            }
        }
        catch(Exception e)
        {

        	e.printStackTrace();
        }
        }
       
    }

