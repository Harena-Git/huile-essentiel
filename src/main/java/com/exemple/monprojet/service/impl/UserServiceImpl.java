package com.exemple.monprojet.service.impl;

import com.exemple.monprojet.model.User;
import com.exemple.monprojet.repository.UserRepository;
import com.exemple.monprojet.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository repository;

    public UserServiceImpl(UserRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public User save(User user) {
        return repository.save(user);
    }
}
