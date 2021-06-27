package demo;

import jdk.nashorn.internal.objects.Global;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Date;

@javax.servlet.annotation.WebServlet(name = "TimeServerServlet" , urlPatterns = {"/login" , "" })
public class TimeServerServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        System.out.println("Name         " + name + "           Pass        " + pass);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
       request.getRequestDispatcher("/login/login.jsp").forward(request,response);
    }
}
