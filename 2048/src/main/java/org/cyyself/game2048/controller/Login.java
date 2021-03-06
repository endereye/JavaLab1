package org.cyyself.game2048.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import org.cyyself.game2048.services.LoginFromToken;

@WebServlet(urlPatterns = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (LoginFromToken.doLogin(req,req.getSession())) {
            resp.sendRedirect("/2048/index.jsp");
        }
        else {
            resp.sendRedirect("/auth/sign-in/?from=/2048/Login&method=cookie");
            //resp.sendRedirect("http://172.20.161.92:8080/auth/sign-in/?from="+ req.getRequestURL().toString() + "&method=url");
        }
    }
}
