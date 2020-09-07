package ru.progwards.advanced.business;

import ru.progwards.java2.lib.DataBase;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet("/consults/view")
public class ConsView extends HttpServlet {
    public class Consult extends DataBase.Consultations.Consultation {
        public final String startD;
        public final String startT;
        public final String startS; //  дата+время для отображения при редактировании
        public final String durationS;
        public Consult(String mentor, long start, long duration, String student, String comment) {
            super(mentor, start, duration, student, comment);
            Instant SecondsAfterEpoch = Instant.ofEpochSecond(this.start);
//            DateTimeFormatter dtf = DateTimeFormatter.ISO_INSTANT;
//            startS = dtf.format(SecondsAfterEpoch).substring(0,16); // Output: 15-02-2014 10:48:08 AM
            DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd.MM.yyyy");  //   HH:mm:ss:S
            DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("HH:mm");  //   HH:mm:ss:S
            DateTimeFormatter dtf3 = DateTimeFormatter.ISO_INSTANT;
            ZonedDateTime zdt = SecondsAfterEpoch.atZone(ZoneId.of("Europe/Moscow"));   //  Instant.now()
            startD = dtf1.format(zdt);
            startT = dtf2.format(zdt);
            startS = dtf3.format(zdt).substring(0,16);  //  без секунд
            durationS = Login.longToString(this.duration);
        }
        public String getStartD() {
            return startD;
        }
        public String getStartT() {
            return startT;
        }
        public String getStartS() {
            return startS;
        }
        public String getDurationS() {
            return durationS;
        }

        @Override
        public String toString() {
            return "Consult{" +
                    "startD='" + startD + '\'' +
                    ", startT='" + startT + '\'' +
                    ", startS='" + startS + '\'' +
                    ", durationS='" + durationS + '\'' +
                    '}';
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
        cons.sort(Comparator.comparing(o -> o.start));
        //  TreeMap для отбора консультаций по датам
        TreeMap<String, LinkedList<Consult>> tCons = new TreeMap<>();
        //  создаем новый список с дополнительными элементами
        LinkedList<Consult> lCons;
        String dateD = null;
        lCons = new LinkedList<>();
        for (DataBase.Consultations.Consultation line : cons){
            Consult line2 = new Consult(line.mentor, line.start, line.duration, line.student, line.comment);
            if (dateD == null) {
                dateD = line2.getStartD();       //  первая дата группы установлена
                lCons = new LinkedList<>();
            }
            if (dateD.equals(line2.getStartD())) //  дата еще продолжается
                lCons.add(line2);
            else {
                tCons.put(dateD, lCons);    //  добавить запись в коллекцию
                lCons = new LinkedList<>();
                lCons.add(line2);
                dateD = line2.startD;       //  новая дата группы установлена
            }
//            System.out.println(line2.getStartD() + " | " + dateD);
        }
        //  после выхода из цикла обработать последнюю запись
        tCons.put(dateD, lCons);    //  добавить запись в коллекцию

//        System.out.println(tCons);
//        req.setAttribute("lCons", lCons); /// ???
        req.setAttribute("tCons", tCons); /// ???
        req.getRequestDispatcher("/cons-view.jsp").forward(req, resp);
    }
}
