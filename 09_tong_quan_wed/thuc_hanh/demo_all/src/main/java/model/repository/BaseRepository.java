package model.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    //allowPublicKeyRetrieval=true&
    // private String jdbcURL = "jdbc:mysql://localhost:3306/database_furama?allowPublicKeyRetrieval=true&useSSL=false";
    private String jdbcURL = "jdbc:mysql://localhost:3306/product_managerment?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";
    static Connection connection ;
    protected Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}