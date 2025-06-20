package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.FAQs;
import services.FAQsServices;

@WebServlet("/UpdateFAQsServlet")
public class UpdateFAQsServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int faqsid = Integer.parseInt(request.getParameter("faqsid"));
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        FAQs faq = new FAQs(faqsid, 0, question, answer);

        if (FAQsServices.updateFAQ(faq)) {
            response.getWriter().println("<script>alert('Answer Send Successful.'); window.location.href='Profile.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Answer Update Failed.'); window.location.href='ViewFAQsServlet';</script>");
        }
    }
}
