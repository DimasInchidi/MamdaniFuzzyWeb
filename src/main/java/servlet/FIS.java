package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 2015 Dimas Ari for all my friends. Thanks
 */
@WebServlet(name = "FIS", urlPatterns = "/FIS")
public class FIS extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        F_Fuzzy Fuzzy = new F_Fuzzy();
        int jeniskelamin, nomorsepatu, warnakulit, tinggibadan;
        jeniskelamin = Integer.parseInt(request.getParameter("jeniskelamin"));
        nomorsepatu = Integer.parseInt(request.getParameter("nomorsepatu"));
        warnakulit = Integer.parseInt(request.getParameter("warnakulit"));
        tinggibadan = Integer.parseInt(request.getParameter("tinggibadan"));
        int[] Values = {jeniskelamin, nomorsepatu, warnakulit, tinggibadan};
        float NilaiKemiripan = Fuzzy.FIS(Values);
        response.sendRedirect("/hasil");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/form");
    }
}
