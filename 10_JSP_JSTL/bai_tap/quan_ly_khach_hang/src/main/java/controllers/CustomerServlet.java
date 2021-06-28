package controllers;

import model.bean.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",value = {"/","/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList ;
    static {
        customerList = new ArrayList<Customer>();
        customerList.add(new Customer("Nguyễn Phi Khanh","19/11/1999","Triệu Phong","https://photographer.com.vn/wp-content/uploads/2020/08/1596889696_Anh-avatar-dep-va-doc-dao-lam-hinh-dai-dien.jpg"));
        customerList.add(new Customer("Nguyễn Văn B","19/11/1998","Sài Gòn","/assert/img/avatar.jpg"));
        customerList.add(new Customer("Nguyễn Văn C","19/11/1990","Phú Yên","/assert/img/avatar.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(
                "a"
        );
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer.jsp");
        requestDispatcher.forward(request,response);
    }
}
