--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
-- Name: bankomat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bankomat (
    suma integer
);


ALTER TABLE public.bankomat OWNER TO postgres;

--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    name text
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: pokupatel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokupatel (
    suma integer
);


ALTER TABLE public.pokupatel OWNER TO postgres;

--
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    tovar text,
    kol integer
);


ALTER TABLE public.result OWNER TO postgres;

--
-- Name: shope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shope (
    tovar text,
    kol integer
);


ALTER TABLE public.shope OWNER TO postgres;

--
-- Name: toy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.toy (
    name text
);


ALTER TABLE public.toy OWNER TO postgres;

--
-- Data for Name: bankomat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bankomat (suma) FROM stdin;
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (name) FROM stdin;
Avatar
King Kong
Green Mile
Hey, Arnold
\.


--
-- Data for Name: pokupatel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokupatel (suma) FROM stdin;
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result (tovar, kol) FROM stdin;
\.


--
-- Data for Name: shope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shope (tovar, kol) FROM stdin;
\.


--
-- Data for Name: toy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.toy (name) FROM stdin;
\.


--
-- Name: result bigger; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE bigger AS
    ON UPDATE TO public.result
   WHERE (new.kol > old.kol) DO  INSERT INTO public.shope (tovar, kol)
  VALUES (new.tovar, new.kol);


--
-- Name: pokupatel dengi; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE dengi AS
    ON UPDATE TO public.pokupatel
   WHERE (new.suma > 100) DO  INSERT INTO public.bankomat (suma)
  VALUES (new.suma);


--
-- Name: result down; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE down AS
    ON DELETE TO public.result
   WHERE (old.kol < 10) DO  INSERT INTO public.shope (tovar, kol)
  VALUES (old.tovar, old.kol);


--
-- Name: pokupatel mal_suma; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE mal_suma AS
    ON DELETE TO public.pokupatel
   WHERE (old.suma < 100) DO  INSERT INTO public.bankomat (suma)
  VALUES (old.suma);


--
-- PostgreSQL database dump complete
--

