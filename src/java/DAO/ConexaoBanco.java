package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBanco {

    Connection conexao = null;

    public Connection getConexao() throws ClassNotFoundException{
        try {
           Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/agenda", "root", "");
        } catch (SQLException e) {
        }
        return conexao;
    }
}
