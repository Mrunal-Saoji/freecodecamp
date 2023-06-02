--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_description text,
    distance_in_billion_km numeric(12,2) NOT NULL,
    color character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: knowlifeform; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.knowlifeform (
    knowlifeform_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_intelligent boolean,
    population integer
);


ALTER TABLE public.knowlifeform OWNER TO freecodecamp;

--
-- Name: knowlifeform_lifeform_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.knowlifeform_lifeform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knowlifeform_lifeform_id_seq OWNER TO freecodecamp;

--
-- Name: knowlifeform_lifeform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.knowlifeform_lifeform_id_seq OWNED BY public.knowlifeform.knowlifeform_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_description text,
    distance_from_planet numeric(12,2) NOT NULL,
    radius integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_description text,
    has_life boolean NOT NULL,
    radius integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_description text,
    radius integer NOT NULL,
    columntemperature_celsius numeric(20,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: knowlifeform knowlifeform_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.knowlifeform ALTER COLUMN knowlifeform_id SET DEFAULT nextval('public.knowlifeform_lifeform_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 'where human lives', 1000000000.00, 'white');
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'closest galxy to milky way', 2000000000.00, 'red');
INSERT INTO public.galaxy VALUES (3, 'cigar galaxy', 'The whole galaxy look like a spoked cartwheel', 124326.23, 'orange');
INSERT INTO public.galaxy VALUES (4, 'black eye galaxy', 'The whole galaxy look like a evil eye', 124326.23, 'black');
INSERT INTO public.galaxy VALUES (5, 'pinwheel galaxy', 'The whole galaxy look like pinwheel', 124326.23, 'yellow');
INSERT INTO public.galaxy VALUES (6, 'cartwheel galaxy', 'The whole galaxy look like cartwheel', 1463.00, 'red');
INSERT INTO public.galaxy VALUES (7, 'whirlpool galaxy', 'The whole galaxy look like whirlpool', 14636363.00, 'white');


--
-- Data for Name: knowlifeform; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'moon of the earth', 384400.00, 1737, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 'moon of the jupitar', 384400.00, 1737, 3);
INSERT INTO public.moon VALUES (3, 'lo', 'moon of the jupitar', 384400.00, 737, 3);
INSERT INTO public.moon VALUES (4, 'callisto', 'moon of the jupitar', 4400.00, 737, 3);
INSERT INTO public.moon VALUES (5, 'ganymede', 'moon of the jupitar', 44410.00, 1237, 3);
INSERT INTO public.moon VALUES (6, 'titan', 'moon of the saturn', 48490.00, 137, 5);
INSERT INTO public.moon VALUES (7, 'dione', 'moon of the saturn', 484110.00, 137, 5);
INSERT INTO public.moon VALUES (8, 'lapetus', 'moon of the saturn', 484110.00, 137, 5);
INSERT INTO public.moon VALUES (9, 'phoebe', 'moon of the saturn', 484110.00, 137, 5);
INSERT INTO public.moon VALUES (10, 'Luna 1', 'moon of the cybertron', 484110.00, 137, 10);
INSERT INTO public.moon VALUES (11, 'Luna 2', 'moon of the cybertron', 484110.00, 137, 10);
INSERT INTO public.moon VALUES (12, 'Wegthor', 'moon of the krypton', 4110.00, 137, 13);
INSERT INTO public.moon VALUES (13, 'Mithen', 'moon of the krypton', 4110.00, 137, 13);
INSERT INTO public.moon VALUES (14, 'eloe 1', 'moon of the mrunal', 4110.00, 137, 13);
INSERT INTO public.moon VALUES (15, 'eloe 2', 'moon of the mrunal', 4110.00, 137, 13);
INSERT INTO public.moon VALUES (16, 'eloe 3', 'moon of the mrunal', 4110.00, 137, 13);
INSERT INTO public.moon VALUES (17, 'eloe 4', 'moon of the mrunal', 4110.00, 137, 13);
INSERT INTO public.moon VALUES (18, 'mayak 1', 'moon of the mrunal', 4110.00, 137, 15);
INSERT INTO public.moon VALUES (19, 'mayak delta 0', 'moon of the mrunal', 4110.00, 137, 15);
INSERT INTO public.moon VALUES (20, 'mayak alpha 0', 'moon of the mrunal', 4110.00, 137, 15);
INSERT INTO public.moon VALUES (21, 'mayak beta 0', 'moon of the mrunal', 4110.00, 137, 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'Only known planet which has life', true, 6371, 1);
INSERT INTO public.planet VALUES (2, 'mars', 'nearest planet to earth', false, 3389, 1);
INSERT INTO public.planet VALUES (3, 'jupiter', 'biggest planet of solar system', false, 20590502, 1);
INSERT INTO public.planet VALUES (5, 'saturn', 'have rings', false, 90502, 1);
INSERT INTO public.planet VALUES (6, 'venus', 'named after god venus', false, 9050, 1);
INSERT INTO public.planet VALUES (7, 'neptune', 'coldest planet', false, 8050, 1);
INSERT INTO public.planet VALUES (8, 'uranus', 'gaseous cyan ice gaint planet', false, 80150, 1);
INSERT INTO public.planet VALUES (9, 'mercury', 'smallest planet', false, 150, 1);
INSERT INTO public.planet VALUES (10, 'cybertron', 'planet of tranformer', true, 15000, 6);
INSERT INTO public.planet VALUES (11, 'solaris', 'mystry planet', true, 172030, 6);
INSERT INTO public.planet VALUES (12, 'ego', 'a living planet', true, 1132830, 6);
INSERT INTO public.planet VALUES (13, 'krypton', 'supermans home planet', true, 12830, 5);
INSERT INTO public.planet VALUES (14, 'vogsphere', NULL, true, 2830, 7);
INSERT INTO public.planet VALUES (15, 'mrunal', NULL, true, 2830, 7);
INSERT INTO public.planet VALUES (16, 'vedant', NULL, false, 2830, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'star of our solar system.', 686340, 5499.00, 1);
INSERT INTO public.star VALUES (3, 'antares', 'star in milky way.', 686340, 5499.00, 1);
INSERT INTO public.star VALUES (4, 'vega', 'star in constellaton of lyra.', 60237, 680.00, 1);
INSERT INTO public.star VALUES (5, 'Nembus', 'Brightest Star in Anromeda', 93529, 20947.01, 2);
INSERT INTO public.star VALUES (6, 'Alpha Andromeda', NULL, 93529, 20947.01, 2);
INSERT INTO public.star VALUES (7, 'Mirach', NULL, 9352, 209847.01, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: knowlifeform_lifeform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.knowlifeform_lifeform_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: knowlifeform knowlifeform_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.knowlifeform
    ADD CONSTRAINT knowlifeform_name_key UNIQUE (name);


--
-- Name: knowlifeform knowlifeform_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.knowlifeform
    ADD CONSTRAINT knowlifeform_pkey PRIMARY KEY (knowlifeform_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

