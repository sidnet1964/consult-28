package ru.progwards.advanced.business;

import ru.progwards.java2.lib.DataBase;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/save")
public class UserSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        boolean isMentor = ("on".equals(req.getParameter("ismentor")));
        if (login == null || name == null) {
            req.setAttribute("error-description", "Хакер? Отсутствуют обязательные параметры.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (login.isEmpty()) {
            req.setAttribute("error-description", "Название параметра должно быть установлено.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.users.remove(login);
        if (!DataBase.INSTANCE.users.put(new DataBase.Users.User(login, password, name, isMentor, "+"))) {
            req.setAttribute("error-description", "Не удалось добавить запись. Вероятно, она уже существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/user/view");
    }
}
