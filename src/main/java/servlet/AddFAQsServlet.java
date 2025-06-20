package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.FAQs;
import model.UserModel;
import services.FAQsServices;

@WebServlet("/AddFAQsServlet")
public class AddFAQsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int id = user.getId();
        String question = request.getParameter("question");

        FAQs faq = new FAQs(0, id, question, "");

        boolean isAdded = FAQsServices.addFAQ(faq);

        if (isAdded) {
            response.sendRedirect("ViewFAQsServlet");
        } else {
            request.setAttribute("error", "Failed to add FAQ to Record Page");
            RequestDispatcher dispatcher = request.getRequestDispatcher("FAQs.jsp");
            dispatcher.forward(request, response);
        }
    }
}
