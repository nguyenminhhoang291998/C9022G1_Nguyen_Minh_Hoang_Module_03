package com.example.case_study.services.facility.impl;

import com.example.case_study.models.facility.Facility;
import com.example.case_study.repository.facility.IFacilityRepository;
import com.example.case_study.repository.facility.impl.FacilityRepository;
import com.example.case_study.services.facility.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAllFacilityList() {
        return this.facilityRepository.findAllFacilityList();
    }

    @Override
    public boolean addFacility(Facility facility) {
        return this.facilityRepository.addFacility(facility);
    }

    @Override
    public boolean editFacility(Facility facility) {
        return this.facilityRepository.editFacility(facility);
    }

    @Override
    public boolean deleteFacility(int id) {
        return this.facilityRepository.deleteFacility(id);
    }

    @Override
    public Facility findFacility(int id) {
        return this.facilityRepository.findFacility(id);
    }

    @Override
    public List<Facility> findAllFacilityIdName() {
        return this.facilityRepository.findAllFacilityIdName();
    }
}
