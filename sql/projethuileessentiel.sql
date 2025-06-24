
-- ddl-end ---- ** Database generated with pgModeler (PostgreSQL Database Modeler).
-- ** pgModeler version: 1.2.0
-- ** PostgreSQL version: 17.0
-- ** Project Site: pgmodeler.io
-- ** Model Author: ---

-- ** Database creation must be performed outside a multi lined SQL file. 
-- ** These commands were put in this file only as a convenience.

-- object: projethuileessentiel | type: DATABASE --
-- DROP DATABASE IF EXISTS projethuileessentiel;
CREATE DATABASE projethuileessentiel;
\c projethuileessentiel;
-- ddl-end --
-- Prepended SQL commands --
CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;

SET search_path TO pg_catalog,public;
-- ddl-end --

-- object: public.personne | type: TABLE --
-- DROP TABLE IF EXISTS public.personne CASCADE;
CREATE TABLE public.personne (
	id serial NOT NULL,
	nom varchar(255),
	prenom varchar(255),
	date_de_naissance date,
	email varchar,
	"dateAjout" date,
	CONSTRAINT pk_id_personne PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.personne OWNER TO postgres;
-- ddl-end --

-- object: public.role | type: TABLE --
-- DROP TABLE IF EXISTS public.role CASCADE;
CREATE TABLE public.role (
	id serial NOT NULL,
	nom varchar(255),
	CONSTRAINT pk_id_role PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN public.role.nom IS E'valeur possible: responsable cueille, responsable production, responsable qualité, gérant';
-- ddl-end --
ALTER TABLE public.role OWNER TO postgres;
-- ddl-end --

-- object: public.utilisateur | type: TABLE --
-- DROP TABLE IF EXISTS public.utilisateur CASCADE;
CREATE TABLE public.utilisateur (
	id serial NOT NULL,
	id_personne integer,
	mot_de_passe_hash varchar(255),
	id_role integer,
	date_inscription date,
	CONSTRAINT pk_utilisateur PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.utilisateur OWNER TO postgres;
-- ddl-end --

-- object: public.collecteur | type: TABLE --
-- DROP TABLE IF EXISTS public.collecteur CASCADE;
CREATE TABLE public.collecteur (
	id serial NOT NULL,
	id_personne integer,
	date_de_creation date,
	CONSTRAINT pk_id_collecteur PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.collecteur OWNER TO postgres;
-- ddl-end --

-- object: public.zone | type: TABLE --
-- DROP TABLE IF EXISTS public.zone CASCADE;
CREATE TABLE public.zone (
	id serial NOT NULL,
	coordonne geometry(GEOMETRY, 26910),
	date_de_collecte timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	nom_lieu varchar(255),
	CONSTRAINT fk_id_zone PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.zone OWNER TO postgres;
-- ddl-end --

-- object: public.phase | type: TABLE --
-- DROP TABLE IF EXISTS public.phase CASCADE;
CREATE TABLE public.phase (
	id serial NOT NULL,
	nom varchar(255),
	CONSTRAINT pk_id_phase PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN public.phase.nom IS E'Nom phase (collecte, production, stockage, exportation)';
-- ddl-end --
ALTER TABLE public.phase OWNER TO postgres;
-- ddl-end --

-- object: public.lot | type: TABLE --
-- DROP TABLE IF EXISTS public.lot CASCADE;
CREATE TABLE public.lot (
	id serial NOT NULL,
	id_zone integer,
	poids decimal,
	poids_apres_trie decimal,
	id_collecteur integer,
	montant_payer_collecteur decimal,
	CONSTRAINT pk_id_lot PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.lot OWNER TO postgres;
-- ddl-end --

-- object: public.phase_lot | type: TABLE --
-- DROP TABLE IF EXISTS public.phase_lot CASCADE;
CREATE TABLE public.phase_lot (
	id serial NOT NULL,
	id_phase integer,
	id_lot integer,
	date_de_creation timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "pk_id_Phase_Lot" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.phase_lot OWNER TO postgres;
-- ddl-end --

-- object: public.lot_distillation | type: TABLE --
-- DROP TABLE IF EXISTS public.lot_distillation CASCADE;
CREATE TABLE public.lot_distillation (
	id serial NOT NULL,
	id_lot integer,
	temperature_vapeur decimal,
	temperature_condensation decimal,
	date_heure_debut timestamp,
	date_heure_fin timestamp,
	quantite_eau decimal,
	CONSTRAINT "pk_id_lotDistillation" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.lot_distillation OWNER TO postgres;
-- ddl-end --

-- object: public.lot_stockage | type: TABLE --
-- DROP TABLE IF EXISTS public.lot_stockage CASCADE;
CREATE TABLE public.lot_stockage (
	id serial NOT NULL,
	id_lot_distillation integer,
	id_flacon integer,
	CONSTRAINT "pk_id_LotStockage" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.lot_stockage OWNER TO postgres;
-- ddl-end --

-- object: public."Flacon" | type: TABLE --
-- DROP TABLE IF EXISTS public."Flacon" CASCADE;
CREATE TABLE public."Flacon" (
	id serial NOT NULL,
	capacite decimal,
	materiaux varchar,
	CONSTRAINT "pk_id_Flacon" PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN public."Flacon".materiaux IS E'liste des materiaux espacer par des virgules';
-- ddl-end --
ALTER TABLE public."Flacon" OWNER TO postgres;
-- ddl-end --

-- object: public."analyse" | type: TABLE --
-- DROP TABLE IF EXISTS public."analyse" CASCADE;
CREATE TABLE public."analyse" (
	id serial NOT NULL,
	rentention_time decimal,
	compount varchar,
	ki decimal,
	percent_area decimal,
	formula varchar,
	CONSTRAINT pk_id_analyse PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public."analyse" OWNER TO postgres;
-- ddl-end --

-- object: public.analyse_lot | type: TABLE --
-- DROP TABLE IF EXISTS public.analyse_lot CASCADE;
CREATE TABLE public.analyse_lot (
	id serial NOT NULL,
	id_analyse integer,
	id_lot_distillation integer,
	CONSTRAINT "pk_id_Analyse_Lot" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.analyse_lot OWNER TO postgres;
-- ddl-end --

-- object: public.type_client | type: TABLE --
-- DROP TABLE IF EXISTS public.type_client CASCADE;
CREATE TABLE public.type_client (
	id serial NOT NULL,
	type_client varchar(255),
	CONSTRAINT "pk_id_TypeClient" PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN public.type_client.type_client IS E'choix entre (Particulier ou entreprise)';
-- ddl-end --
ALTER TABLE public.type_client OWNER TO postgres;
-- ddl-end --

-- object: public.client | type: TABLE --
-- DROP TABLE IF EXISTS public.client CASCADE;
CREATE TABLE public.client (
	id serial NOT NULL,
	id_type_client integer,
	nom varchar(255),
	contact varchar,
	pays varchar(255),
	CONSTRAINT "pk_id_Client" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.client OWNER TO postgres;
-- ddl-end --

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;

-- object: public.cout_production | type: TABLE --
-- DROP TABLE IF EXISTS public.cout_production CASCADE;
CREATE TABLE public.cout_production (
	id serial NOT NULL,
	id_lot integer,
	cout_kg_feuilles decimal,
	cout_main_oeuvre decimal,
	cout_nettyage decimal,
	cout_transport decimal,
	cout_flacon decimal,
	total decimal,
	CONSTRAINT pk_cout_production PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.cout_production OWNER TO postgres;
-- ddl-end --

-- object: public.vente | type: TABLE --
-- DROP TABLE IF EXISTS public.vente CASCADE;
CREATE TABLE public.vente (
	id serial NOT NULL,
	cout_par_litre decimal,
	marge decimal,
	CONSTRAINT pk_vente PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.vente OWNER TO postgres;
-- ddl-end --

-- object: public.employe | type: TABLE --
-- DROP TABLE IF EXISTS public.employe CASCADE;
CREATE TABLE public.employe (
	id serial NOT NULL,
	id_personne smallint,
	salaire_par_mois smallint,
	CONSTRAINT pk_employe PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.employe OWNER TO postgres;
-- ddl-end --

-- object: public.commande | type: TABLE --
-- DROP TABLE IF EXISTS public.commande CASCADE;
CREATE TABLE public.commande (
	id serial NOT NULL,
	id_client smallint,
	date_commande timestamp,
	date_prevue_expedition timestamp,
	status boolean,
	CONSTRAINT pk_commande PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.commande OWNER TO postgres;
-- ddl-end --

-- object: public.commande_detail | type: TABLE --
-- DROP TABLE IF EXISTS public.commande_detail CASCADE;
CREATE TABLE public.commande_detail (
	id serial NOT NULL,
	id_commande integer,
	id_lot integer,
	CONSTRAINT pk_commande_detail PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.commande_detail OWNER TO postgres;
-- ddl-end --

-- object: fk_id_personne | type: CONSTRAINT --
-- ALTER TABLE public.utilisateur DROP CONSTRAINT IF EXISTS fk_id_personne CASCADE;
ALTER TABLE public.utilisateur ADD CONSTRAINT fk_id_personne FOREIGN KEY (id_personne)
REFERENCES public.personne (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_role_id_role | type: CONSTRAINT --
-- ALTER TABLE public.utilisateur DROP CONSTRAINT IF EXISTS fk_role_id_role CASCADE;
ALTER TABLE public.utilisateur ADD CONSTRAINT fk_role_id_role FOREIGN KEY (id_role)
REFERENCES public.role (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idPersonne" | type: CONSTRAINT --
-- ALTER TABLE public.collecteur DROP CONSTRAINT IF EXISTS "fk_idPersonne" CASCADE;
ALTER TABLE public.collecteur ADD CONSTRAINT "fk_idPersonne" FOREIGN KEY (id_personne)
REFERENCES public.personne (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idCollecteur_lot" | type: CONSTRAINT --
-- ALTER TABLE public.lot DROP CONSTRAINT IF EXISTS "fk_idCollecteur_lot" CASCADE;
ALTER TABLE public.lot ADD CONSTRAINT "fk_idCollecteur_lot" FOREIGN KEY (id_collecteur)
REFERENCES public.collecteur (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idZone_lot" | type: CONSTRAINT --
-- ALTER TABLE public.lot DROP CONSTRAINT IF EXISTS "fk_idZone_lot" CASCADE;
ALTER TABLE public.lot ADD CONSTRAINT "fk_idZone_lot" FOREIGN KEY (id_zone)
REFERENCES public.zone (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idPhase_Phase_Lot" | type: CONSTRAINT --
-- ALTER TABLE public.phase_lot DROP CONSTRAINT IF EXISTS "fk_idPhase_Phase_Lot" CASCADE;
ALTER TABLE public.phase_lot ADD CONSTRAINT "fk_idPhase_Phase_Lot" FOREIGN KEY (id_phase)
REFERENCES public.phase (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idLot_Phase_Lot" | type: CONSTRAINT --
-- ALTER TABLE public.phase_lot DROP CONSTRAINT IF EXISTS "fk_idLot_Phase_Lot" CASCADE;
ALTER TABLE public.phase_lot ADD CONSTRAINT "fk_idLot_Phase_Lot" FOREIGN KEY (id_lot)
REFERENCES public.lot (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idLot_LotDistillation" | type: CONSTRAINT --
-- ALTER TABLE public.lot_distillation DROP CONSTRAINT IF EXISTS "fk_idLot_LotDistillation" CASCADE;
ALTER TABLE public.lot_distillation ADD CONSTRAINT "fk_idLot_LotDistillation" FOREIGN KEY (id_lot)
REFERENCES public.lot (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idLotDistillation_LotStockage" | type: CONSTRAINT --
-- ALTER TABLE public.lot_stockage DROP CONSTRAINT IF EXISTS "fk_idLotDistillation_LotStockage" CASCADE;
ALTER TABLE public.lot_stockage ADD CONSTRAINT "fk_idLotDistillation_LotStockage" FOREIGN KEY (id_lot_distillation)
REFERENCES public.lot_distillation (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idFlacon_LotDistillation" | type: CONSTRAINT --
-- ALTER TABLE public.lot_stockage DROP CONSTRAINT IF EXISTS "fk_idFlacon_LotDistillation" CASCADE;
ALTER TABLE public.lot_stockage ADD CONSTRAINT "fk_idFlacon_LotDistillation" FOREIGN KEY (id_flacon)
REFERENCES public."Flacon" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idAnalyse_Analyse_Lot" | type: CONSTRAINT --
-- ALTER TABLE public.analyse_lot DROP CONSTRAINT IF EXISTS "fk_idAnalyse_Analyse_Lot" CASCADE;
ALTER TABLE public.analyse_lot ADD CONSTRAINT "fk_idAnalyse_Analyse_Lot" FOREIGN KEY (id_analyse)
REFERENCES public."analyse" (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idLotDistillation_Analyse_Lot" | type: CONSTRAINT --
-- ALTER TABLE public.analyse_lot DROP CONSTRAINT IF EXISTS "fk_idLotDistillation_Analyse_Lot" CASCADE;
ALTER TABLE public.analyse_lot ADD CONSTRAINT "fk_idLotDistillation_Analyse_Lot" FOREIGN KEY (id_lot_distillation)
REFERENCES public.lot_distillation (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "fk_idTypeClient_Client" | type: CONSTRAINT --
-- ALTER TABLE public.client DROP CONSTRAINT IF EXISTS "fk_idTypeClient_Client" CASCADE;
ALTER TABLE public.client ADD CONSTRAINT "fk_idTypeClient_Client" FOREIGN KEY (id_type_client)
REFERENCES public.type_client (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_lot_id_lot | type: CONSTRAINT --
-- ALTER TABLE public.cout_production DROP CONSTRAINT IF EXISTS fk_lot_id_lot CASCADE;
ALTER TABLE public.cout_production ADD CONSTRAINT fk_lot_id_lot FOREIGN KEY (id_lot)
REFERENCES public.lot (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_personne_id_personne | type: CONSTRAINT --
-- ALTER TABLE public.employe DROP CONSTRAINT IF EXISTS fk_personne_id_personne CASCADE;
ALTER TABLE public.employe ADD CONSTRAINT fk_personne_id_personne FOREIGN KEY (id_personne)
REFERENCES public.personne (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_client_id_client | type: CONSTRAINT --
-- ALTER TABLE public.commande DROP CONSTRAINT IF EXISTS fk_client_id_client CASCADE;
ALTER TABLE public.commande ADD CONSTRAINT fk_client_id_client FOREIGN KEY (id_client)
REFERENCES public.client (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_lot_id_lot | type: CONSTRAINT --
-- ALTER TABLE public.commande_detail DROP CONSTRAINT IF EXISTS fk_lot_id_lot CASCADE;
ALTER TABLE public.commande_detail ADD CONSTRAINT fk_lot_id_lot FOREIGN KEY (id_lot)
REFERENCES public.lot (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_commande_id_commande | type: CONSTRAINT --
-- ALTER TABLE public.commande_detail DROP CONSTRAINT IF EXISTS fk_commande_id_commande CASCADE;
ALTER TABLE public.commande_detail ADD CONSTRAINT fk_commande_id_commande FOREIGN KEY (id_commande)
REFERENCES public.commande (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


