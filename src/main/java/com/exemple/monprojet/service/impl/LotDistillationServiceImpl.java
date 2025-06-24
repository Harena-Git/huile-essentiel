package com.exemple.monprojet.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exemple.monprojet.model.LotDistillation;
import com.exemple.monprojet.repository.LotDistillationRepository;
import com.exemple.monprojet.service.LotDistillationService;

@Service
public class LotDistillationServiceImpl implements LotDistillationService {

    private final LotDistillationRepository repository;

    public LotDistillationServiceImpl(LotDistillationRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<LotDistillation> findAll() {
        return repository.findAll();
    }

    @Override
    public LotDistillation save(LotDistillation lotDistillation) {
        return repository.save(lotDistillation);
    }
}