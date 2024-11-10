package am.azaryan.authorbookee.servlet;

import am.azaryan.authorbookee.model.Author;
import am.azaryan.authorbookee.service.AuthorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/authors")
public class AuthorServlet extends HttpServlet {

    private final AuthorService authorService = new AuthorService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Author> allAuthors = authorService.getAllAuthors();
        req.setAttribute("authors", allAuthors);
        req.getRequestDispatcher("/authors.jsp").forward(req,resp);
    }
}