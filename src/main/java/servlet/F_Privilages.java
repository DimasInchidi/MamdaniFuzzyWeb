package servlet;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by inchidi on 29/10/15.
 */
public class F_Privilages extends F_Koneksi {

    servlet.O_User User = new O_User();

    public F_Privilages() {
        User.setUsername("");
        User.setLevel("");
    }

    public boolean doLogin(String Username, String Pass) {
        String condition = "WHERE Username = '" + CleanInput(Username) + "' AND Katakunci = sha1('" + CleanInput(Pass) + "')";
        try{
            ResultSet rs = super.Select("`Username`, `Level`","dataUser",condition);
            rs.next();
            User.setUsername(rs.getString(1));
            System.out.println(User.getUsername());
            User.setLevel(rs.getString(2));
            doUpdateLastLogin();
            return true;
        }catch(Exception ex){
            return false;
        }
    }

    private void doUpdateLastLogin() {
        //UPDATE `IntracoCSA`.`dataUser` SET `LastLogin` = '2015-09-15 09:33:36' WHERE `dataUser`.`Username` = 'admin';
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date dt = new Date();
        String LastLogin = date.format(dt);
        Update("`LastLogin` = '"+LastLogin+"'","`dataUser`","`Username` = '"+User.getUsername()+"'");
        User.setLastLogin(LastLogin);
    }
}
