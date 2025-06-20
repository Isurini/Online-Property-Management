package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FAQs;
import services.FAQsServices;

@WebServlet("/ViewFAQsServlet")
public class ViewFAQsServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Fetch all FAQs using service
		List<FAQs> faqsList = FAQsServices.getAllFAQs();

		// Set it as request attribute
		request.setAttribute("faqsList", faqsList);

		// Forward to JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayFAQs.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
