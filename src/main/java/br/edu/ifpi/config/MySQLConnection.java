package br.edu.ifpi.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {

    private final static String url = "jdbc:mysql://localhost:3306/prova_bd2_2025.1";
    private final static String usuario = "root";
    private final static String senha = "admin123";
    private static Connection connection;

    public MySQLConnection() {}

    public static Connection getConnection() throws SQLException {
        connection = DriverManager.getConnection(url, usuario, senha);
        return connection;
    }
}
