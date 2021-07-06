package controllers;

import models.bean.Contract;
import models.bean.ContractDetail;
import models.service.contract.ContractService;
import models.service.contract.IContractService;
import models.service.customer.CustomerService;
import models.service.customer.ICustomerService;
import models.service.employee.EmployeeService;
import models.service.employee.IEmployeeService;
import models.service.service.IServiceService;
import models.service.service.ServiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ContractServlet",urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
         IContractService contractService = new ContractService() ;
         ICustomerService customerService = new CustomerService() ;
         IServiceService serviceService = new ServiceService() ;
         IEmployeeService employeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createContract(request, response);
                break;
            case "createDetail":
                createContractDetail(request, response);
                break;


        }
    }

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) {
//
//        <%--    int contractDetailId, int quantity, int contractId, int attachServiceId--%>
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        int contractId= Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId= Integer.parseInt(request.getParameter("attachServiceId"));

        ContractDetail contractDetail = new ContractDetail(quantity,contractId,attachServiceId);
        try {
            contractService.createContractDetail(contractDetail);
            request.setAttribute("message","Create Contract Detail OK");
            request.setAttribute("contractList",contractService.findByAllContract());
            request.setAttribute("attachServiceList",contractService.findByAllAttachService());
            try {
                request.getRequestDispatcher("/view/contract/createDetail.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
//                   int contractId, String contractStartDate, String contractEndDate, double contractDeposit,--%>
//                    double contractTotalMoney, int employeeId, int customerId, int serviceId--%>
        String contractStartDate = request.getParameter("contractStartDate");
        String contractEndDate = request.getParameter("contractEndDate");
        double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        double contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));

        Contract contract = new Contract(contractStartDate,contractEndDate,contractDeposit,contractTotalMoney,employeeId,customerId,serviceId);

        try {
            contractService.createContract(contract);

            request.setAttribute("message","Creat Contract OK");
            request.setAttribute("customerList",customerService.findAll());
            request.setAttribute("serviceList",serviceService.findAllService());
            request.setAttribute("employeeList",employeeService.findAllEmployee());
            try {
                request.getRequestDispatcher("/view/contract/create.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
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
                showCreateContract(request, response);
                break;
            case "createDetail":
                showCreateContractDetail(request, response);

                break;

            default:
                listContract(request, response);
                break;
        }
    }


    private void listContract(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("contractList",contractService.findByAllContract());
        request.setAttribute("customerList",customerService.findAll());
        request.setAttribute("serviceList",serviceService.findAllService());
        request.setAttribute("employeeList",employeeService.findAllEmployee());

        try {
            request.getRequestDispatcher("/view/contract/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreateContractDetail(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("contractList",contractService.findByAllContract());
        request.setAttribute("attachServiceList",contractService.findByAllAttachService());
        try {
            request.getRequestDispatcher("/view/contract/createDetail.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateContract(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("customerList",customerService.findAll());
        request.setAttribute("serviceList",serviceService.findAllService());
        request.setAttribute("employeeList",employeeService.findAllEmployee());

        try {
            request.getRequestDispatcher("/view/contract/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
