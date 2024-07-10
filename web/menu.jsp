<%-- 
    Document   : menu.jsp
    Created on : 02/07/2024, 19:56:37
    Author     : Aluno
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"
    import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException" 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pizzaria</title>
        
        <link rel="stylesheet" href="menu.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ga+Maamli&display=swap" rel="stylesheet">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    </head>
    <body>
        <form id="form" action="pedido.jsp" method="post">
        <header>
            <nav class="navbar">
                <a class="ga-maamli-regular tx-lg nav-logo" href="index.html"><b>B</b>est <b>P</b>izza</a>
                <div class="space-x-sm">
                    <a class="tx-md nav-link" href="#">Menu</a>
                    <a id="order-link" class="tx-md nav-link" href="#">Pedido</a>
                    <a class="tx-md nav-link" href="#">Administração</a>
                </div>
            </nav>
        </header>
        <main>
            <div class="banner"> <!-- Banner do site -->
                <section> <!-- Mensagem de boas vindas -->
                    <h1>Confira abaixo o nosso cardápio!</h1>
                </section>
            </div>

            <section class="menu-box center"> <!-- Preview do menu -->
                <h2>Selecione os itens que você quiser, defina a quantidade na tela de pedidos</h2>
                <div class="menu-grid">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost/pizzaria", "root", "5286");
                            ResultSet rsCliente = conexao.createStatement().executeQuery("SELECT * FROM pizza");

                            while (rsCliente.next()) {
                                out.println("<div class=\"menu-element\">");
                                out.println("   <img class=\"menu-element-image\" src=\"" + rsCliente.getString("img_url") + "\">");
                                out.println("   <div class=\"menu-element-text space-y-sm\">");
                                out.println("       <h2 class=\"menu-element-title\">" + rsCliente.getString("nome") + "</h2>");
                                out.println("       <p class=\"menu-element-description\">" + rsCliente.getString("descricao") + "</p>");
                                out.println("       <p class=\"menu-element-price\"> R$" + rsCliente.getString("preco") + "</p>");
                                out.println("       <input type=\"checkbox\" name=\"" + rsCliente.getString("id") + "\" class=\"menu-button\" />");
                                out.println("       <label for=\"" + rsCliente.getString("id") + "\">Adicionar ao pedido</label>");
                                out.println("</div></div>");
                            }
                        } catch (ClassNotFoundException ex) {
                            out.println("O sistema não encontrou o driver do banco de dados");
                        } catch (SQLException ex) {
                            out.println("Ocorreu um problema ao acessar o banco: " + ex.getMessage());
                        }
                    %>
                </div>
            </section>
        </main>
        </form>
        <script src="menu.js">
            
        </script>
    </body>
</html>
