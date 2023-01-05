package com.example.user_manager.controller;

import com.example.user_manager.model.User;
import com.example.user_manager.service.IUserService;
import com.example.user_manager.service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "sort":
                sortList(request, response);
                break;
            case "permision":
                addUserPermision(request, response);
                break;
            case "test-without-tran":
                testWithoutTran(request, response);
                break;
            default:
                listUser(request, response);
        }
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {
        this.userService.insertUpdateWithoutTransaction();
    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
        User user = new User("quan", "quan.nguyen@codegym.vn", "vn");
        int[] permision = {1, 2, 4};
        this.userService.addUserTransaction(user,permision);
    }

    private void sortList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = this.userService.selectAllUsers();
        userList.sort(new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                return o1.getName().compareTo(o2.getName());
            }
        });
        request.setAttribute("listUser", userList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.userService.deleteUser(id);
        listUser(request,response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("user", this.userService.selectUser(id));
            request.getRequestDispatcher("view/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listUser", userService.selectAllUsers());
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            case "find":
                findUser(request, response);
                break;
            default:

        }
    }

    private void findUser(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        request.setAttribute("users", this.userService.findByCountry(country));
        try {
            request.getRequestDispatcher("view/find.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        this.userService.updateUser(new User(id, name, email, country));
        listUser(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        this.userService.insertUser(new User(name, email, country));
        listUser(request, response);
    }
}
