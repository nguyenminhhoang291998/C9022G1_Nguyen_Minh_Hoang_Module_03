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

    }
}
