package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.UserModel;
import services.UserServices;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	HttpSession session = request.getSession(false);
    	UserModel user = (session != null) ? (UserModel) session.getAttribute("user") : null;
    	String email = (user != null) ? user.getEmail() : null;


        if (email == null || email.trim().isEmpty()) {
            String alertMessage ="Session expired. Please log in again.";
			 response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='Login.jsp'</script>");
            return;
        }

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmNewPassword");

        if (!newPassword.equals(confirmPassword)) {
            String alertMessage ="New passwords do not match.";
			 response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='ChangePassword.jsp'</script>");
            return;
        }

        boolean isTrue = UserServices.changePassword(email, oldPassword, newPassword);

        if (isTrue) {
            session.invalidate(); // Clear session after password change
            String alertMessage ="Password changed successfully. Please log in again.";
			 response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='Login.jsp'</script>");
        }
        else {
            String alertMessage ="Password change failed. Please check your current password.";
			 response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='ChangePassword.jsp'</script>");
        }
    }

}
