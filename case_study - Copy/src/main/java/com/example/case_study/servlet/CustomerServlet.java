package com.example.case_study.servlet;

import com.example.case_study.models.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static final Map<Integer,Customer> customers = new HashMap<>();
    static {

        customers.put(1,new Customer(1,1,"Nguyễn Văn Nam","1997/02/05",true,"09432123123","0905987787","nam97@gmail.com","Hà Nội"));
        customers.put(2,new Customer(2,2,"Nguyễn Thị Tâm","1992/11/09",false,"98965445412","0998654564","tamnguyen@gmail.com","Nam Định"));
        customers.put(3,new Customer(3,2,"Trần Chính","1993/11/12",true,"02439876781","0909888767","chinhtran@gmail.com","Bình Phước"));
        customers.put(4,new Customer(4,1,"Trần Công Thanh","1987/09/05",true,"2016787098","0908034341","congthanh@gmail.com","Quảng Nam"));
        customers.put(5,new Customer(5,1,"Nguyễn Đức","1987/03/07",true,"1214543987","0901232323","duc87@gmail.com","Hà Tĩnh"));

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("customerList", customers.values());
        request.getRequestDispatcher("/jsp/customer.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "add":
            addCustomer(request,response);
            break;
            case "delete":
            deleteCustomer(request,response);
            break;
            case "edit":
                editCustomer(request,response);
                break;
            default:
            break;
        }


    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customers.remove(id);
        try {
            request.setAttribute("message","delete");
            request.getRequestDispatcher("/jsp/customer.jsp").forward(request,response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        int newId = Integer.parseInt(request.getParameter("new-id"));
        int newCustomerTypeId = Integer.parseInt(request.getParameter("new-customer-type-id"));
        String newName = request.getParameter("new-name");
        String newDayOfBirth = request.getParameter("new-day-of-birth");
        boolean newGender = true;
        String newIdCard = request.getParameter("new-id-card");
        String newPhoneNumber = request.getParameter("new-phone-number");
        String newEmail = request.getParameter("new-email");
        String newAddress = request.getParameter("new-address");

        if(customers.containsKey(newId)){
            request.setAttribute("message","Add failed because id already exists!");
        }else {
            customers.put(newId,new Customer(newId,newCustomerTypeId,newName,newDayOfBirth,newGender,newIdCard,newPhoneNumber,newEmail,newAddress));
            request.setAttribute("message","Add successful!");
        }
        try {
            List<Customer> customerList = new ArrayList<>(customers.values());
            request.setAttribute("customerList",customerList);
            request.getRequestDispatcher("/jsp/customer.jsp").forward(request,response);
        }catch (IOException|ServletException e){
            e.printStackTrace();
        }

    }
}
