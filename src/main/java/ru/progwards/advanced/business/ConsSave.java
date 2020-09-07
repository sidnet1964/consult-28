package ru.progwards.advanced.business;

import ru.progwards.java2.lib.DataBase;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.Date;

@WebServlet("/consults/save")
public class ConsSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mentor = req.getParameter("mentor");
        Instant instant = Instant.now();
//        System.out.println(instant);
//        System.out.println(instant.getEpochSecond());
//        2020-09-05T21:24:52.029360Z //  2020-09-06T00:24    //  1599341092
//        System.out.println(Date.parse(req.getParameter("startD")));
        String startD = req.getParameter("startD");
        String startT = req.getParameter("startT")+":00Z";
        String startS = startD + "T" + startT;
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        DateTimeFormatter dtf = DateTimeFormatter.ISO_INSTANT;
        TemporalAccessor ta = dtf.parse(startS);
        Instant i = Instant.from(ta);
        long start = i.getEpochSecond();
        long duration = Login.stringToLong(req.getParameter("durationS"));

        String student = req.getParameter("student");
        String comment = req.getParameter("comment");
        if (mentor == null || start == 0) {
            req.setAttribute("error-description", "Хакер? Отсутствуют обязательные параметры.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (mentor.isEmpty()) {
            req.setAttribute("error-description", "Название параметра должно быть установлено.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit"))){
            DataBase.INSTANCE.consultations.remove(new DataBase.Consultations.Key(mentor, start));   //  mentor, Long.parseLong(start)
        }
        if (!DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(mentor, start, duration, student, comment))) {
            req.setAttribute("error-description", "Не удалось добавить запись. Вероятно, она уже существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/consults/view");
    }
}
