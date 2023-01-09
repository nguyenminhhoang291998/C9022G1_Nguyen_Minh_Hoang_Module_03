package com.example.case_study.repository.facility;

import com.example.case_study.models.facility.FacilityType;
import com.example.case_study.models.facility.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> findAllRentType();
}
