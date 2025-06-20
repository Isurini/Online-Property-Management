package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import services.FAQsServices;

@WebServlet("/DeleteFAQsServlet")
public class DeleteFAQsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int faqsid = Integer.parseInt(request.getParameter("faqsid"));

        if (FAQsServices.deleteFAQ(faqsid)) {
        	 response.getWriter().println("<script>alert('Record Delete Successful.'); window.location.href='Profile.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Record Delete Failed.'); window.location.href='Profile.jsp';</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
