package ru.progwards.advanced.business;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/consults/gen")
//  генерация консультаций на неделю вперед
public class ConsGen extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //      вызов из mentor-view.jsp с параметром
        //      http://localhost:8888/consults/view?mentor=sidnet1964
        List<DataBase.Schedule.Value> sched;            //  список расписаний
        List<DataBase.Consultations.Consultation> cons; //  список консультаций
        String day_of_week = req.getParameter("day_of_week");
        int day;
        if (day_of_week == null)
            day = 1;    //  начинаем с понедельника
        else
            day = Integer.parseInt(day_of_week);
        sched = new ArrayList<>(DataBase.INSTANCE.schedule.select(o -> o.day_of_week == day ));
        cons = new ArrayList<>(DataBase.INSTANCE.consultations.getAll());
//        cons.sort(Comparator.comparing(o -> o.mentor));
        for (DataBase.Schedule.Value slot : sched) {
            long start = slot.start;    //  дальше цикл по слотам
            long duration = 15L * 60;
            for (int i = 1; ; i++) {
                if (duration * i > slot.duration)
                    break;
                if (!DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(slot.mentor, start + i * duration, duration, "", "+"))) {
                    req.setAttribute("error-description", "Не удалось добавить запись. Вероятно, она уже существует.");
                    req.getRequestDispatcher("/error.jsp").forward(req, resp);
                    return;
                }
            }
        }
        cons = new ArrayList<>(DataBase.INSTANCE.consultations.getAll());
        req.setAttribute("cons", cons); /// ???
        req.getRequestDispatcher("/cons-view.jsp").forward(req, resp);
    }
}
