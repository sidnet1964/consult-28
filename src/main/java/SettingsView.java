import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet("/settings-view")
public class SettingsView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DataBase.Settings.Record> settings =
                new ArrayList<DataBase.Settings.Record>(DataBase.INSTANCE.settings.getAll());
        settings.sort(new Comparator<DataBase.Settings.Record>() {
            @Override
            public int compare(DataBase.Settings.Record o1, DataBase.Settings.Record o2) {
                return o1.name.compareTo(o2.name);
            }
        });
        req.setAttribute("settings", settings);
        req.getRequestDispatcher("/settings-view.jsp").forward(req, resp);
    }
}
