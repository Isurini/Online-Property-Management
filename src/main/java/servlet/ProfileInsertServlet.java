package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;


@WebServlet("/ProfileInsertServlet")
public class ProfileInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	private void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Retrieve user information from session
	UserModel user = (UserModel) request.getSession().getAttribute("user");
	
	if(user !=null) {
		//forward user data to Profile.jsp
		request.setAttribute("user", user);
		request.getRequestDispatcher("Profile.jsp").forward(request, response);
	}
	else {
		//Handle case where user is not logged in
		response.sendRedirect("Login.jsp");
	}
}
}