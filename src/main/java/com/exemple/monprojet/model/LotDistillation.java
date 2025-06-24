package com.exemple.monprojet.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "lot_distillation")
public class LotDistillation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_lot")
    private Integer idLot;

    @Column(name = "temperature_vapeur")
    private Double temperatureVapeur;

    @Column(name = "temperature_condensation")
    private Double temperatureCondensation;

    @Column(name = "date_heure_debut")
    private LocalDateTime dateHeureDebut;

    @Column(name = "date_heure_fin")
    private LocalDateTime dateHeureFin;

    @Column(name = "quantite_eau")
    private Double quantiteEau;

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getIdLot() { return idLot; }
    public void setIdLot(Integer idLot) { this.idLot = idLot; }

    public Double getTemperatureVapeur() { return temperatureVapeur; }
    public void setTemperatureVapeur(Double temperatureVapeur) { this.temperatureVapeur = temperatureVapeur; }

    public Double getTemperatureCondensation() { return temperatureCondensation; }
    public void setTemperatureCondensation(Double temperatureCondensation) { this.temperatureCondensation = temperatureCondensation; }

    public LocalDateTime getDateHeureDebut() { return dateHeureDebut; }
    public void setDateHeureDebut(LocalDateTime dateHeureDebut) { this.dateHeureDebut = dateHeureDebut; }

    public LocalDateTime getDateHeureFin() { return dateHeureFin; }
    public void setDateHeureFin(LocalDateTime dateHeureFin) { this.dateHeureFin = dateHeureFin; }

    public Double getQuantiteEau() { return quantiteEau; }
    public void setQuantiteEau(Double quantiteEau) { this.quantiteEau = quantiteEau; }
}