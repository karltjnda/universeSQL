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
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(100),
    been_explored boolean NOT NULL,
    been_studied boolean NOT NULL,
    age_in_million_of_years numeric
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
-- Name: human; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.human (
    human_id integer NOT NULL,
    name character varying(100),
    gender character varying(10) NOT NULL,
    age integer
);


ALTER TABLE public.human OWNER TO freecodecamp;

--
-- Name: human_human_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.human_human_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_human_id_seq OWNER TO freecodecamp;

--
-- Name: human_human_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.human_human_id_seq OWNED BY public.human.human_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    planet_located character varying(100) NOT NULL,
    been_explored boolean NOT NULL,
    been_studied boolean NOT NULL,
    age_in_million_of_years numeric,
    planet_id integer NOT NULL,
    time_of_one_revolution integer
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
    name character varying(100) NOT NULL,
    description text,
    planet_type character varying(100),
    been_explored boolean NOT NULL,
    been_studied boolean NOT NULL,
    livable boolean,
    age_in_million_of_years numeric,
    star_id integer NOT NULL,
    number_of_moons integer
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
    name character varying(100) NOT NULL,
    description text,
    star_type character varying(100),
    been_studied boolean NOT NULL,
    age_in_million_of_years numeric,
    probe_sent boolean NOT NULL,
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
-- Name: human human_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human ALTER COLUMN human_id SET DEFAULT nextval('public.human_human_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'we are located here', 'spiral galaxy', true, true, 13.61);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'nearest balaxy to date (2003)', 'irregular galaxy', false, true, 8);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'twice the size of milky way', 'spiral galaxy', false, true, 10.01);
INSERT INTO public.galaxy VALUES (4, 'Mesier 81', 'one of the brightest galaxy in the night', 'grand design spiral galaxy', false, true, 13.31);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'long lanes of stars and gas laced with dust', 'grand design spiral galaxy', false, true, 0.4);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 'shines brightly at infrared wavelengths and is remarkable for its star formation activity.', 'starburst galaxy', false, true, 13.3);


--
-- Data for Name: human; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.human VALUES (1, 'Karl', 'M', 22);
INSERT INTO public.human VALUES (2, 'Alex', 'F', 23);
INSERT INTO public.human VALUES (3, 'Prada', 'F', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (5, 'Moon', 'Moon of Earth', 'Earth', true, true, 4.6, 4, NULL);
INSERT INTO public.moon VALUES (6, 'Phobos', 'Larger moon of Mars', 'Mars', true, true, 4.6, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Deimos', 'Moon of Mars', 'Mars', true, true, 4.6, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Jupiter', 'Moon of Earth333', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (9, 'Moon1', 'Moon of Earth1', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Moon2', 'Moon of Earth2', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Moon3', 'Moon of Earth3', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Moon4', 'Moon of Earth4', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Moon5', 'Moon of Earth5', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Moon6', 'Moon of Earth6', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Moon7', 'Moon of Earth7', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Moon8', 'Moon of Earth8', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Moon9', 'Moon of Earth9', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Moon0', 'Moon of Earth0', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Moon11', 'Moon of Earth11', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Moon22', 'Moon of Earth22', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Moon33', 'Moon of Earth33', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (22, 'Moon44', 'Moon of Earth44', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (23, 'Moon55', 'Moon of Earth55', 'Earth', true, true, 4.6, 6, NULL);
INSERT INTO public.moon VALUES (24, 'Moon66', 'Moon of Earth66', 'Earth', true, true, 4.6, 7, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sun', 'Largest Object in the Solar System', 'Star', true, true, false, 4.6, 1, 0);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Extreme greenhouse effect', 'Terrestrial', true, true, false, 4.6, 1, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 'Largest Object in the Solar System', 'Star', true, true, false, 4.6, 1, 0);
INSERT INTO public.planet VALUES (4, 'Earth', 'Home Planet', 'Terrestrial', true, true, true, 4.6, 1, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 'Elon Musk', 'Terrestrial', true, true, false, 4.6, 1, 2);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'largest planet in the solar system', 'Gas Giant', true, true, false, 4.6, 1, 80);
INSERT INTO public.planet VALUES (7, 'Saturn', 'large and distinct ring system', 'Terrestrial', true, true, false, 4.6, 1, 82);
INSERT INTO public.planet VALUES (8, 'Uranus', 'clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side.', 'Terrestrial', true, true, false, 4.6, 1, 0);
INSERT INTO public.planet VALUES (9, 'Neptune', 'The average temperature of Neptune at the top of the clouds is minus 346 degrees Fahrenheit (minus 210 degrees Celsius).', 'Terrestrial', true, true, false, 4.6, 1, 14);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarft Planet', 'Terrestrial', true, true, false, 4.6, 1, 0);
INSERT INTO public.planet VALUES (11, 'Planet X', 'Unknown', 'Unknown', false, false, false, 4.6, 1, 0);
INSERT INTO public.planet VALUES (12, 'Planet Jepoy', 'Meme', 'Terrestrial', false, false, false, 999, 1, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'center of the solar system', 'yellow dwarf', true, 4.6, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'brightest star in the sky', 'binary star', true, 0.2, false, 2);
INSERT INTO public.star VALUES (3, 'Adhara', 'second brightest star in the Canaris Major Dwarf Galaxy', 'binary star', true, 0.22, false, 2);
INSERT INTO public.star VALUES (4, 'Antares', 'brightest star in the constellation Scorpius', 'red star', true, 0.11, false, 1);
INSERT INTO public.star VALUES (5, 'Hypermaximus', 'Another star', 'binary star', true, 0.32, false, 4);
INSERT INTO public.star VALUES (6, 'Maximus 22', 'Another star in the universe', 'red star', true, 44, false, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: human_human_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.human_human_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: human human_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_key UNIQUE (human_id);


--
-- Name: human human_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_pkey PRIMARY KEY (human_id);


--
-- Name: moon moon_desc_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_desc_key UNIQUE (description);


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
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

