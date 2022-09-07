package controller;

import dao.BookDAO;
import dao.CustomerDAO;
import model.Book;
import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RegisterController", urlPatterns = "/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            CustomerDAO customerDAO = new CustomerDAO();
            BookDAO bookDAO = new BookDAO();

            if(customerDAO.customerLogin(username, password)) {
                HttpSession session = request.getSession();
                Customer customer = customerDAO.getCustomerByUsername(username);
                session.setAttribute("userId", customer.getId());
                session.setAttribute("username", customer.getUsername());
                session.setAttribute("customerName", (customer.getFirstName() + " " +customer.getLastName()));

                List<Book> list = bookDAO.listAllBooks();
                request.setAttribute("list", list);
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
            else {
                response.sendRedirect("loginfalse.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
