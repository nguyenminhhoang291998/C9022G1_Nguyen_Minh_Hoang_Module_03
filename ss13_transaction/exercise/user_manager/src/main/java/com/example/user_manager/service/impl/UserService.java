package com.example.user_manager.service.impl;

import com.example.user_manager.model.User;
import com.example.user_manager.repository.IUserRepository;
import com.example.user_manager.repository.impl.UserRepository;
import com.example.user_manager.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private final IUserRepository userRepository = new UserRepository();
    @Override
    public boolean insertUser(User user) {
        return this.userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
//        return this.userRepository.selectUser(id);
        return this.userRepository.getUserById(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return this.userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) {
        return this.userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return this.userRepository.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return this.userRepository.findByCountry(country);
    }
}
