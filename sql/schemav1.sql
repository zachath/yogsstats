--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    name text NOT NULL
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role text NOT NULL,
    win boolean,
    detective_role boolean DEFAULT false NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: round; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.round (
    id integer DEFAULT 0 NOT NULL,
    date date NOT NULL,
    winning_team text NOT NULL,
    randomat text,
    video text,
    vid_start integer,
    vid_end integer,
    jester_killer text
);


ALTER TABLE public.round OWNER TO postgres;

--
-- Name: round_participation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.round_participation (
    id integer NOT NULL,
    player text NOT NULL,
    role text,
    team text,
    died text DEFAULT 'not_tracked'::text NOT NULL
);


ALTER TABLE public.round_participation OWNER TO postgres;

--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    team text NOT NULL,
    colour text
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: video; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video (
    title text NOT NULL,
    vid text NOT NULL,
    intro_death text DEFAULT 'not_tracked'::text NOT NULL,
    date date
);


ALTER TABLE public.video OWNER TO postgres;

--
-- Name: round PK_Round; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round
    ADD CONSTRAINT "PK_Round" PRIMARY KEY (id);


--
-- Name: round_participation PK_participation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participation
    ADD CONSTRAINT "PK_participation" PRIMARY KEY (id, player);


--
-- Name: player PK_player; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT "PK_player" PRIMARY KEY (name);


--
-- Name: role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (role);


--
-- Name: role URole; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "URole" UNIQUE (role);


--
-- Name: round Unique_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round
    ADD CONSTRAINT "Unique_id" UNIQUE (id);


--
-- Name: team Uteam; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT "Uteam" PRIMARY KEY (team);


--
-- Name: video video_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_info_pkey PRIMARY KEY (vid);


--
-- Name: round_participation FK-id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participation
    ADD CONSTRAINT "FK-id" FOREIGN KEY (id) REFERENCES public.round(id) ON UPDATE CASCADE NOT VALID;


--
-- Name: round_participation FK_player_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participation
    ADD CONSTRAINT "FK_player_name" FOREIGN KEY (player) REFERENCES public.player(name);


--
-- Name: round_participation FK_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participation
    ADD CONSTRAINT "FK_role" FOREIGN KEY (role) REFERENCES public.role(role) NOT VALID;


--
-- Name: round_participation FK_team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participation
    ADD CONSTRAINT "FK_team" FOREIGN KEY (team) REFERENCES public.team(team) NOT VALID;


--
-- Name: round video_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round
    ADD CONSTRAINT "video_FK" FOREIGN KEY (video) REFERENCES public.video(vid) NOT VALID;


--
-- PostgreSQL database dump complete
--

