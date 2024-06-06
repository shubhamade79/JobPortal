
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/DeleteExperienceDetails")
@SuppressWarnings("serial")
public class DeleteExperienceDetails extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      response.setContentType("text/html");
      
      String id2 = request.getParameter("id1");
     
      try {
    	  Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
          con.setAutoCommit(false);
          PreparedStatement ps = con.prepareStatement("delete from experience where id=?");
          
          ps.setString(1, id2);

          int i1 = ps.executeUpdate();

          if (i1 > 0) {
        	  con.commit();
              response.sendRedirect("profile.jsp");
          } 
          else {
        	  con.rollback();
              RequestDispatcher rd1 = request.getRequestDispatcher("error.jsp");
              rd1.include(request, response);
              
              RequestDispatcher rd2 = request.getRequestDispatcher("edit-profile-experience.jsp");
              rd2.include(request, response);
          }

      } 
      catch (Exception e) {
    	  				e.printStackTrace();
    	  				
			}
      RequestDispatcher rd1 = request.getRequestDispatcher("error.jsp");
      rd1.include(request, response);
      
      RequestDispatcher rd2 = request.getRequestDispatcher("edit-profile-experience.jsp");
      rd2.include(request, response);
  }
}
