package controllers;

import models.bean.AttachUsingService;
import models.bean.CustomerUsingService;
import models.service.customerUsingService.CustomerUsingServiceImpl;
import models.service.customerUsingService.ICustomerUsingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerUsingServlet", urlPatterns = "/customers")
public class CustomerUsingServlet extends HttpServlet {
    ICustomerUsingService service = new CustomerUsingServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchList(request, response);
                break;
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        service.delete(id);

        try {
            response.sendRedirect("/customers");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerUsingService> lists = service.findAll();
        List<AttachUsingService> attachServiceList = service.findAllAttachService();
        request.setAttribute("attachs", attachServiceList);
        request.setAttribute("lists", lists);
        try {
            request.getRequestDispatcher("/view/customerUsingService/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //doPost
    private void searchList(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        List<CustomerUsingService> customerUsingServiceList = service.searchByName(name);
        List<AttachUsingService> attachServiceList = service.findAllAttachService();
        request.setAttribute("attachList", attachServiceList);
        request.setAttribute("lists", customerUsingServiceList);
        try {
            request.getRequestDispatcher("/view/customerUsingService/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
