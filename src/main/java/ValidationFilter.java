import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class ValidationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
            throws IOException, ServletException {
        String name2 = arg0.getParameter("name1");
        String email2 = arg0.getParameter("email1");
        String pass2 = arg0.getParameter("pass1");
        String gender2 = arg0.getParameter("gender1");
        String city2 = arg0.getParameter("city1");

        ValidationServerSide validation = new ValidationServerSide();

        if (!validation.nameValidate(name2)) {
            RequestDispatcher rd = arg0.getRequestDispatcher("register.jsp");
            rd.include(arg0, arg1);
        } else if (!validation.emailValidate(email2)) {
            RequestDispatcher rd = arg0.getRequestDispatcher("register.jsp");
            rd.include(arg0, arg1);
        } else if (!validation.passwordValidate(pass2)) {
            RequestDispatcher rd = arg0.getRequestDispatcher("register.jsp");
            rd.include(arg0, arg1);
        } else if (gender2 == null || gender2.equals("")) {
            RequestDispatcher rd = arg0.getRequestDispatcher("register.jsp");
            rd.include(arg0, arg1);
        } else if (city2 == null || city2.equals("")) {
            RequestDispatcher rd = arg0.getRequestDispatcher("register.jsp");
            rd.include(arg0, arg1);
        } else {
            arg2.doFilter(arg0, arg1); // Use arg2 instead of chain
        }
    }
}
