package models.service.employee;

import models.bean.*;
import models.common.Validate;
import models.repository.employee.EmployeeRepository;
import models.repository.employee.IEmployeeRepository;

import java.util.ArrayList;
import java.util.List;

public class EmployeeService implements IEmployeeService {

    IEmployeeRepository repository = new EmployeeRepository() ;
    @Override
    public List<Employee> findAllEmployee() {
        return repository.findAllEmployee();
    }

    @Override
    public List<Division> findAllDivision() {
        return repository.findAllDivision();
    }

    @Override
    public List<Position> findAllPosition() {
        return repository.findAllPosition();
    }

    @Override
    public List<EducationDegree> findAllEducation() {
        return repository.findAllEducation();
    }

    @Override
    public List<User> findAllUser() {
        return repository.findAllUser();
    }

    @Override
    public List<String> insertIntoEmployee(Employee employee) {
        List<String> errList = new ArrayList<>();
        errList.add(Validate.checkName(employee.getEmployeeName()));
        errList.add(Validate.checkDay(employee.getEmployeeBirthday()));
        errList.add(Validate.checkIdCard(employee.getEmployeeIdCard()));
        if (employee.getEmployeeSalary() > 0){
            errList.add("");
        }else {
            errList.add("enter positive real numbers (ex : 300000)");
        }
        errList.add(Validate.checkPhoneNumber(employee.getEmployeePhone()));
        errList.add(Validate.checkEmail(employee.getEmployeeEmail()));
        errList.add(Validate.checkName(employee.getEmployeeAddress()));
        int checkFull =0 ;
        for (String item : errList){
            if (item.equals("")){
                checkFull++ ;
            }
        }
        if (checkFull == 7){
            repository.insertIntoEmployee(employee);
        }
        return errList ;
    }

    @Override
    public Employee findEmployeeById(int id) {
        return repository.findEmployeeById(id);
    }

    @Override
    public boolean updateEmployeeById(int id, Employee employee) {
        return repository.updateEmployeeById(id,employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return repository.deleteEmployee(id);
    }

    @Override
    public List<Employee> searchByName(String name) {
        return repository.searchByName(name);
    }
}
