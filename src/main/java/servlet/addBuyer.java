package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.buyer;
import services.buyerService;


@WebServlet("/addBuyer")
public class addBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addBuyer() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		buyer bu=new buyer();
		bu.setNic(request.getParameter("nic"));
		bu.setName(request.getParameter("name"));
		bu.setNumber(request.getParameter("number"));
		bu.setEmail(request.getParameter("email"));
		bu.setMessage(request.getParameter("message"));
		
		buyerService service = new buyerService();
		service.regBuyer(bu);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("inquireDetail.jsp");
		request.setAttribute("inquireDetails", bu);

		dispatcher.forward(request, response);
	}

}
