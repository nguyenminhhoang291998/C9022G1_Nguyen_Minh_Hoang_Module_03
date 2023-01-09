package com.example.case_study.controller;

import com.example.case_study.models.facility.Facility;
import com.example.case_study.services.facility.IFacilityService;
import com.example.case_study.services.facility.IRentTypeService;
import com.example.case_study.services.facility.impl.FacilityService;
import com.example.case_study.services.facility.impl.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {

    IFacilityService facilityService = new FacilityService();

    IRentTypeService rentTypeService = new RentTypeService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListFacility(request, response);
        }

    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("rentTypeList", this.rentTypeService.findAllRentType());
        request.setAttribute("facilityList", this.facilityService.findAllFacilityList());
        try {
            request.getRequestDispatcher("view/facility/facility.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addFacility(request, response);
                break;
            case "edit":
                editFacility(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        if (this.facilityService.findFacility(id) != null) {
            boolean check = this.facilityService.deleteFacility(id);
            if (check) {
                request.setAttribute("message", "Delete successful!");
            } else {
                request.setAttribute("message", "Delete failed!");
            }
        } else {
            request.setAttribute("message", "Delete failed because id already not exists!");
        }
        showListFacility(request, response);
    }

    private void editFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idEdit"));
        String name = request.getParameter("nameEdit");
        int area = Integer.parseInt(request.getParameter("areaEdit"));
        double cost = Double.parseDouble(request.getParameter("costEdit"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeopleEdit"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeEdit"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeIdEdit"));
        String standardRoom = request.getParameter("standardRoomEdit");
        String descriptionOtherConvenience = request.getParameter("descriptionEdit");
        double poolArea = Double.parseDouble(request.getParameter("poolAreaEdit"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloorsEdit"));
        String facilityFree = request.getParameter("facilityFreeEdit");
        if (this.facilityService.findFacility(id) != null) {
            boolean check = this.facilityService.editFacility(new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree));
            if (!check) {
                request.setAttribute("message", "Edit failed!");
            } else {
                request.setAttribute("message", "Edit successful!");
            }
        } else {
            request.setAttribute("message", "Edit failed because id already not exists!");
        }
        showListFacility(request, response);
    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        if (this.facilityService.findFacility(id) == null) {
            boolean check = this.facilityService.addFacility(new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree));
            if (!check) {
                request.setAttribute("message", "Add failed!");
            } else {
                request.setAttribute("message", "Add successful!");
            }
        } else {
            request.setAttribute("message", "Add failed because id already exists!");
        }
        showListFacility(request, response);
    }
}
