package servlet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import static java.lang.Class.forName;
import static java.sql.DriverManager.getConnection;

public class F_Koneksi {


    private static final String JDBC_DRIVER;
    private static final String DATABASE_URL;
    private static final String USER;
    private static final String PASS;
    static {
        JDBC_DRIVER = "org.postgresql.Driver";
        DATABASE_URL = System.getenv("DB_URL");
        USER = System.getenv("USER");
        PASS = System.getenv("PASS");
    }
    private Connection con;
    private Statement stmt;

    /**
     *
     */
    public Connection Koneksi() {
        Connection connect;
        try {
            Properties props = new Properties();
            props.setProperty("user", USER);
            props.setProperty("password",PASS);
            props.setProperty("sslfactory", "org.postgresql.ssl.NonValidatingFactory");
            props.setProperty("ssl", "true");
            forName(JDBC_DRIVER);
            connect = getConnection(DATABASE_URL, props);
        } catch (SQLException|ClassNotFoundException se) {
            connect = null;
            //TODO: goto error page
        }
        return connect;
    }

    public Object[][] Select(String query, int colcount) {
        Object[][] hasil;
        try {
            con = Koneksi();
            query = query.replaceAll("`", "\"");
            stmt = con.createStatement();
            System.out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            List<Object[]> rowList = new ArrayList<>();
            List<Object> colList = new ArrayList<>();
            while (rs.next()){
                colList = new ArrayList<>();
                for (int j = 1; j < colcount+1; j++) {
                    colList.add(rs.getObject(j));
                }
                Object[] colArr = new Object[colList.size()];
                colArr= colList.toArray(colArr);
                rowList.add(colArr);
            }
            hasil = new Object[rowList.size()][colList.size()];
            hasil = rowList.toArray(hasil);
        } catch (SQLException|NullPointerException ex) {
            ex.printStackTrace();
            hasil = null;
        } finally {
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException ignored){
            }
            try{
                if(con!=null)
                    con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }
        System.out.println(Arrays.deepToString(hasil));
        return hasil;
    }

    public Object[] Select(String query) {
        Object[] hasil;
        try {
            con = Koneksi();
            query = query.replaceAll("`", "\"");
            stmt = con.createStatement();
            System.out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            List<Object> rowList = new ArrayList<>();
            while (rs.next()){
                rowList.add(rs.getObject(1));
            }
            hasil = new Object[rowList.size()];
            hasil = rowList.toArray(hasil);
        } catch (SQLException ex) {
            ex.printStackTrace();
            hasil = null;
        } finally {
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException ignored){
            }
            try{
                if(con!=null)
                    con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }
        System.out.println(Arrays.deepToString(hasil));
        return hasil;
    }

    public boolean SelectCheck(String query) {
        boolean ok;
        try {
            con = Koneksi();
            query = query.replaceAll("`", "\"");
            stmt = con.createStatement();
            System.out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) ok = true;
            else ok = false;
        } catch (SQLException ex) {
            ok = false;
        } finally {
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException ignored){
            }
            try{
                if(con!=null)
                    con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }
        return ok;
    }

    public boolean Update(String Query) {
        try {
            con = Koneksi();
            Query = Query.replaceAll("`", "\"");
            System.out.println(Query);
            stmt = con.createStatement();
            stmt.executeUpdate(Query);
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException ignored){
            }
            try{
                if(con!=null)
                    con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }
    }


    public boolean Insert(String sql) {
        try {
            con = Koneksi();
            sql = sql.replaceAll("`", "\"");
            stmt = con.createStatement();
            stmt.executeQuery(sql);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException ignored){
            }
            try{
                if(con!=null)
                    con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }
    }

    public boolean Delete(String sql) {
        try {
            con = Koneksi();
            sql = sql.replaceAll("`", "\"");
            stmt = con.createStatement();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            return false;
        } finally {
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException ignored){
            }
            try{
                if(con!=null)
                    con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }
    }

    public String CleanInput (String input){
        return input.replaceAll("'","''");
    }

}
