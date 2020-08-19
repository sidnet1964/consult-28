package ru.progwards.advanced.business.examples;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/test-cookie1")
public class TestCookie extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookieLogin = new Cookie("login", "Nik");
        resp.addCookie(cookieLogin);

        Cookie[] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if ("login".equals(cookie.getName())) {
                cookie.setMaxAge(0);
                resp.getWriter().write("qwerty");
            }
        }

        resp.getWriter().write("Все куки = " + Arrays.toString(cookies));
    }
}
