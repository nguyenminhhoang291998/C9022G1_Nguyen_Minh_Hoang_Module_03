package com.example.case_study.services.facility;

import com.example.case_study.models.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAllFacilityList();
    boolean addFacility(Facility facility);
    boolean editFacility(Facility facility);
    boolean deleteFacility(int id);

    Facility findFacility(int id);
}
