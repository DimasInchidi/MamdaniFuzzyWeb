package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by inchidi on 29/10/15.
 */
@WebServlet(
        name = "Login",
        urlPatterns = {"/Login"}    )
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    servlet.O_User User = new O_User();
    F_Privilages Priv = new F_Privilages();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user;
        String level;
        //for debug only
        boolean UserExist = Priv.doLogin(request.getParameter("username"), request.getParameter("password"));
        if (UserExist) {
            System.out.println("user exist");
            user = User.getUsername();
            level = User.getLevel();
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            session.setAttribute("level", level);
            response.sendRedirect("dashboard");
        } else {
            System.out.println("userNOTexist");
            User.setUsername("");
            User.setLevel("");
            response.sendRedirect("");
        }
    }

}
