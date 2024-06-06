
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

@SuppressWarnings("serial")
@WebServlet("/AddEducationDetails")

public class AddEducationDetails extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html");
    	
    	PrintWriter out=response.getWriter();
        HttpSession session = request.getSession();
        String email2 = (String) session.getAttribute("session_email");

        String school2 = request.getParameter("school1");
        String degree2 = request.getParameter("degree1");
        String grade2 = request.getParameter("grade1");
        String year2 = request.getParameter("year1");
        String description2 = request.getParameter("description1");
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
          	con.setAutoCommit(false);
           	PreparedStatement ps = con.prepareStatement("INSERT INTO education(email, school, degree, year, grade, description) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, email2);
            ps.setString(2, school2);
            ps.setString(3, degree2);
            ps.setString(4, year2);
            ps.setString(5, grade2);
            ps.setString(6, description2);

            int i1 = ps.executeUpdate();

            if (i1 > 0) {
            	con.commit();
            	response.sendRedirect("profile.jsp");
            } else {
            	con.rollback();
                RequestDispatcher rd1 = request.getRequestDispatcher("error.jsp");
                rd1.include(request, response);
                
                RequestDispatcher rd2 = request.getRequestDispatcher("edit-profile-education.jsp");
                rd2.include(request, response);
            }

        } catch (Exception e) {
        	e.printStackTrace();
        }
        
    }
}
