package com.example.case_study.services.facility;

import com.example.case_study.models.facility.Facility;

import java.util.List;
import java.util.Map;

public interface IFacilityService {
    List<Facility> findAllFacilityList();
    boolean addFacility(Facility facility);
    boolean editFacility(Facility facility);
    boolean deleteFacility(int id);

    Facility findFacility(int id);

    List<Facility> findAllFacilityIdName();

    Map<String,String> checkValida(Facility facility);
}
