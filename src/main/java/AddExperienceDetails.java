import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/AddExperienceDetails")

@SuppressWarnings("serial")
public class AddExperienceDetails extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      response.setContentType("text/html");

      HttpSession session = request.getSession();
      String email2 = (String) session.getAttribute("session_email");
      String company2 = request.getParameter("company1");
      String location2 = request.getParameter("location1");
      String year2 = request.getParameter("year1");
      String jobtitle2 = request.getParameter("jobtitle1");
      String description2 = request.getParameter("description1");
      try {
    	  Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
     		          con.setAutoCommit(false);
          PreparedStatement ps = con.prepareStatement("INSERT INTO experience(email, company, location, year, job_title, description) VALUES (?, ?, ?, ?, ?, ?)");
          ps.setString(1, email2);
          ps.setString(2, company2);
          ps.setString(3, location2);
          ps.setString(4, year2);
          ps.setString(5, jobtitle2);
          ps.setString(6, description2);

          int i1 = ps.executeUpdate();

          if (i1 > 0) {
        	  con.commit();
              response.sendRedirect("profile.jsp");
          } else {
        	  con.rollback();
              RequestDispatcher rd1 = request.getRequestDispatcher("error.jsp");
              rd1.include(request, response);
              
              RequestDispatcher rd2 = request.getRequestDispatcher("add-profile-experience.jsp");
              rd2.include(request, response);
          }

      } catch (Exception e) {
				
					e.printStackTrace();
				}
	
  }
}
