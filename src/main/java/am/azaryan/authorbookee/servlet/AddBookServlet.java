package am.azaryan.authorbookee.servlet;

import am.azaryan.authorbookee.model.Author;
import am.azaryan.authorbookee.model.Book;
import am.azaryan.authorbookee.model.Gender;

import am.azaryan.authorbookee.service.AuthorService;
import am.azaryan.authorbookee.service.BookService;
import am.azaryan.authorbookee.util.DateUtil;
import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {

    private final BookService bookService = new BookService();
    private final AuthorService authorService = new AuthorService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Author> authorList = authorService.getAllAuthors();
        req.setAttribute("authors",authorList);
        req.getRequestDispatcher("/addBook.jsp").forward(req, resp);
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        double price = Double.parseDouble(req.getParameter("price"));
        int qty = Integer.parseInt(req.getParameter("qty"));
        Date createdAt = DateUtil.fromSqlStringToDateTime(req.getParameter("createdAt"));
        String author = req.getParameter("author_id");
        Author author1 = Author.
                builder().id(Integer.parseInt(author)).build();
        Book book = Book.builder()
                .title(title)
                .price(price)
                .qty(qty)
                .author(author1)
                .createdAt(createdAt)
                .build();
        bookService.add(book);

        resp.sendRedirect("/books");
    }
}
