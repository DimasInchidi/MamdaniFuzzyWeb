package servlet;

/**
 * Created by inchidi on 20/11/15.
 */
public class O_User {
    private String Username;
    private String Nama;
    private String Level;
    private String LastLogin;

    public void setUsername(String Username){
        this.Username = Username;
    }

    public void setLastLogin(String lastLogin) {
        LastLogin = lastLogin;
    }

    public void setLevel(String level) {
        Level = level;
    }

    public void setNama(String nama) {
        Nama = nama;
    }

    public String getLevel() {
        return Level;
    }

    public String getNama() {
        return Nama;
    }

    public String getUsername() {
        return Username;
    }

    public String getLastLogin() {
        return LastLogin;
    }
}
