package util;

import java.sql.*;

public class DBUtil {

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/test1?useSSL=true";
        String user = "root";
        String pwd = "123456";
        Connection con = DriverManager.getConnection(url,user,pwd);
        return con;
    }

    public void close(ResultSet rs) {
    }

    public void close(PreparedStatement preparedStatement) {
    }

    public void close(Connection connection) {
    }
}
