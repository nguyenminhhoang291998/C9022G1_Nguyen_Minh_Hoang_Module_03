package com.example.case_study.services.contract.impl;

import com.example.case_study.models.contract.Contract;
import com.example.case_study.models.contract.ContractVirtual;
import com.example.case_study.repository.contract.IContractRepository;
import com.example.case_study.repository.contract.impl.ContractRepository;
import com.example.case_study.services.contract.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    IContractRepository contractRepository = new ContractRepository();
    @Override
    public List<ContractVirtual> findAllContractVirtualList() {
        return this.contractRepository.findAllContractVirtualList();
    }

    @Override
    public boolean addContract(Contract contract) {
        return this.contractRepository.addContract(contract);
    }

    @Override
    public boolean editContract(Contract contract) {
        return this.contractRepository.editContract(contract);
    }

    @Override
    public boolean deleteContract(int id) {
        return this.contractRepository.deleteContract(id);
    }

    @Override
    public Contract findContract(int id) {
        return this.contractRepository.findContract(id);
    }
}
