package com.gumi.enjoytrip.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private DBUtil() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private static DBUtil instance = new DBUtil();

    public static DBUtil getInstance() {
        return instance;
    }

    public Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://127.0.0.1:3306/enjoytrip?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8";
        String user = "root";
        String pwd = "wkwjsrj5886";
        
//        String user = "ssafy";
//        String pwd = "ssafy";
        return DriverManager.getConnection(url, user, pwd);
    }

    public void close(AutoCloseable... closeables) {
        for (AutoCloseable c : closeables) {
            if (c != null) {
                try {
                    c.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void commit(Connection connection) {
        if (connection != null) {
            try {
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void rollback(Connection connection) {
        if (connection != null) {
            try {
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}

