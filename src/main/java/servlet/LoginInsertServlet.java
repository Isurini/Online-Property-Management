package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import services.UserServices;

@WebServlet("/LoginInsertServlet")
public class LoginInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
		    List<UserModel> userlogin = UserServices.loginValidate(email, password);
		    
		    if (userlogin != null && !userlogin.isEmpty()) {
		        
		        // Set the user session
		        request.getSession().setAttribute("user", userlogin.get(0));
		        
		        request.getSession().setAttribute("email", userlogin.get(0).getEmail());  // Assuming 'UserModel' has a getEmail() method


		        // Show alert and redirect using JavaScript
		        response.getWriter().println("<script>alert('Login Successful'); window.location.href='ProfileInsertServlet';</script>");

		    } else {
		        // Show alert and redirect to Login.jsp
		        response.getWriter().println("<script>alert('Invalid Credentials, Please try again.'); window.location.href='Login.jsp';</script>");
		    }

		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
}
