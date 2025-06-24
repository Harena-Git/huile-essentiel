package com.exemple.monprojet.service;

import java.util.List;

import com.exemple.monprojet.model.Lot;

public interface LotService {
    List<Lot> findAll();
    Lot save(Lot lot);
}