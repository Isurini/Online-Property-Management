package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import services.PaymentServices;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentID = request.getParameter("id");
        boolean isDeleted = PaymentServices.deletePayment(paymentID);

        if (isDeleted) {
            response.getWriter().println("<script>alert('Delete Successful'); window.location.href='AddPayments.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Delete Failed'); window.location.href='ViewPayments.jsp';</script>");
        }
    }
}
