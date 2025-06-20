package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import services.UserServices;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id");
		 String firstname = request.getParameter("firstname");
		 String lastname = request.getParameter("lastname");
		 String contactnumber = request.getParameter("contactnumber");
		 String email = request.getParameter("email");
		 
		 boolean isTrue;
			
		 isTrue = UserServices.updateprofile(id,firstname,lastname,contactnumber,email);
		 
		 if(isTrue == true) {
			 List<UserModel>userdetails = UserServices.getById(id);
			 request.setAttribute("userdetails",userdetails );
			 String alertMessage ="Data Update Successful";
			 response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='Login.jsp'</script>");
			 
		 }
		 else {
			 RequestDispatcher dis2 = request.getRequestDispatcher("Profile.jsp");
			 dis2.forward(request,response);
		 }
	}

}
