package com.example.simple_login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
     boolean flag = username.equals("admin") & password.equals("123");
     if(flag){
         request.setAttribute("kq", "true");
     }else {
         request.setAttribute("kq", "false");
     }
        RequestDispatcher rs = request.getRequestDispatcher("result.jsp");
        rs.forward(request,response);
    }
}
