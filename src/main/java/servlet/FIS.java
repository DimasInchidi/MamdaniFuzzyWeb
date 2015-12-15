package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

/**
 * 2015 Dimas Ari for all my friends. Thanks
 */
@WebServlet(name = "FIS", urlPatterns = "/FIS")
public class FIS extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        F_Fuzzy Fuzzy = new F_Fuzzy();
        int jeniskelamin, nomorsepatu=0, warnakulit, tinggibadan=0, fail = 0;
        switch (request.getParameter("jeniskelamin")){
            case "Perempuan":
                jeniskelamin = 1;
                break;
            default:
                jeniskelamin = 0;
                break;
        }
        switch (request.getParameter("warnakulit")){
            case "Hitam":
                warnakulit = 0;
                break;
            case "Coklat":
                warnakulit = 1;
                break;
            case "Sawo Matang":
                warnakulit = 2;
                break;
            case "Kuning Langsat":
                warnakulit = 3;
                break;
            case "Putih":
                warnakulit = 4;
                break;
            default:
                warnakulit = 0;
                break;
        }
        try {
            nomorsepatu = Integer.parseInt(request.getParameter("nomorsepatu"));
            tinggibadan = Integer.parseInt(request.getParameter("tinggibadan"));
        }catch (Exception ex){
            fail = 1;
        }

        if (fail ==1 || nomorsepatu == 0 || tinggibadan == 0){
            response.sendRedirect("/form?fail=true");
        }else{
            int[] Values = {jeniskelamin, nomorsepatu, warnakulit, tinggibadan};
            System.out.println(Arrays.toString(Values));
            float NilaiKemiripan = Fuzzy.FIS(Values);
            F_Koneksi FK = new F_Koneksi();
            FK.Insert("INSERT INTO clientdata (\"id\", \"jeniskelamin\", \"nomorsepatu\", \"warnakulit\", \"tinggibadan\", \"nama\", \"nilaikemiripan\") " +
                    "VALUES ('"+request.getParameter("id")+"', '"+jeniskelamin+"', '"+nomorsepatu+"', '"+warnakulit+"', '"+tinggibadan+"', '"+request.getParameter("nama")+"', '"+NilaiKemiripan+"');");
            response.sendRedirect("/hasil?mamimu=" + request.getParameter("id"));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/form");
    }
}
