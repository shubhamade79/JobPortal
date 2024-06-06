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
@SuppressWarnings("serial")
@WebServlet("/reg")
public class Register extends HttpServlet {
	
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			String name2=request.getParameter("name1");
			String email2=request.getParameter("email1");
			String pass2=request.getParameter("pass1");
			String gender2=request.getParameter("gender1");
			String[] field2=request.getParameterValues("field1");
			String city2=request.getParameter("city1");
			
			String fields2="";
			if(field2!=null) 
			{
			for(String s:field2) {
				fields2=fields2+","+s;
			}
			}
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jobportal", "root", "9168505036");
           		PreparedStatement ps=con.prepareStatement("insert into register(name,email,password,gender,field,city) values(?,?,?,?,?,?)");
				ps.setString(1,name2);
				ps.setString(2,email2);
				ps.setString(3,pass2);
				ps.setString(4,gender2);
				ps.setString(5,fields2);
				ps.setString(6,city2);
				int i1=ps.executeUpdate();				
				PreparedStatement ps2=con.prepareStatement("insert into about_user(email,about,skills) values(?,?,?)");
				ps2.setString(1,email2);
				ps2.setString(2,"");
				ps2.setString(3,"");
				int i2=ps2.executeUpdate();				

				PreparedStatement ps3=con.prepareStatement("insert into profile_pics(email,path) values(?,?)");
				ps3.setString(1,email2);
				ps3.setString(2,"profilepic.png");//by default profile img upload
				int i3=ps3.executeUpdate();
//				
				if(i1>0 && i2>0) {
					response.sendRedirect("profile.jsp");

					HttpSession session=request.getSession();
					session.setAttribute("session_name", name2);
					session.setAttribute("session_email", email2);
					session.setAttribute("session_gender", gender2);
					session.setAttribute("session_city", city2);
					session.setAttribute("session_field", field2);
					
					session.setAttribute("session_title","");
					session.setAttribute("session_skills","");

					session.setAttribute("session_profilepic","profilepic.png");
				}
				else{
					out.print("Failed ");
					
				}

			}
			catch(Exception e){
				e.printStackTrace();
				out.print("Error: " + e.getMessage()); // Print error message to the response
			}
		}
	}

