package com.example.case_study.controller;

import com.example.case_study.models.Contract;
import com.example.case_study.models.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    private static final Map<Integer, Contract> contractList = new HashMap<>();
    static {
        contractList.put(1,new Contract(1,"22/09/2022","23/09/2022",400,2,1,3));
        contractList.put(2,new Contract(2,"11/08/2022","13/08/2022",200,1,3,2));
        contractList.put(3,new Contract(3,"22/10/2022","25/10/2022",105,3,2,4));
        contractList.put(4,new Contract(4,"11/09/2022","17/09/2022",202,2,5,6));
    }
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
        request.setAttribute("contractList", contractList.values());
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
