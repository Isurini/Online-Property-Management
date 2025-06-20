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



@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		boolean isTrue;
		
		isTrue = UserServices.deleteaccount(id);
		if(isTrue == true) {
			 String alertMessage ="Account Delete Successful";
			 response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='Register.jsp'</script>");
			 
		 }
		 else {
			 List<UserModel>userdetails = UserServices.getById(id);
			 request.setAttribute("userdetails",userdetails );
				 
			 RequestDispatcher dis2 = request.getRequestDispatcher("Login.jsp");
			 dis2.forward(request,response);
		 }
		
		
	}

}
