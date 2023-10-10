--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-0+deb12u1)

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
-- Name: used_cars; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.used_cars (
    id integer NOT NULL,
    url character varying(256),
    title character varying(256),
    price_usd integer,
    odometer integer,
    username character varying(256),
    phone_number integer,
    image_url character varying(256),
    images_count integer,
    car_number character varying(256),
    car_vin character varying(256),
    datetime_found timestamp without time zone
);


ALTER TABLE public.used_cars OWNER TO "Admin";

--
-- Name: used_cars_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.used_cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.used_cars_id_seq OWNER TO "Admin";

--
-- Name: used_cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.used_cars_id_seq OWNED BY public.used_cars.id;


--
-- Name: used_cars id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.used_cars ALTER COLUMN id SET DEFAULT nextval('public.used_cars_id_seq'::regclass);


--
-- Data for Name: used_cars; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.used_cars (id, url, title, price_usd, odometer, username, phone_number, image_url, images_count, car_number, car_vin, datetime_found) FROM stdin;
\.


--
-- Name: used_cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.used_cars_id_seq', 1, false);


--
-- Name: used_cars used_cars_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.used_cars
    ADD CONSTRAINT used_cars_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

