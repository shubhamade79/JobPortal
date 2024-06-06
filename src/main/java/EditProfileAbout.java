import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/EditProfileAbout")
public class EditProfileAbout extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email2 = (String) session.getAttribute("session_email");
        String name2 = request.getParameter("name1");
        String city2 = request.getParameter("city1");
        String gender2 = request.getParameter("gender1");
        String title2 = request.getParameter("title1");
        String skills2 = request.getParameter("skills1");
        Connection con = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
       		

            PreparedStatement ps1 = con1.prepareStatement("UPDATE register SET name=?, city=?, gender=? WHERE email=?");
            ps1.setString(1, name2);
            ps1.setString(2, city2);
            ps1.setString(3, gender2);
            ps1.setString(4, email2);
            int i1 = ps1.executeUpdate(); // executeUpdate() for UPDATE statement

            PreparedStatement ps2 = con1.prepareStatement("UPDATE about_user SET about=?, skills=? WHERE email=?");
            ps2.setString(1, title2);
            ps2.setString(2, skills2);
            ps2.setString(3, email2);
            int i2 = ps2.executeUpdate(); // executeUpdate() for UPDATE statement

            if (i1 > 0 && i2 > 0) {
            	session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_city", city2);
				
				session.setAttribute("session_title",title2);
				session.setAttribute("session_skills",skills2);
				
	            response.sendRedirect("profile.jsp");

            
            } else {
            	
            	RequestDispatcher rd1=request.getRequestDispatcher("error.jsp");
            	rd1.include(request, response);
            	RequestDispatcher rd2=request.getRequestDispatcher("edit-profile-about.jsp");
            	rd2.include(request, response);
            }

        } catch (Exception e) {  
        	e.printStackTrace();
		}
	          }
        
    }

