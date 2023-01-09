package com.example.case_study.models.contract_detail;

import com.example.case_study.models.contract.AttachFacility;

public class ContractDetailVirtual {
    private int contractId;
    private AttachFacility attachFacility;
    private int quantity;

    public ContractDetailVirtual(int contractId, AttachFacility attachFacility, int quantity) {
        this.contractId = contractId;
        this.attachFacility = attachFacility;
        this.quantity = quantity;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public AttachFacility getAttachFacility() {
        return attachFacility;
    }

    public void setAttachFacility(AttachFacility attachFacility) {
        this.attachFacility = attachFacility;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


}
