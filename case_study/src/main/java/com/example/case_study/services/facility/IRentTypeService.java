package com.example.case_study.services.facility;

import com.example.case_study.models.facility.RentType;

import java.util.List;

public interface IRentTypeService {
    List<RentType> findAllRentType();
}
