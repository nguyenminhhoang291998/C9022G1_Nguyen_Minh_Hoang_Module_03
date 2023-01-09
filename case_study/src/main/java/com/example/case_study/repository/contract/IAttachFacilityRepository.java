package com.example.case_study.repository.contract;

import com.example.case_study.models.contract.AttachFacility;

import java.util.List;

public interface IAttachFacilityRepository {
    List<AttachFacility> findAllAttachFacility();
}
