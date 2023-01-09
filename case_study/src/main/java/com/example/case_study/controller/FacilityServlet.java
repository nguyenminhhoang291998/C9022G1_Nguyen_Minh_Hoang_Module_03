package com.example.case_study.controller;

import com.example.case_study.services.facility.IFacilityService;
import com.example.case_study.services.facility.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {

    IFacilityService facilityService = new FacilityService();


    @Override
    protected void  doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            default:
                showListFacility(request,response);
        }

    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("facilityList",this.facilityService.findAllFacilityList());
        try {
            request.getRequestDispatcher("view/facility/facility.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
                addFacility(request,response);
        }
    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double area = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
    }
}
