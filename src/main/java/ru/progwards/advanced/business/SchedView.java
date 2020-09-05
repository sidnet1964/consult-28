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

@WebServlet("/schedule/view")
public class SchedView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //      вызов из mentor-view.jsp с параметром
        //      http://localhost:8888/schedule/view?mentor=sidnet1964
        List<DataBase.Schedule.Value> sched;
        String mentor = req.getParameter("mentor");
        if (mentor == null) { //  вывод всех - сортируем
            sched = new ArrayList<>(DataBase.INSTANCE.schedule.getAll());
            sched.sort(Comparator.comparing(o -> o.mentor));
        }
        else {  //  вывод по одному ментору - фильтруем
            sched = new ArrayList<>(DataBase.INSTANCE.schedule.select(o -> o.mentor.equals(mentor) ));
        }
        String[][] aSched = new String[sched.size()][6];
        int i = 0;
        for (DataBase.Schedule.Value line : sched){
            aSched[i][0] = line.mentor;
            aSched[i][1] = String.valueOf(line.day_of_week);
            aSched[i][2] = String.valueOf(line.start);
            aSched[i][3] = String.valueOf(line.duration);
            aSched[i][4] = Login.longToString(line.start);
            aSched[i][5] = Login.longToString(line.duration);
            i++;
        }
//        System.out.println(Arrays.deepToString(aSched));
//        req.setAttribute("sched", sched);
        req.setAttribute("aShed", aSched);
        req.getRequestDispatcher("/sched-view.jsp").forward(req, resp);
    }
}
//            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");
//            sdf2.setTimeZone(TimeZone.getTimeZone("MSK"));
//            String dateStr = sdf2.format(line.start); // Output: 15-02-2014 10:48:08 AM
