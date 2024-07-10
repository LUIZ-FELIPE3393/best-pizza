package com.luizfelipe;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class AddServlet extends HttpServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws IOException{
        PrintWriter out = res.getWriter();

        System.out.println("A resposta é " + req.getParameter("num"));
    }
}
