package com.luizfelipe;

import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetPizzaDataServlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost/pizzaria", "root", "5286");
            ResultSet rsCliente = conexao.createStatement().executeQuery("SELECT * FROM pizza");

            while (rsCliente.next()) {
                System.out.println("Nome: " + rsCliente.getString("nome"));
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("O sistema não encontrou o driver do banco de dados");
        } catch (SQLException ex) {
            System.out.println("Ocorreu um problema ao acessar o banco: " + ex.getMessage());
        }

        //System.out.println("<img class=\"menu-element-image\" src=\"" +  + "\">");
    }

}
