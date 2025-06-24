package com.exemple.monprojet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exemple.monprojet.model.Lot;

public interface LotRepository extends JpaRepository<Lot, Long> {}