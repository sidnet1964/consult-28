package ru.progwards.advanced.business.examples;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cookies/readall")
public class CookiesExample extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookieLogin = new Cookie("login", "Nik " + System.currentTimeMillis());
        cookieLogin.setHttpOnly(true);
        cookieLogin.setSecure(false);
        resp.addCookie(cookieLogin);
            req.getSession().invalidate();

        // выводим имя и значение кук
        PrintWriter out = resp.getWriter();
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                out.print("<br>" + cookie.getName() + " = " + cookie.getValue()
                        + " httpOnly: " + cookie.isHttpOnly()
                        + " maxAge: " + cookie.getMaxAge()
                );
            }
        }
    }

}
