--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: keys2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE keys2 (
    id integer DEFAULT 0 NOT NULL,
    machine_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL,
    count integer DEFAULT 0 NOT NULL
);


ALTER TABLE keys2 OWNER TO postgres;

--
-- Name: lapis_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lapis_migrations (
    name character varying(255) NOT NULL
);


ALTER TABLE lapis_migrations OWNER TO postgres;

--
-- Name: keys2 keys2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keys2
    ADD CONSTRAINT keys2_pkey PRIMARY KEY (machine_id, id);


--
-- Name: lapis_migrations lapis_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lapis_migrations
    ADD CONSTRAINT lapis_migrations_pkey PRIMARY KEY (name);


--
-- Name: keys2_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX keys2_time_idx ON keys2 USING btree ("time");


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: lapis_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lapis_migrations (name) FROM stdin;
1
\.


--
-- PostgreSQL database dump complete
--

