// Created by endereyewxy@gmail.com, 2020.10.21

package cn.endereye.controller;

import cn.endereye.model.User;
import cn.endereye.service.AuthService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/sign-out/")
public class SignOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            final User user = SignIn.signInByRefreshToken(request);
            if (user != null)
                AuthService.signOut(user);
            // Clear cookies.
            final Cookie refreshCookie = new Cookie("refresh", "");
            refreshCookie.setPath("/auth");
            final Cookie accessCookie = new Cookie("token", "");
            accessCookie.setPath("/");
            response.addCookie(refreshCookie);
            response.addCookie(accessCookie);
            response.sendRedirect(URLDecoder.decode(request.getParameter("from"), "UTF-8"));
        } catch (SQLException e) {
            e.printStackTrace(); // TODO Now what?
        }
    }
}
