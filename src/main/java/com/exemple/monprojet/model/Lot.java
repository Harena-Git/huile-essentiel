package com.exemple.monprojet.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "lot")
public class Lot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_zone")
    private Integer idZone;

    private Double poids;

    @Column(name = "poids_apres_trie")
    private Double poidsApresTrie;

    @Column(name = "id_collecteur")
    private Integer idCollecteur;

    @Column(name = "montant_payer_collecteur")
    private Double montantPayerCollecteur;

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getIdZone() { return idZone; }
    public void setIdZone(Integer idZone) { this.idZone = idZone; }

    public Double getPoids() { return poids; }
    public void setPoids(Double poids) { this.poids = poids; }

    public Double getPoidsApresTrie() { return poidsApresTrie; }
    public void setPoidsApresTrie(Double poidsApresTrie) { this.poidsApresTrie = poidsApresTrie; }

    public Integer getIdCollecteur() { return idCollecteur; }
    public void setIdCollecteur(Integer idCollecteur) { this.idCollecteur = idCollecteur; }

    public Double getMontantPayerCollecteur() { return montantPayerCollecteur; }
    public void setMontantPayerCollecteur(Double montantPayerCollecteur) { this.montantPayerCollecteur = montantPayerCollecteur; }
}