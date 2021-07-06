package controllers;

import models.bean.RentType;
import models.bean.Service;
import models.bean.ServiceType;
import models.service.service.IServiceService;
import models.service.service.ServiceService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServieServlet",urlPatterns = "/service")
public class ServieServlet extends HttpServlet {
    IServiceService serviceService = new ServiceService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                CreateService(request, response);
                break;



        }
    }

    private void CreateService(HttpServletRequest request, HttpServletResponse response) {
//        <%--                String service_code, String serviceName, int serviceArea, double serviceCost, int serviceMaxPeople,--%>
//<%--                String serviceStandardRoom, String serviceDescriptionOtherConvenience, double servicePollArea,--%>
//<%--                int serviceNumberOfFloors, int serviceTypeId, int serviceRentTypeId)--%>
        String service_code = request.getParameter("service_code");
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        String serviceStandardRoom = request.getParameter("serviceStandardRoom");
        String serviceDescriptionOtherConvenience = request.getParameter("serviceDescriptionOtherConvenience");
        double servicePollArea = Double.parseDouble(request.getParameter("servicePollArea"));
        int serviceNumberOfFloors = Integer.parseInt(request.getParameter("serviceNumberOfFloors"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        int serviceRentTypeId = Integer.parseInt(request.getParameter("serviceRentTypeId"));

        Service service = new Service(service_code,serviceName,serviceArea,serviceCost,serviceMaxPeople,serviceStandardRoom,serviceDescriptionOtherConvenience,servicePollArea,serviceNumberOfFloors,serviceTypeId,serviceRentTypeId);

        serviceService.save(service);

        request.setAttribute("message","Create OK ");
        List<RentType> rentTypeList = serviceService.findRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        List<ServiceType> serviceTypeList = serviceService.findServiceType();
        request.setAttribute("serviceTypeList",serviceTypeList);

        try {
            request.getRequestDispatcher("/view/service/create.jsp").forward(request,response);
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
                showCreateService(request, response);
                break;
            case "delete":
                deleteService(request, response);

                break;

            case "view":
                viewService(request, response);
                break;
            default:
                listService(request, response);
                break;
        }
    }

    private void showCreateService(HttpServletRequest request, HttpServletResponse response) {
        List<RentType> rentTypeList = serviceService.findRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        List<ServiceType> serviceTypeList = serviceService.findServiceType();
        request.setAttribute("serviceTypeList",serviceTypeList);

        try {
            request.getRequestDispatcher("/view/service/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        serviceService.remove(id);
        try {
            response.sendRedirect("/service");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void viewService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Service service = serviceService.findById(id);
        request.setAttribute("service",service);

        List<RentType> rentTypeList = serviceService.findRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        List<ServiceType> serviceTypeList = serviceService.findServiceType();
        request.setAttribute("serviceTypeList",serviceTypeList);

        try {
            request.getRequestDispatcher("/view/service/view.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void listService(HttpServletRequest request, HttpServletResponse response) {

        List<Service> serviceList = serviceService.findAllService();
        request.setAttribute("serviceList",serviceList);
        List<RentType> rentTypeList = serviceService.findRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        List<ServiceType> serviceTypeList = serviceService.findServiceType();
        request.setAttribute("serviceTypeList",serviceTypeList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/service/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
