package models.repository.contractRepository;

import models.bean.AttachService;
import models.bean.Contract;
import models.bean.ContractDetail;
import models.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository{
    String insertContract = "insert into contract (employee_id,customer_id,service_id,contract_start_date," +
            "contract_end_date,contract_deposit,contract_total)\n" +
            "values  \n" +
            "(?,?,?,?,?,?,?);";
    String insertContractDetail = "insert into contract_detail(contract_id,attach_service_id,quantity)\n" +
            " values (?,?,?);";

    public boolean createContract(Contract contract) throws SQLException {
        boolean check = false;
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(insertContract);
            statement.setInt(1, contract.getEmployeeId());
            statement.setInt(2, contract.getCustomerId());
            statement.setInt(3, contract.getServiceId());
            statement.setString(4, contract.getContractStartDate());
            statement.setString(5, contract.getContractEndDate());
            statement.setDouble(6, contract.getContractDeposit());
            statement.setDouble(7, contract.getContractTotalMoney());
            check = statement.executeUpdate() > 0;
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }


    public boolean createContractDetail(ContractDetail contractDetail) throws SQLException {
        boolean check = false;
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(insertContractDetail);
            statement.setInt(1, contractDetail.getContractId());
            statement.setInt(2, contractDetail.getAttachServiceId());
            statement.setInt(3, contractDetail.getQuantity());
            check = statement.executeUpdate() > 0;
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<Contract> findByAllContract() {
        Connection connection = DBConnection.getConnection();
        List<Contract> contracts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from contract");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int contractId = resultSet.getInt("contract_id");

                String contractStartDate = resultSet.getString("contract_start_date");
                String contractEndDate = resultSet.getString("contract_end_date");
                int contractDeposit = resultSet.getInt("contract_deposit");
                int contractTotal = resultSet.getInt("contract_total");
                int employeeId = resultSet.getInt("employee_id");
                int customerId = resultSet.getInt("customer_id");
                int serviceId = resultSet.getInt("service_id");
                contracts.add(new Contract(contractId,contractStartDate,contractEndDate,contractDeposit,contractTotal,employeeId,customerId,serviceId));

            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contracts;
    }


    public List<AttachService> findByAllAttachService() {
        Connection connection = DBConnection.getConnection();
        List<AttachService> attachServices = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from attach_service");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int attachServiceId = resultSet.getInt("attach_service_id");
                String attachServiceName = resultSet.getString("attach_service_name");
                double attachServiceCost = resultSet.getDouble("attach_service_cost");
                int attachServiceUnit = resultSet.getInt("attach_service_until");
                String attachServiceStatus = resultSet.getString("attach_service_status");
                attachServices.add(new AttachService(attachServiceId, attachServiceName, attachServiceCost, attachServiceUnit, attachServiceStatus));
            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attachServices;
    }


    public Contract findById(int id) {
        Connection connection = DBConnection.getConnection();
        Contract contract = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from contract\n" +
                    "where contract_id=?;");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int contractId = resultSet.getInt("contract_id");
                String startDate = resultSet.getString("contract_start_date");
                String endDate = resultSet.getString("contract_end_date");
                int deposit = resultSet.getInt("contract_deposit");
                int total = resultSet.getInt("contract_total");
                int employeeId = resultSet.getInt("employee_id");
                int customerId = resultSet.getInt("customer_id");
                int serviceId = resultSet.getInt("service_id");
                contract = new Contract(contractId, startDate, endDate, deposit, total, employeeId, customerId, serviceId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contract;
    }

    public boolean edit(int idContract, Contract contract) {
        boolean check = false;
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement("update contract\n" +
                    "set service_id=?,contract_start_date=?,contract_end_date=?,contract_deposit=?,contract_total=?\n" +
                    "where contract_id=?;");
            statement.setInt(1, contract.getServiceId());
            statement.setString(2, contract.getContractStartDate());
            statement.setString(3, contract.getContractEndDate());
            statement.setDouble(4, contract.getContractDeposit());
            statement.setDouble(5, contract.getContractTotalMoney());
            statement.setInt(6, idContract);
            check = statement.executeUpdate() > 0;
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public ContractDetail findByIdContractDT(int id) {
        Connection connection = DBConnection.getConnection();
        ContractDetail contractDetail = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from contract_detail\n" +
                    "where contract_detail_id=?;");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int contract_detail_id = resultSet.getInt("contract_detail_id");
                int contract_id = resultSet.getInt("contract_id");
                int attach_service_id = resultSet.getInt("attach_service_id");
                int quantity = resultSet.getInt("quantity");
                contractDetail=new ContractDetail(contract_detail_id,contract_id,attach_service_id,quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetail;
    }
}
