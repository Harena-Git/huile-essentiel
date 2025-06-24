package com.exemple.monprojet.service;

import java.util.List;

import com.exemple.monprojet.model.Personne;

public interface PersonneService {
    List<Personne> findAll();
    Personne save(Personne personne);
}