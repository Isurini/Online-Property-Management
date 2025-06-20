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


@WebServlet("/deleteInquireDetails")
public class deleteInquireDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public deleteInquireDetails() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		buyer bu=new buyer();
		bu.setNic(request.getParameter("nic"));
	
		buyerService service =new buyerService();
		service.deleteBuyer(bu);
		
		RequestDispatcher dispatcher= request.getRequestDispatcher("inquire.jsp");
		
		dispatcher.forward(request, response);
	}

}
