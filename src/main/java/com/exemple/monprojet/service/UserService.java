package com.exemple.monprojet.service;

import com.exemple.monprojet.model.User;
import java.util.List;

public interface UserService {
    List<User> findAll();
    User save(User user);
}
