package controller;

import dao.BookDAO;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControl", value = "/search")
public class SearchControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String key = request.getParameter("key");
        BookDAO bookDAO = new BookDAO();
        List<Book> list = bookDAO.searchBook(key);
        request.setAttribute("list", list);
        request.setAttribute("key", key);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}