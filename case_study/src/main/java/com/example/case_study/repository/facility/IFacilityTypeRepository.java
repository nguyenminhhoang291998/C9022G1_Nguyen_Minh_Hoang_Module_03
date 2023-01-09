package com.example.case_study.repository.facility;

import com.example.case_study.models.employee.Position;
import com.example.case_study.models.facility.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> findAllFacilityType();
}
