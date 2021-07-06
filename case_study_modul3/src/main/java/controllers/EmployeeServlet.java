package controllers;

import models.bean.*;
import models.common.Validate;
import models.service.employee.EmployeeService;
import models.service.employee.IEmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;

        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("employeeName");
        List<Employee> employeeList = employeeService.searchByName(name);
        request.setAttribute("employeeList",employeeList);

        List<Position> positionList = employeeService.findAllPosition();
        request.setAttribute("positionList",positionList);
        List<EducationDegree> educationDegreeList = employeeService.findAllEducation();
        request.setAttribute("educationDegreeList",educationDegreeList);
        List<Division> divisionList = employeeService.findAllDivision();
        request.setAttribute("divisionList",divisionList);

        try {
            request.getRequestDispatcher("/view/employee/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));

        Employee employee = new Employee(employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,
                positionId,educationDegreeId,divisionId);

        employeeService.updateEmployeeById(id,employee);
        request.setAttribute("message", "Up date OK");
        request.setAttribute("employee",employee);
        List<Position> positionList = employeeService.findAllPosition();
        request.setAttribute("positionList",positionList);
        List<EducationDegree> educationDegreeList = employeeService.findAllEducation();
        request.setAttribute("educationDegreeList",educationDegreeList);
        List<Division> divisionList = employeeService.findAllDivision();
        request.setAttribute("divisionList",divisionList);
        try {
            request.getRequestDispatcher("/view/employee/edit.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
//        <%--                int employeeId, String employeeName, String employeeBirthday, String employeeIdCard,--%>
//<%--                double employeeSalary, String employeePhone, String employeeEmail, String employeeAddress,--%>
//<%--                int positionId, int educationDegreeId, int divisionId, String userName--%>
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");

        String employeeSalaryString = (request.getParameter("employeeSalary"));
        double employeeSalary ;
        if ("".equals(Validate.checkNumberDouble(employeeSalaryString))){
            employeeSalary = Double.parseDouble(employeeSalaryString);
        }else {
            employeeSalary = -1 ;
        }
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));

        Employee employee = new Employee(employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,
                employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId);

        int checkFull = 0 ;
        String msg = "";

        List<String> errList = employeeService.insertIntoEmployee(employee);
        for (String item : errList){
            if (item.equals("")){
                checkFull++;
            }
        }
        if (checkFull == 7){
            msg = "Insert in to OK ";
        }else {
            msg = "Insert Fail" ;
            request.setAttribute("employeeFail",employee);
        }
        request.setAttribute("message",msg);
        request.setAttribute("errList",errList);

        try {
            request.getRequestDispatcher("/view/employee/create.jsp").forward(request,response);
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
                showCreateEmployee(request, response);
                break;
            case "edit":
                showEditEmployee(request, response);

                break;
            case "delete":
                deleteEmploye(request, response);

                break;

            case "view":
                viewEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    private void deleteEmploye(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        employeeService.deleteEmployee(id);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Employee employee = employeeService.findEmployeeById(id);

        request.setAttribute("employee",employee);

        List<Position> positionList = employeeService.findAllPosition();
        request.setAttribute("positionList",positionList);
        List<EducationDegree> educationDegreeList = employeeService.findAllEducation();
        request.setAttribute("educationDegreeList",educationDegreeList);
        List<Division> divisionList = employeeService.findAllDivision();
        request.setAttribute("divisionList",divisionList);

        try {
            request.getRequestDispatcher("/view/employee/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.findAllEmployee();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", employeeService.findAllPosition());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/list.jsp");
        requestDispatcher.forward(request, response);
    }


    private void viewEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Employee employee = employeeService.findEmployeeById(id);

        request.setAttribute("employee", employee);
        List<Position> positionList = employeeService.findAllPosition();
        request.setAttribute("positionList",positionList);
        List<EducationDegree> educationDegreeList = employeeService.findAllEducation();
        request.setAttribute("educationDegreeList",educationDegreeList);
        List<Division> divisionList = employeeService.findAllDivision();
        request.setAttribute("divisionList",divisionList);
        List<User> userList = employeeService.findAllUser();
        request.setAttribute("userList",userList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Position> positionList = employeeService.findAllPosition();
        request.setAttribute("positionList",positionList);
        List<EducationDegree> educationDegreeList = employeeService.findAllEducation();
        request.setAttribute("educationDegreeList",educationDegreeList);
        List<Division> divisionList = employeeService.findAllDivision();
        request.setAttribute("divisionList",divisionList);


        try {
            request.getRequestDispatcher("/view/employee/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

}
