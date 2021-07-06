package controllers;

import models.bean.Customer;
import models.bean.CustomerType;
import models.service.customer.CustomerService;
import models.service.customer.ICustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;

        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customerName = request.getParameter("customerName") ;
        List<Customer> customerList = new ArrayList<>();
        customerList = customerService.search(customerName);
        request.setAttribute("customerTypeList",customerService.findAllCustomerType());
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
//        <%--                String customerCode, String customerName, String customerBirthday, int customerGender,--%>
//        <%--                String customerIdCard, String customerPhone, String customerEmail, String customerAddress,--%>
//        <%--                int customerTypeId--%>
        int id = Integer.parseInt(request.getParameter("customerId"));
        String customerCode = request.getParameter("customerCode");
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));

        Customer customer = new Customer(customerCode,customerName,customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress,customerTypeId);

        RequestDispatcher dispatcher;
        customerService.updateByID(id, customer);
        request.setAttribute("customer", customer);

        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        request.setAttribute("customerTypes",customerTypeList);

        request.setAttribute("message", "User information was updated");
        dispatcher = request.getRequestDispatcher("/view/customer/edit.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
//        <%--                String customerCode, String customerName, String customerBirthday, int customerGender,--%>
//<%--                String customerIdCard, String customerPhone, String customerEmail, String customerAddress,--%>
//<%--                int customerTypeId--%>
        String customerCode = request.getParameter("customerCode");
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));

        Customer customer = new Customer( customerCode,customerName,customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress,customerTypeId);

        List<String> errList = customerService.save(customer);

        int checkFull = 0;
        boolean check = false;
        String msgCreate = null;
        for (String string : errList){
            if (string.equals("")){
                checkFull++;
            }
        }
        if (checkFull == 7){
            check = true;
        }
        if (check){
            msgCreate = "New Product was created";
        }else {
            msgCreate = "Create Fail";
            request.setAttribute("customerFail",customer);
        }
        request.setAttribute("message",msgCreate);

        request.setAttribute("errList",errList);

        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        request.setAttribute("customerType",customerTypeList);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request, response);

                break;
            case "delete":
                deleteCustomer(request, response);

                break;

            case "view":
                viewCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerService.findAllCustomerType());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/list.jsp");
        requestDispatcher.forward(request, response);
    }


    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
     Customer customer = customerService.findById(id);
        request.setAttribute("customer", customerService.findById(id));
        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        request.setAttribute("customerTypes",customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.remove(id);
        response.sendRedirect("/customer");
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("customer",customerService.findById(id));
        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        request.setAttribute("customerTypes",customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }


    }


    private void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<CustomerType> customerTypeList = customerService.findAllCustomerType();
        request.setAttribute("customerType",customerTypeList);
        try {
            request.getRequestDispatcher("/view/customer/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
