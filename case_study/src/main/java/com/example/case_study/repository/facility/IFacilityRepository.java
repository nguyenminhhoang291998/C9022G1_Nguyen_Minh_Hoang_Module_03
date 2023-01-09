package com.example.case_study.repository.facility;

import com.example.case_study.models.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAllFacilityList();
    boolean addFacility(Facility facility);
    boolean editFacility(Facility facility);
    boolean deleteFacility(int id);

    Facility findFacility(int id);

    List<Facility> findAllFacilityIdName();
}
