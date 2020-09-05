package ru.progwards.advanced.business;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/schedule/delete")
public class SchedDelete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> names = Collections.list(req.getParameterNames());
        String mentor = req.getParameter("mentor");
        String day_of_week = req.getParameter("day_of_week");
        String start = req.getParameter("start");

        if (names.size() != 4) {
            req.setAttribute("error-description", "Хакер? Неправильное число параметров.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (DataBase.INSTANCE.schedule.remove(new DataBase.Schedule.Key(mentor, Integer.parseInt(day_of_week), Long.parseLong(start))) == null) {
            req.setAttribute("error-description", "Не удалось удалить элемент. Вероятно, он уже не существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            DataBase.INSTANCE.schedule.readAll();
            return;
        }
        resp.sendRedirect("/schedule/view");
    }
}
//  Key{mentor='sidnet1964', start=600}
//  false
//  [Key{mentor='sidnet1964', start=0}, Key{mentor='mazneff', start=0}, Key{mentor='mazneff', start=15}, Key{mentor='mazneff', start=900}, Key{mentor='sidnet1964', start=600}, Key{mentor='sidnet1964', start=600}, Key{mentor='mazneff', start=30}]
//  [Key{mentor='sidnet1964', start=0}=ru.progwards.java2.lib.DataBase$Consultations$Consultation@760aec9e, Key{mentor='mazneff', start=0}=ru.progwards.java2.lib.DataBase$Consultations$Consultation@68111b56, Key{mentor='mazneff', start=15}=ru.progwards.java2.lib.DataBase$Consultations$Consultation@703e773, Key{mentor='mazneff', start=900}=ru.progwards.java2.lib.DataBase$Consultations$Consultation@640dc040, Key{mentor='sidnet1964', start=600}=ru.progwards.java2.lib.DataBase$Consultations$Consultation@4542ae43, Key{mentor='sidnet1964', start=600}=ru.progwards.java2.lib.DataBase$Consultations$Consultation@25e9d616, Key{mentor='mazneff', start=30}=ru.progwards.java2.lib.DataBase$Consultations$Consultation@3d4985a7]