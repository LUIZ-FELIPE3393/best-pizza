<%--
    Document   : menu.jsp
    Created on : 02/07/2024, 19:56:37
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays,java.util.stream.Collectors,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pizzaria</title>

        <link rel="stylesheet" href="pedido.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ga+Maamli&display=swap" rel="stylesheet">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav class="navbar">
                <a class="ga-maamli-regular tx-lg nav-logo" href="index.html"><b>B</b>est <b>P</b>izza</a>
                <div class="space-x-sm">
                    <a class="tx-md nav-link" href="menu.jsp">Menu</a>
                    <a class="tx-md nav-link" href="#">Pedido</a>
                    <a class="tx-md nav-link" href="#">Administração</a>
                </div>
            </nav>
        </header>
        <main>
            <section class="menu-box center"> <!-- Preview do menu -->
                <h2>Seu carrinho de compras</h2>
                <div class="menu-grid">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost/pizzaria", "root", "5286");
                        ResultSet rsCliente = conexao.createStatement().executeQuery("SELECT * FROM pizza");

                        while (rsCliente.next()) {
                            if (request.getParameter(rsCliente.getString("id")) != null) {
                                out.println("<div class=\"menu-element\">");
                                out.println("   <img class=\"menu-element-image\" src=\"" + rsCliente.getString("img_url") + "\">");
                                out.println("   <div class=\"menu-element-text space-y-sm\">");
                                out.println("       <h2 class=\"menu-element-title\">" + rsCliente.getString("nome") + "</h2>");
                                out.println("       <p class=\"menu-element-description\">" + rsCliente.getString("descricao") + "</p>");
                                out.println("       <p class=\"menu-element-price\"> R$" + rsCliente.getString("preco") + "</p>");
                                out.println("       <button id=\"" + rsCliente.getString("id") + "\" class=\"menu-button\">Adicionar ao pedido</button>");
                                out.println("</div></div>");
                            }
                        }
                    %>
                </div>
            </section>
        </main>

    </body>
</html>
