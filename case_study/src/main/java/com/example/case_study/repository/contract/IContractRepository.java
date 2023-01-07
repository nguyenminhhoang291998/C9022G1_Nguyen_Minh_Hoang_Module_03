package com.example.case_study.repository.contract;

import com.example.case_study.models.contract.Contract;
import com.example.case_study.models.contract.ContractVirtual;


import java.util.List;

public interface IContractRepository {

    List<ContractVirtual> findAllContractVirtualList();
    boolean addContract(Contract contract);
    boolean editContract(Contract contract);
    boolean deleteContract(int id);

    Contract findContract(int id);
}
