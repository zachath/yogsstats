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
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    name text NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role text NOT NULL,
    is_detective boolean DEFAULT false NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_by_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_by_teams (
    role text NOT NULL,
    team text NOT NULL
);


ALTER TABLE public.roles_by_teams OWNER TO postgres;

--
-- Name: round_participations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.round_participations (
    id integer NOT NULL,
    player text NOT NULL,
    role text NOT NULL,
    team text NOT NULL,
    died boolean NOT NULL
);


ALTER TABLE public.round_participations OWNER TO postgres;

--
-- Name: rounds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rounds (
    id integer NOT NULL,
    winning_team text NOT NULL,
    video text NOT NULL,
    round_start integer NOT NULL,
    round_end integer NOT NULL,
    jester_killer text
);


ALTER TABLE public.rounds OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team text NOT NULL,
    can_win boolean DEFAULT true NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videos (
    video_id text NOT NULL,
    title text NOT NULL,
    intro_death boolean DEFAULT false NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.videos OWNER TO postgres;

--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (name);


--
-- Name: roles_by_teams roles_by_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_by_teams
    ADD CONSTRAINT roles_by_teams_pkey PRIMARY KEY (role, team);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role);


--
-- Name: round_participations round_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participations
    ADD CONSTRAINT round_participations_pkey PRIMARY KEY (id, player);


--
-- Name: rounds rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (video_id);


--
-- Name: roles_by_teams roles_by_teams_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_by_teams
    ADD CONSTRAINT roles_by_teams_role_fkey FOREIGN KEY (role) REFERENCES public.roles(role);


--
-- Name: roles_by_teams roles_by_teams_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_by_teams
    ADD CONSTRAINT roles_by_teams_team_fkey FOREIGN KEY (team) REFERENCES public.teams(team);


--
-- Name: round_participations round_participations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participations
    ADD CONSTRAINT round_participations_id_fkey FOREIGN KEY (id) REFERENCES public.rounds(id);


--
-- Name: round_participations round_participations_player_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participations
    ADD CONSTRAINT round_participations_player_fkey FOREIGN KEY (player) REFERENCES public.players(name);


--
-- Name: round_participations round_participations_team_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_participations
    ADD CONSTRAINT round_participations_team_role_fk FOREIGN KEY (role, team) REFERENCES public.roles_by_teams(role, team);


--
-- Name: rounds rounds_jester_killer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_jester_killer_fkey FOREIGN KEY (jester_killer) REFERENCES public.players(name);


--
-- Name: rounds rounds_video_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_video_fkey FOREIGN KEY (video) REFERENCES public.videos(video_id);


--
-- Name: rounds rounds_winning_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_winning_team_fkey FOREIGN KEY (winning_team) REFERENCES public.teams(team);


--
-- PostgreSQL database dump complete
--