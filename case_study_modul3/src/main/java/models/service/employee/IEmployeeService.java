package models.service.employee;

import models.bean.*;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAllEmployee();
    List<Division> findAllDivision();
    List<Position> findAllPosition();
    List<EducationDegree> findAllEducation();
    List<User> findAllUser();
    List<String> insertIntoEmployee(Employee employee);
    Employee findEmployeeById(int id);
    boolean updateEmployeeById(int id,Employee employee);
    boolean deleteEmployee(int id);
    List<Employee> searchByName(String name);
}
