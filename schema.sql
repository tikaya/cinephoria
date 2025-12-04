--
-- PostgreSQL database dump
--
-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: role_employe; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role_employe AS ENUM (
    'ADMIN',
    'EMPLOYEE'
);


ALTER TYPE public.role_employe OWNER TO postgres;

--
-- Name: notify_reservation_changed(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.notify_reservation_changed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE rid int;
BEGIN
  IF TG_TABLE_NAME = 'reservation' THEN
    rid := NEW.id_reservation;
  ELSIF TG_TABLE_NAME = 'reservation_siege' THEN
    rid := NEW.id_reservation;
  END IF;
  PERFORM pg_notify('reservation_changed', rid::text);
  RETURN NEW;
END; $$;


ALTER FUNCTION public.notify_reservation_changed() OWNER TO postgres;

--
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_updated_at() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cinema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema (
    id_cinema integer NOT NULL,
    nom_cinema character varying(100),
    ville character varying(100),
    adresse character varying(150),
    telephone character varying(30)
);


ALTER TABLE public.cinema OWNER TO postgres;

--
-- Name: cinema_id_cinema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_id_cinema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cinema_id_cinema_seq OWNER TO postgres;

--
-- Name: cinema_id_cinema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_id_cinema_seq OWNED BY public.cinema.id_cinema;


--
-- Name: employe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employe (
    id_employe integer NOT NULL,
    email_employe public.citext NOT NULL,
    password_hash text NOT NULL,
    role_employe public.role_employe DEFAULT 'EMPLOYEE'::public.role_employe NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    password_temp boolean DEFAULT false
);


ALTER TABLE public.employe OWNER TO postgres;

--
-- Name: employe_id_employe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employe_id_employe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employe_id_employe_seq OWNER TO postgres;

--
-- Name: employe_id_employe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employe_id_employe_seq OWNED BY public.employe.id_employe;


--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    id_film integer NOT NULL,
    titre character varying(150) NOT NULL,
    description text NOT NULL,
    age_minimum integer,
    label_coup_de_coeur boolean DEFAULT false,
    genre character varying(50) NOT NULL,
    affiche_url text,
    date_ajout timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT film_age_minimun_check CHECK ((age_minimum >= 0))
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_id_film_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_id_film_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.film_id_film_seq OWNER TO postgres;

--
-- Name: film_id_film_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_id_film_seq OWNED BY public.film.id_film;


--
-- Name: note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note (
    id_note integer NOT NULL,
    note integer,
    commentaire text,
    valide_par_employe integer,
    id_user integer,
    id_film integer,
    id_seance integer,
    CONSTRAINT note_note_check CHECK (((note >= 0) AND (note <= 10)))
);


ALTER TABLE public.note OWNER TO postgres;

--
-- Name: note_id_note_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.note_id_note_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.note_id_note_seq OWNER TO postgres;

--
-- Name: note_id_note_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.note_id_note_seq OWNED BY public.note.id_note;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id_reservation integer NOT NULL,
    nombre_places integer,
    prix_total numeric(8,2),
    etat character varying(50),
    id_user integer,
    id_seance integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_id_reservation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_reservation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservation_id_reservation_seq OWNER TO postgres;

--
-- Name: reservation_id_reservation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_reservation_seq OWNED BY public.reservation.id_reservation;


--
-- Name: reservation_siege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_siege (
    id_reservation integer NOT NULL,
    id_siege integer NOT NULL
);


ALTER TABLE public.reservation_siege OWNER TO postgres;

--
-- Name: salle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salle (
    id_salle integer NOT NULL,
    nom_salle character varying(100),
    capacite integer,
    qualite_projection character varying(50),
    id_cinema integer
);


ALTER TABLE public.salle OWNER TO postgres;

--
-- Name: salle_id_salle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salle_id_salle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salle_id_salle_seq OWNER TO postgres;

--
-- Name: salle_id_salle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salle_id_salle_seq OWNED BY public.salle.id_salle;


--
-- Name: seance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seance (
    id_seance integer NOT NULL,
    heure_debut time without time zone,
    heure_fin time without time zone,
    prix numeric(6,2),
    id_salle integer,
    id_film integer,
    date_seance date DEFAULT CURRENT_DATE NOT NULL,
    qualite_projection character varying(50)
);


ALTER TABLE public.seance OWNER TO postgres;

--
-- Name: seance_id_seance_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seance_id_seance_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seance_id_seance_seq OWNER TO postgres;

--
-- Name: seance_id_seance_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seance_id_seance_seq OWNED BY public.seance.id_seance;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: siege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siege (
    id_siege integer NOT NULL,
    numero_siege character varying(10) NOT NULL,
    type_siege character varying(20) DEFAULT 'STANDARD'::character varying,
    position_x integer,
    position_y integer,
    id_salle integer NOT NULL
);


ALTER TABLE public.siege OWNER TO postgres;

--
-- Name: siege_id_siege_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siege_id_siege_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.siege_id_siege_seq OWNER TO postgres;

--
-- Name: siege_id_siege_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siege_id_siege_seq OWNED BY public.siege.id_siege;


--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id_user integer NOT NULL,
    nom_user character varying(100) NOT NULL,
    prenom_user character varying(100) NOT NULL,
    date_creation_compte date DEFAULT CURRENT_DATE,
    username character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    password character varying(255),
    role character varying(20) DEFAULT 'USER'::character varying NOT NULL,
    password_temp boolean DEFAULT false
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- Name: utilisateur_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utilisateur_id_user_seq OWNER TO postgres;

--
-- Name: utilisateur_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_user_seq OWNED BY public.utilisateur.id_user;


--
-- Name: cinema id_cinema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema ALTER COLUMN id_cinema SET DEFAULT nextval('public.cinema_id_cinema_seq'::regclass);


--
-- Name: employe id_employe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe ALTER COLUMN id_employe SET DEFAULT nextval('public.employe_id_employe_seq'::regclass);


--
-- Name: film id_film; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film ALTER COLUMN id_film SET DEFAULT nextval('public.film_id_film_seq'::regclass);


--
-- Name: note id_note; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note ALTER COLUMN id_note SET DEFAULT nextval('public.note_id_note_seq'::regclass);


--
-- Name: reservation id_reservation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id_reservation SET DEFAULT nextval('public.reservation_id_reservation_seq'::regclass);


--
-- Name: salle id_salle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle ALTER COLUMN id_salle SET DEFAULT nextval('public.salle_id_salle_seq'::regclass);


--
-- Name: seance id_seance; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seance ALTER COLUMN id_seance SET DEFAULT nextval('public.seance_id_seance_seq'::regclass);


--
-- Name: siege id_siege; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siege ALTER COLUMN id_siege SET DEFAULT nextval('public.siege_id_siege_seq'::regclass);


--
-- Name: utilisateur id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_user SET DEFAULT nextval('public.utilisateur_id_user_seq'::regclass);


--
-- Name: cinema cinema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema
    ADD CONSTRAINT cinema_pkey PRIMARY KEY (id_cinema);


--
-- Name: employe employe_email_employe_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_email_employe_key UNIQUE (email_employe);


--
-- Name: employe employe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pkey PRIMARY KEY (id_employe);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id_film);


--
-- Name: film film_titre_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_titre_unique UNIQUE (titre);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id_note);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id_reservation);


--
-- Name: reservation_siege reservation_siege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_siege
    ADD CONSTRAINT reservation_siege_pkey PRIMARY KEY (id_reservation, id_siege);


--
-- Name: salle salle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle
    ADD CONSTRAINT salle_pkey PRIMARY KEY (id_salle);


--
-- Name: seance seance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seance
    ADD CONSTRAINT seance_pkey PRIMARY KEY (id_seance);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: siege siege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siege
    ADD CONSTRAINT siege_pkey PRIMARY KEY (id_siege);


--
-- Name: siege uniq_salle_numero; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siege
    ADD CONSTRAINT uniq_salle_numero UNIQUE (id_salle, numero_siege);


--
-- Name: utilisateur utilisateur_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_email_key UNIQUE (email);


--
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_user);


--
-- Name: utilisateur utilisateur_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_username_key UNIQUE (username);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


--
-- Name: idx_res_siege_siege; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_siege_siege ON public.reservation_siege USING btree (id_siege);


--
-- Name: idx_reservation_seance; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reservation_seance ON public.reservation USING btree (id_seance);


--
-- Name: idx_seance_film; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_seance_film ON public.seance USING btree (id_film);


--
-- Name: idx_seance_salle; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_seance_salle ON public.seance USING btree (id_salle);


--
-- Name: idx_siege_salle; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_siege_salle ON public.siege USING btree (id_salle);


--
-- Name: idx_utilisateur_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_utilisateur_role ON public.utilisateur USING btree (role);


--
-- Name: uq_film_titre_ci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_film_titre_ci ON public.film USING btree (lower((titre)::text));


--
-- Name: reservation tr_reservation_notify; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tr_reservation_notify AFTER INSERT OR UPDATE ON public.reservation FOR EACH ROW EXECUTE FUNCTION public.notify_reservation_changed();


--
-- Name: reservation_siege tr_reservation_siege_notify; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tr_reservation_siege_notify AFTER INSERT OR UPDATE ON public.reservation_siege FOR EACH ROW EXECUTE FUNCTION public.notify_reservation_changed();


--
-- Name: employe trg_employe_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_employe_updated BEFORE UPDATE ON public.employe FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: reservation trg_reservation_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_reservation_updated BEFORE UPDATE ON public.reservation FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: note fk_note_employe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT fk_note_employe FOREIGN KEY (valide_par_employe) REFERENCES public.employe(id_employe) ON DELETE SET NULL;


--
-- Name: note note_id_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_id_film_fkey FOREIGN KEY (id_film) REFERENCES public.film(id_film);


--
-- Name: note note_id_seance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_id_seance_fkey FOREIGN KEY (id_seance) REFERENCES public.seance(id_seance) ON DELETE CASCADE;


--
-- Name: note note_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


--
-- Name: reservation reservation_id_seance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_id_seance_fkey FOREIGN KEY (id_seance) REFERENCES public.seance(id_seance);


--
-- Name: reservation reservation_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


--
-- Name: reservation_siege reservation_siege_id_reservation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_siege
    ADD CONSTRAINT reservation_siege_id_reservation_fkey FOREIGN KEY (id_reservation) REFERENCES public.reservation(id_reservation) ON DELETE CASCADE;


--
-- Name: reservation_siege reservation_siege_id_siege_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_siege
    ADD CONSTRAINT reservation_siege_id_siege_fkey FOREIGN KEY (id_siege) REFERENCES public.siege(id_siege) ON DELETE CASCADE;


--
-- Name: salle salle_id_cinema_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle
    ADD CONSTRAINT salle_id_cinema_fkey FOREIGN KEY (id_cinema) REFERENCES public.cinema(id_cinema);


--
-- Name: seance seance_id_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seance
    ADD CONSTRAINT seance_id_film_fkey FOREIGN KEY (id_film) REFERENCES public.film(id_film);


--
-- Name: seance seance_id_salle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seance
    ADD CONSTRAINT seance_id_salle_fkey FOREIGN KEY (id_salle) REFERENCES public.salle(id_salle);


--
-- Name: siege siege_id_salle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siege
    ADD CONSTRAINT siege_id_salle_fkey FOREIGN KEY (id_salle) REFERENCES public.salle(id_salle) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


