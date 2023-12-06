/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoMySql {
    
    private static final String url = "jdbc:mysql://127.0.0.1:3306/trabalho_bd";
    private static final String usuario = "root";
    private static final String senha = "2003";

    public static Connection obterConexao() {
        try {
            return DriverManager.getConnection(url, usuario, senha);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao obter conexão com o banco de dados", e);
        }
    }

    
}
