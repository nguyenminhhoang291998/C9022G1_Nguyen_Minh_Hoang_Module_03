package com.example.user_manager.service;

import com.example.user_manager.model.User;

import java.util.List;

public interface IUserService {
     boolean insertUser(User user);

     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id);

     boolean updateUser(User user);

     List<User> findByCountry(String country);
}

