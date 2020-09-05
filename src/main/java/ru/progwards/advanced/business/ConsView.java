package ru.progwards.advanced.business;

import ru.progwards.java2.lib.DataBase;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/consults/view")
public class ConsView extends HttpServlet {
    public class Consult extends DataBase.Consultations.Consultation {
        public String start1;
        public String duration1;

        @Override
        public String toString() {
            return "Consult{" +
                    "start1='" + start1 + '\'' +
                    ", duration1='" + duration1 + '\'' +
                    ", mentor='" + mentor + '\'' +
                    ", start=" + start +
                    ", duration=" + duration +
                    ", student='" + student + '\'' +
                    ", comment='" + comment + '\'' +
                    '}';
        }

        public Consult(String mentor, long start, long duration, String student, String comment) {
            super(mentor, start, duration, student, comment);
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");
            sdf2.setTimeZone(TimeZone.getTimeZone("MSK"));
            start1 = sdf2.format(this.start); // Output: 15-02-2014 10:48:08 AM
            duration1 = Login.longToString(this.duration);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //      вызов из mentor-view.jsp с параметром
        //      http://localhost:8888/consults/view?mentor=sidnet1964
        List<DataBase.Consultations.Consultation> cons;
        String mentor = req.getParameter("mentor");
        if (mentor == null) { //  вывод всех - сортируем
            cons = new ArrayList<>(DataBase.INSTANCE.consultations.getAll());
            cons.sort(Comparator.comparing(o -> o.mentor));
        }
        else {  //  вывод по одному ментору - фильтруем
            cons = new ArrayList<>(DataBase.INSTANCE.consultations.select(o -> o.mentor.equals(mentor) ));
        }
        //  создаем новый список с дополнительными элементами
//        DataBase.Consultations.Consultation line1 = cons.get(0);
//        Consult line2 = (Consult) line1;
        LinkedList<Consult> lCons = new LinkedList<>();
        for (DataBase.Consultations.Consultation line : cons){
            Consult line2 = new Consult(line.mentor, line.start, line.duration, line.student, line.comment);
            lCons.add(line2);
        }
        System.out.println(lCons);
//        req.setAttribute("cons", cons); /// ???
        req.setAttribute("lCons", lCons); /// ???
        req.getRequestDispatcher("/cons-view.jsp").forward(req, resp);
    }
}
