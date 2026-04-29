package com.quanly_matbang.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static final String jdbcURL = "jdbc:mysql://localhost:3306/ql_matbang";
    public static final String jdbcUsername = "root";
    public static final String jdbcPassword = "123456";

    private static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                System.out.println("Connected to database");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
    // main test
//    public static void main(String[] args) {
//        Connection conn = DBConnection.getConnection();
//
//        if (conn != null) {
//            System.out.println("Kết nối thành công!");
//        } else {
//            System.out.println("Kết nối thất bại!");
//        }
//    }
}