package com.example.case_study.services.facility.impl;

import com.example.case_study.models.facility.FacilityType;
import com.example.case_study.repository.facility.IFacilityTypeRepository;
import com.example.case_study.repository.facility.impl.FacilityTypeRepository;
import com.example.case_study.services.facility.IFacilityTypeService;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {
    IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> findAllFacilityType() {
        return facilityTypeRepository.findAllFacilityType();
    }
}
