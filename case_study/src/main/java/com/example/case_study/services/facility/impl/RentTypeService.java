package com.example.case_study.services.facility.impl;

import com.example.case_study.models.facility.RentType;
import com.example.case_study.repository.facility.IRentTypeRepository;
import com.example.case_study.repository.facility.impl.RentTypeRepository;
import com.example.case_study.services.facility.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> findAllRentType() {
        return this.rentTypeRepository.findAllRentType();
    }
}
