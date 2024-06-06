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
@WebServlet("/EditExperienceDetails")

@SuppressWarnings("serial")
public class EditExperienceDetails extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      response.setContentType("text/html");
//		PrintWriter out=response.getWriter();
		
      String id2 = request.getParameter("id1");
      String company2 = request.getParameter("company1");
      String location2 = request.getParameter("location1");
      String year2 = request.getParameter("year1");
      String job_title2 = request.getParameter("job_title1");
      String description2 = request.getParameter("description1");
     
      try {
    	  Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
          PreparedStatement ps = con.prepareStatement("update experience set company=?,location=?,year=?,job_title=?,description=? where id=?");
          ps.setString(1, company2);
          ps.setString(2, location2);
          ps.setString(3, year2);
          ps.setString(4, job_title2);
          ps.setString(5, description2);
          ps.setString(6, id2);

          int i1 = ps.executeUpdate();

          if (i1 > 0) {
              response.sendRedirect("profile.jsp");
          } 
          else {

              RequestDispatcher rd1 = request.getRequestDispatcher("error.jsp");
              rd1.include(request, response);
              
              RequestDispatcher rd2 = request.getRequestDispatcher("edit-profile-experience.jsp");
              rd2.include(request, response);
          }

      } 
      catch (Exception e) {
    	  e.printStackTrace();
			}
    	  
      
  }
}

