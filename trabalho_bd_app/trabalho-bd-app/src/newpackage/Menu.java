/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package newpackage;

import javax.swing.JOptionPane;

/**
 *
 * @author mafxr
 */
import javax.swing.JOptionPane;

public class Menu {

    public static void main(String[] args) {
        while (true) {
            String[] opcoes = { "1. Inserir Cliente", "2. Atualizar Cliente", "3. Excluir Cliente", "4. Listar Clientes",
                    "5. Inserir Livro", "6. Atualizar Livro", "7. Excluir Livro", "8. Listar Livros", "9. Sair" };
            String escolha = (String) JOptionPane.showInputDialog(null, "Escolha uma opção:", "Menu",
                    JOptionPane.PLAIN_MESSAGE, null, opcoes, opcoes[0]);

            if (escolha == null) {
                // Usuário clicou em Cancelar ou fechou a janela
                break;
            }

            switch (escolha.charAt(0)) {
                case '1':
                    inserirCliente();
                    break;
                case '2':
                    atualizarCliente();
                    break;
                case '3':
                    excluirCliente();
                    break;
                case '4':
                    listarClientes();
                    break;
                case '5':
                    inserirLivro();
                    break;
                case '6':
                    atualizarLivro();
                    break;
                case '7':
                    excluirLivro();
                    break;
                case '8':
                    listarLivros();
                    break;
                case '9':
                    // Sair do programa
                    System.exit(0);
            }
        }
    }

    private static void inserirCliente() {
        String nome = JOptionPane.showInputDialog("Nome do Cliente:");
        String email = JOptionPane.showInputDialog("Email do Cliente:");
        String rg = JOptionPane.showInputDialog("RG do Cliente:");
        int codigoEndereco = Integer.parseInt(JOptionPane.showInputDialog("Código do Endereço:"));
        Consultas.inserirCliente(nome, email, rg, codigoEndereco);
    }

    private static void atualizarCliente() {
        int codigo = Integer.parseInt(JOptionPane.showInputDialog("Código do Cliente a ser atualizado:"));
        String nome = JOptionPane.showInputDialog("Novo Nome do Cliente:");
        String email = JOptionPane.showInputDialog("Novo Email do Cliente:");
        String rg = JOptionPane.showInputDialog("Novo RG do Cliente:");
        int codigoEndereco = Integer.parseInt(JOptionPane.showInputDialog("Novo Código do Endereço:"));
        Consultas.atualizarCliente(codigo, nome, email, rg, codigoEndereco);
    }

    private static void excluirCliente() {
        int codigo = Integer.parseInt(JOptionPane.showInputDialog("Código do Cliente a ser excluído:"));
        Consultas.excluirCliente(codigo);
    }

    private static void listarClientes() {
        Consultas.listarClientes();
    }

    private static void inserirLivro() {
        String edicao = JOptionPane.showInputDialog("Edição do Livro:");
        float custo = Float.parseFloat(JOptionPane.showInputDialog("Custo do Livro:"));
        String titulo = JOptionPane.showInputDialog("Título do Livro:");
        int codigoEditora = Integer.parseInt(JOptionPane.showInputDialog("Código da Editora:"));
        Consultas.inserirLivro(edicao, custo, titulo, codigoEditora);
    }

    private static void atualizarLivro() {
        int codigo = Integer.parseInt(JOptionPane.showInputDialog("Código do Livro a ser atualizado:"));
        String edicao = JOptionPane.showInputDialog("Nova Edição do Livro:");
        float custo = Float.parseFloat(JOptionPane.showInputDialog("Novo Custo do Livro:"));
        String titulo = JOptionPane.showInputDialog("Novo Título do Livro:");
        int codigoEditora = Integer.parseInt(JOptionPane.showInputDialog("Novo Código da Editora:"));
        Consultas.atualizarLivro(codigo, edicao, custo, titulo, codigoEditora);
    }

    private static void excluirLivro() {
        int codigo = Integer.parseInt(JOptionPane.showInputDialog("Código do Livro a ser excluído:"));
        Consultas.excluirLivro(codigo);
    }

    private static void listarLivros() {
        Consultas.listarLivros();
    }
}