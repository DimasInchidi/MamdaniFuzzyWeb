package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 class ini dibangun untuk perKUTUan
 */
@WebServlet(
        name = "Inchidi",
        urlPatterns = {"/Inchidi"}    )
public class Wuzzup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try (ServletOutputStream out = resp.getOutputStream()) {
            out.print("Hello!");
            out.flush();
        }
    }

}