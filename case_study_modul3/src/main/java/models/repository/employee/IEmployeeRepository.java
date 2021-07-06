package models.repository.employee;

import models.bean.*;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAllEmployee();
    List<Division> findAllDivision();
    List<Position> findAllPosition();
    List<EducationDegree> findAllEducation();
    List<User> findAllUser();
    boolean insertIntoEmployee(Employee employee);
    Employee findEmployeeById(int id);
    boolean updateEmployeeById(int id,Employee employee);
    boolean deleteEmployee(int id);
    List<Employee> searchByName(String name);
}
