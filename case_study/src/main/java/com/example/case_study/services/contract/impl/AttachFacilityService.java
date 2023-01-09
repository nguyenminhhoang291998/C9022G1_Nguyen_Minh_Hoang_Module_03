package com.example.case_study.services.contract.impl;

import com.example.case_study.models.contract.AttachFacility;
import com.example.case_study.repository.contract.IAttachFacilityRepository;
import com.example.case_study.repository.contract.impl.AttachFacilityRepository;
import com.example.case_study.services.contract.IAttachFacilityService;

import java.util.List;

public class AttachFacilityService implements IAttachFacilityService {
    IAttachFacilityRepository attachFacilityRepository = new AttachFacilityRepository();
    @Override
    public List<AttachFacility> findAllAttachFacility() {
        return this.attachFacilityRepository.findAllAttachFacility();
    }
}
