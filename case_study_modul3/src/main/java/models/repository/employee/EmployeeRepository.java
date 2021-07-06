package models.repository.employee;

import models.bean.*;
import models.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    DBConnection baseRepository = new DBConnection();
    final String SELECT_ALL_EMPLOYEE = "SELECT * FROM employee;";
    final String SELECT_ALL_POSITION = "select * from `position`;";
    final String SELECT_ALL_DIVISION = "select * from division;";
    final String SELECT_ALL_EDUCATION = "select * from education_degree;";
    final String SELECT_ALL_USER = "select * from `user`;";
    final String SELECT_EMPLOYEE_BY_ID = "select * from employee where employee_id = ?;";
    final String INSERT_INTO_EMPLOYEE = "insert into employee(employee_name,employee_birthday,\n" +
            "employee_id_card,employee_salary,employee_phone,employee_email,\n" +
            "employee_address,position_id,education_degree_id,division_id)\n" +
            "values(?,?,?,?,?,?,?,?,?,?);";
    final String UPDATE_EMPLOYEE_BY_ID = "update employee\n" +
            "set employee_name=?,employee_birthday=?,\n" +
            "employee_id_card=?,employee_salary=?,\n" +
            "employee_phone=?,employee_email=?,\n" +
            "employee_address=?,position_id=?,education_degree_id=?,\n" +
            "division_id=?,username=? \n" +
            "where employee_id = ?;";
    final String DELETE_EMPLOYEE_BY_ID = "delete from employee\n" +
            "where employee_id = ?;";
    final String SEARCH_BY_NAME = "select * from employee where employee_name like ?;";


    public List<Employee> searchByName(String name){
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_NAME);
            preparedStatement.setString(1,"%"+name+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String nameEmployee = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int idPosition = resultSet.getInt("position_id");
                int idEducation = resultSet.getInt("education_degree_id");
                int idDivision = resultSet.getInt("division_id");
                String userName = resultSet.getString("userName");
                Employee employee = new Employee(id, nameEmployee, birthday, idCard, salary, phone, email, address, idPosition, idEducation, idDivision, userName);
                employeeList.add(employee);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
    public boolean deleteEmployee(int id){
        boolean rowUpdate = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1,id);
            rowUpdate = preparedStatement.executeUpdate()>0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }
    public boolean insertIntoEmployee(Employee employee){

        boolean rowInsert = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_EMPLOYEE);
            preparedStatement.setString(1,employee.getEmployeeName());
            preparedStatement.setString(2,employee.getEmployeeBirthday());
            preparedStatement.setString(3,employee.getEmployeeIdCard());
            preparedStatement.setDouble(4,employee.getEmployeeSalary());
            preparedStatement.setString(5,employee.getEmployeePhone());
            preparedStatement.setString(6,employee.getEmployeeEmail());
            preparedStatement.setString(7,employee.getEmployeeAddress());
            preparedStatement.setInt(8 ,employee.getPositionId());
            preparedStatement.setInt(9 ,employee.getEducationDegreeId());
            preparedStatement.setInt(10 ,employee.getDivisionId());


            rowInsert = preparedStatement.executeUpdate()>0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInsert;
    }
    public boolean updateEmployeeById(int id,Employee employee){
        boolean rowUpdate = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_BY_ID);
            preparedStatement.setString(1,employee.getEmployeeName());
            preparedStatement.setString(2,employee.getEmployeeBirthday());
            preparedStatement.setString(3,employee.getEmployeeIdCard());
            preparedStatement.setDouble(4,employee.getEmployeeSalary());
            preparedStatement.setString(5,employee.getEmployeePhone());
            preparedStatement.setString(6,employee.getEmployeeEmail());
            preparedStatement.setString(7,employee.getEmployeeAddress());
            preparedStatement.setInt(8 ,employee.getPositionId());
            preparedStatement.setInt(9 ,employee.getEducationDegreeId());
            preparedStatement.setInt(10 ,employee.getDivisionId());
            preparedStatement.setString(11,employee.getUserName());
            preparedStatement.setInt(12,id);
            rowUpdate = preparedStatement.executeUpdate()>0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }
    public List<Employee> findAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int idPosition = resultSet.getInt("position_id");
                int idEducation = resultSet.getInt("education_degree_id");
                int idDivision = resultSet.getInt("division_id");
                String userName = resultSet.getString("userName");
                Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, idPosition, idEducation, idDivision, userName);
                employeeList.add(employee);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
    public List<Position> findAllPosition() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("position_id");
                String name = resultSet.getString("position_name");
                Position position = new Position(id, name);
                positionList.add(position);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;
    }
    public List<Division> findAllDivision(){
        List<Division> divisionList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("division_id");
                String name = resultSet.getString("division_name");
                Division  division = new Division(id,name);
                divisionList.add(division);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisionList;
    }
    public List<EducationDegree> findAllEducation(){
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EDUCATION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("education_degree_id");
                String name = resultSet.getString("education_degree_name");
                EducationDegree  educationDegree = new EducationDegree(id,name);
                educationDegreeList.add(educationDegree);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educationDegreeList;
    }
    public List<User> findAllUser(){
        List<User> users = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String userName = resultSet.getString("username");
                String password = resultSet.getString("password");
                User user = new User(userName,password);
                users.add(user);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }


    public Employee findEmployeeById(int id){
        Connection connection = baseRepository.getConnection();
        Employee employee = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idEmployee = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int idPosition = resultSet.getInt("position_id");
                int idEducation = resultSet.getInt("education_degree_id");
                int idDivision = resultSet.getInt("division_id");
                String userName = resultSet.getString("userName");
                employee = new Employee(idEmployee, name, birthday, idCard, salary, phone, email, address, idPosition, idEducation, idDivision, userName);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
}
