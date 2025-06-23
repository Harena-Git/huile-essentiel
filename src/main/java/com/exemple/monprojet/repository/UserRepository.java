package com.exemple.monprojet.repository;

import com.exemple.monprojet.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {}
