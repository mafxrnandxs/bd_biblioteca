/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Consultas {

    // Métodos para a tabela cliente
   public static void inserirCliente(String nome, String email, String rg, int codigoEndereco) {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "INSERT INTO cliente (nome, email, rg, codigo_endereco) VALUES (?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, nome);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, rg);
                preparedStatement.setInt(4, codigoEndereco);
                preparedStatement.executeUpdate();
                JOptionPane.showMessageDialog(null, "Cliente inserido com sucesso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Erro ao inserir cliente: " + e.getMessage());
        }}

    public static void atualizarCliente(int codigo, String nome, String email, String rg, int codigoEndereco) {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "UPDATE cliente SET nome = ?, email = ?, rg = ?, codigo_endereco = ? WHERE codigo = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, nome);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, rg);
                preparedStatement.setInt(4, codigoEndereco);
                preparedStatement.setInt(5, codigo);
                preparedStatement.executeUpdate();
                JOptionPane.showMessageDialog(null, "Cliente atualizado com sucesso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void excluirCliente(int codigo) {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "DELETE FROM cliente WHERE codigo = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, codigo);
                preparedStatement.executeUpdate();
                JOptionPane.showMessageDialog(null, "Cliente excluído com sucesso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void listarClientes() {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "SELECT * FROM cliente";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                ResultSet resultSet = preparedStatement.executeQuery();
                StringBuilder result = new StringBuilder("Lista de Clientes:\n");
                while (resultSet.next()) {
                    int codigo = resultSet.getInt("codigo");
                    String nome = resultSet.getString("nome");
                    String email = resultSet.getString("email");
                    String rg = resultSet.getString("rg");
                    int codigoEndereco = resultSet.getInt("codigo_endereco");

                    result.append("Código: ").append(codigo)
                            .append(", Nome: ").append(nome)
                            .append(", Email: ").append(email)
                            .append(", RG: ").append(rg)
                            .append(", Código Endereço: ").append(codigoEndereco)
                            .append("\n");
                }
                JOptionPane.showMessageDialog(null, result.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Métodos para a tabela livros
    public static void inserirLivro(String edicao, float custo, String titulo, int codigoEditora) {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "INSERT INTO livros (edicao, custo, titulo, codigo_editora) VALUES (?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, edicao);
                preparedStatement.setFloat(2, custo);
                preparedStatement.setString(3, titulo);
                preparedStatement.setInt(4, codigoEditora);
                preparedStatement.executeUpdate();
                JOptionPane.showMessageDialog(null, "Livro inserido com sucesso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void atualizarLivro(int codigo, String edicao, float custo, String titulo, int codigoEditora) {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "UPDATE livros SET edicao = ?, custo = ?, titulo = ?, codigo_editora = ? WHERE codigo = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, edicao);
                preparedStatement.setFloat(2, custo);
                preparedStatement.setString(3, titulo);
                preparedStatement.setInt(4, codigoEditora);
                preparedStatement.setInt(5, codigo);
                preparedStatement.executeUpdate();
                JOptionPane.showMessageDialog(null, "Livro atualizado com sucesso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void excluirLivro(int codigo) {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "DELETE FROM livros WHERE codigo = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, codigo);
                preparedStatement.executeUpdate();
                JOptionPane.showMessageDialog(null, "Livro excluído com sucesso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void listarLivros() {
        try (Connection connection = ConexaoMySql.obterConexao()) {
            String query = "SELECT * FROM livros";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                ResultSet resultSet = preparedStatement.executeQuery();
                StringBuilder result = new StringBuilder("Lista de Livros:\n");
                while (resultSet.next()) {
                    int codigo = resultSet.getInt("codigo");
                    String edicao = resultSet.getString("edicao");
                    float custo = resultSet.getFloat("custo");
                    String titulo = resultSet.getString("titulo");
                    int codigoEditora = resultSet.getInt("codigo_editora");

                    result.append("Código: ").append(codigo)
                            .append(", Edição: ").append(edicao)
                            .append(", Custo: ").append(custo)
                            .append(", Título: ").append(titulo)
                            .append(", Código Editora: ").append(codigoEditora)
                            .append("\n");
                }
                JOptionPane.showMessageDialog(null, result.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}