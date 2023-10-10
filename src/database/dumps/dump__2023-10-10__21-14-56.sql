--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
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
1	https://auto.ria.com/uk/auto_bmw_x6_35372777.html	BMW X6 2021	105000	44000	Yura	932448750	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x6__518791314f.webp	133	\N	WBAGT610x09xxxx31	2023-10-10 21:07:15.145525
2	https://auto.ria.com/uk/auto_volkswagen_tiguan_34633467.html	Volkswagen Tiguan 2020	25900	18000	Гена	964509157	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__512280050f.webp	57	AB 0930 KH	3VV3B7AX4LM105896	2023-10-10 21:07:15.948788
3	https://auto.ria.com/uk/auto_volkswagen_tiguan_35177119.html	Volkswagen Tiguan 2021	40900	78000	Сергій Станіславович	673140436	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__513741891f.webp	218	\N	WVGZZZ5NZMW502576	2023-10-10 21:07:16.723668
4	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35327999.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	675464141	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517641919f.webp	46	\N	LFVVB9E66P5005128	2023-10-10 21:07:17.689098
5	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35368445.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kyiv	675464141	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518678382f.webp	59	\N	LFVVB9E65P5008909	2023-10-10 21:07:18.531068
6	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35363913.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kyiv	675464141	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518566213f.webp	45	\N	LFVVB9E66P5007364	2023-10-10 21:07:19.354477
7	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35286470.html	Volkswagen ID.4 Crozz 2023	29000	1000	SKM-1 Kyiv	675464141	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__516510793f.webp	55	\N	LFVVB9E64P5003099	2023-10-10 21:07:20.302795
8	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35250459.html	Volkswagen ID.4 Crozz 2023	29000	1000	SKM-1 Kiev	672594432	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__515581417f.webp	46	\N	LFVVB9E63P5002848	2023-10-10 21:07:21.02748
9	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35286697.html	Volkswagen ID.4 Crozz 2023	31000	1000	SKM-1 Kiev	672594432	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__516516750f.webp	36	\N	LFVVB9E65P5007811	2023-10-10 21:07:22.043639
10	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35347813.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kiev	672594432	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518152001f.webp	50	\N	LFVVB9E65P5016377	2023-10-10 21:07:23.07202
11	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35368410.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Kiev	672594432	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518677518f.webp	49	\N	LFVVB9E6XP5008291	2023-10-10 21:07:23.787826
12	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35299219.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Kyiv	675464141	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__516838394f.webp	59	\N	LFVVB9E6XP5014141	2023-10-10 21:07:24.706242
13	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35304961.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1 Lviv	673219665	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517006296f.webp	49	\N	LFVVB9E67P5016333	2023-10-10 21:07:25.608064
14	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35327782.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1 Lviv	673219665	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517637765f.webp	41	\N	LFVVB9E60P5011510	2023-10-10 21:07:26.875579
15	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35347657.html	Volkswagen ID.4 Crozz 2023	32500	1000	SKM-1 Lviv	673219665	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518147488f.webp	49	\N	LFVVB9E6XP5005424	2023-10-10 21:07:27.768342
16	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35327832.html	Volkswagen ID.4 Crozz 2023	31500	1000	SKM-1	674146650	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__517638453f.webp	47	\N	LFVVB9E69P5001087	2023-10-10 21:07:28.685962
17	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35347542.html	Volkswagen ID.4 Crozz 2023	38900	1000	SKM-1	674146650	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518144858f.webp	56	\N	LFVVB9E68P5016406	2023-10-10 21:07:29.679806
18	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35368382.html	Volkswagen ID.4 Crozz 2023	29000	1000	SKM-1	674146650	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__518676790f.webp	41	\N	LFVVB9E65P5000261	2023-10-10 21:07:30.451903
19	https://auto.ria.com/uk/auto_mazda_cx_5_35370614.html	Mazda CX-5 2019	26400	69000	Сергей Богатый Сергеевич	636460880	https://cdn2.riastatic.com/photosnew/auto/photo/mazda_cx-5__518732997f.webp	25	AA 3582 EK	JMZKF6W7A00849542	2023-10-10 21:07:31.372123
20	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35223811.html	Volkswagen ID.4 Crozz 2023	31500	1000	Elcars	931894046	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__514932927f.webp	22	\N	LFVVB9E68P5084937	2023-10-10 21:07:32.093226
21	https://auto.ria.com/uk/auto_porsche_cayenne_35355440.html	Porsche Cayenne 2012	26900	117000	Богдан Радионов	734706025	https://cdn1.riastatic.com/photosnew/auto/photo/porsche_cayenne__518364281f.webp	41	AA 6699 PT	WP1ZZZ92ZDLA04122	2023-10-10 21:07:33.026269
22	https://auto.ria.com/uk/auto_porsche_cayenne_35358795.html	Porsche Cayenne 2016	29500	139000	\N	733227227	https://cdn0.riastatic.com/photosnew/auto/photo/porsche_cayenne__518473660f.webp	35	AB 7777 XA	WP1AA2A20HKA87913	2023-10-10 21:07:33.813126
23	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_35354283.html	Mercedes-Benz Sprinter 2018	22800	214000	Ref & Bus	676115119	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__518314808f.webp	26	\N	WDB9061332N755120	2023-10-10 21:07:34.631218
24	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_35338252.html	Mercedes-Benz Sprinter 2017	33200	225000	Ref & Bus	676115119	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__517901365f.webp	25	\N	WDB9061531N700203	2023-10-10 21:07:35.37625
25	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_34253323.html	Mercedes-Benz Sprinter 2018	24200	260000	Ref & Bus	676115119	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__503843524f.webp	27	\N	WDB9071332N005970	2023-10-10 21:07:36.184038
26	https://auto.ria.com/uk/auto_volkswagen_id_4_crozz_35044861.html	Volkswagen ID.4 Crozz 2023	30850	1000	АМПЕР АВТО	674659762	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_id-4-crozz__510575097f.webp	14	\N	LFVVB9E68P5001601	2023-10-10 21:07:37.040074
27	https://auto.ria.com/uk/auto_bmw_x5_35370988.html	BMW X5 2023	103800	1000	Nik	678905575	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x5__518738169f.webp	101	\N	WBA11EV0x09xxxx51	2023-10-10 21:07:37.988068
\.


--
-- Name: used_cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.used_cars_id_seq', 27, true);


--
-- Name: used_cars used_cars_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.used_cars
    ADD CONSTRAINT used_cars_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

