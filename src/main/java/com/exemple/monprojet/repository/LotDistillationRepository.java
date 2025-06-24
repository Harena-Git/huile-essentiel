package com.exemple.monprojet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exemple.monprojet.model.LotDistillation;

public interface LotDistillationRepository extends JpaRepository<LotDistillation, Long> {}