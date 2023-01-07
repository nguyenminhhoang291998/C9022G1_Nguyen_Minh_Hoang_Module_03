package com.example.case_study.controller;

import com.example.case_study.models.contract.Contract;
import com.example.case_study.services.contract.IContractService;
import com.example.case_study.services.contract.impl.ContractService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    IContractService contractService = new ContractService();
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
        request.setAttribute("contractVirtualList", this.contractService.findAllContractVirtualList());
        try {
            request.getRequestDispatcher("view/contract/contract.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
