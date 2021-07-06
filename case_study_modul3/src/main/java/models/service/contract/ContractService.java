package models.service.contract;

import models.bean.AttachService;
import models.bean.Contract;
import models.bean.ContractDetail;
import models.repository.contractRepository.ContractRepository;
import models.repository.contractRepository.IContractRepository;

import java.sql.SQLException;
import java.util.List;

public class ContractService implements IContractService {
    IContractRepository repository = new ContractRepository();

    @Override
    public boolean createContract(Contract contract) throws SQLException {
        return repository.createContract(contract);
    }

    @Override
    public boolean createContractDetail(ContractDetail contractDetail) throws SQLException {
        return repository.createContractDetail(contractDetail);
    }

    @Override
    public List<Contract> findByAllContract() {
        return repository.findByAllContract();
    }

    @Override
    public List<AttachService> findByAllAttachService() {
        return repository.findByAllAttachService();
    }

    @Override
    public Contract findById(int id) {
        return repository.findById(id);
    }

    @Override
    public ContractDetail findByIdContractDT(int id) {
        return repository.findByIdContractDT(id);
    }

    @Override
    public boolean edit(int idContract, Contract contract) {
        return repository.edit(idContract,contract);
    }
}
