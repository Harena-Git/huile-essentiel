package com.exemple.monprojet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exemple.monprojet.model.Personne;

public interface PersonneRepository extends JpaRepository<Personne, Long> {}