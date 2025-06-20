package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.UserServices;

@WebServlet("/UserInsertServlet")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String firstname = request.getParameter("firstname");
		 String lastname = request.getParameter("lastname");
		 String contactnumber = request.getParameter("contactnumber");
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
		 String confirmpassword = request.getParameter("confirmpassword");
		 
		 
		 boolean isTrue;
		
		 isTrue = UserServices.insertdata(firstname,lastname,contactnumber,email,password,confirmpassword);
		 
		 if(isTrue == true) {
			 String alertMessage ="Register Successful";
			 response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='Login.jsp'</script>");
			 
		 }
		 else {
			 RequestDispatcher dis2 = request.getRequestDispatcher("Register.jsp");
			 dis2.forward(request,response);
		 }
		 

}
}

