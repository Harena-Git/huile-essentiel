package com.exemple.monprojet.service;

import java.util.List;

import com.exemple.monprojet.model.LotDistillation;

public interface LotDistillationService {
    List<LotDistillation> findAll();
    LotDistillation save(LotDistillation lotDistillation);
}