package com.exemple.monprojet.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exemple.monprojet.model.Personne;
import com.exemple.monprojet.repository.PersonneRepository;
import com.exemple.monprojet.service.PersonneService;

@Service
public class PersonneServiceImpl implements PersonneService {

    private final PersonneRepository repository;

    public PersonneServiceImpl(PersonneRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Personne> findAll() {
        return repository.findAll();
    }

    @Override
    public Personne save(Personne personne) {
        return repository.save(personne);
    }
}