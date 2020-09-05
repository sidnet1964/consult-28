package ru.progwards.advanced.business;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
    //  преобразование строки "15:00" в секунды
    public static long stringToLong (String minutes) {
        long second = Long.valueOf(minutes.substring(0,2)) * 3600 + Long.valueOf(minutes.substring(3)) * 60;
        return second;
    }
    //  преобразование секунд в строку "15:00"
    public static String longToString (long second) {
        String minutes = String.format("%02d", second / 3600) + ":" +String.format("%02d", (second - (second / 3600) * 3600) / 60);
        return minutes;
    }
}
