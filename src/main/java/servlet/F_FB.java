package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * 2015 Dimas Ari for all my friends. Thanks
 */
@WebServlet(name = "F_FB",urlPatterns = "/FBConnect")
public class F_FB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String code,url, accessToken, graph;
    Map fbProfileData;
    code = "";
    if (code.equals("")) {
        FBConnection fbConnection = new FBConnection();
        url = fbConnection.getFBAuthUrl();
        response.sendRedirect(url);
    } else{
        FBConnection fbConnection = new FBConnection();
        accessToken = fbConnection.getAccessToken(code);
        FBGraph fbGraph = new FBGraph(accessToken);
        graph = fbGraph.getFBGraph();
        fbProfileData = fbGraph.getGraphData(graph);

        F_Koneksi Koneksi = new F_Koneksi();
        String query = "SELECT * FROM datauser WHERE userid = '"+fbProfileData.get("id")+"';";
        if (Koneksi.SelectCheck(query)){
            HttpSession session = request.getSession();
            session.setAttribute("ID",fbProfileData.get("id"));
            response.sendRedirect("/hasil");
        }else{
            String fail;
            HttpSession session = request.getSession();
            if (session.getAttribute("fail") == null || session.getAttribute("fail").equals("")){
                fail = "none";
            } else{
                fail = session.getAttribute("fail").toString();
            }
    }
}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
