package murach.email;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import murach.business.Survey;
import murach.business.User;


public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException{

        String url = "/index.html";

        String action = request.getParameter("action");
        if( action == null){
            action = "join";
        }

        if (action.equals("join")){
            url = "/index.html";
        }else if (action.equals("add")){

            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String email = request.getParameter("email");
            String dateOfBirth = request.getParameter("dob");
            String search = request.getParameter("search");
            String announcement = request.getParameter("announcement");
            String offer = request.getParameter("offer");
            String contactMethod = request.getParameter("contactMethod");

            User user = new User(firstName, lastName, email, dateOfBirth);

            Survey survey = new Survey(search,  announcement, offer, contactMethod);

            // UserDB.insert(user);

            request.setAttribute("user", user);
            request.setAttribute("survey", survey);
            url = "/thanks.jsp";

            System.out.println("Contact Method: " + contactMethod);
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);


    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        doPost(request, response);
    }


}
