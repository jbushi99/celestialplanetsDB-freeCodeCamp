--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    interesting_facts text,
    distance_kpc integer,
    notable_constellation character varying(50)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    interesting_facts text,
    discovery_year integer,
    radius_km numeric(6,2),
    planet_id integer
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
    name character varying(50) NOT NULL,
    has_satellites boolean,
    inhabited boolean,
    exoplanet boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_details; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_details (
    planet_details_id integer NOT NULL,
    number_of_moons integer,
    interesting_facts text,
    planet_id integer NOT NULL,
    mass_e numeric(5,2),
    volume_e numeric(6,2),
    name character varying(50)
);


ALTER TABLE public.planet_details OWNER TO freecodecamp;

--
-- Name: planet_details_planet_details_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_details_planet_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_details_planet_details_id_seq OWNER TO freecodecamp;

--
-- Name: planet_details_planet_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_details_planet_details_id_seq OWNED BY public.planet_details.planet_details_id;


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
    name character varying(50) NOT NULL,
    number_of_planets integer,
    interesting_facts text,
    temperature_k integer,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_details planet_details_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_details ALTER COLUMN planet_details_id SET DEFAULT nextval('public.planet_details_planet_details_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy of our solar system.', 0, 'Sagittarius');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Visible only from the southern hemisphere.', 49, 'Dorado');
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Visible only from the southern hemisphere.', 61, 'Tucana');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Visibility strongly affected even by small amounts of light pollution.', 890, 'Triangulum');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Can be observed with the naked eye.', 4200, 'Centaurus');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest major galaxy to the Milky Way.', 770, 'Andromeda');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of the Earth.', NULL, 1737.50, 2);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Name comes from Greek, meaning fear.', 1877, 11.00, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Name comes from  Greek, meaningdread, terror.', 1877, 6.20, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest natural satellite in the Solar System.', 1610, 2634.10, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Sixth largest moon in the Solar System.', 1610, 1560.80, 4);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Third largest moon in the Solar System.', 1610, 2410.30, 4);
INSERT INTO public.moon VALUES (7, 'Elara', 'By some, called Hera in the past.', 1905, 43.00, 4);
INSERT INTO public.moon VALUES (8, 'Pasiphae', '', 1908, 29.00, 4);
INSERT INTO public.moon VALUES (9, 'Ananke', 'Named after the goddess personifying necessity in ancient Greek religion.', 1951, 14.50, 4);
INSERT INTO public.moon VALUES (10, 'Metis', 'The innnermost known Moon of Jupiter.', 1979, 21.50, 4);
INSERT INTO public.moon VALUES (11, 'Taygete', '', 2000, 2.50, 4);
INSERT INTO public.moon VALUES (12, 'Euanthe', '', 2001, 1.50, 4);
INSERT INTO public.moon VALUES (14, 'Enceladus', 'Sixth largest moon of Saturn.', 1789, 252.10, 5);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Fifth largest moon of Saturn.', 1684, 531.10, 5);
INSERT INTO public.moon VALUES (16, 'Titan', 'Second largest moon in the Solar System.', 1655, 2574.73, 5);
INSERT INTO public.moon VALUES (17, 'Janus', 'Named after the two faced Roman god Janus.', 1966, 89.00, 5);
INSERT INTO public.moon VALUES (18, 'Pandora', '', 1980, 40.00, 5);
INSERT INTO public.moon VALUES (19, 'Calypso', '', 1980, 9.50, 5);
INSERT INTO public.moon VALUES (20, 'Atlas', '', 1980, 19.90, 5);
INSERT INTO public.moon VALUES (21, 'Methone', '', 2004, 1.45, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Earth', true, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Mars', true, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', true, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', true, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Luyten b', NULL, false, true, 9);
INSERT INTO public.planet VALUES (7, 'Luyten c', NULL, false, true, 9);
INSERT INTO public.planet VALUES (8, 'YZ Ceti b', NULL, false, true, 10);
INSERT INTO public.planet VALUES (9, 'YZ Ceti c', NULL, false, true, 10);
INSERT INTO public.planet VALUES (10, 'YZ Ceti d', NULL, false, true, 10);
INSERT INTO public.planet VALUES (11, 'Kepler-90b', NULL, false, true, 11);
INSERT INTO public.planet VALUES (12, 'Kepler-90c', NULL, false, true, 11);


--
-- Data for Name: planet_details; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_details VALUES (4, 146, 'The least dense planet in the solar system', 5, 95.00, 763.62, 'Saturn');
INSERT INTO public.planet_details VALUES (2, 95, 'Largest planet in the solar system.', 4, 318.00, 1321.30, 'Jupiter');
INSERT INTO public.planet_details VALUES (1, 0, 'Nearest planet to the Sun.', 1, 0.06, 0.06, 'Mercury');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 'The closest star to Earth.', 5772, 1);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', NULL, 'Extreme oxygen-rich hypergiant', 3490, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', NULL, 'It is actually a binary system of two stars in close proximity to eachother.', NULL, 2);
INSERT INTO public.star VALUES (7, 'Mirach', NULL, NULL, 3802, 2);
INSERT INTO public.star VALUES (8, 'Betelgeuse', NULL, 'Red supergiant in the constellation of Orion.', 3600, 1);
INSERT INTO public.star VALUES (4, 'UY Scuti', NULL, 'It is thought to be a metal-rich star.', 3550, 1);
INSERT INTO public.star VALUES (9, 'Luyten s Star', 2, 'There are 2 confirmed and 2 non-confirmed planets oribiting this star.', 3382, 1);
INSERT INTO public.star VALUES (10, 'YZ Ceti', 3, 'Although 12 light years from the Sun, it cannot be seen with the naked eye.', 3056, 1);
INSERT INTO public.star VALUES (11, 'Kepler-90', 8, NULL, 6080, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_details_planet_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_details_planet_details_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: planet_details planet_details_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_details
    ADD CONSTRAINT planet_details_name_key UNIQUE (name);


--
-- Name: planet_details planet_details_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_details
    ADD CONSTRAINT planet_details_pkey PRIMARY KEY (planet_details_id);


--
-- Name: planet_details planet_details_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_details
    ADD CONSTRAINT planet_details_planet_id_key UNIQUE (planet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_details planet_details_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_details
    ADD CONSTRAINT planet_details_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

