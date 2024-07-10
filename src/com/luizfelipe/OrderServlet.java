package com.luizfelipe;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.stream.Collectors;

public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String body = req.getReader().lines().collect(Collectors.joining("\n"));
        PrintWriter out = res.getWriter();
        out.println("<p>awdadwadwada" + body + "</p>");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Connection conexao = null;
        try {
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/pizzaria", "root", "5286");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ResultSet rsCliente = null;
        try {
            rsCliente = conexao.createStatement().executeQuery("SELECT * FROM pizza");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String[] idStrArray =  body.split(",");

        while (true) {
            try {
                if (!rsCliente.next()) break;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                if (Arrays.asList(idStrArray).contains(rsCliente.getString("id"))) {
                    out.println("<div class=\"menu-element\">");
                    out.println("   <img class=\"menu-element-image\" src=\"" + rsCliente.getString("img_url") + "\">");
                    out.println("   <div class=\"menu-element-text space-y-sm\">");
                    out.println("       <h2 class=\"menu-element-title\">" + rsCliente.getString("nome") + "</h2>");
                    out.println("       <p class=\"menu-element-description\">" + rsCliente.getString("descricao") + "</p>");
                    out.println("       <p class=\"menu-element-price\"> R$" + rsCliente.getString("preco") + "</p>");
                    out.println("       <button id=\"" + rsCliente.getString("id") + "\" class=\"menu-button\">Adicionar ao pedido</button>");
                    out.println("</div></div>");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
