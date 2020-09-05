package ru.progwards.advanced.business;

import ru.progwards.java2.lib.DataBase;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/user/view")
public class UserView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DataBase.Users.User> user =
                new ArrayList<>(DataBase.INSTANCE.users.getAll());
        user.sort(Comparator.comparing(o -> o.login));

        req.setAttribute("user", user);
        req.getRequestDispatcher("/user-view.jsp").forward(req, resp);
    }
}
