package com.exemple.monprojet.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exemple.monprojet.model.Lot;
import com.exemple.monprojet.repository.LotRepository;
import com.exemple.monprojet.service.LotService;

@Service
public class LotServiceImpl implements LotService {

    private final LotRepository repository;

    public LotServiceImpl(LotRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Lot> findAll() {
        return repository.findAll();
    }

    @Override
    public Lot save(Lot lot) {
        return repository.save(lot);
    }
}