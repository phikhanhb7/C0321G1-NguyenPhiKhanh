package models.repository.service;

import models.bean.*;
import models.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {
    public static final String SELECT_ALL_SERVICE = "select * from service ";
    public static final String SELECT_ALL_SERVICETYPE = "select * from service_type";
    public static final String SELECT_ALL_RENTTYPE = "select * from rent_type";
    private static final String INSERT_INTO_SERVICE = "insert into service(service_code,\n" +
            "service_name,\n" +
            "service_area,\n" +
            "service_cost,\n" +
            "service_max_people,\n" +

            "standard_room,\n" +
            "description_other_convenience,\n" +
            "pool_area,\n" +
            "number_of_floors,\n" +
            "rent_type_id,\n" +
            "service_type_id) \n" +
            "values (?,?,?,?,?,?,?,?,?,?,?)";

    private static final String DELETE_SERVICE_BY_ID = "delete from service where service_id=?";
    private static final String FIND_SERVICE_BY_ID = " select * from service where service_id=?";

    @Override
    public List<Service> findAllService() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Service> serviceList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_SERVICE);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt(1);
                    String service_code = resultSet.getString("service_code");
                    String service_name = resultSet.getString("service_name");
                    int service_area = resultSet.getInt("service_area");
                    int service_cost = resultSet.getInt("service_cost");
                    int service_max_people = resultSet.getInt("service_max_people");
                    int rent_type_id = resultSet.getInt("rent_type_id");
                    int service_type_id = resultSet.getInt("service_type_id");
                    String standard_room = resultSet.getString("standard_room");
                    String description_other_convenience = resultSet.getString("description_other_convenience");
                    int pool_area = resultSet.getInt("pool_area");
                    int number_of_floors = resultSet.getInt("number_of_floors");

                    Service service = new Service(id, service_code, service_name, service_area, service_cost, service_max_people, standard_room,
                            description_other_convenience, pool_area, number_of_floors, rent_type_id, service_type_id);

                    serviceList.add(service);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return serviceList;
    }

    @Override
    public void save(Service service) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
//<%--                String service_code, String serviceName, int serviceArea, double serviceCost,
// int serviceMaxPeople,--%>
//<%--                String serviceStandardRoom, String serviceDescriptionOtherConvenience, d
// ouble servicePollArea,--%>
//<%--                int serviceNumberOfFloors, int serviceTypeId, int serviceRentTypeId)--%>

        if (connection!= null) {
            try {
                statement = connection.prepareStatement(INSERT_INTO_SERVICE);
                statement.setString(1, service.getService_code());
                statement.setString(2, service.getServiceName());
                statement.setInt(3, service.getServiceArea());
                statement.setDouble(4, service.getServiceCost());
                statement.setInt(5,service.getServiceMaxPeople());
                statement.setString(6,service.getServiceStandardRoom());
                statement.setString(7,service.getServiceDescriptionOtherConvenience());
                statement.setDouble(8,service.getServicePollArea());
                statement.setInt(9,service.getServiceNumberOfFloors());
                statement.setInt(10,service.getServiceTypeId());
                statement.setInt(11,service.getServiceRentTypeId());


                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public Service findById(int id) {

        Connection connection = DBConnection.getConnection();
        Service service = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_SERVICE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idService = resultSet.getInt(1);
                String service_code = resultSet.getString("service_code");
                String service_name = resultSet.getString("service_name");
                int service_area = resultSet.getInt("service_area");
                int service_cost = resultSet.getInt("service_cost");
                int service_max_people = resultSet.getInt("service_max_people");
                int rent_type_id = resultSet.getInt("rent_type_id");
                int service_type_id = resultSet.getInt("service_type_id");
                String standard_room = resultSet.getString("standard_room");
                String description_other_convenience = resultSet.getString("description_other_convenience");
                int pool_area = resultSet.getInt("pool_area");
                int number_of_floors = resultSet.getInt("number_of_floors");

                service = new Service(idService,service_code, service_name, service_area, service_cost, service_max_people, standard_room,
                        description_other_convenience, pool_area, number_of_floors, rent_type_id, service_type_id);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return service;
    }

    @Override
    public boolean remove(int id) {

        boolean rowRemove = false;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(DELETE_SERVICE_BY_ID);
            statement.setInt(1, id);
            rowRemove = statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }

        return rowRemove;
    }

    @Override
    public List<ServiceType> findServiceType() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<ServiceType> serviceTypeList = new ArrayList<>();

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_SERVICETYPE);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
//                    int serviceTypeId, String serviceTypeName
                    int serviceTypeId = resultSet.getInt(1);
                    String serviceTypeName = resultSet.getString("service_type_name");
                    ServiceType serviceType = new ServiceType(serviceTypeId, serviceTypeName);
                    serviceTypeList.add(serviceType);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

        return serviceTypeList;
    }

    @Override
    public List<RentType> findRentType() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<RentType> rentTypeList = new ArrayList<>();

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_RENTTYPE);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
//                   int rentTypeId, String rentTypeName, double rentTypeCost)
                    int rentTypeId = resultSet.getInt(1);
                    String rentTypeName = resultSet.getString("rent_type_name");
                    double rent_type_cost = resultSet.getDouble("rent_type_cost");
                    RentType rentType = new RentType(rentTypeId, rentTypeName, rent_type_cost);
                    rentTypeList.add(rentType);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

        return rentTypeList;
    }
}
