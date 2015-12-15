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
@WebServlet(name = "F_FB",urlPatterns = "/FBConnect")
public class F_FB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String code,url, accessToken, graph;
        FBConnection fbConnection = new FBConnection();
        url = fbConnection.getFBAuthUrl();
        response.sendRedirect(url);
    }
}
