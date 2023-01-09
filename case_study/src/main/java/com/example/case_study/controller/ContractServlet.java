package com.example.case_study.controller;

import com.example.case_study.models.contract.Contract;
import com.example.case_study.models.contract_detail.ContractDetail;
import com.example.case_study.services.contract.IAttachFacilityService;
import com.example.case_study.services.contract.IContractService;
import com.example.case_study.services.contract.impl.AttachFacilityService;
import com.example.case_study.services.contract.impl.ContractService;
import com.example.case_study.services.customer.ICustomerService;
import com.example.case_study.services.customer.impl.CustomerService;
import com.example.case_study.services.facility.IFacilityService;
import com.example.case_study.services.facility.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    IContractService contractService = new ContractService();
    IAttachFacilityService attachFacilityService = new AttachFacilityService();

    ICustomerService customerService = new CustomerService();

    IFacilityService facilityService = new FacilityService();


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
                showListContract(request, response);
                break;
        }
    }

    private void showListContract(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList", this.customerService.findAllCustomerIdName());
        request.setAttribute("facilityList", this.facilityService.findAllFacilityIdName());
        request.setAttribute("attachFacilityList", this.attachFacilityService.findAllAttachFacility());
        request.setAttribute("contractVirtualList", this.contractService.findAllContractVirtualList());
        try {
            request.getRequestDispatcher("view/contract/contract.jsp").forward(request, response);
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
            case "addAF":
                addAttachFacility(request,response);
                break;
            case "add":
                addContract(request,response);
                break;
        }
    }

    private void addContract(HttpServletRequest request, HttpServletResponse response) {
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int facilityId = Integer.parseInt(request.getParameter("facilityId"));
        boolean check = this.contractService.addContract(new Contract(startDate,endDate,deposit,1,customerId,facilityId));
        if (!check) {
            request.setAttribute("message", "Add failed!");
        } else {
            request.setAttribute("message", "Add successful!");
        }
        showListContract(request,response);
    }

    private void addAttachFacility(HttpServletRequest request, HttpServletResponse response) {
        int idContract = Integer.parseInt(request.getParameter("contractId"));
        int idAttachFacility = Integer.parseInt(request.getParameter("idAttachFacility"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        boolean check = this.contractService.addContractDetail(new ContractDetail(idContract,idAttachFacility,quantity));
        if (!check) {
            request.setAttribute("message", "Add failed!");
        } else {
            request.setAttribute("message", "Add successful!");
        }
        showListContract(request,response);
    }
}
