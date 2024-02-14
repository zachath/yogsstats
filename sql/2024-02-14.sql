--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
    jester_killer text,
    guessed text,
    vindicator_killer text
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
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (name) FROM stdin;
Lewis
Ben
Duncan
Ravs
Pedguin
Boba
Breeh
Daltos
Rythian
RTGame
Kirsty
Shadow
Lolip
Zoey
Zylus
Osie
Nilesy
Gee
Briony
Mousie
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role, is_detective) FROM stdin;
innocent	f
traitor	f
jester	f
impersonator	f
informant	f
clown	f
hypnotist	f
veteran	f
beggar	f
zombie	f
turncoat	f
mad scientist	f
summoner	f
parasite	f
deputy	f
glitch	f
paramedic	f
elf	f
communist	f
cupid	f
taxidermist	f
boxer	f
drunk	f
loot goblin	f
swapper	f
shadow	f
clowntective	f
queen bee	f
bee	f
mud scientist	f
spy	f
guesser	f
vindicator	f
hive mind	f
detective	t
paladin	t
medium	t
tracker	t
santa	t
marshal	t
randoman	t
lover	f
announcer	t
faker	f
mercenary	f
sponge	f
\.


--
-- Data for Name: roles_by_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_by_teams (role, team) FROM stdin;
innocent	innocents
traitor	traitors
jester	jester
impersonator	traitors
informant	traitors
clown	clown
hypnotist	traitors
veteran	innocents
beggar	none
beggar	traitors
beggar	innocents
zombie	zombies
turncoat	innocents
turncoat	traitors
mad scientist	zombies
summoner	traitors
parasite	traitors
deputy	innocents
glitch	innocents
paramedic	innocents
elf	elves
communist	communists
cupid	lovers
taxidermist	traitors
boxer	none
drunk	none
loot goblin	none
swapper	none
shadow	none
clowntective	clown
queen bee	bees
bee	bees
mud scientist	none
detective	innocents
paladin	innocents
medium	innocents
tracker	innocents
santa	innocents
marshal	innocents
randoman	innocents
lover	lovers
hive mind	hive mind
vindicator	none
vindicator	innocents
guesser	none
spy	traitors
announcer	innocents
faker	none
mercenary	innocents
sponge	sponge
\.


--
-- Data for Name: round_participations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.round_participations (id, player, role, team, died) FROM stdin;
202210250	Ben	paladin	innocents	f
202210250	Duncan	traitor	traitors	f
202210250	Pedguin	turncoat	traitors	f
202210250	Boba	innocent	innocents	f
202210250	Rythian	innocent	innocents	f
202210250	RTGame	summoner	traitors	f
202210251	Lewis	innocent	innocents	f
202210251	Ben	turncoat	innocents	f
202210251	Duncan	innocent	innocents	f
202210251	Pedguin	parasite	traitors	f
202210251	Boba	medium	innocents	f
202210251	Rythian	traitor	traitors	f
202210252	Lewis	innocent	innocents	f
202210252	Ben	turncoat	innocents	f
202210252	Duncan	innocent	innocents	f
202210252	Boba	traitor	traitors	f
202210252	Rythian	randoman	innocents	f
202210253	Lewis	veteran	innocents	f
202210253	Ben	innocent	innocents	f
202210253	Pedguin	traitor	traitors	f
202210253	Boba	innocent	innocents	f
202210253	Rythian	paladin	innocents	f
202210254	Lewis	summoner	traitors	f
202210254	Ben	paladin	innocents	f
202210254	Duncan	glitch	innocents	f
202210254	Pedguin	traitor	traitors	f
202210254	Boba	innocent	innocents	f
202210254	RTGame	innocent	innocents	f
202210290	Lewis	mad scientist	zombies	f
202210290	Ben	innocent	innocents	f
202210290	Duncan	innocent	innocents	f
202210290	Pedguin	traitor	traitors	f
202210290	Breeh	tracker	innocents	f
202210290	Ravs	parasite	traitors	f
202210290	Kirsty	turncoat	traitors	f
202210291	Lewis	innocent	innocents	f
202210291	Duncan	innocent	innocents	f
202210291	Pedguin	traitor	traitors	f
202210291	Rythian	paramedic	innocents	f
202210291	Ravs	tracker	innocents	f
202210291	Kirsty	mad scientist	zombies	f
202210292	Lewis	veteran	innocents	f
202210292	Duncan	traitor	traitors	f
202210292	Pedguin	innocent	innocents	f
202210292	Breeh	mad scientist	zombies	f
202210292	Rythian	tracker	innocents	f
202210292	Kirsty	innocent	innocents	f
202210293	Lewis	summoner	traitors	f
202210293	Ben	medium	innocents	f
202210293	Duncan	traitor	traitors	f
202210293	Pedguin	zombie	zombies	f
202210293	Breeh	innocent	innocents	f
202210293	Rythian	turncoat	innocents	f
202210293	Ravs	mad scientist	zombies	f
202210294	Lewis	traitor	traitors	f
202210294	Ben	zombie	zombies	f
202210294	Duncan	zombie	zombies	f
202210294	Pedguin	innocent	innocents	f
202210294	Breeh	zombie	zombies	f
202210294	Rythian	zombie	zombies	f
202210294	Ravs	mad scientist	zombies	f
202210220	Lewis	mad scientist	zombies	f
202210220	Ben	parasite	traitors	f
202210220	Duncan	deputy	innocents	f
202210250	Lewis	drunk	none	f
202210251	RTGame	beggar	none	f
202210253	Duncan	swapper	none	f
202210220	Ravs	traitor	traitors	f
202210220	Pedguin	innocent	innocents	f
202210294	Kirsty	zombie	zombies	f
202210295	Lewis	veteran	innocents	f
202210295	Pedguin	randoman	innocents	f
202210295	Breeh	parasite	traitors	f
202210295	Rythian	innocent	innocents	f
202210295	Ravs	traitor	traitors	f
202210295	Kirsty	innocent	innocents	f
202211010	Lewis	traitor	traitors	f
202211010	Ben	mad scientist	zombies	f
202211010	Duncan	innocent	innocents	f
202211010	Pedguin	innocent	innocents	f
202211010	Breeh	zombie	zombies	f
202211010	Ravs	glitch	innocents	f
202211010	Daltos	tracker	innocents	f
202211011	Lewis	traitor	traitors	f
202211011	Ben	summoner	traitors	f
202211011	Duncan	randoman	innocents	f
202211011	Boba	innocent	innocents	f
202211011	Ravs	innocent	innocents	f
202211011	Daltos	glitch	innocents	f
202211012	Lewis	beggar	traitors	f
202211012	Ben	mad scientist	zombies	f
202211012	Duncan	veteran	innocents	f
202211012	Pedguin	tracker	innocents	f
202211012	Breeh	summoner	traitors	f
202211012	Boba	traitor	traitors	f
202211012	Ravs	innocent	innocents	f
202211012	Daltos	innocent	innocents	f
202212061	Lewis	zombie	zombies	f
202210252	RTGame	jester	jester	f
202210254	Rythian	jester	jester	f
202210253	RTGame	informant	traitors	f
202210291	Breeh	informant	traitors	f
202210292	Ben	informant	traitors	f
202210252	Pedguin	impersonator	traitors	f
202210295	Duncan	impersonator	traitors	f
202211011	Breeh	impersonator	traitors	f
202211013	Lewis	innocent	innocents	f
202211013	Ben	parasite	traitors	f
202211013	Duncan	turncoat	innocents	f
202211013	Pedguin	randoman	innocents	f
202211013	Breeh	innocent	innocents	f
202211013	Boba	innocent	innocents	f
202211013	Ravs	innocent	innocents	f
202211013	Daltos	traitor	traitors	f
202211014	Lewis	innocent	innocents	f
202211014	Ben	paramedic	innocents	f
202211014	Duncan	innocent	innocents	f
202211014	Pedguin	traitor	traitors	f
202211014	Breeh	randoman	innocents	f
202211014	Boba	innocent	innocents	f
202211014	Ravs	innocent	innocents	f
202211014	Daltos	summoner	traitors	f
202211015	Ben	glitch	innocents	f
202211015	Duncan	tracker	innocents	f
202211015	Pedguin	traitor	traitors	f
202211015	Breeh	traitor	traitors	f
202211015	Boba	innocent	innocents	f
202211015	Ravs	innocent	innocents	f
202211015	Daltos	innocent	innocents	f
202211050	Lewis	turncoat	traitors	f
202211050	Ben	hypnotist	traitors	f
202211050	Pedguin	innocent	innocents	f
202211050	Boba	randoman	innocents	f
202211050	Ravs	traitor	traitors	f
202211050	Daltos	innocent	innocents	f
202211051	Lewis	parasite	traitors	f
202211051	Ben	tracker	innocents	f
202211051	Duncan	glitch	innocents	f
202211051	Pedguin	innocent	innocents	f
202211051	Breeh	innocent	innocents	f
202211051	Ravs	traitor	traitors	f
202211052	Lewis	traitor	traitors	f
202211052	Duncan	innocent	innocents	f
202211052	Pedguin	mad scientist	zombies	f
202211052	Boba	zombie	zombies	f
202211052	Ravs	tracker	innocents	f
202211052	Daltos	innocent	innocents	f
202211053	Ben	innocent	innocents	f
202211053	Pedguin	traitor	traitors	f
202211053	Breeh	deputy	innocents	f
202211053	Boba	summoner	traitors	f
202211053	Ravs	innocent	innocents	f
202211053	Daltos	randoman	innocents	f
202211054	Lewis	glitch	innocents	f
202211054	Ben	randoman	innocents	f
202211054	Pedguin	innocent	innocents	f
202211054	Boba	innocent	innocents	f
202211054	Ravs	mad scientist	zombies	f
202211054	Daltos	traitor	traitors	f
202211055	Lewis	tracker	innocents	f
202211055	Duncan	traitor	traitors	f
202211055	Pedguin	traitor	traitors	f
202211055	Breeh	innocent	innocents	f
202211055	Boba	beggar	innocents	f
202211055	Ravs	turncoat	traitors	f
202211050	Breeh	drunk	none	f
202211051	Daltos	swapper	none	f
202211053	Lewis	drunk	none	f
202211055	Daltos	drunk	none	f
202211080	Lewis	innocent	innocents	f
202211080	Ben	traitor	traitors	f
202211080	Duncan	hypnotist	traitors	f
202211080	Pedguin	veteran	innocents	f
202211080	RTGame	innocent	innocents	f
202211080	Boba	paladin	innocents	f
202211080	Rythian	drunk	none	f
202211081	Lewis	zombie	zombies	f
202211081	Ben	paladin	innocents	f
202211081	Duncan	innocent	innocents	f
202211081	Pedguin	turncoat	traitors	f
202211081	RTGame	innocent	innocents	f
202211081	Boba	traitor	traitors	f
202211081	Rythian	mad scientist	zombies	f
202211082	Duncan	medium	innocents	f
202211082	Pedguin	turncoat	traitors	f
202211082	RTGame	traitor	traitors	f
202211082	Boba	innocent	innocents	f
202211082	Rythian	innocent	innocents	f
202211083	Lewis	traitor	traitors	f
202211083	Ben	hypnotist	traitors	f
202211083	Pedguin	innocent	innocents	f
202211083	RTGame	traitor	traitors	f
202211083	Boba	veteran	innocents	f
202211083	Rythian	randoman	innocents	f
202211084	Lewis	traitor	traitors	f
202211084	Ben	turncoat	innocents	f
202211084	Duncan	innocent	innocents	f
202211084	Pedguin	tracker	innocents	f
202211084	RTGame	zombie	zombies	f
202211084	Boba	mad scientist	zombies	f
202211084	Rythian	summoner	traitors	f
202211085	Lewis	innocent	innocents	f
202211085	Ben	innocent	innocents	f
202211085	Duncan	paladin	innocents	f
202211085	Pedguin	veteran	innocents	f
202211085	RTGame	traitor	traitors	f
202211085	Boba	swapper	none	f
202211085	Rythian	parasite	traitors	f
202211015	Lewis	informant	traitors	f
202211051	Boba	informant	traitors	f
202211083	Duncan	clown	clown	f
202211052	Breeh	impersonator	traitors	f
202211054	Duncan	impersonator	traitors	f
202211055	Ben	impersonator	traitors	f
202211082	Ben	impersonator	traitors	f
202211086	Lewis	innocent	innocents	f
202211086	Duncan	innocent	innocents	f
202211086	Pedguin	swapper	none	f
202211086	RTGame	paladin	innocents	f
202211086	Boba	traitor	traitors	f
202211086	Rythian	deputy	innocents	f
202211120	Ben	veteran	innocents	f
202211120	Duncan	tracker	innocents	f
202211120	Pedguin	innocent	innocents	f
202211120	RTGame	innocent	innocents	f
202211120	Boba	summoner	traitors	f
202211120	Rythian	traitor	traitors	f
202211121	Lewis	deputy	innocents	f
202211121	Ben	tracker	innocents	f
202211121	Duncan	innocent	innocents	f
202211121	Pedguin	innocent	innocents	f
202211121	RTGame	traitor	traitors	f
202211121	Boba	summoner	traitors	f
202211121	Rythian	turncoat	traitors	f
202211122	Lewis	glitch	innocents	f
202211122	Ben	tracker	innocents	f
202211122	Duncan	innocent	innocents	f
202211122	RTGame	traitor	traitors	f
202211122	Boba	innocent	innocents	f
202211122	Rythian	summoner	traitors	f
202211123	Lewis	traitor	traitors	f
202211123	Ben	paramedic	innocents	f
202211123	Duncan	beggar	traitors	f
202211123	Pedguin	innocent	innocents	f
202211123	RTGame	parasite	traitors	f
202211123	Boba	innocent	innocents	f
202211123	Rythian	innocent	innocents	f
202211150	Lewis	innocent	innocents	f
202211150	Ben	zombie	zombies	f
202211150	Duncan	mad scientist	zombies	f
202211150	Pedguin	tracker	innocents	f
202211150	Ravs	traitor	traitors	f
202211150	Breeh	summoner	traitors	f
202211150	Rythian	zombie	zombies	f
202211150	Kirsty	turncoat	innocents	f
202211151	Lewis	mad scientist	zombies	f
202211151	Ben	innocent	innocents	f
202211151	Duncan	traitor	traitors	f
202211151	Pedguin	innocent	innocents	f
202211151	Ravs	paladin	innocents	f
202211151	Breeh	turncoat	innocents	f
202211151	Rythian	parasite	traitors	f
202211152	Lewis	innocent	innocents	f
202211152	Duncan	veteran	innocents	f
202211152	Pedguin	innocent	innocents	f
202211152	Ravs	beggar	none	f
202211152	Breeh	randoman	innocents	f
202211152	Rythian	parasite	traitors	f
202211152	Kirsty	mad scientist	zombies	f
202211153	Lewis	traitor	traitors	f
202211153	Ben	randoman	innocents	f
202211153	Pedguin	innocent	innocents	f
202211153	Ravs	hypnotist	traitors	f
202211153	Breeh	glitch	innocents	f
202211153	Rythian	parasite	traitors	f
202211153	Kirsty	mad scientist	zombies	f
202211154	Lewis	drunk	none	f
202211154	Duncan	innocent	innocents	f
202211154	Pedguin	tracker	innocents	f
202211154	Ravs	veteran	innocents	f
202211154	Breeh	summoner	traitors	f
202211154	Rythian	innocent	innocents	f
202211154	Kirsty	traitor	traitors	f
202211190	Ben	innocent	innocents	f
202211190	Duncan	veteran	innocents	f
202211190	Pedguin	traitor	traitors	f
202211190	Ravs	innocent	innocents	f
202211190	Breeh	mad scientist	zombies	f
202211190	Rythian	randoman	innocents	f
202211191	Ben	traitor	traitors	f
202211191	Duncan	hypnotist	traitors	f
202211191	Pedguin	innocent	innocents	f
202211191	Ravs	traitor	traitors	f
202211191	Breeh	innocent	innocents	f
202211191	Rythian	medium	innocents	f
202211191	Kirsty	turncoat	traitors	f
202211192	Ben	parasite	traitors	f
202211192	Duncan	innocent	innocents	f
202211192	Ravs	veteran	innocents	f
202211192	Breeh	innocent	innocents	f
202211192	Rythian	traitor	traitors	f
202211193	Ben	medium	innocents	f
202211193	Duncan	summoner	traitors	f
202211193	Pedguin	deputy	innocents	f
202211193	Ravs	innocent	innocents	f
202211193	Breeh	innocent	innocents	f
202211193	Rythian	traitor	traitors	f
202211194	Ben	beggar	traitors	f
202211194	Duncan	traitor	traitors	f
202211194	Pedguin	turncoat	traitors	f
202211194	Breeh	innocent	innocents	f
202211194	Rythian	paladin	innocents	f
202211194	Kirsty	innocent	innocents	f
202211195	Ben	traitor	traitors	f
202211195	Duncan	summoner	traitors	f
202211120	Lewis	jester	jester	f
202211151	Kirsty	jester	jester	f
202211086	Ben	informant	traitors	f
202211152	Ben	informant	traitors	f
202211194	Ravs	informant	traitors	f
202211193	Kirsty	clown	clown	f
202211153	Duncan	impersonator	traitors	f
202211190	Kirsty	impersonator	traitors	f
202211192	Pedguin	impersonator	traitors	f
202211195	Pedguin	medium	innocents	f
202211195	Ravs	innocent	innocents	f
202211195	Breeh	innocent	innocents	f
202211195	Rythian	swapper	none	f
202211195	Kirsty	paramedic	innocents	f
202211220	Ben	summoner	traitors	f
202211220	Duncan	randoman	innocents	f
202211220	Shadow	innocent	innocents	f
202211220	Lolip	traitor	traitors	f
202211220	Zoey	turncoat	innocents	f
202211220	Zylus	innocent	innocents	f
202211221	Duncan	traitor	traitors	f
202211221	Shadow	tracker	innocents	f
202211221	Lolip	veteran	innocents	f
202211221	Zoey	innocent	innocents	f
202211221	Lewis	innocent	innocents	f
202211222	Ben	innocent	innocents	f
202211222	Duncan	innocent	innocents	f
202211222	Shadow	beggar	traitors	f
202211222	Lolip	paladin	innocents	f
202211222	Zoey	summoner	traitors	f
202211222	Zylus	traitor	traitors	f
202211222	Lewis	paramedic	innocents	f
202211223	Ben	innocent	innocents	f
202211223	Duncan	traitor	traitors	f
202211223	Lolip	turncoat	traitors	f
202211223	Zylus	paladin	innocents	f
202211223	Lewis	innocent	innocents	f
202211224	Ben	innocent	innocents	f
202211224	Duncan	medium	innocents	f
202211224	Shadow	innocent	innocents	f
202211224	Lolip	innocent	innocents	f
202211224	Zylus	veteran	innocents	f
202211225	Ben	paramedic	innocents	f
202211225	Duncan	randoman	innocents	f
202211225	Shadow	innocent	innocents	f
202211225	Zoey	traitor	traitors	f
202211225	Zylus	hypnotist	traitors	f
202211225	Lewis	innocent	innocents	f
202211250	Duncan	paramedic	innocents	f
202211250	Lolip	randoman	innocents	f
202211250	Zoey	innocent	innocents	f
202211250	Lewis	traitor	traitors	f
202211251	Ben	traitor	traitors	f
202211251	Duncan	paladin	innocents	f
202211251	Shadow	glitch	innocents	f
202211251	Lolip	innocent	innocents	f
202211251	Zoey	innocent	innocents	f
202211251	Lewis	summoner	traitors	f
202211252	Ben	zombie	zombies	f
202211252	Duncan	mad scientist	zombies	f
202211252	Shadow	paladin	innocents	f
202211252	Lolip	innocent	innocents	f
202211252	Zoey	zombie	zombies	f
202211252	Zylus	zombie	zombies	f
202211252	Lewis	paramedic	innocents	f
202211253	Duncan	paladin	innocents	f
202211253	Shadow	innocent	innocents	f
202211253	Lolip	innocent	innocents	f
202211253	Zoey	deputy	innocents	f
202211253	Zylus	summoner	traitors	f
202211253	Lewis	traitor	traitors	f
202211254	Ben	innocent	innocents	f
202211254	Duncan	beggar	traitors	f
202211254	Shadow	innocent	innocents	f
202211254	Lolip	tracker	innocents	f
202211254	Zylus	turncoat	traitors	f
202211254	Lewis	traitor	traitors	f
202211255	Duncan	innocent	innocents	f
202211255	Shadow	innocent	innocents	f
202211255	Lolip	traitor	traitors	f
202211255	Zylus	tracker	innocents	f
202211255	Lewis	glitch	innocents	f
202211256	Ben	traitor	traitors	f
202211256	Duncan	randoman	innocents	f
202211256	Lolip	turncoat	innocents	f
202211256	Zoey	traitor	traitors	f
202211256	Zylus	innocent	innocents	f
202211256	Lewis	innocent	innocents	f
202211257	Ben	parasite	traitors	f
202211257	Duncan	traitor	traitors	f
202211257	Shadow	medium	innocents	f
202211257	Lolip	drunk	none	f
202211257	Zoey	innocent	innocents	f
202211257	Zylus	veteran	innocents	f
202211257	Lewis	innocent	innocents	f
202212010	Ben	innocent	innocents	f
202212010	Duncan	tracker	innocents	f
202212010	Lolip	traitor	traitors	f
202212010	Zoey	parasite	traitors	f
202212010	Zylus	innocent	innocents	f
202212010	Lewis	veteran	innocents	f
202212011	Ben	turncoat	innocents	f
202212011	Duncan	innocent	innocents	f
202212011	Shadow	tracker	innocents	f
202212011	Lolip	traitor	traitors	f
202212011	Zylus	traitor	traitors	f
202211220	Lewis	jester	jester	f
202211250	Ben	jester	jester	f
202211253	Ben	jester	jester	f
202211256	Shadow	jester	jester	f
202211221	Ben	informant	traitors	f
202211223	Shadow	informant	traitors	f
202211224	Zoey	informant	traitors	f
202211225	Lolip	informant	traitors	f
202211251	Zylus	clown	clown	f
202211255	Zoey	clown	clown	f
202212011	Lewis	innocent	innocents	f
202212012	Ben	innocent	innocents	f
202212012	Duncan	traitor	traitors	f
202211250	Zylus	innocent	innocents	f
202212012	Shadow	glitch	innocents	f
202212012	Zoey	beggar	innocents	f
202212012	Zylus	randoman	innocents	f
202212012	Lewis	innocent	innocents	f
202212013	Duncan	innocent	innocents	f
202212013	Shadow	veteran	innocents	f
202212013	Lolip	traitor	traitors	f
202212013	Zoey	paladin	innocents	f
202212013	Zylus	innocent	innocents	f
202212013	Lewis	drunk	none	f
202212014	Ben	beggar	none	f
202212014	Shadow	traitor	traitors	f
202212014	Lolip	veteran	innocents	f
202212014	Zoey	innocent	innocents	f
202212014	Zylus	randoman	innocents	f
202212014	Lewis	traitor	traitors	f
202212030	Ben	innocent	innocents	f
202212030	Duncan	zombie	zombies	f
202212030	Rythian	traitor	traitors	f
202212030	Zoey	mad scientist	zombies	f
202212030	Osie	innocent	innocents	f
202212030	Lewis	zombie	zombies	f
202212031	Ben	innocent	innocents	f
202212031	Ravs	parasite	traitors	f
202212031	Rythian	medium	innocents	f
202212031	Zoey	traitor	traitors	f
202212031	Osie	innocent	innocents	f
202212031	Lewis	turncoat	innocents	f
202212032	Ben	medium	innocents	f
202212032	Duncan	mad scientist	zombies	f
202212032	Rythian	zombie	zombies	f
202212032	Zoey	innocent	innocents	f
202212032	Osie	traitor	traitors	f
202212032	Lewis	innocent	innocents	f
202212033	Ben	beggar	innocents	f
202212033	Duncan	summoner	traitors	f
202212033	Ravs	medium	innocents	f
202212033	Rythian	glitch	innocents	f
202212033	Zoey	traitor	traitors	f
202212033	Osie	innocent	innocents	f
202212033	Lewis	innocent	innocents	f
202210220	Breeh	randoman	innocents	f
202210220	Daltos	innocent	innocents	f
202210221	Ben	traitor	traitors	f
202210221	Duncan	innocent	innocents	f
202210221	Ravs	turncoat	traitors	f
202210221	Pedguin	medium	innocents	f
202210221	Breeh	drunk	none	f
202210221	Daltos	innocent	innocents	f
202210222	Ben	paladin	innocents	f
202210222	Duncan	innocent	innocents	f
202210222	Ravs	innocent	innocents	f
202210222	Pedguin	traitor	traitors	f
202210222	Boba	veteran	innocents	f
202210222	Daltos	parasite	traitors	f
202210223	Lewis	innocent	innocents	f
202210223	Ben	traitor	traitors	f
202210223	Duncan	parasite	traitors	f
202210223	Ravs	mad scientist	zombies	f
202210223	Pedguin	innocent	innocents	f
202210223	Boba	beggar	none	f
202210223	Breeh	turncoat	traitors	f
202210223	Daltos	medium	innocents	f
202210224	Ben	paladin	innocents	f
202210224	Duncan	traitor	traitors	f
202210224	Ravs	traitor	traitors	f
202210224	Pedguin	glitch	innocents	f
202210224	Breeh	innocent	innocents	f
202210224	Daltos	hypnotist	traitors	f
202210225	Lewis	glitch	innocents	f
202210225	Duncan	zombie	zombies	f
202210225	Ravs	zombie	zombies	f
202210225	Pedguin	mad scientist	zombies	f
202210225	Boba	innocent	innocents	f
202210225	Breeh	zombie	zombies	f
202210225	Daltos	zombie	zombies	f
202210226	Lewis	innocent	innocents	f
202210226	Duncan	traitor	traitors	f
202210226	Ravs	paramedic	innocents	f
202210226	Pedguin	randoman	innocents	f
202210226	Boba	innocent	innocents	f
202210226	Daltos	innocent	innocents	f
202212060	Ben	randoman	innocents	f
202212060	Duncan	innocent	innocents	f
202212060	Ravs	traitor	traitors	f
202212060	Rythian	veteran	innocents	f
202212060	Zoey	innocent	innocents	f
202212060	Lewis	mad scientist	zombies	f
202212061	Ben	zombie	zombies	f
202212061	Duncan	zombie	zombies	f
202212061	Ravs	zombie	zombies	f
202212061	Rythian	zombie	zombies	f
202212061	Zoey	innocent	innocents	f
202212061	Osie	zombie	zombies	f
202210221	Boba	jester	jester	f
202212012	Lolip	informant	traitors	f
202212013	Ben	informant	traitors	f
202212030	Ravs	informant	traitors	f
202212032	Ravs	informant	traitors	f
202212031	Duncan	clown	clown	f
202212014	Duncan	impersonator	traitors	f
202212060	Osie	impersonator	traitors	f
202212062	Ben	glitch	innocents	f
202212062	Ravs	innocent	innocents	f
202212062	Rythian	traitor	traitors	f
202212062	Zoey	innocent	innocents	f
202212062	Lewis	paladin	innocents	f
202212063	Ben	randoman	innocents	f
202212063	Duncan	innocent	innocents	f
202212063	Rythian	glitch	innocents	f
202212063	Zoey	innocent	innocents	f
202212063	Lewis	traitor	traitors	f
202212064	Ben	traitor	traitors	f
202212064	Duncan	innocent	innocents	f
202212064	Ravs	traitor	traitors	f
202212064	Rythian	innocent	innocents	f
202212064	Zoey	innocent	innocents	f
202212064	Osie	innocent	innocents	f
202212064	Lewis	innocent	innocents	f
202212065	Ben	innocent	innocents	f
202212065	Duncan	innocent	innocents	f
202212065	Ravs	tracker	innocents	f
202212065	Rythian	beggar	none	f
202212065	Zoey	traitor	traitors	f
202212065	Osie	turncoat	innocents	f
202212100	Ben	traitor	traitors	f
202212100	Duncan	glitch	innocents	f
202212100	Ravs	paladin	innocents	f
202212100	Osie	turncoat	innocents	f
202212100	Lewis	innocent	innocents	f
202212101	Ben	innocent	innocents	f
202212101	Duncan	mad scientist	zombies	f
202212101	Ravs	parasite	traitors	f
202212101	Rythian	innocent	innocents	f
202212101	Zoey	traitor	traitors	f
202212101	Osie	tracker	innocents	f
202212101	Lewis	veteran	innocents	f
202212102	Ben	paladin	innocents	f
202212102	Duncan	innocent	innocents	f
202212102	Ravs	swapper	none	f
202212102	Rythian	traitor	traitors	f
202212102	Zoey	innocent	innocents	f
202212102	Osie	glitch	innocents	f
202212103	Ben	tracker	innocents	f
202212103	Duncan	traitor	traitors	f
202212103	Ravs	innocent	innocents	f
202212103	Rythian	veteran	innocents	f
202212103	Zoey	beggar	innocents	f
202212103	Osie	parasite	traitors	f
202212103	Lewis	innocent	innocents	f
202212104	Ben	traitor	traitors	f
202212104	Duncan	innocent	innocents	f
202212104	Ravs	tracker	innocents	f
202212104	Zoey	beggar	innocents	f
202212104	Osie	parasite	traitors	f
202212104	Lewis	glitch	innocents	f
202212105	Ben	traitor	traitors	f
202212105	Duncan	glitch	innocents	f
202212105	Ravs	randoman	innocents	f
202212105	Rythian	innocent	innocents	f
202212105	Zoey	innocent	innocents	f
202212105	Lewis	glitch	innocents	f
202212106	Ben	innocent	innocents	f
202212106	Duncan	randoman	innocents	f
202212106	Ravs	parasite	traitors	f
202212106	Rythian	beggar	traitors	f
202212106	Zoey	innocent	innocents	f
202212106	Osie	traitor	traitors	f
202212106	Lewis	glitch	innocents	f
202212130	Ben	traitor	traitors	f
202212130	Ravs	paladin	innocents	f
202212130	Rythian	veteran	innocents	f
202212130	Osie	innocent	innocents	f
202212130	Lewis	innocent	innocents	f
202212131	Ben	innocent	innocents	f
202212131	Duncan	innocent	innocents	f
202212131	Ravs	paladin	innocents	f
202212131	Rythian	deputy	innocents	f
202212131	Zoey	swapper	none	f
202212131	Osie	traitor	traitors	f
202212132	Ben	randoman	innocents	f
202212132	Duncan	innocent	innocents	f
202212132	Ravs	swapper	none	f
202212132	Rythian	innocent	innocents	f
202212132	Zoey	summoner	traitors	f
202212132	Osie	turncoat	innocents	f
202212132	Lewis	traitor	traitors	f
202212133	Ben	parasite	traitors	f
202212133	Duncan	innocent	innocents	f
202212133	Ravs	traitor	traitors	f
202212133	Rythian	paramedic	innocents	f
202212133	Zoey	randoman	innocents	f
202212133	Lewis	innocent	innocents	f
202212134	Ben	traitor	traitors	f
202212134	Duncan	innocent	innocents	f
202212134	Ravs	paramedic	innocents	f
202212134	Rythian	randoman	innocents	f
202212134	Zoey	innocent	innocents	f
202212135	Ben	traitor	traitors	f
202212135	Duncan	innocent	innocents	f
202212135	Ravs	innocent	innocents	f
202212062	Duncan	jester	jester	f
202212100	Rythian	jester	jester	f
202212062	Osie	informant	traitors	f
202212065	Lewis	informant	traitors	f
202212100	Zoey	informant	traitors	f
202212102	Lewis	informant	traitors	f
202212104	Rythian	informant	traitors	f
202212063	Osie	impersonator	traitors	f
202212134	Osie	impersonator	traitors	f
202212135	Rythian	glitch	innocents	f
202212135	Zoey	randoman	innocents	f
202212135	Lewis	summoner	traitors	f
202212136	Duncan	tracker	innocents	f
202212136	Rythian	mad scientist	zombies	f
202212136	Zoey	deputy	innocents	f
202212136	Lewis	deputy	innocents	f
202212170	Lewis	innocent	innocents	f
202212170	Ben	summoner	traitors	f
202212170	Duncan	santa	innocents	f
202212170	Osie	drunk	none	f
202212170	Shadow	veteran	innocents	f
202212170	Breeh	innocent	innocents	f
202212170	Lolip	traitor	traitors	f
202212170	Rythian	traitor	traitors	f
202212171	Lewis	zombie	zombies	f
202212171	Ben	innocent	innocents	f
202212171	Duncan	santa	innocents	f
202212171	Osie	traitor	traitors	f
202212171	Shadow	glitch	innocents	f
202212171	Breeh	mad scientist	zombies	f
202212171	Lolip	innocent	innocents	f
202212172	Lewis	parasite	traitors	f
202212172	Ben	traitor	traitors	f
202212172	Duncan	santa	innocents	f
202212172	Rythian	innocent	innocents	f
202212172	Osie	innocent	innocents	f
202212172	Shadow	veteran	innocents	f
202212172	Lolip	glitch	innocents	f
202212173	Lewis	elf	elves	f
202212173	Ben	elf	elves	f
202212173	Duncan	elf	elves	f
202212173	Rythian	elf	elves	f
202212173	Osie	elf	elves	f
202212173	Shadow	elf	elves	f
202212173	Breeh	elf	elves	f
202212173	Lolip	elf	elves	f
202212174	Lewis	elf	elves	f
202212174	Ben	elf	elves	f
202212174	Duncan	elf	elves	f
202212174	Rythian	elf	elves	f
202212174	Osie	detective	innocents	f
202212174	Shadow	traitor	traitors	f
202212174	Breeh	elf	elves	f
202212174	Lolip	elf	elves	f
202212200	Lewis	innocent	innocents	f
202212200	Ben	zombie	zombies	f
202212200	Duncan	zombie	zombies	f
202212200	Rythian	swapper	none	f
202212200	Osie	zombie	zombies	f
202212200	Shadow	zombie	zombies	f
202212200	Breeh	mad scientist	zombies	f
202212200	Lolip	zombie	zombies	f
202212201	Lewis	santa	innocents	f
202212201	Ben	innocent	innocents	f
202212201	Osie	innocent	innocents	f
202212201	Shadow	veteran	innocents	f
202212201	Breeh	traitor	traitors	f
202212201	Lolip	mad scientist	zombies	f
202212202	Lewis	traitor	traitors	f
202212202	Ben	innocent	innocents	f
202212202	Duncan	glitch	innocents	f
202212202	Osie	santa	innocents	f
202212202	Shadow	parasite	traitors	f
202212202	Breeh	innocent	innocents	f
202212202	Lolip	innocent	innocents	f
202212203	Lewis	mad scientist	zombies	f
202212203	Ben	zombie	zombies	f
202212203	Duncan	traitor	traitors	f
202212203	Rythian	zombie	zombies	f
202212203	Osie	zombie	zombies	f
202212203	Shadow	beggar	none	f
202212203	Breeh	innocent	innocents	f
202212203	Lolip	zombie	zombies	f
202212204	Lewis	parasite	traitors	f
202212204	Duncan	innocent	innocents	f
202212204	Rythian	innocent	innocents	f
202212204	Osie	paramedic	innocents	f
202212204	Shadow	traitor	traitors	f
202212204	Breeh	medium	innocents	f
202212204	Lolip	mad scientist	zombies	f
202212240	Ben	innocent	innocents	f
202212240	Rythian	santa	innocents	f
202212240	Osie	innocent	innocents	f
202212240	Shadow	traitor	traitors	f
202212240	Breeh	drunk	none	f
202212240	Lolip	turncoat	traitors	f
202212241	Lewis	randoman	innocents	f
202212241	Ben	innocent	innocents	f
202212241	Duncan	elf	elves	f
202212241	Rythian	elf	elves	f
202212241	Osie	elf	elves	f
202212241	Shadow	traitor	traitors	f
202212241	Breeh	elf	elves	f
202212241	Lolip	elf	elves	f
202212242	Ben	summoner	traitors	f
202212242	Duncan	traitor	traitors	f
202212242	Rythian	innocent	innocents	f
202212242	Osie	elf	elves	f
202212242	Shadow	veteran	innocents	f
202212242	Breeh	detective	innocents	f
202212242	Lolip	innocent	innocents	f
202212243	Lewis	hypnotist	traitors	f
202212243	Ben	paramedic	innocents	f
202212135	Osie	jester	jester	f
202212136	Ravs	jester	jester	f
202212171	Rythian	jester	jester	f
202212136	Ben	informant	traitors	f
202212136	Osie	informant	traitors	f
202212240	Lewis	informant	traitors	f
202212201	Duncan	impersonator	traitors	f
202212243	Duncan	paramedic	innocents	f
202212243	Rythian	traitor	traitors	f
202212243	Osie	paramedic	innocents	f
202212243	Shadow	mad scientist	zombies	f
202212243	Breeh	hypnotist	traitors	f
202212243	Lolip	paramedic	innocents	f
202212244	Lewis	elf	elves	f
202212244	Ben	elf	elves	f
202212244	Duncan	elf	elves	f
202212244	Rythian	elf	elves	f
202212244	Osie	elf	elves	f
202212244	Shadow	elf	elves	f
202212244	Breeh	elf	elves	f
202212244	Lolip	elf	elves	f
202212245	Lewis	innocent	innocents	f
202212245	Ben	turncoat	innocents	f
202212245	Rythian	innocent	innocents	f
202212245	Osie	traitor	traitors	f
202212245	Breeh	innocent	innocents	f
202212245	Lolip	santa	innocents	f
202212246	Lewis	innocent	innocents	f
202212246	Ben	turncoat	innocents	f
202212246	Duncan	paladin	innocents	f
202212246	Rythian	traitor	traitors	f
202212246	Shadow	deputy	innocents	f
202212246	Breeh	innocent	innocents	f
202212246	Lolip	parasite	traitors	f
202212270	Lewis	mad scientist	zombies	f
202212270	Ben	traitor	traitors	f
202212270	Rythian	turncoat	innocents	f
202212270	Boba	zombie	zombies	f
202212270	Kirsty	zombie	zombies	f
202212270	Ravs	zombie	zombies	f
202212271	Lewis	paramedic	innocents	f
202212271	Ben	traitor	traitors	f
202212271	Rythian	paladin	innocents	f
202212271	Boba	innocent	innocents	f
202212271	Kirsty	summoner	traitors	f
202212271	Ravs	mad scientist	zombies	f
202212272	Lewis	innocent	innocents	f
202212272	Ben	paladin	innocents	f
202212272	Rythian	beggar	none	f
202212272	Boba	innocent	innocents	f
202212272	Kirsty	traitor	traitors	f
202212272	Ravs	turncoat	innocents	f
202212273	Lewis	beggar	none	f
202212273	Ben	innocent	innocents	f
202212273	Rythian	summoner	traitors	f
202212273	Boba	turncoat	innocents	f
202212273	Kirsty	innocent	innocents	f
202212273	Ravs	paladin	innocents	f
202212274	Lewis	veteran	innocents	f
202212274	Ben	traitor	traitors	f
202212274	Rythian	traitor	traitors	f
202212274	Kirsty	traitor	traitors	f
202212274	Ravs	randoman	innocents	f
202212275	Lewis	medium	innocents	f
202212275	Ben	innocent	innocents	f
202212275	Rythian	innocent	innocents	f
202212275	Boba	veteran	innocents	f
202212275	Ravs	traitor	traitors	f
202212270	Zylus	zombie	zombies	f
202212271	Zylus	innocent	innocents	f
202212273	Zylus	traitor	traitors	f
202212274	Zylus	traitor	traitors	f
202212310	Lewis	paramedic	innocents	f
202212310	Zylus	innocent	innocents	f
202212310	Rythian	innocent	innocents	f
202212310	Boba	traitor	traitors	f
202212310	Ravs	paladin	innocents	f
202212311	Lewis	beggar	none	f
202212311	Ben	parasite	traitors	f
202212311	Zylus	traitor	traitors	f
202212311	Rythian	innocent	innocents	f
202212311	Boba	randoman	innocents	f
202212311	Kirsty	paramedic	innocents	f
202212311	Ravs	innocent	innocents	f
202212312	Ben	paladin	innocents	f
202212312	Zylus	veteran	innocents	f
202212312	Rythian	innocent	innocents	f
202212312	Kirsty	traitor	traitors	f
202212312	Ravs	innocent	innocents	f
202212313	Lewis	traitor	traitors	f
202212313	Ben	paladin	innocents	f
202212313	Zylus	innocent	innocents	f
202212313	Boba	swapper	none	f
202212313	Kirsty	veteran	innocents	f
202212313	Ravs	innocent	innocents	f
202212314	Lewis	innocent	innocents	f
202212314	Ben	traitor	traitors	f
202212314	Zylus	innocent	innocents	f
202212314	Rythian	paramedic	innocents	f
202212314	Kirsty	innocent	innocents	f
202212314	Ravs	swapper	none	f
202301030	Lewis	turncoat	innocents	f
202301030	Ben	innocent	innocents	f
202301030	Zylus	medium	innocents	f
202301030	Rythian	traitor	traitors	f
202301030	Boba	parasite	traitors	f
202301030	Ravs	innocent	innocents	f
202301031	Lewis	innocent	innocents	f
202301030	Kirsty	traitor	traitors	f
202212245	Shadow	informant	traitors	f
202212274	Boba	informant	traitors	f
202212272	Zylus	informant	traitors	f
202212275	Kirsty	clown	clown	f
202212313	Rythian	impersonator	traitors	f
202212314	Boba	impersonator	traitors	f
202301031	Ben	innocent	innocents	f
202301031	Rythian	tracker	innocents	f
202301031	Boba	traitor	traitors	f
202301031	Ravs	veteran	innocents	f
202301032	Ben	traitor	traitors	f
202301032	Zylus	innocent	innocents	f
202301032	Rythian	innocent	innocents	f
202301032	Boba	paramedic	innocents	f
202301032	Kirsty	drunk	none	f
202301032	Ravs	tracker	innocents	f
202301033	Lewis	parasite	traitors	f
202301033	Ben	medium	innocents	f
202301033	Zylus	innocent	innocents	f
202301033	Boba	traitor	traitors	f
202301033	Kirsty	innocent	innocents	f
202301033	Ravs	turncoat	traitors	f
202301034	Lewis	summoner	traitors	f
202301034	Ben	tracker	innocents	f
202301034	Zylus	innocent	innocents	f
202301034	Rythian	beggar	innocents	f
202301034	Boba	traitor	traitors	f
202301034	Kirsty	innocent	innocents	f
202301034	Ravs	turncoat	traitors	f
202301070	Lewis	randoman	innocents	f
202301070	Ben	innocent	innocents	f
202301070	Zylus	traitor	traitors	f
202301070	Rythian	swapper	none	f
202301070	Kirsty	innocent	innocents	f
202301070	Ravs	turncoat	innocents	f
202301071	Lewis	innocent	innocents	f
202301071	Ben	turncoat	innocents	f
202301071	Zylus	innocent	innocents	f
202301071	Rythian	parasite	traitors	f
202301071	Duncan	traitor	traitors	f
202301071	Kirsty	tracker	innocents	f
202301071	Ravs	swapper	none	f
202301072	Lewis	innocent	innocents	f
202301072	Ben	zombie	zombies	f
202301072	Zylus	zombie	zombies	f
202301072	Rythian	veteran	innocents	f
202301072	Duncan	zombie	zombies	f
202301072	Kirsty	zombie	zombies	f
202301072	Ravs	mad scientist	zombies	f
202301073	Lewis	innocent	innocents	f
202301073	Ben	traitor	traitors	f
202301073	Rythian	paladin	innocents	f
202301073	Duncan	veteran	innocents	f
202301073	Kirsty	innocent	innocents	f
202301074	Lewis	innocent	innocents	f
202301074	Ben	parasite	traitors	f
202301074	Zylus	traitor	traitors	f
202301074	Rythian	randoman	innocents	f
202301074	Duncan	glitch	innocents	f
202301074	Ravs	innocent	innocents	f
202301075	Lewis	hypnotist	traitors	f
202301075	Ben	traitor	traitors	f
202301075	Rythian	innocent	innocents	f
202301075	Duncan	traitor	traitors	f
202301075	Kirsty	innocent	innocents	f
202301075	Ravs	veteran	innocents	f
202301035	Lewis	swapper	none	f
202301035	Zylus	traitor	traitors	f
202301035	Rythian	glitch	innocents	f
202301035	Boba	innocent	innocents	f
202301035	Kirsty	innocent	innocents	f
202301035	Ravs	innocent	innocents	f
202301100	Lewis	medium	innocents	f
202301100	Zylus	traitor	traitors	f
202301101	Lewis	innocent	innocents	f
202301101	Ben	paramedic	innocents	f
202301101	Zylus	traitor	traitors	f
202301101	Rythian	medium	innocents	f
202301101	Kirsty	summoner	traitors	f
202301101	Ravs	innocent	innocents	f
202301102	Lewis	medium	innocents	f
202301102	Ben	innocent	innocents	f
202301102	Zylus	glitch	innocents	f
202301102	Rythian	innocent	innocents	f
202301102	Duncan	traitor	traitors	f
202301102	Ravs	summoner	traitors	f
202301103	Lewis	innocent	innocents	f
202301103	Ben	innocent	innocents	f
202301103	Zylus	traitor	traitors	f
202301103	Rythian	hypnotist	traitors	f
202301103	Duncan	beggar	traitors	f
202301103	Kirsty	traitor	traitors	f
202301103	Ravs	medium	innocents	f
202301104	Lewis	traitor	traitors	f
202301104	Ben	tracker	innocents	f
202301104	Zylus	glitch	innocents	f
202301104	Rythian	innocent	innocents	f
202301104	Ravs	innocent	innocents	f
202301105	Lewis	zombie	zombies	f
202301105	Ben	zombie	zombies	f
202301105	Zylus	mad scientist	zombies	f
202301105	Rythian	zombie	zombies	f
202301031	Kirsty	informant	traitors	f
202301073	Zylus	informant	traitors	f
202301035	Ben	informant	traitors	f
202301104	Duncan	informant	traitors	f
202301031	Zylus	clown	clown	f
202301102	Kirsty	clown	clown	f
202301104	Kirsty	clown	clown	f
202301032	Lewis	impersonator	traitors	f
202301070	Duncan	impersonator	traitors	f
202301105	Duncan	zombie	zombies	f
202301105	Kirsty	paramedic	innocents	f
202301105	Ravs	zombie	zombies	f
202301140	Lewis	mad scientist	zombies	f
202301140	Ben	veteran	innocents	f
202301140	Rythian	summoner	traitors	f
202301140	Duncan	randoman	innocents	f
202301140	Kirsty	innocent	innocents	f
202301140	Ravs	traitor	traitors	f
202301140	Zoey	innocent	innocents	f
202301141	Lewis	beggar	innocents	f
202301141	Ben	traitor	traitors	f
202301141	Osie	drunk	none	f
202301141	Duncan	innocent	innocents	f
202301141	Kirsty	innocent	innocents	f
202301141	Ravs	paladin	innocents	f
202301141	Zoey	glitch	innocents	f
202301142	Lewis	traitor	traitors	f
202301142	Ben	traitor	traitors	f
202301142	Osie	detective	innocents	f
202301142	Rythian	hypnotist	traitors	f
202301142	Duncan	medium	innocents	f
202301142	Kirsty	glitch	innocents	f
202301142	Zoey	innocent	innocents	f
202301143	Lewis	drunk	none	f
202301143	Ben	paladin	innocents	f
202301143	Osie	turncoat	innocents	f
202301143	Rythian	innocent	innocents	f
202301143	Duncan	innocent	innocents	f
202301143	Zoey	traitor	traitors	f
202301170	Ben	innocent	innocents	f
202301170	Osie	innocent	innocents	f
202301170	Rythian	deputy	innocents	f
202301170	Duncan	summoner	traitors	f
202301170	Kirsty	traitor	traitors	f
202301170	Ravs	medium	innocents	f
202301170	Zoey	traitor	traitors	f
202301171	Ben	veteran	innocents	f
202301171	Osie	traitor	traitors	f
202301171	Rythian	innocent	innocents	f
202301171	Kirsty	drunk	none	f
202301171	Ravs	innocent	innocents	f
202301171	Zoey	paladin	innocents	f
202301172	Lewis	traitor	traitors	f
202301172	Ben	innocent	innocents	f
202301172	Osie	tracker	innocents	f
202301172	Rythian	swapper	none	f
202301172	Duncan	innocent	innocents	f
202301172	Kirsty	drunk	none	f
202301172	Ravs	glitch	innocents	f
202301172	Zoey	hypnotist	traitors	f
202301173	Lewis	innocent	innocents	f
202301173	Osie	traitor	traitors	f
202301173	Rythian	paladin	innocents	f
202301173	Duncan	innocent	innocents	f
202301173	Kirsty	glitch	innocents	f
202301173	Ravs	mad scientist	zombies	f
202301174	Lewis	zombie	zombies	f
202301174	Ben	mad scientist	zombies	f
202301174	Osie	traitor	traitors	f
202301174	Rythian	innocent	innocents	f
202301174	Duncan	deputy	innocents	f
202301174	Kirsty	zombie	zombies	f
202301174	Ravs	zombie	zombies	f
202301174	Zoey	zombie	zombies	f
202301210	Ben	parasite	traitors	f
202301210	Osie	hypnotist	traitors	f
202301210	Rythian	innocent	innocents	f
202301210	Duncan	traitor	traitors	f
202301210	Kirsty	turncoat	innocents	f
202301210	Ravs	innocent	innocents	f
202301210	Zoey	medium	innocents	f
202301211	Lewis	beggar	traitors	f
202301211	Ben	traitor	traitors	f
202301211	Osie	innocent	innocents	f
202301211	Rythian	veteran	innocents	f
202301211	Duncan	randoman	innocents	f
202301211	Kirsty	turncoat	traitors	f
202301211	Zoey	innocent	innocents	f
202301212	Lewis	summoner	traitors	f
202301212	Ben	drunk	none	f
202301212	Osie	medium	innocents	f
202301212	Rythian	innocent	innocents	f
202301212	Duncan	innocent	innocents	f
202301212	Kirsty	traitor	traitors	f
202301212	Zoey	turncoat	innocents	f
202301213	Lewis	drunk	none	f
202301213	Osie	innocent	innocents	f
202301213	Rythian	traitor	traitors	f
202301213	Duncan	summoner	traitors	f
202301213	Kirsty	paladin	innocents	f
202301213	Ravs	innocent	innocents	f
202301213	Zoey	turncoat	innocents	f
202301214	Lewis	zombie	zombies	f
202301214	Ben	traitor	traitors	f
202301214	Osie	zombie	zombies	f
202301214	Rythian	zombie	zombies	f
202301214	Duncan	zombie	zombies	f
202301214	Kirsty	zombie	zombies	f
202301214	Ravs	zombie	zombies	f
202301214	Zoey	zombie	zombies	f
202301215	Lewis	innocent	innocents	f
202301142	Ravs	jester	jester	f
202301141	Rythian	informant	traitors	f
202301211	Ravs	informant	traitors	f
202301143	Ravs	clown	clown	f
202301170	Lewis	clown	clown	f
202301173	Zoey	clown	clown	f
202301143	Kirsty	impersonator	traitors	f
202301171	Duncan	impersonator	traitors	f
202301173	Ben	impersonator	traitors	f
202301215	Osie	turncoat	innocents	f
202301215	Rythian	innocent	innocents	f
202301215	Duncan	summoner	traitors	f
202301215	Kirsty	mad scientist	zombies	f
202301215	Ravs	traitor	traitors	f
202301215	Zoey	tracker	innocents	f
202301240	Osie	summoner	traitors	f
202301240	Rythian	traitor	traitors	f
202301240	Duncan	innocent	innocents	f
202301240	Kirsty	paladin	innocents	f
202301240	Ravs	innocent	innocents	f
202301240	Zoey	turncoat	traitors	f
202301241	Lewis	glitch	innocents	f
202301241	Ben	innocent	innocents	f
202301241	Rythian	paladin	innocents	f
202301241	Duncan	summoner	traitors	f
202301241	Kirsty	traitor	traitors	f
202301241	Ravs	innocent	innocents	f
202301241	Zoey	mad scientist	zombies	f
202301242	Lewis	veteran	innocents	f
202301242	Ben	innocent	innocents	f
202301242	Osie	randoman	innocents	f
202301242	Rythian	innocent	innocents	f
202301242	Duncan	parasite	traitors	f
202301242	Kirsty	traitor	traitors	f
202301242	Ravs	swapper	none	f
202301242	Zoey	summoner	traitors	f
202301243	Lewis	parasite	traitors	f
202301243	Ben	drunk	none	f
202301243	Osie	traitor	traitors	f
202301243	Rythian	glitch	innocents	f
202301243	Duncan	paladin	innocents	f
202301243	Ravs	innocent	innocents	f
202301243	Zoey	innocent	innocents	f
202301244	Lewis	innocent	innocents	f
202301244	Ben	innocent	innocents	f
202301244	Osie	innocent	innocents	f
202301244	Rythian	innocent	innocents	f
202301244	Duncan	innocent	innocents	f
202301244	Kirsty	innocent	innocents	f
202301244	Ravs	innocent	innocents	f
202301244	Zoey	innocent	innocents	f
202301280	Lewis	turncoat	innocents	f
202301280	Ben	innocent	innocents	f
202301280	Zylus	innocent	innocents	f
202301280	Rythian	medium	innocents	f
202301280	Boba	parasite	traitors	f
202301280	Ravs	traitor	traitors	f
202301280	Pedguin	drunk	none	f
202301281	Lewis	innocent	innocents	f
202301281	Ben	innocent	innocents	f
202301281	Zylus	innocent	innocents	f
202301281	Rythian	innocent	innocents	f
202301281	Duncan	innocent	innocents	f
202301281	Boba	innocent	innocents	f
202301281	Ravs	innocent	innocents	f
202301281	Pedguin	innocent	innocents	f
202301282	Lewis	veteran	innocents	f
202301282	Ben	hypnotist	traitors	f
202301282	Zylus	beggar	none	f
202301282	Rythian	innocent	innocents	f
202301282	Duncan	traitor	traitors	f
202301282	Boba	mad scientist	zombies	f
202301282	Ravs	innocent	innocents	f
202301282	Pedguin	paladin	innocents	f
202301283	Lewis	innocent	innocents	f
202301283	Ben	summoner	traitors	f
202301283	Zylus	veteran	innocents	f
202301283	Rythian	innocent	innocents	f
202301283	Duncan	traitor	traitors	f
202301283	Boba	swapper	none	f
202301283	Ravs	drunk	none	f
202301283	Pedguin	randoman	innocents	f
202301284	Lewis	glitch	innocents	f
202301284	Ben	traitor	traitors	f
202301284	Zylus	parasite	traitors	f
202301284	Rythian	swapper	none	f
202301284	Duncan	innocent	innocents	f
202301284	Boba	paladin	innocents	f
202301284	Ravs	veteran	innocents	f
202301284	Pedguin	innocent	innocents	f
202301310	Boba	innocent	innocents	f
202301310	Pedguin	paladin	innocents	f
202301311	Rythian	traitor	traitors	f
202301312	Lewis	summoner	traitors	f
202301312	Pedguin	swapper	none	f
202301313	Lewis	innocent	innocents	f
202301313	Ben	medium	innocents	f
202301313	Zylus	paramedic	innocents	f
202301313	Rythian	innocent	innocents	f
202301313	Boba	traitor	traitors	f
202301313	Ravs	innocent	innocents	f
202301241	Osie	jester	jester	f
202301313	Pedguin	informant	traitors	f
202301215	Ben	clown	clown	f
202301240	Ben	clown	clown	f
202301310	Lewis	traitor	traitors	t
202301310	Ben	zombie	zombies	t
202301310	Zylus	summoner	traitors	t
202302040	Rythian	randoman	innocents	f
202302040	Boba	innocent	innocents	f
202302041	Rythian	innocent	innocents	f
202302041	Ravs	veteran	innocents	f
202302042	Zylus	innocent	innocents	f
202302042	Rythian	swapper	none	f
202302043	Lewis	turncoat	innocents	f
202302043	Duncan	innocent	innocents	f
202302043	Boba	innocent	innocents	f
202302043	Ravs	deputy	innocents	f
202302043	Pedguin	paladin	innocents	f
202302044	Rythian	zombie	zombies	f
202302044	Duncan	zombie	zombies	f
202302044	Ravs	zombie	zombies	f
202302044	Pedguin	zombie	zombies	f
202302070	Rythian	innocent	innocents	f
202302070	Kirsty	randoman	innocents	f
202302071	Rythian	tracker	innocents	f
202302072	Rythian	traitor	traitors	f
202302073	Lewis	traitor	traitors	f
202302074	Lewis	turncoat	traitors	f
202302074	Ben	summoner	traitors	f
202302075	Zylus	traitor	traitors	f
202302110	Lewis	paladin	innocents	f
202302111	Duncan	innocent	innocents	f
202302112	Ben	innocent	innocents	f
202302112	Rythian	glitch	innocents	f
202302113	Ben	summoner	traitors	f
202302114	Duncan	innocent	innocents	f
202302140	Ben	summoner	traitors	f
202302040	Ravs	jester	jester	f
202302112	Kirsty	jester	jester	f
202302045	Ben	clown	clown	f
202302075	Rythian	impersonator	traitors	f
202302040	Ben	hypnotist	traitors	t
202302040	Zylus	traitor	traitors	t
202302040	Duncan	traitor	traitors	t
202302040	Pedguin	drunk	none	t
202302144	Lewis	zombie	zombies	f
202302144	Zylus	zombie	zombies	f
202302144	Rythian	zombie	zombies	f
202302180	Kirsty	turncoat	innocents	f
202302180	Ravs	tracker	innocents	f
202302181	Lewis	swapper	none	f
202302181	Zylus	traitor	traitors	f
202302182	Zylus	traitor	traitors	f
202302210	Lewis	mad scientist	zombies	f
202302210	Ravs	zombie	zombies	f
202302212	Lewis	beggar	innocents	f
202302213	Zylus	traitor	traitors	f
202302250	Lewis	innocent	innocents	f
202302250	Ben	glitch	innocents	f
202302250	Pedguin	paladin	innocents	f
202302250	Duncan	innocent	innocents	f
202302251	Lewis	swapper	none	f
202302251	Ben	zombie	zombies	f
202302251	Zylus	zombie	zombies	f
202302251	Pedguin	mad scientist	zombies	f
202302251	Duncan	zombie	zombies	f
202302251	Kirsty	zombie	zombies	f
202302251	Ravs	zombie	zombies	f
202302253	Ben	turncoat	innocents	f
202302253	Pedguin	zombie	zombies	f
202302253	Duncan	traitor	traitors	f
202302253	Kirsty	hypnotist	traitors	f
202302253	Osie	traitor	traitors	f
202302253	Ravs	mad scientist	zombies	f
202302254	Pedguin	veteran	innocents	f
202302254	Duncan	zombie	zombies	f
202302254	Kirsty	mad scientist	zombies	f
202302254	Osie	zombie	zombies	f
202302254	Ravs	zombie	zombies	f
202302280	Ben	traitor	traitors	f
202302250	Kirsty	jester	jester	f
202302252	Duncan	jester	jester	f
202302142	Kirsty	informant	traitors	f
202302143	Duncan	informant	traitors	f
202302182	Duncan	informant	traitors	f
202302141	Ben	clown	clown	f
202302254	Zylus	clown	clown	f
202302141	Lewis	paramedic	innocents	t
202302141	Zylus	traitor	traitors	t
202302141	Rythian	innocent	innocents	t
202302141	Duncan	medium	innocents	t
202302283	Lewis	paramedic	innocents	f
202302283	Ben	innocent	innocents	f
202303040	Ben	turncoat	innocents	f
202303040	Zylus	swapper	none	f
202303040	Rythian	innocent	innocents	f
202303041	Shadow	medium	innocents	f
202303041	Kirsty	innocent	innocents	f
202303041	Ravs	veteran	innocents	f
202303042	Lewis	innocent	innocents	f
202303042	Rythian	veteran	innocents	f
202303042	Ravs	tracker	innocents	f
202303043	Lewis	randoman	innocents	f
202303043	Duncan	innocent	innocents	f
202303043	Kirsty	innocent	innocents	f
202303043	Rythian	swapper	none	f
202303070	Ben	innocent	innocents	f
202303070	Zylus	swapper	none	f
202303070	Kirsty	beggar	none	f
202303070	Ravs	paramedic	innocents	f
202303071	Zylus	parasite	traitors	f
202303072	Zylus	swapper	none	f
202303072	Kirsty	medium	innocents	f
202303072	Rythian	innocent	innocents	f
202303073	Duncan	swapper	none	f
202303073	Kirsty	traitor	traitors	f
202303073	Ravs	summoner	traitors	f
202303110	Shadow	veteran	innocents	f
202303111	Ben	innocent	innocents	f
202303111	Zylus	innocent	innocents	f
202303111	Kirsty	parasite	traitors	f
202303112	Ben	turncoat	traitors	f
202303112	Zylus	parasite	traitors	f
202303112	Rythian	traitor	traitors	f
202303112	Ravs	beggar	traitors	f
202303113	Kirsty	swapper	none	f
202303040	Lewis	jester	jester	f
202303073	Rythian	jester	jester	f
202302281	Duncan	informant	traitors	f
202302282	Pedguin	clown	clown	f
202303074	Zylus	clown	clown	f
202303113	Lewis	clown	clown	f
202302280	Osie	paladin	innocents	t
202302280	Ravs	innocent	innocents	t
202302281	Ben	paramedic	innocents	t
202302281	Zylus	deputy	innocents	t
202302281	Pedguin	innocent	innocents	t
202302281	Kirsty	traitor	traitors	t
202302281	Osie	innocent	innocents	t
202303114	Duncan	zombie	zombies	f
202303114	Kirsty	zombie	zombies	f
202303114	Rythian	zombie	zombies	f
202303114	Ravs	zombie	zombies	f
202303115	Lewis	traitor	traitors	f
202303140	Lewis	traitor	traitors	f
202303140	Shadow	swapper	none	f
202303141	Rythian	traitor	traitors	f
202303142	Rythian	parasite	traitors	f
202303143	Duncan	traitor	traitors	f
202303144	Shadow	innocent	innocents	f
202303144	Rythian	paladin	innocents	f
202303145	Lewis	beggar	traitors	f
202303145	Ben	innocent	innocents	f
202303145	Duncan	innocent	innocents	f
202303145	Kirsty	tracker	innocents	f
202303145	Ravs	traitor	traitors	f
202303180	Zoey	innocent	innocents	f
202303180	Rythian	veteran	innocents	f
202303180	Ravs	swapper	none	f
202303181	Lolip	summoner	traitors	f
202303182	Osie	parasite	traitors	f
202303182	Ravs	innocent	innocents	f
202303183	Ravs	tracker	innocents	f
202303184	Lolip	veteran	innocents	f
202303184	Zoey	innocent	innocents	f
202303184	Duncan	paladin	innocents	f
202303184	Kirsty	traitor	traitors	f
202303185	Zoey	veteran	innocents	f
202303186	Lolip	innocent	innocents	f
202303186	Osie	glitch	innocents	f
202303186	Ravs	medium	innocents	f
202303210	Lolip	zombie	zombies	f
202303210	Zoey	zombie	zombies	f
202303210	Osie	mad scientist	zombies	f
202303210	Rythian	zombie	zombies	f
202303211	Zoey	parasite	traitors	f
202303211	Osie	innocent	innocents	f
202303211	Duncan	traitor	traitors	f
202303211	Kirsty	tracker	innocents	f
202303211	Ravs	veteran	innocents	f
202303212	Lewis	innocent	innocents	f
202303212	Lolip	glitch	innocents	f
202303140	Kirsty	jester	jester	f
202303142	Kirsty	jester	jester	f
202303140	Rythian	informant	traitors	f
202303114	Lewis	zombie	zombies	t
202303114	Ben	zombie	zombies	t
202303114	Zylus	innocent	innocents	t
202303114	Shadow	mad scientist	zombies	t
202303115	Ben	summoner	traitors	t
202303212	Duncan	medium	innocents	f
202303212	Kirsty	innocent	innocents	f
202303212	Rythian	swapper	none	f
202303214	Osie	traitor	traitors	f
202303211	Lewis	cupid	lovers	f
202302140	Kirsty	traitor	traitors	f
202303250	Kirsty	cupid	lovers	f
202303250	Ravs	parasite	traitors	f
202303251	Lewis	beggar	none	f
202303251	Lolip	innocent	innocents	f
202303251	Kirsty	paramedic	innocents	f
202303252	Zoey	traitor	traitors	f
202303252	Rythian	summoner	traitors	f
202303253	Lewis	innocent	innocents	f
202303253	Zoey	glitch	innocents	f
202303253	Duncan	swapper	none	f
202303253	Rythian	traitor	traitors	f
202303253	Ravs	innocent	innocents	f
202303254	Lewis	cupid	lovers	f
202303254	Lolip	swapper	none	f
202303254	Ravs	traitor	traitors	f
202303280	Duncan	summoner	traitors	f
202303280	Ravs	traitor	traitors	f
202303281	Ben	traitor	traitors	f
202303281	Ravs	parasite	traitors	f
202303282	Lewis	cupid	lovers	f
202303282	Ravs	parasite	traitors	f
202303283	Kirsty	summoner	traitors	f
202303283	Rythian	glitch	innocents	f
202304010	Rythian	glitch	innocents	f
202304011	Zylus	cupid	lovers	f
202304012	Lewis	innocent	innocents	f
202304012	Kirsty	hypnotist	traitors	f
202304012	Rythian	traitor	traitors	f
202304012	Ravs	veteran	innocents	f
202304013	Ben	innocent	innocents	f
202304013	Kirsty	paladin	innocents	f
202304013	Rythian	innocent	innocents	f
202304013	Ravs	innocent	innocents	f
202304014	Lewis	paramedic	innocents	f
202304014	Ben	innocent	innocents	f
202304014	Kirsty	swapper	none	f
202304015	Lewis	traitor	traitors	f
202303213	Ravs	jester	jester	f
202303213	Lolip	informant	traitors	f
202303254	Kirsty	informant	traitors	f
202303253	Lolip	impersonator	traitors	f
202304011	Duncan	lover	lovers	f
202304011	Ravs	lover	lovers	f
202303212	Osie	summoner	traitors	t
202303212	Ravs	mad scientist	zombies	t
202303213	Lewis	paladin	innocents	t
202303213	Zoey	innocent	innocents	t
202304040	Duncan	innocent	innocents	f
202304040	Rythian	randoman	innocents	f
202304041	Duncan	medium	innocents	f
202304042	Duncan	innocent	innocents	f
202304042	Kirsty	innocent	innocents	f
202304042	Rythian	paladin	innocents	f
202304043	Ben	traitor	traitors	f
202304044	Ben	innocent	innocents	f
202304044	Zylus	paladin	innocents	f
202304045	Lewis	summoner	traitors	f
202304045	Ben	traitor	traitors	f
202304045	Kirsty	medium	innocents	f
202304045	Rythian	innocent	innocents	f
202304045	Ravs	innocent	innocents	f
202304045	Zylus	glitch	innocents	f
202304080	Ravs	beggar	traitors	f
202304081	Zylus	innocent	innocents	f
202304081	Zoey	innocent	innocents	f
202304082	Ben	mad scientist	zombies	f
202304082	Duncan	zombie	zombies	f
202304082	Rythian	zombie	zombies	f
202304083	Duncan	traitor	traitors	f
202304083	Rythian	glitch	innocents	f
202304083	Zylus	innocent	innocents	f
202304083	Zoey	mad scientist	zombies	f
202304084	Lewis	innocent	innocents	f
202304084	Ben	innocent	innocents	f
202304084	Duncan	innocent	innocents	f
202304084	Rythian	paladin	innocents	f
202304084	Ravs	innocent	innocents	f
202304084	Zoey	veteran	innocents	f
202304110	Duncan	veteran	innocents	f
202304110	Shadow	swapper	none	f
202304112	Lewis	randoman	innocents	f
202304113	Ben	innocent	innocents	f
202304113	Duncan	innocent	innocents	f
202304113	Shadow	zombie	zombies	f
202304113	Rythian	zombie	zombies	f
202304113	Zylus	zombie	zombies	f
202304150	Lewis	innocent	innocents	f
202304150	Duncan	tracker	innocents	f
202304150	Shadow	innocent	innocents	f
202304150	Zoey	veteran	innocents	f
202304151	Ravs	deputy	innocents	f
202304080	Duncan	jester	jester	f
202304083	Shadow	informant	traitors	f
202304111	Ravs	clown	clown	f
202304040	Ravs	impersonator	traitors	f
202304015	Ravs	marshal	innocents	t
202304015	Zylus	summoner	traitors	t
202304040	Lewis	traitor	traitors	t
202304040	Kirsty	veteran	innocents	t
202304040	Zylus	innocent	innocents	t
202304152	Ben	innocent	innocents	f
202304153	Zoey	summoner	traitors	f
202304154	Rythian	traitor	traitors	f
202304180	Pedguin	hypnotist	traitors	f
202304180	Kirsty	traitor	traitors	f
202304181	Pedguin	hypnotist	traitors	f
202304181	Zylus	traitor	traitors	f
202304182	Ben	innocent	innocents	f
202304182	Boba	randoman	innocents	f
202304182	Pedguin	innocent	innocents	f
202304182	Kirsty	glitch	innocents	f
202304183	Lewis	innocent	innocents	f
202304183	Rythian	innocent	innocents	f
202304184	Pedguin	parasite	traitors	f
202304185	Pedguin	traitor	traitors	f
202304220	Pedguin	medium	innocents	f
202304220	Rythian	glitch	innocents	f
202304221	Boba	traitor	traitors	f
202304222	Lewis	paladin	innocents	f
202304222	Boba	innocent	innocents	f
202304223	Lewis	zombie	zombies	f
202304223	Pedguin	zombie	zombies	f
202304223	Rythian	mad scientist	zombies	f
202304223	Kirsty	zombie	zombies	f
202304223	Zylus	zombie	zombies	f
202304224	Lewis	paladin	innocents	f
202304224	Boba	innocent	innocents	f
202304224	Kirsty	paramedic	innocents	f
202304225	Ben	traitor	traitors	f
202304226	Zylus	traitor	traitors	f
202304227	Ben	innocent	innocents	f
202304227	Rythian	innocent	innocents	f
202304250	Lewis	beggar	none	f
202304250	Pedguin	marshal	innocents	f
202304250	Zylus	innocent	innocents	f
202304224	Rythian	jester	jester	f
202304152	Lewis	tracker	innocents	t
202304152	Duncan	drunk	none	t
202304152	Shadow	traitor	traitors	t
202304152	Rythian	glitch	innocents	t
202304250	Kirsty	innocent	innocents	f
202304250	Boba	glitch	innocents	f
202304251	Lewis	deputy	innocents	f
202304251	Ben	drunk	none	f
202304251	Pedguin	innocent	innocents	f
202304251	Rythian	innocent	innocents	f
202304251	Zylus	parasite	traitors	f
202304251	Boba	medium	innocents	f
202304252	Ben	veteran	innocents	f
202304252	Boba	innocent	innocents	f
202304253	Lewis	paladin	innocents	f
202304253	Pedguin	innocent	innocents	f
202304253	Kirsty	glitch	innocents	f
202304253	Boba	innocent	innocents	f
202304254	Pedguin	paladin	innocents	f
202304255	Lewis	innocent	innocents	f
202304255	Ben	marshal	innocents	f
202304255	Pedguin	glitch	innocents	f
202304255	Rythian	innocent	innocents	f
202304255	Kirsty	parasite	traitors	f
202304255	Boba	traitor	traitors	f
202304256	Lewis	innocent	innocents	f
202304256	Zylus	deputy	innocents	f
202304256	Kirsty	innocent	innocents	f
202304256	Boba	paladin	innocents	f
202304257	Pedguin	traitor	traitors	f
202304257	Zylus	innocent	innocents	f
202304257	Kirsty	randoman	innocents	f
202304257	Boba	innocent	innocents	f
202304258	Ben	innocent	innocents	f
202304258	Rythian	innocent	innocents	f
202304258	Boba	paladin	innocents	f
202304290	Lewis	traitor	traitors	f
202304291	Zylus	traitor	traitors	f
202304292	Ravs	traitor	traitors	f
202304292	Zylus	beggar	traitors	f
202305020	Kirsty	beggar	none	f
202305020	Zoey	innocent	innocents	f
202305021	Ravs	traitor	traitors	f
202305021	Rythian	beggar	traitors	f
202305022	Ben	zombie	zombies	f
202305022	Ravs	zombie	zombies	f
202305022	Zylus	zombie	zombies	f
202305022	Kirsty	zombie	zombies	f
202305023	Lewis	innocent	innocents	f
202305023	Duncan	glitch	innocents	f
202305023	Ravs	glitch	innocents	f
202305023	Kirsty	paladin	innocents	f
202305023	Zoey	paladin	innocents	f
202305024	Duncan	swapper	none	f
202305024	Ravs	summoner	traitors	f
202305060	Ravs	tracker	innocents	f
202305060	Zylus	beggar	innocents	f
202304253	Rythian	jester	jester	f
202304290	Duncan	informant	traitors	f
202304292	Ben	informant	traitors	f
202304258	Kirsty	impersonator	traitors	f
202304251	Kirsty	traitor	traitors	t
202304252	Lewis	traitor	traitors	t
202304252	Pedguin	summoner	traitors	t
202304252	Rythian	paladin	innocents	t
202304252	Zylus	innocent	innocents	t
202304252	Kirsty	traitor	traitors	t
202305061	Zylus	tracker	innocents	f
202305061	Boba	traitor	traitors	f
202305062	Lewis	innocent	innocents	f
202305062	Boba	swapper	none	f
202305064	Lewis	deputy	innocents	f
202305064	Duncan	medium	innocents	f
202305064	Zylus	innocent	innocents	f
202305065	Duncan	tracker	innocents	f
202305065	Ravs	innocent	innocents	f
202305090	Lewis	paramedic	innocents	f
202305090	Ravs	beggar	none	f
202305090	Zylus	innocent	innocents	f
202305090	Boba	randoman	innocents	f
202305091	Lewis	innocent	innocents	f
202305091	Pedguin	veteran	innocents	f
202305091	Boba	innocent	innocents	f
202305092	Ravs	mad scientist	zombies	f
202305092	Zylus	zombie	zombies	f
202305092	Kirsty	zombie	zombies	f
202305093	Lewis	marshal	innocents	f
202305093	Ravs	innocent	innocents	f
202305093	Zylus	deputy	innocents	f
202305093	Boba	innocent	innocents	f
202305094	Zylus	parasite	traitors	f
202305130	Duncan	medium	innocents	f
202305130	Ravs	innocent	innocents	f
202305130	Kirsty	innocent	innocents	f
202305131	Ben	innocent	innocents	f
202305131	Ravs	glitch	innocents	f
202305131	Pedguin	medium	innocents	f
202305131	Boba	beggar	none	f
202305132	Lewis	traitor	traitors	f
202305133	Lewis	glitch	innocents	f
202305133	Ben	innocent	innocents	f
202305133	Pedguin	swapper	none	f
202305133	Zylus	paladin	innocents	f
202305134	Pedguin	innocent	innocents	f
202305063	Kirsty	informant	traitors	f
202305061	Kirsty	shadow	none	f
202305093	Duncan	shadow	none	f
202305095	Boba	clown	clown	f
202305090	Duncan	impersonator	traitors	f
202305061	Duncan	innocent	innocents	t
202305061	Ravs	glitch	innocents	t
202305061	Pedguin	innocent	innocents	t
202305062	Duncan	parasite	traitors	t
202305062	Ravs	innocent	innocents	t
202305062	Pedguin	traitor	traitors	t
202305062	Zylus	paladin	innocents	t
202305160	Rythian	tracker	innocents	f
202305161	Lewis	swapper	none	f
202305161	Kirsty	tracker	innocents	f
202305162	Zylus	medium	innocents	f
202305162	Zoey	innocent	innocents	f
202305162	Nilesy	veteran	innocents	f
202305200	Duncan	medium	innocents	f
202305201	Zylus	randoman	innocents	f
202305201	Zoey	veteran	innocents	f
202305202	Kirsty	traitor	traitors	f
202305203	Zoey	traitor	traitors	f
202305204	Kirsty	traitor	traitors	f
202305204	Zoey	beggar	traitors	f
202305205	Lewis	innocent	innocents	f
202210180	Lewis	glitch	innocents	f
202210180	Boba	swapper	none	f
202210180	Ravs	innocent	innocents	f
202210180	Kirsty	innocent	innocents	f
202210181	Pedguin	randoman	innocents	f
202210181	Ravs	glitch	innocents	f
202210182	Pedguin	traitor	traitors	f
202210183	Lewis	paladin	innocents	f
202210183	Boba	swapper	none	f
202210184	Gee	queen bee	bees	f
202210150	Ben	traitor	traitors	f
202210150	Ravs	innocent	innocents	f
202210150	Zoey	glitch	innocents	f
202210150	Kirsty	innocent	innocents	f
202210151	Zoey	traitor	traitors	f
202210152	Ravs	innocent	innocents	f
202210151	Kirsty	jester	jester	f
202305202	Lewis	impersonator	traitors	f
202305160	Kirsty	paramedic	innocents	t
202305160	Zoey	innocent	innocents	t
202305160	Nilesy	innocent	innocents	t
202305161	Ben	innocent	innocents	t
202305161	Duncan	deputy	innocents	t
202305163	Ben	parasite	traitors	t
202210152	Kirsty	medium	innocents	f
202210153	Ben	tracker	innocents	f
202210153	Duncan	innocent	innocents	f
202210154	Duncan	glitch	innocents	f
202210154	Rythian	swapper	none	f
202210154	Zylus	tracker	innocents	f
202210154	Zoey	innocent	innocents	f
202210155	Duncan	turncoat	innocents	f
202210155	Ravs	traitor	traitors	f
202210155	Rythian	paladin	innocents	f
202210155	Zylus	innocent	innocents	f
202210156	Duncan	traitor	traitors	f
202305230	Duncan	paramedic	innocents	f
202305230	Pedguin	paladin	innocents	f
202305230	Rythian	traitor	traitors	f
202305230	Nilesy	innocent	innocents	f
202305231	Pedguin	innocent	innocents	f
202305231	Rythian	innocent	innocents	f
202305232	Lewis	innocent	innocents	f
202305233	Duncan	hypnotist	traitors	f
202305234	Duncan	innocent	innocents	f
202305234	Pedguin	beggar	none	f
202305234	Nilesy	veteran	innocents	f
202305235	Pedguin	paladin	innocents	f
202305235	Rythian	innocent	innocents	f
202305235	Boba	glitch	innocents	f
202305270	Duncan	innocent	innocents	f
202305271	Duncan	beggar	traitors	f
202305271	Boba	traitor	traitors	f
202305273	Lewis	traitor	traitors	f
202305274	Duncan	summoner	traitors	f
202305275	Pedguin	innocent	innocents	f
202305275	Rythian	veteran	innocents	f
202305276	Ben	medium	innocents	f
202305276	Nilesy	innocent	innocents	f
202210156	Ben	informant	traitors	f
202210155	Ben	impersonator	traitors	f
202305230	Lewis	impersonator	traitors	f
202305272	Rythian	impersonator	traitors	f
202210152	Zylus	summoner	traitors	t
202210152	Zoey	paramedic	innocents	t
202210153	Ravs	traitor	traitors	t
202210153	Rythian	paramedic	innocents	t
202210153	Zylus	beggar	none	t
202210153	Zoey	innocent	innocents	t
202305301	Zoey	veteran	innocents	f
202305302	Ravs	traitor	traitors	f
202305303	Kirsty	glitch	innocents	f
202305304	Lewis	traitor	traitors	f
202305304	Duncan	beggar	traitors	f
202210110	Ben	beggar	none	f
202210110	Zoey	traitor	traitors	f
202210111	Ben	innocent	innocents	f
202210111	Rythian	innocent	innocents	f
202210112	Zoey	traitor	traitors	f
202210112	Kirsty	hypnotist	traitors	f
202210113	Ravs	innocent	innocents	f
202306030	Ravs	innocent	innocents	f
202306030	Rythian	traitor	traitors	f
202306031	Lewis	zombie	zombies	f
202306031	Rythian	zombie	zombies	f
202306031	Zylus	marshal	innocents	f
202306031	Zoey	mad scientist	zombies	f
202306032	Duncan	innocent	innocents	f
202306032	Kirsty	swapper	none	f
202306033	Duncan	innocent	innocents	f
202210080	Ben	innocent	innocents	f
202210081	Ben	veteran	innocents	f
202210081	Ravs	tracker	innocents	f
202210081	Pedguin	innocent	innocents	f
202210082	Ben	medium	innocents	f
202210082	Duncan	innocent	innocents	f
202210082	Ravs	innocent	innocents	f
202210082	Pedguin	glitch	innocents	f
202210083	Pedguin	parasite	traitors	f
202210084	Duncan	hypnotist	traitors	f
202210040	Ben	traitor	traitors	f
202305304	Rythian	impersonator	traitors	f
202305300	Zoey	marshal	innocents	t
202305300	Nilesy	traitor	traitors	t
202305301	Duncan	medium	innocents	t
202305301	Ravs	traitor	traitors	t
202210041	Duncan	tracker	innocents	f
202210042	Pedguin	randoman	innocents	f
202210043	Osie	paladin	innocents	f
202210011	Ben	randoman	innocents	f
202210011	Zoey	glitch	innocents	f
202210012	Osie	traitor	traitors	f
202210012	Zoey	hypnotist	traitors	f
202210012	Zylus	traitor	traitors	f
202210014	Ben	parasite	traitors	f
202210014	Rythian	traitor	traitors	f
202210014	Zylus	deputy	innocents	f
202306060	Rythian	traitor	traitors	f
202306061	Duncan	tracker	innocents	f
202306061	Zylus	glitch	innocents	f
202306061	Nilesy	beggar	innocents	f
202306062	Lewis	paladin	innocents	f
202306062	Zylus	innocent	innocents	f
202306062	Kirsty	innocent	innocents	f
202306100	Zylus	traitor	traitors	f
202306100	Zoey	traitor	traitors	f
202306101	Duncan	randoman	innocents	f
202306102	Lewis	paladin	innocents	f
202306102	Duncan	veteran	innocents	f
202306102	Rythian	beggar	none	f
202306102	Zoey	innocent	innocents	f
202306103	Rythian	zombie	zombies	f
202306103	Daltos	zombie	zombies	f
202210013	Rythian	jester	jester	f
202210040	Ravs	innocent	innocents	t
202210040	Pedguin	innocent	innocents	t
202210040	Kirsty	innocent	innocents	t
202210040	Osie	glitch	innocents	t
202210040	Boba	randoman	innocents	t
202210041	Ben	glitch	innocents	t
202210042	Ben	traitor	traitors	t
202306132	Rythian	traitor	traitors	f
202306133	Rythian	innocent	innocents	f
202209270	Rythian	traitor	traitors	f
202209270	Zylus	randoman	innocents	f
202209271	Zoey	innocent	innocents	f
202209272	Kirsty	deputy	innocents	f
202209273	Zylus	traitor	traitors	f
202209274	Ben	summoner	traitors	f
202209275	Lewis	traitor	traitors	f
202209240	Ben	traitor	traitors	f
202209240	Osie	swapper	none	f
202209241	Osie	tracker	innocents	f
202209241	Rythian	turncoat	innocents	f
202209242	Ben	summoner	traitors	f
202209242	Zoey	traitor	traitors	f
202209243	Lewis	summoner	traitors	f
202209243	Zylus	traitor	traitors	f
202209244	Zoey	innocent	innocents	f
202209244	Rythian	innocent	innocents	f
202209244	Zylus	swapper	none	f
202306130	Lewis	veteran	innocents	f
202306131	Daltos	traitor	traitors	f
202306170	Duncan	medium	innocents	f
202306171	Lewis	veteran	innocents	f
202306171	Nilesy	paladin	innocents	f
202306172	Ben	summoner	traitors	f
202306172	Duncan	traitor	traitors	f
202306172	Zylus	swapper	none	f
202209275	Osie	informant	traitors	f
202306104	Daltos	innocent	innocents	t
202306132	Ben	innocent	innocents	t
202306132	Duncan	innocent	innocents	t
202306173	Duncan	zombie	zombies	f
202306173	Rythian	zombie	zombies	f
202306173	Zylus	zombie	zombies	f
202306173	Zoey	zombie	zombies	f
202306174	Rythian	beggar	traitors	f
202306175	Lewis	medium	innocents	f
202306175	Ben	innocent	innocents	f
202306175	Duncan	beggar	innocents	f
202306175	Zoey	innocent	innocents	f
202306175	Nilesy	veteran	innocents	f
202306176	Zylus	traitor	traitors	f
202306200	Rythian	parasite	traitors	f
202306200	Zylus	traitor	traitors	f
202306201	Lewis	parasite	traitors	f
202306201	Duncan	traitor	traitors	f
202306202	Duncan	tracker	innocents	f
202306202	Rythian	veteran	innocents	f
202306203	Duncan	glitch	innocents	f
202306203	Rythian	innocent	innocents	f
202306203	Zoey	innocent	innocents	f
202306203	Daltos	paladin	innocents	f
202306204	Ben	traitor	traitors	f
202306204	Daltos	summoner	traitors	f
202306205	Lewis	innocent	innocents	f
202306220	Zylus	innocent	innocents	f
202306220	Osie	innocent	innocents	f
202306220	Kirsty	tracker	innocents	f
202306221	Lewis	traitor	traitors	f
202306222	Lewis	innocent	innocents	f
202306223	Osie	traitor	traitors	f
202306240	Zylus	hypnotist	traitors	f
202306240	Pedguin	traitor	traitors	f
202306240	Kirsty	traitor	traitors	f
202306241	Rythian	traitor	traitors	f
202306242	Ben	traitor	traitors	f
202306242	Pedguin	parasite	traitors	f
202306175	Daltos	jester	jester	f
202306202	Nilesy	jester	jester	f
202306223	Lewis	jester	jester	f
202306223	Ben	jester	jester	f
202306174	Daltos	informant	traitors	f
202306176	Rythian	informant	traitors	f
202306176	Zoey	shadow	none	f
202306203	Nilesy	shadow	none	f
202306173	Ben	marshal	innocents	t
202306173	Nilesy	innocent	innocents	t
202306173	Daltos	zombie	zombies	t
202306174	Lewis	traitor	traitors	t
202306174	Ben	innocent	innocents	t
202306174	Duncan	innocent	innocents	t
202306174	Zylus	deputy	innocents	t
202306243	Pedguin	traitor	traitors	f
202306243	Kirsty	innocent	innocents	f
202306243	Nilesy	paramedic	innocents	f
202209200	Lewis	traitor	traitors	f
202209200	Ben	turncoat	traitors	f
202209200	Lolip	parasite	traitors	f
202209201	Lewis	paladin	innocents	f
202209201	Duncan	innocent	innocents	f
202209202	Duncan	deputy	innocents	f
202209202	Rythian	tracker	innocents	f
202209203	Lolip	traitor	traitors	f
202306280	Nilesy	traitor	traitors	f
202306281	Duncan	tracker	innocents	f
202306281	Rythian	innocent	innocents	f
202306281	Kirsty	innocent	innocents	f
202306282	Duncan	traitor	traitors	f
202306282	Rythian	beggar	none	f
202306283	Zylus	swapper	none	f
202306283	Pedguin	veteran	innocents	f
202306284	Zylus	innocent	innocents	f
202306284	Pedguin	traitor	traitors	f
202306290	Ben	traitor	traitors	f
202306291	Lewis	paladin	innocents	f
202306291	Lolip	traitor	traitors	f
202306292	Duncan	parasite	traitors	f
202306292	Lolip	traitor	traitors	f
202306293	Duncan	beggar	innocents	f
202306293	Zoey	innocent	innocents	f
202306294	Nilesy	summoner	traitors	f
202306294	Daltos	veteran	innocents	f
202306295	Lewis	traitor	traitors	f
202306295	Zoey	traitor	traitors	f
202306295	Nilesy	traitor	traitors	f
202306295	Daltos	traitor	traitors	f
202307010	Ben	traitor	traitors	f
202307010	Duncan	parasite	traitors	f
202307011	Lewis	traitor	traitors	f
202306291	Ben	jester	jester	f
202306291	Duncan	jester	jester	f
202306291	Kirsty	jester	jester	f
202306291	Zoey	jester	jester	f
202306243	Zylus	informant	traitors	f
202306242	Kirsty	tracker	innocents	t
202306242	Nilesy	innocent	innocents	t
202306243	Ben	innocent	innocents	t
202306243	Rythian	randoman	innocents	t
202209200	Duncan	tracker	innocents	t
202209200	Rythian	innocent	innocents	t
202307012	Kirsty	traitor	traitors	f
202307013	Ben	glitch	innocents	f
202307013	Kirsty	beggar	none	f
202307013	Zoey	innocent	innocents	f
202307013	Lolip	randoman	innocents	f
202307042	Lewis	beggar	traitors	f
202307042	Duncan	summoner	traitors	f
202307042	Kirsty	traitor	traitors	f
202307043	Kirsty	beggar	none	f
202307043	Lolip	traitor	traitors	f
202307061	Ben	zombie	zombies	f
202307061	Duncan	mad scientist	zombies	f
202307064	Zoey	traitor	traitors	f
202307065	Zoey	traitor	traitors	f
202307014	Lewis	veteran	innocents	f
202307014	Nilesy	beggar	none	f
202307015	Zoey	parasite	traitors	f
202307040	Lewis	innocent	innocents	f
202307040	Zoey	innocent	innocents	f
202307041	Kirsty	paladin	innocents	f
202307041	Zoey	glitch	innocents	f
202307044	Ben	traitor	traitors	f
202307045	Duncan	traitor	traitors	f
202307060	Rythian	traitor	traitors	f
202307060	Zoey	summoner	traitors	f
202307062	Duncan	beggar	none	f
202307062	Rythian	zombie	zombies	f
202307062	Zoey	mad scientist	zombies	f
202307062	Nilesy	zombie	zombies	f
202307042	Zoey	jester	jester	f
202307015	Lewis	jester	jester	f
202307012	Daltos	informant	traitors	f
202307041	Ben	shadow	none	f
202307043	Ben	impersonator	traitors	f
202307011	Duncan	summoner	traitors	t
202307011	Kirsty	glitch	innocents	t
202307011	Zoey	innocent	innocents	t
202307011	Nilesy	innocent	innocents	t
202307011	Daltos	medium	innocents	t
202307011	Lolip	traitor	traitors	t
202307012	Lewis	randoman	innocents	t
202307012	Duncan	innocent	innocents	t
202307063	Zoey	beggar	none	f
202307063	Breeh	glitch	innocents	f
202307080	Breeh	mad scientist	zombies	f
202307081	Rythian	parasite	traitors	f
202307082	Ben	innocent	innocents	f
202307082	Rythian	medium	innocents	f
202307083	Kirsty	traitor	traitors	f
202307083	Breeh	traitor	traitors	f
202307083	Zylus	traitor	traitors	f
202307110	Ben	innocent	innocents	f
202307110	Zylus	glitch	innocents	f
202307110	Zoey	innocent	innocents	f
202307110	Breeh	tracker	innocents	f
202307111	Duncan	innocent	innocents	f
202307111	Zoey	randoman	innocents	f
202307112	Duncan	parasite	traitors	f
202307112	Rythian	traitor	traitors	f
202307113	Ben	elf	elves	f
202307113	Zylus	elf	elves	f
202307113	Zoey	elf	elves	f
202307130	Zoey	innocent	innocents	f
202307130	Breeh	innocent	innocents	f
202307131	Zylus	mad scientist	zombies	f
202307150	Ben	innocent	innocents	f
202307150	Zylus	veteran	innocents	f
202307150	Kirsty	parasite	traitors	f
202307151	Zylus	medium	innocents	f
202307152	Rythian	traitor	traitors	f
202307152	Shadow	beggar	none	f
202307153	Rythian	paramedic	innocents	f
202307153	Zylus	innocent	innocents	f
202307153	Nilesy	randoman	innocents	f
202307153	Shadow	beggar	none	f
202307181	Rythian	innocent	innocents	f
202307152	Nilesy	impersonator	traitors	f
202307063	Kirsty	hypnotist	traitors	t
202307063	Nilesy	innocent	innocents	t
202307080	Ben	zombie	zombies	t
202307080	Duncan	zombie	zombies	t
202307184	Nilesy	traitor	traitors	f
202307220	Duncan	traitor	traitors	f
202307221	Lewis	glitch	innocents	f
202307221	Ravs	tracker	innocents	f
202307221	Nilesy	beggar	none	f
202307223	Lewis	innocent	innocents	f
202307223	Zoey	innocent	innocents	f
202307224	Rythian	veteran	innocents	f
202307224	Zylus	medium	innocents	f
202307226	Lewis	innocent	innocents	f
202307226	Zylus	traitor	traitors	f
202307226	Nilesy	innocent	innocents	f
202307132	Duncan	summoner	traitors	f
202307132	Zylus	traitor	traitors	f
202307133	Duncan	zombie	zombies	f
202307133	Rythian	zombie	zombies	f
202307134	Zoey	deputy	innocents	f
202307135	Rythian	zombie	zombies	f
202307135	Zoey	zombie	zombies	f
202307154	Rythian	swapper	none	f
202307154	Kirsty	traitor	traitors	f
202307180	Duncan	swapper	none	f
202307180	Zylus	innocent	innocents	f
202307180	Kirsty	glitch	innocents	f
202307180	Nilesy	medium	innocents	f
202307180	Shadow	traitor	traitors	f
202307182	Duncan	paramedic	innocents	f
202307182	Zylus	medium	innocents	f
202307182	Zoey	innocent	innocents	f
202307183	Duncan	traitor	traitors	f
202307183	Nilesy	parasite	traitors	f
202307185	Rythian	swapper	none	f
202307185	Zoey	tracker	innocents	f
202307200	Ravs	hypnotist	traitors	f
202307200	Zylus	traitor	traitors	f
202307201	Ravs	beggar	none	f
202307201	Kirsty	veteran	innocents	f
202307201	Nilesy	innocent	innocents	f
202307182	Rythian	jester	jester	f
202307183	Rythian	jester	jester	f
202307201	Zylus	jester	jester	f
202307184	Shadow	veteran	innocents	t
202307220	Lewis	innocent	innocents	t
202307220	Ravs	innocent	innocents	t
202307220	Rythian	traitor	traitors	t
202307220	Zylus	tracker	innocents	t
202307202	Ravs	innocent	innocents	f
202307202	Rythian	swapper	none	f
202307203	Zylus	glitch	innocents	f
202307204	Lewis	traitor	traitors	f
202307205	Lewis	traitor	traitors	f
202307206	Lewis	veteran	innocents	f
202307225	Lewis	innocent	innocents	f
202307225	Zylus	swapper	none	f
202307250	Kirsty	traitor	traitors	f
202307250	Nilesy	swapper	none	f
202307251	Kirsty	marshal	innocents	f
202307253	Lewis	innocent	innocents	f
202307254	Lewis	beggar	traitors	f
202307254	Zylus	traitor	traitors	f
202307271	Nilesy	glitch	innocents	f
202307272	Lewis	mud scientist	none	f
202307273	Lewis	innocent	innocents	f
202307273	Ravs	medium	innocents	f
202307273	Nilesy	traitor	traitors	f
202307273	Daltos	innocent	innocents	f
202307274	Lewis	zombie	zombies	f
202307274	Ben	zombie	zombies	f
202307253	Kirsty	jester	jester	f
202307205	Nilesy	informant	traitors	f
202307254	Ben	informant	traitors	f
202307222	Nilesy	clown	clown	f
202307252	Ravs	clown	clown	f
202307272	Zylus	impersonator	traitors	f
202307202	Lewis	innocent	innocents	t
202307202	Zylus	veteran	innocents	t
202307202	Zoey	mad scientist	zombies	t
202307202	Kirsty	paladin	innocents	t
202307274	Ravs	zombie	zombies	f
202307274	Zoey	zombie	zombies	f
202307274	Kirsty	mad scientist	zombies	f
202307274	Nilesy	zombie	zombies	f
202307274	Daltos	zombie	zombies	f
202307275	Ben	randoman	innocents	f
202307290	Lewis	innocent	innocents	f
202307291	Lewis	innocent	innocents	f
202307291	Kirsty	innocent	innocents	f
202307291	Briony	swapper	none	f
202307292	Ben	swapper	none	f
202307292	Duncan	randoman	innocents	f
202307293	Kirsty	innocent	innocents	f
202307294	Lewis	beggar	traitors	f
202307294	Duncan	hypnotist	traitors	f
202307295	Lewis	deputy	innocents	f
202307295	Zylus	paladin	innocents	f
202307295	Rythian	innocent	innocents	f
202307295	Briony	innocent	innocents	f
202308010	Zylus	innocent	innocents	f
202308012	Lewis	traitor	traitors	f
202308013	Lewis	zombie	zombies	f
202308013	Ben	zombie	zombies	f
202308013	Duncan	zombie	zombies	f
202308013	Kirsty	mad scientist	zombies	f
202308013	Briony	zombie	zombies	f
202308014	Duncan	innocent	innocents	f
202308030	Lewis	summoner	traitors	f
202308030	Rythian	swapper	none	f
202308031	Lewis	paramedic	innocents	f
202308031	Rythian	innocent	innocents	f
202308031	Nilesy	swapper	none	f
202308032	Nilesy	innocent	innocents	f
202307295	Kirsty	jester	jester	f
202307275	Zoey	informant	traitors	f
202308011	Lewis	informant	traitors	f
202307274	Zylus	innocent	innocents	t
202307275	Lewis	innocent	innocents	t
202307275	Ravs	innocent	innocents	t
202307275	Kirsty	traitor	traitors	t
202307275	Nilesy	beggar	none	t
202308033	Rythian	traitor	traitors	f
202308034	Kirsty	veteran	innocents	f
202308034	Nilesy	innocent	innocents	f
202308035	Duncan	innocent	innocents	f
202308050	Lewis	traitor	traitors	f
202308050	Kirsty	beggar	none	f
202308051	Duncan	hypnotist	traitors	f
202308051	Zoey	hypnotist	traitors	f
202308052	Ben	medium	innocents	f
202308052	Briony	innocent	innocents	f
202308053	Ben	parasite	traitors	f
202308053	Kirsty	tracker	innocents	f
202308120	Lewis	innocent	innocents	f
202308125	Rythian	veteran	innocents	f
202308125	Zylus	swapper	none	f
202308080	Briony	traitor	traitors	f
202308081	Zoey	innocent	innocents	f
202308082	Lewis	swapper	none	f
202308082	Duncan	traitor	traitors	f
202308082	Rythian	parasite	traitors	f
202308083	Rythian	glitch	innocents	f
202308083	Zoey	summoner	traitors	f
202308083	Kirsty	innocent	innocents	f
202308083	Nilesy	randoman	innocents	f
202308083	Briony	traitor	traitors	f
202308121	Pedguin	medium	innocents	f
202308122	Lewis	innocent	innocents	f
202308122	Duncan	randoman	innocents	f
202308122	Zylus	glitch	innocents	f
202308123	Lewis	swapper	none	f
202308123	Pedguin	hypnotist	traitors	f
202308035	Ben	jester	jester	f
202308050	Nilesy	informant	traitors	f
202308080	Rythian	informant	traitors	f
202308033	Duncan	glitch	innocents	t
202308033	Zoey	summoner	traitors	t
202308033	Kirsty	innocent	innocents	t
202308124	Pedguin	traitor	traitors	f
202308150	Lewis	parasite	traitors	f
202308151	Lewis	traitor	traitors	f
202308153	Lewis	traitor	traitors	f
202308154	Lewis	medium	innocents	f
202308154	Duncan	glitch	innocents	f
202308154	Rythian	innocent	innocents	f
202308154	Nilesy	innocent	innocents	f
202308154	Kirsty	swapper	none	f
202308155	Lewis	innocent	innocents	f
202308155	Nilesy	innocent	innocents	f
202308190	Lewis	traitor	traitors	f
202308190	Briony	hypnotist	traitors	f
202308191	Duncan	innocent	innocents	f
202308192	Lewis	traitor	traitors	f
202308192	Duncan	summoner	traitors	f
202308193	Duncan	deputy	innocents	f
202308193	Kirsty	innocent	innocents	f
202308193	Briony	innocent	innocents	f
202308194	Lewis	innocent	innocents	f
202308220	Lewis	zombie	zombies	f
202308220	Rythian	summoner	traitors	f
202308221	Lewis	innocent	innocents	f
202308221	Ravs	innocent	innocents	f
202308222	Rythian	summoner	traitors	f
202308223	Zoey	traitor	traitors	f
202308223	Nilesy	innocent	innocents	f
202308250	Ravs	traitor	traitors	f
202308251	Lewis	innocent	innocents	f
202308251	Ben	medium	innocents	f
202308251	Zoey	beggar	innocents	f
202308151	Lolip	informant	traitors	f
202308152	Lolip	informant	traitors	f
202308124	Osie	impersonator	traitors	f
202308123	Nilesy	marshal	innocents	t
202308123	Osie	veteran	innocents	t
202308124	Lewis	veteran	innocents	t
202308252	Daltos	innocent	innocents	f
202308260	Lewis	innocent	innocents	f
202308260	Rythian	tracker	innocents	f
202308260	Nilesy	innocent	innocents	f
202308261	Zylus	traitor	traitors	f
202308262	Zoey	traitor	traitors	f
202308264	Rythian	glitch	innocents	f
202308253	Lewis	traitor	traitors	f
202308290	Lewis	glitch	innocents	f
202308290	Nilesy	innocent	innocents	f
202308291	Duncan	deputy	innocents	f
202308291	Nilesy	innocent	innocents	f
202308292	Rythian	mad scientist	zombies	f
202308293	Nilesy	traitor	traitors	f
202308294	Rythian	veteran	innocents	f
202308294	Nilesy	medium	innocents	f
202308295	Lewis	paladin	innocents	f
202308295	Zylus	innocent	innocents	f
202308295	Zoey	paramedic	innocents	f
202308295	Nilesy	innocent	innocents	f
202308295	Kirsty	swapper	none	f
202308296	Lewis	innocent	innocents	f
202308310	Duncan	innocent	innocents	f
202308310	Zoey	medium	innocents	f
202308311	Lewis	innocent	innocents	f
202308311	Zoey	swapper	none	f
202308311	Kirsty	innocent	innocents	f
202308260	Zoey	jester	jester	f
202308262	Duncan	informant	traitors	f
202308263	Ben	clown	clown	f
202308253	Ravs	impersonator	traitors	f
202308252	Lewis	innocent	innocents	t
202308252	Ben	innocent	innocents	t
202308252	Ravs	innocent	innocents	t
202308252	Rythian	innocent	innocents	t
202308313	Lewis	paladin	innocents	f
202308313	Duncan	swapper	none	f
202308313	Zoey	innocent	innocents	f
202308314	Ben	innocent	innocents	f
202308314	Rythian	parasite	traitors	f
202308314	Zylus	innocent	innocents	f
202308314	Zoey	traitor	traitors	f
202308314	Nilesy	paladin	innocents	f
202309020	Lewis	hypnotist	traitors	f
202309020	Duncan	traitor	traitors	f
202309020	Pedguin	glitch	innocents	f
202309020	Boba	randoman	innocents	f
202309020	Kirsty	innocent	innocents	f
202309021	Lewis	swapper	none	f
202309021	Pedguin	mad scientist	zombies	f
202309022	Ben	veteran	innocents	f
202309022	Duncan	traitor	traitors	f
202309022	Rythian	marshal	innocents	f
202309022	Pedguin	innocent	innocents	f
202309052	Lewis	traitor	traitors	f
202309052	Rythian	innocent	innocents	f
202309052	Boba	veteran	innocents	f
202309052	Nilesy	innocent	innocents	f
202309053	Ben	innocent	innocents	f
202309056	Ben	marshal	innocents	f
202309056	Rythian	traitor	traitors	f
202309056	Pedguin	innocent	innocents	f
202309056	Boba	summoner	traitors	f
202309056	Nilesy	innocent	innocents	f
202309056	Kirsty	paramedic	innocents	f
202309073	Rythian	innocent	innocents	f
202309023	Lewis	traitor	traitors	f
202309023	Boba	summoner	traitors	f
202309024	Lewis	tracker	innocents	f
202309024	Ben	innocent	innocents	f
202309024	Nilesy	cupid	lovers	f
202309025	Ben	veteran	innocents	f
202309025	Duncan	innocent	innocents	f
202309025	Rythian	paladin	innocents	f
202309025	Pedguin	traitor	traitors	f
202309025	Kirsty	innocent	innocents	f
202309050	Lewis	mad scientist	zombies	f
202309050	Duncan	zombie	zombies	f
202309050	Rythian	zombie	zombies	f
202309050	Pedguin	zombie	zombies	f
202309051	Kirsty	traitor	traitors	f
202309054	Lewis	innocent	innocents	f
202309054	Rythian	innocent	innocents	f
202308312	Zoey	informant	traitors	f
202309052	Duncan	informant	traitors	f
202309025	Boba	informant	traitors	f
202309051	Boba	informant	traitors	f
202308315	Zylus	clown	clown	f
202309020	Rythian	clown	clown	f
202309025	Lewis	clown	clown	f
202308312	Duncan	traitor	traitors	t
202308312	Rythian	innocent	innocents	t
202308312	Zylus	mad scientist	zombies	t
202308312	Nilesy	glitch	innocents	t
202308313	Ben	innocent	innocents	t
202308313	Rythian	drunk	none	t
202308313	Zylus	parasite	traitors	t
202309054	Pedguin	innocent	innocents	f
202309054	Boba	innocent	innocents	f
202309055	Lewis	traitor	traitors	f
202309070	Lewis	paladin	innocents	f
202309070	Duncan	swapper	none	f
202309070	Ravs	glitch	innocents	f
202309070	Nilesy	beggar	innocents	f
202309071	Nilesy	traitor	traitors	f
202309074	Ben	veteran	innocents	f
202309090	Zoey	glitch	innocents	f
202309090	Nilesy	traitor	traitors	f
202309091	Lewis	zombie	zombies	f
202309091	Duncan	mad scientist	zombies	f
202309091	Ravs	zombie	zombies	f
202309092	Duncan	beggar	traitors	f
202309092	Nilesy	traitor	traitors	f
202309093	Lewis	swapper	none	f
202309093	Rythian	glitch	innocents	f
202309093	Zoey	innocent	innocents	f
202309094	Ben	zombie	zombies	f
202309094	Rythian	zombie	zombies	f
202309094	Zoey	mad scientist	zombies	f
202309120	Ben	innocent	innocents	f
202309120	Nilesy	beggar	none	f
202309121	Ben	parasite	traitors	f
202309123	Lewis	randoman	innocents	f
202309123	Zoey	veteran	innocents	f
202309123	Nilesy	innocent	innocents	f
202309124	Zoey	marshal	innocents	f
202309162	Lewis	traitor	traitors	f
202309192	Lewis	deputy	innocents	f
202309192	Kirsty	informant	traitors	f
202309072	Ravs	clown	clown	f
202309054	Nilesy	traitor	traitors	t
202309054	Kirsty	traitor	traitors	t
202309055	Ben	beggar	none	t
202309055	Duncan	tracker	innocents	t
202309055	Rythian	innocent	innocents	t
202309231	Kirsty	parasite	traitors	f
202309232	Lewis	traitor	traitors	f
202309232	Osie	traitor	traitors	f
202309260	Zoey	traitor	traitors	f
202309261	Duncan	beggar	traitors	f
202309261	Ravs	traitor	traitors	f
202309262	Lewis	swapper	none	f
202309262	Duncan	parasite	traitors	f
202309262	Osie	traitor	traitors	f
202309300	Duncan	traitor	traitors	f
202309302	Duncan	parasite	traitors	f
202310030	Duncan	innocent	innocents	f
202309122	Rythian	innocent	innocents	f
202309160	Zoey	innocent	innocents	f
202309161	Nilesy	traitor	traitors	f
202309161	Osie	hypnotist	traitors	f
202309190	Zoey	innocent	innocents	f
202309233	Ravs	traitor	traitors	f
202309192	Osie	traitor	traitors	t
202309230	Ben	drunk	none	t
202309230	Duncan	traitor	traitors	t
202309230	Ravs	innocent	innocents	t
202309261	Ben	drunk	none	t
202309264	Duncan	traitor	traitors	f
202309264	Ravs	innocent	innocents	f
202309264	Kirsty	beggar	none	f
202309265	Lewis	zombie	zombies	f
202309265	Ben	zombie	zombies	f
202309265	Nilesy	zombie	zombies	f
202309265	Zoey	mad scientist	zombies	f
202310031	Ben	innocent	innocents	f
202310031	Duncan	tracker	innocents	f
202310031	Rythian	veteran	innocents	f
202310031	Zylus	innocent	innocents	f
202310032	Kirsty	innocent	innocents	f
202310033	Ben	glitch	innocents	f
202310033	Rythian	innocent	innocents	f
202310072	Lewis	summoner	traitors	f
202310072	Rythian	traitor	traitors	f
202310072	Zoey	innocent	innocents	f
202310072	Kirsty	paramedic	innocents	f
202310072	Shadow	randoman	innocents	f
202310072	Duncan	innocent	innocents	f
202310101	Duncan	traitor	traitors	f
202310101	Rythian	traitor	traitors	f
202310101	Zoey	hypnotist	traitors	f
202310101	Briony	swapper	none	f
202310142	Kirsty	beggar	traitors	f
202310143	Zylus	parasite	traitors	f
202310144	Ben	traitor	traitors	f
202310144	Duncan	mud scientist	none	f
202310070	Ben	summoner	traitors	f
202310070	Zoey	traitor	traitors	f
202310100	Zylus	innocent	innocents	f
202310103	Lewis	innocent	innocents	f
202310103	Duncan	innocent	innocents	f
202310103	Zoey	traitor	traitors	f
202310103	Kirsty	innocent	innocents	f
202310103	Briony	innocent	innocents	f
202310104	Lewis	innocent	innocents	f
202310104	Ben	innocent	innocents	f
202310144	Lewis	jester	jester	f
202310103	Ben	jester	jester	f
202310103	Rythian	jester	jester	f
202310102	Rythian	informant	traitors	f
202310071	Lewis	informant	traitors	f
202310072	Ben	clown	clown	f
202310102	Briony	impersonator	traitors	f
202309264	Nilesy	tracker	innocents	t
202309264	Zoey	innocent	innocents	t
202309264	Osie	deputy	innocents	t
202309265	Duncan	innocent	innocents	t
202309265	Ravs	traitor	traitors	t
202310140	Duncan	traitor	traitors	f
202310140	Rythian	beggar	traitors	f
202310141	Duncan	marshal	innocents	f
202310141	Rythian	innocent	innocents	f
202310141	Zoey	veteran	innocents	f
202310141	Briony	beggar	none	f
202310173	Lewis	mad scientist	zombies	f
202310173	Rythian	swapper	none	f
202310173	Zylus	zombie	zombies	f
202310173	Zoey	zombie	zombies	f
202310173	Shadow	zombie	zombies	f
202310243	Lewis	traitor	traitors	f
202310243	Zylus	swapper	none	f
202310244	Rythian	innocent	innocents	f
202310244	Zylus	marshal	innocents	f
202310244	Kirsty	deputy	innocents	f
202310246	Nilesy	summoner	traitors	f
202310280	Kirsty	traitor	traitors	f
202310282	Lewis	marshal	innocents	f
202310282	Rythian	swapper	none	f
202310282	Zylus	paramedic	innocents	f
202310282	Breeh	innocent	innocents	f
202310172	Lewis	parasite	traitors	f
202310172	Zylus	traitor	traitors	f
202310172	Zoey	beggar	none	f
202310174	Lewis	paladin	innocents	f
202310211	Rythian	traitor	traitors	f
202310212	Rythian	innocent	innocents	f
202310210	Duncan	jester	jester	f
202310243	Breeh	informant	traitors	f
202310280	Daltos	informant	traitors	f
202310140	Ben	innocent	innocents	t
202310140	Zoey	innocent	innocents	t
202310140	Briony	randoman	innocents	t
202310141	Lewis	traitor	traitors	t
202310141	Ben	parasite	traitors	t
202310141	Kirsty	mad scientist	zombies	t
202310213	Duncan	summoner	traitors	f
202310240	Nilesy	glitch	innocents	f
202310240	Breeh	innocent	innocents	f
202310240	Daltos	innocent	innocents	f
202310241	Lewis	innocent	innocents	f
202310241	Zylus	beggar	none	f
202310241	Breeh	glitch	innocents	f
202310242	Lewis	glitch	innocents	f
202310242	Rythian	traitor	traitors	f
202310242	Kirsty	innocent	innocents	f
202310242	Breeh	innocent	innocents	f
202310242	Daltos	tracker	innocents	f
202310242	Ben	summoner	traitors	f
202310281	Zylus	elf	elves	f
202310281	Kirsty	elf	elves	f
202310281	Nilesy	elf	elves	f
202310281	Daltos	elf	elves	f
202310310	Zylus	veteran	innocents	f
202310311	Lewis	deputy	innocents	f
202310311	Daltos	medium	innocents	f
202310312	Kirsty	traitor	traitors	f
202310313	Breeh	innocent	innocents	f
202310313	Daltos	innocent	innocents	f
202310314	Ben	traitor	traitors	f
202311040	Lewis	innocent	innocents	f
202311040	Rythian	beggar	none	f
202311040	Kirsty	medium	innocents	f
202311042	Pedguin	paramedic	innocents	f
202311043	Lewis	innocent	innocents	f
202311043	Duncan	glitch	innocents	f
202311043	Nilesy	innocent	innocents	f
202311043	Pedguin	paladin	innocents	f
202311070	Lewis	traitor	traitors	f
202311070	Pedguin	innocent	innocents	f
202311071	Lewis	tracker	innocents	f
202310214	Zoey	clown	clown	f
202311041	Rythian	clown	clown	f
202310213	Zylus	medium	innocents	t
202310213	Zoey	innocent	innocents	t
202310213	Kirsty	glitch	innocents	t
202311074	Kirsty	traitor	traitors	f
202311110	Ravs	traitor	traitors	f
202311111	Lewis	innocent	innocents	f
202311111	Duncan	beggar	none	f
202311111	Ravs	innocent	innocents	f
202311111	Zylus	deputy	innocents	f
202311111	Daltos	medium	innocents	f
202311112	Lewis	innocent	innocents	f
202311112	Ravs	parasite	traitors	f
202311112	Nilesy	deputy	innocents	f
202311114	Lewis	randoman	innocents	f
202311114	Ben	veteran	innocents	f
202311114	Duncan	hypnotist	traitors	f
202311114	Zylus	innocent	innocents	f
202311114	Nilesy	innocent	innocents	f
202311114	Osie	drunk	none	f
202311114	Daltos	traitor	traitors	f
202311173	Lewis	traitor	traitors	f
202311173	Zylus	innocent	innocents	f
202311173	Osie	traitor	traitors	f
202311174	Duncan	traitor	traitors	f
202311180	Ravs	mad scientist	zombies	f
202311181	Osie	glitch	innocents	f
202311210	Ben	zombie	zombies	f
202311210	Rythian	zombie	zombies	f
202311210	Nilesy	zombie	zombies	f
202311210	Kirsty	mad scientist	zombies	f
202311210	Pedguin	zombie	zombies	f
202311211	Pedguin	traitor	traitors	f
202311212	Lewis	traitor	traitors	f
202311212	Ben	summoner	traitors	f
202311213	Lewis	marshal	innocents	f
202311113	Ravs	swapper	none	f
202311113	Osie	innocent	innocents	f
202311170	Ravs	traitor	traitors	f
202311072	Duncan	jester	jester	f
202311111	Osie	jester	jester	f
202311170	Duncan	informant	traitors	f
202311071	Briony	mad scientist	zombies	t
202311072	Lewis	innocent	innocents	t
202311072	Rythian	veteran	innocents	t
202311172	Lewis	innocent	innocents	f
202311172	Ben	innocent	innocents	f
202311172	Zylus	traitor	traitors	f
202311172	Osie	innocent	innocents	f
202311182	Daltos	traitor	traitors	f
202311183	Ben	traitor	traitors	f
202311183	Osie	innocent	innocents	f
202311184	Nilesy	innocent	innocents	f
202311184	Daltos	swapper	none	f
202311250	Pedguin	traitor	traitors	f
202311251	Zylus	veteran	innocents	f
202311251	Pedguin	paladin	innocents	f
202311252	Kirsty	traitor	traitors	f
202311254	Rythian	traitor	traitors	f
202311254	Boba	summoner	traitors	f
202312040	Rythian	mad scientist	zombies	f
202312040	Nilesy	innocent	innocents	f
202312040	Kirsty	innocent	innocents	f
202312041	Lewis	glitch	innocents	f
202312041	Rythian	parasite	traitors	f
202312041	Nilesy	traitor	traitors	f
202312041	Kirsty	innocent	innocents	f
202312041	Osie	tracker	innocents	f
202312041	Mousie	innocent	innocents	f
202312042	Kirsty	mad scientist	zombies	f
202312042	Mousie	zombie	zombies	f
202312043	Lewis	veteran	innocents	f
202312043	Ben	innocent	innocents	f
202312043	Rythian	innocent	innocents	f
202312043	Nilesy	innocent	innocents	f
202312044	Lewis	innocent	innocents	f
202312044	Ben	swapper	none	f
202312044	Duncan	glitch	innocents	f
202312044	Kirsty	marshal	innocents	f
202312044	Mousie	deputy	innocents	f
202312045	Ben	veteran	innocents	f
202312045	Duncan	innocent	innocents	f
202312045	Rythian	marshal	innocents	f
202312045	Nilesy	deputy	innocents	f
202312043	Osie	jester	jester	f
202311171	Ben	clown	clown	f
202311250	Rythian	impersonator	traitors	f
202311170	Zylus	veteran	innocents	t
202311170	Nilesy	innocent	innocents	t
202311170	Osie	innocent	innocents	t
202311171	Duncan	randoman	innocents	t
202311171	Ravs	veteran	innocents	t
202311171	Zylus	traitor	traitors	t
202311171	Nilesy	innocent	innocents	t
202312046	Kirsty	paladin	innocents	f
202312046	Mousie	traitor	traitors	f
202312047	Rythian	traitor	traitors	f
202312047	Nilesy	innocent	innocents	f
202312047	Kirsty	glitch	innocents	f
202312047	Mousie	paladin	innocents	f
202312090	Lewis	drunk	none	f
202312090	Duncan	innocent	innocents	f
202312090	Rythian	marshal	innocents	f
202312090	Osie	traitor	traitors	f
202312090	Mousie	innocent	innocents	f
202312091	Lewis	hypnotist	traitors	f
202312091	Ben	innocent	innocents	f
202312091	Duncan	innocent	innocents	f
202312091	Osie	deputy	innocents	f
202312093	Ben	glitch	innocents	f
202312093	Rythian	innocent	innocents	f
202312093	Mousie	innocent	innocents	f
202312094	Lewis	traitor	traitors	f
202312094	Duncan	swapper	none	f
202312094	Rythian	traitor	traitors	f
202312094	Osie	summoner	traitors	f
202312141	Duncan	paramedic	innocents	f
202312141	Briony	innocent	innocents	f
202312142	Lewis	elf	elves	f
202312142	Ben	elf	elves	f
202312142	Zylus	elf	elves	f
202312142	Kirsty	elf	elves	f
202312142	Briony	elf	elves	f
202312143	Ben	innocent	innocents	f
202312143	Osie	innocent	innocents	f
202312231	Kirsty	innocent	innocents	f
202312232	Zylus	traitor	traitors	f
202312233	Duncan	tracker	innocents	f
202312270	Ben	deputy	innocents	f
202312270	Rythian	marshal	innocents	f
202312270	Daltos	innocent	innocents	f
202312271	Ben	parasite	traitors	f
202312271	Rythian	glitch	innocents	f
202312092	Osie	traitor	traitors	f
202312046	Lewis	jester	jester	f
202312091	Nilesy	clown	clown	f
202312230	Osie	clown	clown	f
202312090	Kirsty	impersonator	traitors	f
202312232	Duncan	impersonator	traitors	f
202312045	Osie	summoner	traitors	t
202312045	Mousie	traitor	traitors	t
202312047	Ben	drunk	none	t
202312047	Osie	innocent	innocents	t
202312090	Ben	glitch	innocents	t
202312091	Rythian	traitor	traitors	t
202312091	Mousie	medium	innocents	t
202312093	Duncan	tracker	innocents	t
202312093	Nilesy	summoner	traitors	t
202312093	Kirsty	traitor	traitors	t
202312093	Osie	mad scientist	zombies	t
202312094	Ben	veteran	innocents	t
202312142	Osie	elf	elves	t
202312095	Osie	parasite	traitors	f
202312140	Ben	innocent	innocents	f
202312140	Duncan	glitch	innocents	f
202312140	Zylus	medium	innocents	f
202312273	Kirsty	veteran	innocents	f
202312274	Ben	innocent	innocents	f
202312274	Rythian	medium	innocents	f
202312274	Daltos	innocent	innocents	f
202312303	Kirsty	medium	innocents	f
202312303	Briony	beggar	innocents	f
202312304	Zylus	marshal	innocents	f
202312305	Rythian	innocent	innocents	f
202312305	Zylus	innocent	innocents	f
202312305	Nilesy	paladin	innocents	f
202312305	Daltos	innocent	innocents	f
202401020	Kirsty	traitor	traitors	f
202401021	Ben	traitor	traitors	f
202401021	Zylus	summoner	traitors	f
202401022	Lewis	medium	innocents	f
202401022	Rythian	innocent	innocents	f
202401022	Kirsty	veteran	innocents	f
202401022	Osie	innocent	innocents	f
202312272	Rythian	zombie	zombies	f
202312272	Zylus	mad scientist	zombies	f
202312272	Nilesy	zombie	zombies	f
202312272	Briony	zombie	zombies	f
202312272	Daltos	zombie	zombies	f
202312300	Briony	tracker	innocents	f
202312301	Zylus	innocent	innocents	f
202312302	Zylus	traitor	traitors	f
202312302	Briony	summoner	traitors	f
202401023	Ben	randoman	innocents	f
202401023	Duncan	mad scientist	zombies	f
202401023	Rythian	innocent	innocents	f
202401023	Zylus	innocent	innocents	f
202401023	Osie	parasite	traitors	f
202401023	Briony	traitor	traitors	f
202401060	Lewis	guesser	none	f
202401060	Duncan	innocent	innocents	f
202401060	Briony	tracker	innocents	f
202401061	Lewis	veteran	innocents	f
202401061	Nilesy	innocent	innocents	f
202401061	Briony	innocent	innocents	f
202401062	Rythian	traitor	traitors	f
202312095	Kirsty	jester	jester	f
202401020	Ben	jester	jester	f
202312271	Daltos	jester	jester	f
202312271	Zylus	clown	clown	f
202312274	Briony	impersonator	traitors	f
202401020	Zylus	impersonator	traitors	f
202312095	Nilesy	innocent	innocents	t
202312095	Mousie	mad scientist	zombies	t
202312140	Lewis	mad scientist	zombies	t
202312140	Rythian	traitor	traitors	t
202401062	Nilesy	spy	traitors	f
202401063	Lewis	veteran	innocents	f
202401063	Duncan	medium	innocents	f
202401063	Briony	swapper	none	f
202401064	Lewis	traitor	traitors	f
202401090	Duncan	vindicator	none	f
202401090	Kirsty	swapper	none	f
202401091	Lewis	vindicator	innocents	f
202401091	Rythian	medium	innocents	f
202401091	Kirsty	guesser	none	f
202401092	Lewis	guesser	none	f
202401092	Rythian	spy	traitors	f
202401092	Briony	traitor	traitors	f
202401093	Rythian	innocent	innocents	f
202401093	Zylus	innocent	innocents	f
202401093	Nilesy	innocent	innocents	f
202401093	Briony	medium	innocents	f
202401094	Ben	beggar	innocents	f
202401130	Lewis	hive mind	hive mind	f
202401130	Ben	hive mind	hive mind	f
202401130	Duncan	hive mind	hive mind	f
202401130	Rythian	hive mind	hive mind	f
202401130	Nilesy	hive mind	hive mind	f
202401130	Kirsty	hive mind	hive mind	f
202401130	Briony	hive mind	hive mind	f
202401131	Duncan	medium	innocents	f
202401131	Kirsty	innocent	innocents	f
202401131	Briony	innocent	innocents	f
202401132	Duncan	parasite	traitors	f
202401132	Zylus	beggar	traitors	f
202401132	Kirsty	traitor	traitors	f
202401132	Briony	innocent	innocents	f
202401133	Lewis	spy	traitors	f
202401133	Nilesy	traitor	traitors	f
202401135	Lewis	guesser	none	f
202401135	Duncan	zombie	zombies	f
202401135	Rythian	zombie	zombies	f
202401135	Zylus	mad scientist	zombies	f
202211010	Boba	swapper	none	f
202211011	Pedguin	loot goblin	none	f
202211122	Pedguin	loot goblin	none	f
202211154	Ben	loot goblin	none	f
202211192	Kirsty	loot goblin	none	f
202211221	Zylus	loot goblin	none	f
202211223	Zoey	loot goblin	none	f
202211224	Lewis	loot goblin	none	f
202212010	Shadow	loot goblin	none	f
202212011	Zoey	loot goblin	none	f
202210222	Breeh	loot goblin	none	f
202212063	Ravs	loot goblin	none	f
202212134	Lewis	loot goblin	none	f
202212172	Breeh	loot goblin	none	f
202212201	Rythian	loot goblin	none	f
202212242	Lewis	loot goblin	none	f
202301140	Osie	loot goblin	none	f
202301280	Duncan	loot goblin	none	f
202401131	Ben	informant	traitors	f
202401134	Lewis	informant	traitors	f
202401131	Rythian	clown	clown	f
202401062	Zylus	innocent	innocents	t
202401062	Kirsty	guesser	none	t
202401062	Briony	beggar	traitors	t
202401063	Ben	innocent	innocents	t
202302140	Lewis	loot goblin	none	f
202302144	Kirsty	loot goblin	none	f
202302210	Duncan	loot goblin	none	f
202302283	Pedguin	loot goblin	none	f
202303186	Zoey	loot goblin	none	f
202304150	Ben	loot goblin	none	f
202304257	Lewis	loot goblin	none	f
202305133	Boba	loot goblin	none	f
202305204	Lewis	loot goblin	none	f
202305300	Duncan	loot goblin	none	f
202306033	Lewis	loot goblin	none	f
202210084	Pedguin	loot goblin	none	f
202210014	Lewis	loot goblin	none	f
202209243	Osie	loot goblin	none	f
202209200	Ravs	loot goblin	none	f
202306281	Pedguin	loot goblin	none	f
202307010	Daltos	loot goblin	none	f
202307064	Nilesy	loot goblin	none	f
202307185	Shadow	loot goblin	none	f
202307204	Nilesy	loot goblin	none	f
202307273	Kirsty	loot goblin	none	f
202307275	Zylus	loot goblin	none	f
202308010	Rythian	loot goblin	none	f
202308012	Briony	loot goblin	none	f
202308031	Briony	loot goblin	none	f
202308080	Lewis	loot goblin	none	f
202308122	Pedguin	loot goblin	none	f
202308151	Nilesy	loot goblin	none	f
202308194	Rythian	loot goblin	none	f
202308264	Ben	loot goblin	none	f
202308290	Zoey	loot goblin	none	f
202308291	Lewis	loot goblin	none	f
202309052	Pedguin	loot goblin	none	f
202309056	Duncan	loot goblin	none	f
202309023	Nilesy	loot goblin	none	f
202309123	Duncan	loot goblin	none	f
202309160	Nilesy	loot goblin	none	f
202309265	Osie	loot goblin	none	f
202310032	Rythian	loot goblin	none	f
202310104	Zylus	loot goblin	none	f
202310242	Nilesy	loot goblin	none	f
202310311	Kirsty	loot goblin	none	f
202311110	Lewis	loot goblin	none	f
202311170	Daltos	loot goblin	none	f
202311183	Zylus	loot goblin	none	f
202311254	Lewis	loot goblin	none	f
202312232	Osie	loot goblin	none	f
202401020	Briony	loot goblin	none	f
202312300	Daltos	loot goblin	none	f
202210290	Rythian	jester	jester	f
202210291	Ben	jester	jester	f
202210292	Ravs	jester	jester	f
202210293	Kirsty	jester	jester	f
202210220	Boba	jester	jester	f
202210295	Ben	jester	jester	f
202211050	Duncan	jester	jester	f
202211052	Ben	jester	jester	f
202211053	Duncan	jester	jester	f
202211054	Breeh	jester	jester	f
202211082	Lewis	jester	jester	f
202210224	Lewis	jester	jester	f
202210225	Ben	jester	jester	f
202210226	Ben	jester	jester	f
202212105	Osie	jester	jester	f
202212130	Zoey	jester	jester	f
202212133	Osie	jester	jester	f
202212202	Rythian	jester	jester	f
202212204	Ben	jester	jester	f
202212240	Duncan	jester	jester	f
202212245	Duncan	jester	jester	f
202212246	Osie	jester	jester	f
202302281	Lewis	loot goblin	none	t
202212310	Ben	jester	jester	f
202212312	Lewis	jester	jester	f
202301033	Rythian	jester	jester	f
202301073	Ravs	jester	jester	f
202301074	Kirsty	jester	jester	f
202301075	Zylus	jester	jester	f
202301100	Ben	jester	jester	f
202301100	Rythian	jester	jester	f
202301100	Duncan	jester	jester	f
202301100	Kirsty	jester	jester	f
202301100	Ravs	jester	jester	f
202301101	Duncan	jester	jester	f
202301171	Lewis	jester	jester	f
202301210	Lewis	jester	jester	f
202301213	Ben	jester	jester	f
202303112	Kirsty	jester	jester	f
202304010	Lewis	jester	jester	f
202304150	Rythian	jester	jester	f
202305060	Lewis	jester	jester	f
202305063	Boba	jester	jester	f
202305064	Pedguin	jester	jester	f
202210081	Osie	jester	jester	f
202306223	Duncan	jester	jester	f
202306223	Ravs	jester	jester	f
202306223	Zylus	jester	jester	f
202306223	Kirsty	jester	jester	f
202306223	Nilesy	jester	jester	f
202306291	Daltos	jester	jester	f
202307010	Lolip	jester	jester	f
202307015	Ben	jester	jester	f
202307015	Duncan	jester	jester	f
202307015	Kirsty	jester	jester	f
202307015	Nilesy	jester	jester	f
202307015	Daltos	jester	jester	f
202307015	Lolip	jester	jester	f
202307041	Daltos	jester	jester	f
202307044	Zoey	jester	jester	f
202307081	Ben	jester	jester	f
202307111	Nilesy	jester	jester	f
202307112	Breeh	jester	jester	f
202309073	Ravs	jester	jester	f
202309024	Boba	jester	jester	f
202309050	Kirsty	jester	jester	f
202309051	Nilesy	jester	jester	f
202310103	Zylus	jester	jester	f
202310213	Lewis	jester	jester	f
202312046	Ben	jester	jester	f
202312046	Duncan	jester	jester	f
202312046	Rythian	jester	jester	f
202312046	Nilesy	jester	jester	f
202312046	Osie	jester	jester	f
202312141	Lewis	jester	jester	f
202312271	Nilesy	jester	jester	f
202312271	Kirsty	jester	jester	f
202312271	Briony	jester	jester	f
202401064	Kirsty	jester	jester	f
202401092	Ben	jester	jester	f
202401094	Zylus	jester	jester	f
202401132	Lewis	jester	jester	f
202211250	Shadow	informant	traitors	f
202211254	Zoey	informant	traitors	f
202211255	Ben	informant	traitors	f
202210221	Lewis	informant	traitors	f
202210222	Lewis	informant	traitors	f
202210224	Boba	informant	traitors	f
202210226	Breeh	informant	traitors	f
202212130	Duncan	informant	traitors	f
202212131	Lewis	informant	traitors	f
202212275	Zylus	informant	traitors	f
202212310	Kirsty	informant	traitors	f
202212312	Boba	informant	traitors	f
202302073	Rythian	informant	traitors	f
202302211	Pedguin	informant	traitors	f
202304112	Rythian	informant	traitors	f
202305132	Kirsty	informant	traitors	f
202210151	Duncan	informant	traitors	f
202305300	Lewis	informant	traitors	f
202210010	Kirsty	informant	traitors	f
202210013	Ben	informant	traitors	f
202306104	Lewis	informant	traitors	f
202305020	Rythian	shadow	none	f
202305023	Ben	shadow	none	f
202305023	Rythian	shadow	none	f
202305024	Ben	shadow	none	f
202305133	Kirsty	shadow	none	f
202305276	Lewis	shadow	none	f
202305300	Rythian	shadow	none	f
202301212	Ravs	clown	clown	f
202301243	Kirsty	clown	clown	f
202307270	Zylus	clown	clown	f
202309263	Duncan	clown	clown	f
202309301	Zoey	clown	clown	f
202309122	Ravs	clown	clown	f
202310245	Breeh	clown	clown	f
202310210	Zoey	clown	clown	f
202307180	Rythian	impersonator	traitors	f
202301310	Rythian	mad scientist	zombies	t
202301310	Duncan	zombie	zombies	t
202301310	Ravs	paramedic	innocents	t
202301311	Lewis	innocent	innocents	t
202301311	Ben	summoner	traitors	t
202301311	Zylus	innocent	innocents	t
202301311	Duncan	drunk	none	t
202301311	Boba	paramedic	innocents	t
202301311	Pedguin	medium	innocents	t
202301312	Ben	randoman	innocents	t
202301312	Zylus	innocent	innocents	t
202301312	Rythian	innocent	innocents	t
202301312	Duncan	traitor	traitors	t
202301312	Boba	parasite	traitors	t
202301312	Ravs	veteran	innocents	t
202302040	Lewis	turncoat	traitors	t
202302041	Ben	innocent	innocents	t
202302041	Zylus	traitor	traitors	t
202302041	Duncan	traitor	traitors	t
202302041	Boba	summoner	traitors	t
202302041	Pedguin	tracker	innocents	t
202302042	Lewis	traitor	traitors	t
202302042	Ben	turncoat	innocents	t
202302042	Duncan	paladin	innocents	t
202302042	Ravs	innocent	innocents	t
202302042	Pedguin	veteran	innocents	t
202302043	Zylus	traitor	traitors	t
202302043	Rythian	swapper	none	t
202302044	Lewis	traitor	traitors	t
202302044	Ben	zombie	zombies	t
202302044	Zylus	zombie	zombies	t
202302044	Boba	zombie	zombies	t
202302045	Lewis	mad scientist	zombies	t
202302045	Zylus	paramedic	innocents	t
202302045	Rythian	traitor	traitors	t
202302045	Duncan	paladin	innocents	t
202302045	Boba	summoner	traitors	t
202302045	Ravs	innocent	innocents	t
202302045	Pedguin	innocent	innocents	t
202302070	Lewis	traitor	traitors	t
202302070	Ben	parasite	traitors	t
202302070	Zylus	innocent	innocents	t
202302070	Duncan	glitch	innocents	t
202302071	Lewis	innocent	innocents	t
202302071	Ben	innocent	innocents	t
202302071	Zylus	traitor	traitors	t
202302071	Duncan	traitor	traitors	t
202302071	Kirsty	glitch	innocents	t
202302071	Osie	hypnotist	traitors	t
202302072	Lewis	paladin	innocents	t
202302072	Zylus	innocent	innocents	t
202302072	Duncan	veteran	innocents	t
202302072	Osie	innocent	innocents	t
202302073	Ben	tracker	innocents	t
202302073	Zylus	innocent	innocents	t
202302073	Duncan	veteran	innocents	t
202302073	Kirsty	innocent	innocents	t
202302073	Osie	paramedic	innocents	t
202302074	Zylus	innocent	innocents	t
202302074	Duncan	innocent	innocents	t
202302074	Kirsty	traitor	traitors	t
202302074	Osie	medium	innocents	t
202302075	Lewis	paladin	innocents	t
202302075	Ben	turncoat	innocents	t
202302075	Duncan	swapper	none	t
202302075	Kirsty	innocent	innocents	t
202302075	Osie	innocent	innocents	t
202302110	Ben	innocent	innocents	t
202302110	Zylus	traitor	traitors	t
202302110	Rythian	veteran	innocents	t
202302110	Duncan	turncoat	innocents	t
202302110	Kirsty	traitor	traitors	t
202302110	Osie	innocent	innocents	t
202302111	Ben	glitch	innocents	t
202302111	Zylus	paladin	innocents	t
202302111	Rythian	innocent	innocents	t
202302111	Kirsty	traitor	traitors	t
202302111	Osie	parasite	traitors	t
202302112	Lewis	traitor	traitors	t
202302112	Duncan	randoman	innocents	t
202302112	Osie	innocent	innocents	t
202302113	Lewis	paladin	innocents	t
202302113	Zylus	innocent	innocents	t
202302113	Rythian	veteran	innocents	t
202302113	Duncan	traitor	traitors	t
202302113	Osie	innocent	innocents	t
202302114	Lewis	mad scientist	zombies	t
202302114	Ben	traitor	traitors	t
202302114	Zylus	glitch	innocents	t
202302114	Rythian	parasite	traitors	t
202302114	Kirsty	innocent	innocents	t
202302114	Osie	medium	innocents	t
202302140	Zylus	innocent	innocents	t
202302140	Rythian	deputy	innocents	t
202302140	Duncan	paladin	innocents	t
202302140	Osie	innocent	innocents	t
202302072	Ben	jester	jester	t
202302042	Boba	informant	traitors	t
202302072	Kirsty	informant	traitors	t
202302041	Lewis	clown	clown	t
202302070	Osie	clown	clown	t
202302043	Ben	impersonator	traitors	t
202302112	Zylus	impersonator	traitors	t
202302141	Kirsty	summoner	traitors	t
202302141	Osie	innocent	innocents	t
202302142	Lewis	innocent	innocents	t
202302142	Ben	randoman	innocents	t
202302142	Zylus	turncoat	innocents	t
202302142	Rythian	traitor	traitors	t
202302142	Duncan	innocent	innocents	t
202302142	Osie	mad scientist	zombies	t
202302143	Lewis	medium	innocents	t
202302143	Ben	traitor	traitors	t
202302143	Zylus	innocent	innocents	t
202302143	Rythian	innocent	innocents	t
202302143	Osie	deputy	innocents	t
202302144	Duncan	mad scientist	zombies	t
202302180	Lewis	innocent	innocents	t
202302180	Ben	glitch	innocents	t
202302180	Zylus	innocent	innocents	t
202302180	Duncan	traitor	traitors	t
202302180	Osie	hypnotist	traitors	t
202302181	Ben	innocent	innocents	t
202302181	Pedguin	zombie	zombies	t
202302181	Duncan	mad scientist	zombies	t
202302181	Kirsty	deputy	innocents	t
202302181	Osie	parasite	traitors	t
202302181	Ravs	innocent	innocents	t
202302182	Lewis	deputy	innocents	t
202302182	Ben	mad scientist	zombies	t
202302182	Pedguin	randoman	innocents	t
202302182	Kirsty	innocent	innocents	t
202302182	Ravs	zombie	zombies	t
202302210	Ben	zombie	zombies	t
202302210	Zylus	zombie	zombies	t
202302210	Pedguin	zombie	zombies	t
202302210	Kirsty	zombie	zombies	t
202302210	Osie	innocent	innocents	t
202302211	Lewis	innocent	innocents	t
202302211	Ben	tracker	innocents	t
202302211	Zylus	glitch	innocents	t
202302211	Duncan	innocent	innocents	t
202302211	Kirsty	traitor	traitors	t
202302211	Osie	mad scientist	zombies	t
202302211	Ravs	beggar	traitors	t
202302212	Ben	zombie	zombies	t
202302212	Zylus	zombie	zombies	t
202302212	Pedguin	mad scientist	zombies	t
202302212	Duncan	tracker	innocents	t
202302212	Kirsty	zombie	zombies	t
202302212	Osie	traitor	traitors	t
202302212	Ravs	innocent	innocents	t
202302213	Lewis	innocent	innocents	t
202302213	Ben	drunk	none	t
202302213	Pedguin	paladin	innocents	t
202302213	Duncan	parasite	traitors	t
202302213	Osie	innocent	innocents	t
202302213	Ravs	glitch	innocents	t
202302250	Zylus	mad scientist	zombies	t
202302250	Osie	traitor	traitors	t
202302250	Ravs	parasite	traitors	t
202302143	Kirsty	communist	communists	t
202302144	Ben	taxidermist	traitors	t
202302144	Osie	boxer	none	t
202302251	Osie	veteran	innocents	t
202302252	Lewis	randoman	innocents	t
202302252	Ben	innocent	innocents	t
202302252	Zylus	hypnotist	traitors	t
202302252	Pedguin	traitor	traitors	t
202302252	Kirsty	innocent	innocents	t
202302252	Osie	drunk	none	t
202302252	Ravs	turncoat	innocents	t
202302253	Lewis	innocent	innocents	t
202302254	Lewis	zombie	zombies	t
202302254	Ben	zombie	zombies	t
202302280	Lewis	veteran	innocents	t
202302280	Zylus	summoner	traitors	t
202302280	Duncan	drunk	none	t
202302280	Kirsty	innocent	innocents	t
202302182	Osie	jester	jester	t
202302213	Kirsty	clown	clown	t
202302280	Pedguin	clown	clown	t
202302281	Ravs	medium	innocents	t
202302282	Lewis	traitor	traitors	t
202302282	Ben	medium	innocents	t
202302282	Zylus	mad scientist	zombies	t
202302282	Duncan	innocent	innocents	t
202302282	Kirsty	zombie	zombies	t
202302282	Osie	hypnotist	traitors	t
202302282	Ravs	glitch	innocents	t
202302283	Zylus	traitor	traitors	t
202302283	Duncan	innocent	innocents	t
202302283	Kirsty	turncoat	traitors	t
202302283	Osie	tracker	innocents	t
202303040	Shadow	innocent	innocents	t
202303040	Duncan	summoner	traitors	t
202303040	Kirsty	traitor	traitors	t
202303040	Ravs	paladin	innocents	t
202303041	Lewis	beggar	traitors	t
202303041	Ben	mad scientist	zombies	t
202303041	Duncan	innocent	innocents	t
202303041	Rythian	traitor	traitors	t
202303042	Ben	innocent	innocents	t
202303042	Zylus	mad scientist	zombies	t
202303042	Shadow	drunk	none	t
202303042	Duncan	traitor	traitors	t
202303042	Kirsty	hypnotist	traitors	t
202303043	Ben	paramedic	innocents	t
202303043	Shadow	traitor	traitors	t
202303070	Lewis	traitor	traitors	t
202303070	Shadow	innocent	innocents	t
202303070	Duncan	medium	innocents	t
202303071	Lewis	randoman	innocents	t
202303071	Ben	parasite	traitors	t
202303071	Shadow	parasite	traitors	t
202303071	Duncan	randoman	innocents	t
202303071	Kirsty	drunk	none	t
202303071	Rythian	parasite	traitors	t
202303071	Ravs	randoman	innocents	t
202303072	Lewis	turncoat	innocents	t
202303072	Ben	innocent	innocents	t
202303072	Shadow	beggar	traitors	t
202303072	Ravs	traitor	traitors	t
202303073	Lewis	innocent	innocents	t
202303073	Ben	innocent	innocents	t
202303073	Zylus	deputy	innocents	t
202303073	Shadow	medium	innocents	t
202303074	Ben	glitch	innocents	t
202303074	Shadow	innocent	innocents	t
202303074	Duncan	paladin	innocents	t
202303074	Kirsty	innocent	innocents	t
202303074	Rythian	mad scientist	zombies	t
202303074	Ravs	traitor	traitors	t
202303110	Lewis	innocent	innocents	t
202303110	Ben	mad scientist	zombies	t
202303110	Zylus	zombie	zombies	t
202303110	Duncan	innocent	innocents	t
202303110	Kirsty	beggar	none	t
202303110	Ravs	randoman	innocents	t
202303111	Lewis	traitor	traitors	t
202303111	Shadow	turncoat	traitors	t
202303111	Ravs	medium	innocents	t
202303112	Lewis	innocent	innocents	t
202303112	Shadow	medium	innocents	t
202303112	Duncan	innocent	innocents	t
202303113	Ben	paladin	innocents	t
202303113	Zylus	turncoat	innocents	t
202303113	Shadow	innocent	innocents	t
202303113	Duncan	traitor	traitors	t
202303113	Rythian	innocent	innocents	t
202303113	Ravs	summoner	traitors	t
202302283	Ravs	informant	traitors	t
202303041	Zylus	informant	traitors	t
202303043	Zylus	clown	clown	t
202303111	Rythian	clown	clown	t
202303115	Shadow	traitor	traitors	t
202303115	Duncan	paladin	innocents	t
202303115	Kirsty	drunk	none	t
202303115	Rythian	innocent	innocents	t
202303115	Ravs	veteran	innocents	t
202303140	Ben	tracker	innocents	t
202303140	Zylus	innocent	innocents	t
202303140	Duncan	deputy	innocents	t
202303140	Ravs	innocent	innocents	t
202303141	Lewis	innocent	innocents	t
202303141	Ben	paladin	innocents	t
202303141	Zylus	summoner	traitors	t
202303141	Shadow	swapper	none	t
202303141	Duncan	innocent	innocents	t
202303141	Kirsty	veteran	innocents	t
202303141	Ravs	beggar	innocents	t
202303142	Lewis	paladin	innocents	t
202303142	Ben	deputy	innocents	t
202303142	Zylus	traitor	traitors	t
202303142	Duncan	innocent	innocents	t
202303142	Ravs	innocent	innocents	t
202303143	Lewis	tracker	innocents	t
202303143	Ben	innocent	innocents	t
202303143	Zylus	zombie	zombies	t
202303143	Shadow	turncoat	traitors	t
202303143	Kirsty	zombie	zombies	t
202303143	Ravs	mad scientist	zombies	t
202303144	Lewis	traitor	traitors	t
202303144	Ben	zombie	zombies	t
202303144	Zylus	zombie	zombies	t
202303144	Duncan	mad scientist	zombies	t
202303144	Kirsty	zombie	zombies	t
202303144	Ravs	veteran	innocents	t
202303145	Zylus	turncoat	traitors	t
202303180	Lolip	innocent	innocents	t
202303180	Osie	summoner	traitors	t
202303180	Duncan	traitor	traitors	t
202303180	Kirsty	randoman	innocents	t
202303181	Zoey	paladin	innocents	t
202303181	Osie	innocent	innocents	t
202303181	Duncan	innocent	innocents	t
202303181	Kirsty	traitor	traitors	t
202303181	Rythian	beggar	traitors	t
202303181	Ravs	glitch	innocents	t
202303182	Lolip	paramedic	innocents	t
202303182	Zoey	randoman	innocents	t
202303182	Duncan	traitor	traitors	t
202303182	Kirsty	innocent	innocents	t
202303183	Lolip	mad scientist	zombies	t
202303183	Zoey	zombie	zombies	t
202303183	Osie	traitor	traitors	t
202303183	Duncan	innocent	innocents	t
202303183	Kirsty	glitch	innocents	t
202303184	Rythian	innocent	innocents	t
202303185	Lolip	innocent	innocents	t
202303185	Osie	innocent	innocents	t
202303185	Duncan	summoner	traitors	t
202303185	Kirsty	tracker	innocents	t
202303185	Rythian	traitor	traitors	t
202303185	Ravs	innocent	innocents	t
202303186	Duncan	summoner	traitors	t
202303186	Kirsty	traitor	traitors	t
202303186	Rythian	innocent	innocents	t
202303210	Lewis	zombie	zombies	t
202303210	Duncan	zombie	zombies	t
202303210	Kirsty	zombie	zombies	t
202303210	Ravs	innocent	innocents	t
202303211	Lolip	innocent	innocents	t
202303212	Zoey	traitor	traitors	t
202303145	Rythian	jester	jester	t
202303145	Shadow	informant	traitors	t
202303142	Shadow	clown	clown	t
202303183	Rythian	impersonator	traitors	t
202303184	Osie	impersonator	traitors	t
202303213	Osie	veteran	innocents	t
202303213	Kirsty	traitor	traitors	t
202303213	Rythian	innocent	innocents	t
202303214	Lewis	veteran	innocents	t
202303214	Lolip	innocent	innocents	t
202303214	Zoey	traitor	traitors	t
202303214	Duncan	tracker	innocents	t
202303214	Kirsty	summoner	traitors	t
202303214	Ravs	innocent	innocents	t
202303250	Lewis	traitor	traitors	t
202303250	Lolip	innocent	innocents	t
202303250	Zoey	innocent	innocents	t
202303250	Duncan	paladin	innocents	t
202303250	Rythian	deputy	innocents	t
202303251	Zoey	innocent	innocents	t
202303251	Osie	traitor	traitors	t
202303251	Duncan	medium	innocents	t
202303252	Lewis	paramedic	innocents	t
202303252	Lolip	cupid	lovers	t
202303252	Osie	tracker	innocents	t
202303252	Kirsty	innocent	innocents	t
202303252	Ravs	innocent	innocents	t
202303253	Osie	tracker	innocents	t
202303254	Zoey	innocent	innocents	t
202303254	Osie	paladin	innocents	t
202303254	Duncan	paramedic	innocents	t
202303254	Rythian	innocent	innocents	t
202303280	Lewis	medium	innocents	t
202303280	Ben	innocent	innocents	t
202303280	Kirsty	innocent	innocents	t
202303280	Zylus	paramedic	innocents	t
202303281	Duncan	tracker	innocents	t
202303281	Kirsty	innocent	innocents	t
202303281	Rythian	glitch	innocents	t
202303281	Zylus	innocent	innocents	t
202303282	Ben	marshal	innocents	t
202303282	Duncan	traitor	traitors	t
202303282	Kirsty	glitch	innocents	t
202303282	Rythian	innocent	innocents	t
202303282	Zylus	innocent	innocents	t
202303283	Lewis	innocent	innocents	t
202303283	Ben	marshal	innocents	t
202303283	Duncan	traitor	traitors	t
202303283	Ravs	innocent	innocents	t
202304010	Ben	summoner	traitors	t
202304010	Duncan	traitor	traitors	t
202304010	Kirsty	innocent	innocents	t
202304010	Ravs	tracker	innocents	t
202304010	Zylus	innocent	innocents	t
202304011	Lewis	marshal	innocents	t
202304011	Ben	hypnotist	traitors	t
202304011	Kirsty	deputy	innocents	t
202304011	Rythian	innocent	innocents	t
202304012	Duncan	marshal	innocents	t
202304012	Zylus	innocent	innocents	t
202304013	Lewis	traitor	traitors	t
202304013	Zylus	veteran	innocents	t
202304014	Rythian	traitor	traitors	t
202304014	Ravs	innocent	innocents	t
202304014	Zylus	paladin	innocents	t
202304015	Ben	innocent	innocents	t
202304015	Duncan	glitch	innocents	t
202304015	Kirsty	deputy	innocents	t
202303253	Kirsty	jester	jester	t
202304013	Duncan	informant	traitors	t
202304014	Duncan	informant	traitors	t
202303213	Duncan	clown	clown	t
202303214	Rythian	clown	clown	t
202303250	Osie	clown	clown	t
202303280	Rythian	clown	clown	t
202304015	Rythian	clown	clown	t
202303251	Rythian	impersonator	traitors	t
202304041	Ben	glitch	innocents	t
202304041	Kirsty	traitor	traitors	t
202304041	Rythian	innocent	innocents	t
202304041	Ravs	innocent	innocents	t
202304042	Ben	veteran	innocents	t
202304042	Ravs	summoner	traitors	t
202304042	Zylus	traitor	traitors	t
202304043	Lewis	innocent	innocents	t
202304043	Duncan	innocent	innocents	t
202304043	Kirsty	beggar	traitors	t
202304043	Rythian	parasite	traitors	t
202304043	Ravs	paladin	innocents	t
202304043	Zylus	glitch	innocents	t
202304044	Lewis	traitor	traitors	t
202304044	Kirsty	innocent	innocents	t
202304044	Rythian	glitch	innocents	t
202304044	Ravs	traitor	traitors	t
202304080	Lewis	innocent	innocents	t
202304080	Ben	innocent	innocents	t
202304080	Rythian	paladin	innocents	t
202304080	Zylus	traitor	traitors	t
202304080	Zoey	veteran	innocents	t
202304081	Lewis	innocent	innocents	t
202304081	Ben	innocent	innocents	t
202304081	Duncan	innocent	innocents	t
202304081	Shadow	innocent	innocents	t
202304081	Rythian	innocent	innocents	t
202304081	Ravs	innocent	innocents	t
202304082	Shadow	zombie	zombies	t
202304082	Ravs	innocent	innocents	t
202304082	Zylus	zombie	zombies	t
202304082	Zoey	traitor	traitors	t
202304083	Lewis	innocent	innocents	t
202304083	Ben	tracker	innocents	t
202304084	Shadow	traitor	traitors	t
202304084	Zylus	traitor	traitors	t
202304110	Lewis	traitor	traitors	t
202304110	Ben	innocent	innocents	t
202304110	Rythian	traitor	traitors	t
202304110	Ravs	drunk	none	t
202304110	Zoey	innocent	innocents	t
202304111	Ben	veteran	innocents	t
202304111	Duncan	paladin	innocents	t
202304111	Shadow	parasite	traitors	t
202304111	Rythian	innocent	innocents	t
202304111	Zylus	traitor	traitors	t
202304111	Zoey	innocent	innocents	t
202304112	Ben	glitch	innocents	t
202304112	Shadow	mad scientist	zombies	t
202304112	Ravs	innocent	innocents	t
202304112	Zylus	innocent	innocents	t
202304112	Zoey	traitor	traitors	t
202304113	Lewis	zombie	zombies	t
202304113	Ravs	innocent	innocents	t
202304113	Zoey	zombie	zombies	t
202304150	Ravs	traitor	traitors	t
202304151	Lewis	deputy	innocents	t
202304151	Duncan	tracker	innocents	t
202304151	Shadow	deputy	innocents	t
202304040	Ben	jester	jester	t
202304045	Duncan	jester	jester	t
202304083	Ravs	jester	jester	t
202304041	Zylus	informant	traitors	t
202304044	Duncan	informant	traitors	t
202304080	Shadow	informant	traitors	t
202304110	Zylus	informant	traitors	t
202304041	Lewis	clown	clown	t
202304042	Lewis	clown	clown	t
202304150	Zylus	impersonator	traitors	t
202304151	Ben	impersonator	traitors	t
202304152	Zylus	traitor	traitors	t
202304152	Zoey	hypnotist	traitors	t
202304153	Lewis	drunk	none	t
202304153	Ben	innocent	innocents	t
202304153	Shadow	traitor	traitors	t
202304153	Rythian	innocent	innocents	t
202304153	Ravs	paramedic	innocents	t
202304153	Zylus	marshal	innocents	t
202304154	Lewis	paladin	innocents	t
202304154	Ben	glitch	innocents	t
202304154	Duncan	innocent	innocents	t
202304154	Ravs	parasite	traitors	t
202304154	Zylus	beggar	innocents	t
202304154	Zoey	innocent	innocents	t
202304180	Ben	tracker	innocents	t
202304180	Boba	innocent	innocents	t
202304180	Rythian	veteran	innocents	t
202304180	Zylus	innocent	innocents	t
202304181	Lewis	innocent	innocents	t
202304181	Ben	innocent	innocents	t
202304181	Boba	traitor	traitors	t
202304181	Rythian	paladin	innocents	t
202304181	Kirsty	veteran	innocents	t
202304182	Rythian	parasite	traitors	t
202304182	Zylus	traitor	traitors	t
202304183	Ben	paramedic	innocents	t
202304183	Pedguin	traitor	traitors	t
202304183	Kirsty	summoner	traitors	t
202304183	Zylus	marshal	innocents	t
202304184	Lewis	beggar	traitors	t
202304184	Ben	veteran	innocents	t
202304184	Boba	traitor	traitors	t
202304184	Rythian	marshal	innocents	t
202304184	Kirsty	innocent	innocents	t
202304184	Zylus	innocent	innocents	t
202304185	Lewis	hypnotist	traitors	t
202304185	Ben	glitch	innocents	t
202304185	Boba	innocent	innocents	t
202304185	Rythian	traitor	traitors	t
202304185	Kirsty	innocent	innocents	t
202304185	Zylus	innocent	innocents	t
202304220	Ben	innocent	innocents	t
202304220	Boba	traitor	traitors	t
202304220	Kirsty	innocent	innocents	t
202304220	Zylus	traitor	traitors	t
202304221	Lewis	innocent	innocents	t
202304221	Ben	medium	innocents	t
202304221	Rythian	innocent	innocents	t
202304221	Kirsty	cupid	lovers	t
202304221	Zylus	deputy	innocents	t
202304222	Ben	traitor	traitors	t
202304222	Pedguin	cupid	lovers	t
202304222	Rythian	veteran	innocents	t
202304222	Kirsty	innocent	innocents	t
202304223	Ben	traitor	traitors	t
202304223	Boba	innocent	innocents	t
202304224	Ben	traitor	traitors	t
202304224	Pedguin	parasite	traitors	t
202304224	Zylus	innocent	innocents	t
202304225	Lewis	innocent	innocents	t
202304225	Boba	paladin	innocents	t
202304225	Pedguin	glitch	innocents	t
202304225	Rythian	innocent	innocents	t
202304225	Zylus	summoner	traitors	t
202304226	Lewis	innocent	innocents	t
202304226	Ben	innocent	innocents	t
202304226	Boba	randoman	innocents	t
202304226	Pedguin	elf	elves	t
202304226	Rythian	glitch	innocents	t
202304226	Kirsty	summoner	traitors	t
202304227	Lewis	summoner	traitors	t
202304227	Boba	traitor	traitors	t
202304227	Pedguin	glitch	innocents	t
202304227	Kirsty	mad scientist	zombies	t
202304227	Zylus	medium	innocents	t
202304250	Rythian	traitor	traitors	t
202304221	Pedguin	informant	traitors	t
202304222	Zylus	informant	traitors	t
202304182	Lewis	shadow	none	t
202304151	Zylus	clown	clown	t
202304154	Shadow	clown	clown	t
202304180	Lewis	clown	clown	t
202304151	Zoey	impersonator	traitors	t
202304153	Duncan	impersonator	traitors	t
202304253	Zylus	traitor	traitors	t
202304254	Lewis	traitor	traitors	t
202304254	Ben	innocent	innocents	t
202304254	Rythian	innocent	innocents	t
202304254	Zylus	veteran	innocents	t
202304254	Boba	parasite	traitors	t
202304256	Ben	traitor	traitors	t
202304256	Pedguin	cupid	lovers	t
202304257	Ben	veteran	innocents	t
202304258	Lewis	glitch	innocents	t
202304258	Pedguin	traitor	traitors	t
202304290	Ben	veteran	innocents	t
202304290	Ravs	innocent	innocents	t
202304290	Rythian	randoman	innocents	t
202304290	Zoey	innocent	innocents	t
202304291	Lewis	veteran	innocents	t
202304291	Ben	marshal	innocents	t
202304291	Duncan	innocent	innocents	t
202304291	Ravs	innocent	innocents	t
202304291	Kirsty	summoner	traitors	t
202304291	Zoey	clowntective	clown	t
202304292	Duncan	innocent	innocents	t
202304292	Rythian	veteran	innocents	t
202304292	Kirsty	marshal	innocents	t
202304292	Zoey	innocent	innocents	t
202305020	Ben	tracker	innocents	t
202305020	Duncan	innocent	innocents	t
202305020	Ravs	traitor	traitors	t
202305020	Zylus	veteran	innocents	t
202305021	Lewis	innocent	innocents	t
202305021	Ben	paladin	innocents	t
202305021	Duncan	parasite	traitors	t
202305021	Zylus	drunk	none	t
202305021	Kirsty	innocent	innocents	t
202305021	Zoey	glitch	innocents	t
202305022	Lewis	mad scientist	zombies	t
202305022	Duncan	innocent	innocents	t
202305022	Rythian	innocent	innocents	t
202305022	Zoey	tracker	innocents	t
202305024	Lewis	innocent	innocents	t
202305024	Rythian	paramedic	innocents	t
202305024	Zylus	randoman	innocents	t
202305024	Kirsty	traitor	traitors	t
202305024	Zoey	innocent	innocents	t
202305060	Ben	innocent	innocents	t
202305060	Duncan	summoner	traitors	t
202305060	Pedguin	traitor	traitors	t
202305060	Kirsty	traitor	traitors	t
202305060	Boba	paramedic	innocents	t
202305061	Lewis	parasite	traitors	t
202304256	Rythian	informant	traitors	t
202304290	Zylus	shadow	none	t
202304291	Rythian	shadow	none	t
202304292	Lewis	shadow	none	t
202304254	Kirsty	clown	clown	t
202304290	Kirsty	clown	clown	t
202304253	Ben	impersonator	traitors	t
202304257	Rythian	impersonator	traitors	t
202305020	Lewis	impersonator	traitors	t
202305062	Kirsty	glitch	innocents	t
202305063	Ben	traitor	traitors	t
202305063	Duncan	paramedic	innocents	t
202305063	Ravs	paladin	innocents	t
202305063	Pedguin	innocent	innocents	t
202305063	Zylus	innocent	innocents	t
202305064	Ben	innocent	innocents	t
202305064	Kirsty	traitor	traitors	t
202305065	Lewis	innocent	innocents	t
202305065	Ben	traitor	traitors	t
202305065	Pedguin	innocent	innocents	t
202305065	Zylus	parasite	traitors	t
202305065	Kirsty	veteran	innocents	t
202305065	Boba	beggar	none	t
202305090	Pedguin	traitor	traitors	t
202305090	Kirsty	innocent	innocents	t
202305091	Duncan	marshal	innocents	t
202305091	Zylus	drunk	none	t
202305091	Kirsty	traitor	traitors	t
202305092	Ben	innocent	innocents	t
202305092	Duncan	innocent	innocents	t
202305092	Pedguin	deputy	innocents	t
202305093	Kirsty	traitor	traitors	t
202305094	Lewis	innocent	innocents	t
202305094	Ben	traitor	traitors	t
202305094	Ravs	mad scientist	zombies	t
202305094	Pedguin	innocent	innocents	t
202305094	Kirsty	glitch	innocents	t
202305094	Boba	randoman	innocents	t
202305095	Lewis	randoman	innocents	t
202305095	Ravs	glitch	innocents	t
202305095	Pedguin	innocent	innocents	t
202305095	Zylus	innocent	innocents	t
202305095	Kirsty	traitor	traitors	t
202305130	Lewis	traitor	traitors	t
202305130	Ben	mad scientist	zombies	t
202305130	Pedguin	traitor	traitors	t
202305130	Zylus	traitor	traitors	t
202305130	Boba	paramedic	innocents	t
202305131	Lewis	traitor	traitors	t
202305131	Duncan	innocent	innocents	t
202305131	Zylus	parasite	traitors	t
202305132	Ben	traitor	traitors	t
202305132	Duncan	innocent	innocents	t
202305132	Ravs	deputy	innocents	t
202305132	Pedguin	traitor	traitors	t
202305132	Zylus	clowntective	clown	t
202305132	Boba	glitch	innocents	t
202305133	Duncan	hypnotist	traitors	t
202305133	Ravs	traitor	traitors	t
202305134	Lewis	innocent	innocents	t
202305134	Ben	glitch	innocents	t
202305134	Duncan	randoman	innocents	t
202305134	Ravs	innocent	innocents	t
202305134	Zylus	hypnotist	traitors	t
202305134	Kirsty	traitor	traitors	t
202305134	Boba	traitor	traitors	t
202305160	Lewis	traitor	traitors	t
202305160	Ben	parasite	traitors	t
202305160	Duncan	innocent	innocents	t
202305091	Ravs	loot goblin	none	t
202305061	Ben	jester	jester	t
202305064	Ravs	informant	traitors	t
202305092	Boba	informant	traitors	t
202305093	Ben	informant	traitors	t
202305095	Duncan	informant	traitors	t
202305062	Ben	shadow	none	t
202305064	Boba	shadow	none	t
202305092	Lewis	shadow	none	t
202305094	Duncan	shadow	none	t
202305063	Lewis	clown	clown	t
202305091	Ben	impersonator	traitors	t
202305161	Zylus	innocent	innocents	t
202305161	Nilesy	traitor	traitors	t
202305162	Rythian	traitor	traitors	t
202305162	Kirsty	innocent	innocents	t
202305163	Lewis	innocent	innocents	t
202305163	Duncan	drunk	none	t
202305163	Zylus	innocent	innocents	t
202305163	Kirsty	traitor	traitors	t
202305163	Zoey	tracker	innocents	t
202305163	Nilesy	veteran	innocents	t
202305200	Ben	traitor	traitors	t
202305200	Rythian	innocent	innocents	t
202305200	Kirsty	paramedic	innocents	t
202305200	Nilesy	innocent	innocents	t
202305201	Ben	traitor	traitors	t
202305201	Duncan	hypnotist	traitors	t
202305201	Rythian	mad scientist	zombies	t
202305201	Kirsty	innocent	innocents	t
202305201	Nilesy	innocent	innocents	t
202305202	Duncan	glitch	innocents	t
202305202	Rythian	randoman	innocents	t
202305202	Zylus	innocent	innocents	t
202305202	Nilesy	innocent	innocents	t
202305203	Lewis	innocent	innocents	t
202305203	Duncan	veteran	innocents	t
202305203	Rythian	traitor	traitors	t
202305203	Kirsty	medium	innocents	t
202305203	Nilesy	innocent	innocents	t
202305204	Ben	veteran	innocents	t
202305204	Duncan	medium	innocents	t
202305204	Rythian	summoner	traitors	t
202305204	Zylus	innocent	innocents	t
202305204	Nilesy	innocent	innocents	t
202305205	Ben	innocent	innocents	t
202305205	Duncan	innocent	innocents	t
202305205	Rythian	innocent	innocents	t
202305205	Zylus	traitor	traitors	t
202305205	Kirsty	tracker	innocents	t
202305205	Zoey	glitch	innocents	t
202305205	Nilesy	traitor	traitors	t
202210180	Ben	traitor	traitors	t
202210180	Pedguin	summoner	traitors	t
202210180	Gee	tracker	innocents	t
202210181	Boba	innocent	innocents	t
202210181	Gee	traitor	traitors	t
202210182	Lewis	innocent	innocents	t
202210182	Ben	traitor	traitors	t
202210182	Boba	innocent	innocents	t
202210182	Ravs	innocent	innocents	t
202210182	Gee	innocent	innocents	t
202210182	Kirsty	innocent	innocents	t
202210183	Ben	innocent	innocents	t
202210183	Pedguin	parasite	traitors	t
202210183	Ravs	traitor	traitors	t
202210183	Gee	innocent	innocents	t
202210183	Kirsty	deputy	innocents	t
202210184	Lewis	innocent	innocents	t
202210184	Ben	innocent	innocents	t
202210184	Boba	tracker	innocents	t
202210184	Pedguin	deputy	innocents	t
202210184	Kirsty	bee	bees	t
202210150	Rythian	paladin	innocents	t
202210151	Ben	paramedic	innocents	t
202210151	Ravs	innocent	innocents	t
202210151	Rythian	innocent	innocents	t
202210151	Zylus	tracker	innocents	t
202210152	Ben	innocent	innocents	t
202210152	Duncan	traitor	traitors	t
202210152	Rythian	swapper	none	t
202305162	Lewis	jester	jester	t
202210150	Duncan	jester	jester	t
202305200	Zylus	traitor	traitors	t
202305161	Rythian	informant	traitors	t
202210181	Lewis	informant	traitors	t
202305160	Zylus	shadow	none	t
202305161	Zoey	shadow	none	t
202305162	Duncan	shadow	none	t
202305200	Zoey	shadow	none	t
202305201	Lewis	shadow	none	t
202305163	Rythian	clown	clown	t
202305200	Lewis	clown	clown	t
202305202	Zoey	clown	clown	t
202305162	Ben	impersonator	traitors	t
202305203	Zylus	impersonator	traitors	t
202210153	Kirsty	parasite	traitors	t
202210154	Ravs	traitor	traitors	t
202210154	Kirsty	innocent	innocents	t
202210155	Zoey	innocent	innocents	t
202210156	Ravs	innocent	innocents	t
202210156	Rythian	innocent	innocents	t
202210156	Zoey	randoman	innocents	t
202210156	Kirsty	turncoat	innocents	t
202305230	Ben	innocent	innocents	t
202305231	Lewis	traitor	traitors	t
202305231	Duncan	paladin	innocents	t
202305231	Boba	summoner	traitors	t
202305231	Nilesy	paramedic	innocents	t
202305232	Ben	glitch	innocents	t
202305232	Duncan	traitor	traitors	t
202305232	Pedguin	parasite	traitors	t
202305232	Rythian	innocent	innocents	t
202305232	Boba	drunk	none	t
202305232	Nilesy	paladin	innocents	t
202305233	Lewis	randoman	innocents	t
202305233	Ben	deputy	innocents	t
202305233	Rythian	innocent	innocents	t
202305233	Boba	traitor	traitors	t
202305233	Nilesy	innocent	innocents	t
202305234	Lewis	traitor	traitors	t
202305234	Ben	parasite	traitors	t
202305234	Rythian	innocent	innocents	t
202305234	Boba	randoman	innocents	t
202305235	Lewis	traitor	traitors	t
202305235	Ben	traitor	traitors	t
202305235	Duncan	innocent	innocents	t
202305235	Nilesy	traitor	traitors	t
202305270	Ben	traitor	traitors	t
202305270	Pedguin	deputy	innocents	t
202305270	Rythian	hypnotist	traitors	t
202305270	Boba	medium	innocents	t
202305270	Nilesy	innocent	innocents	t
202305271	Lewis	medium	innocents	t
202305271	Ben	glitch	innocents	t
202305271	Pedguin	innocent	innocents	t
202305271	Rythian	innocent	innocents	t
202305271	Nilesy	summoner	traitors	t
202305272	Lewis	marshal	innocents	t
202305272	Duncan	traitor	traitors	t
202305272	Pedguin	glitch	innocents	t
202305272	Boba	innocent	innocents	t
202305272	Nilesy	innocent	innocents	t
202305273	Ben	innocent	innocents	t
202305273	Duncan	parasite	traitors	t
202305273	Pedguin	innocent	innocents	t
202305273	Rythian	mad scientist	zombies	t
202305273	Boba	glitch	innocents	t
202305273	Nilesy	randoman	innocents	t
202305274	Ben	traitor	traitors	t
202305274	Pedguin	medium	innocents	t
202305274	Rythian	innocent	innocents	t
202305274	Boba	innocent	innocents	t
202305274	Nilesy	veteran	innocents	t
202305275	Lewis	innocent	innocents	t
202305275	Boba	traitor	traitors	t
202305275	Nilesy	marshal	innocents	t
202305276	Duncan	glitch	innocents	t
202305276	Pedguin	summoner	traitors	t
202305276	Rythian	traitor	traitors	t
202305276	Boba	innocent	innocents	t
202305300	Ravs	paramedic	innocents	t
202305300	Zylus	innocent	innocents	t
202305300	Kirsty	innocent	innocents	t
202210155	Kirsty	jester	jester	t
202305230	Boba	jester	jester	t
202210154	Ben	informant	traitors	t
202305233	Pedguin	shadow	none	t
202305270	Lewis	shadow	none	t
202305272	Ben	shadow	none	t
202305274	Lewis	shadow	none	t
202305231	Ben	clown	clown	t
202305301	Zylus	innocent	innocents	t
202305301	Kirsty	innocent	innocents	t
202305302	Duncan	innocent	innocents	t
202305302	Rythian	glitch	innocents	t
202305302	Kirsty	innocent	innocents	t
202305302	Zoey	innocent	innocents	t
202305302	Nilesy	paladin	innocents	t
202305303	Lewis	innocent	innocents	t
202305303	Ravs	innocent	innocents	t
202305303	Rythian	hypnotist	traitors	t
202305303	Zoey	tracker	innocents	t
202305303	Nilesy	traitor	traitors	t
202305304	Ravs	glitch	innocents	t
202305304	Zylus	innocent	innocents	t
202305304	Kirsty	randoman	innocents	t
202305304	Zoey	innocent	innocents	t
202210110	Duncan	innocent	innocents	t
202210110	Ravs	hypnotist	traitors	t
202210110	Rythian	turncoat	innocents	t
202210110	Zylus	innocent	innocents	t
202210110	Kirsty	tracker	innocents	t
202210111	Duncan	hypnotist	traitors	t
202210111	Ravs	randoman	innocents	t
202210111	Zylus	traitor	traitors	t
202210111	Kirsty	veteran	innocents	t
202210112	Duncan	innocent	innocents	t
202210112	Ravs	tracker	innocents	t
202210112	Zylus	glitch	innocents	t
202210113	Ben	tracker	innocents	t
202210113	Duncan	innocent	innocents	t
202210113	Rythian	traitor	traitors	t
202210113	Zylus	summoner	traitors	t
202210113	Zoey	veteran	innocents	t
202210113	Kirsty	beggar	traitors	t
202306030	Lewis	summoner	traitors	t
202306030	Duncan	paramedic	innocents	t
202306030	Nilesy	innocent	innocents	t
202306030	Zoey	innocent	innocents	t
202306031	Nilesy	clowntective	clown	t
202306031	Ravs	traitor	traitors	t
202306031	Kirsty	veteran	innocents	t
202306032	Lewis	traitor	traitors	t
202306032	Nilesy	parasite	traitors	t
202306032	Ravs	paladin	innocents	t
202306032	Rythian	glitch	innocents	t
202306032	Zoey	innocent	innocents	t
202306033	Nilesy	traitor	traitors	t
202306033	Ravs	glitch	innocents	t
202306033	Kirsty	summoner	traitors	t
202306033	Zylus	tracker	innocents	t
202306033	Zoey	innocent	innocents	t
202210080	Duncan	randoman	innocents	t
202210080	Ravs	traitor	traitors	t
202210080	Pedguin	innocent	innocents	t
202210080	Osie	innocent	innocents	t
202210080	Boba	turncoat	innocents	t
202210081	Duncan	innocent	innocents	t
202210081	Kirsty	traitor	traitors	t
202210081	Boba	parasite	traitors	t
202210082	Kirsty	summoner	traitors	t
202210082	Boba	traitor	traitors	t
202210082	Osie	drunk	none	t
202210083	Ben	zombie	zombies	t
202210083	Duncan	mad scientist	zombies	t
202210083	Ravs	zombie	zombies	t
202210083	Kirsty	innocent	innocents	t
202210083	Osie	innocent	innocents	t
202210083	Boba	zombie	zombies	t
202210084	Ben	traitor	traitors	t
202210084	Ravs	innocent	innocents	t
202210084	Kirsty	innocent	innocents	t
202210084	Osie	tracker	innocents	t
202210084	Boba	glitch	innocents	t
202210112	Ben	jester	jester	t
202306030	Zylus	jester	jester	t
202305302	Zylus	informant	traitors	t
202210112	Rythian	informant	traitors	t
202306031	Duncan	informant	traitors	t
202305301	Rythian	shadow	none	t
202305303	Duncan	shadow	none	t
202305304	Nilesy	shadow	none	t
202306030	Kirsty	shadow	none	t
202305301	Nilesy	clown	clown	t
202305303	Zylus	clown	clown	t
202210111	Zoey	clown	clown	t
202306033	Rythian	clown	clown	t
202305301	Lewis	impersonator	traitors	t
202210041	Ravs	innocent	innocents	t
202210041	Pedguin	traitor	traitors	t
202210041	Osie	innocent	innocents	t
202210041	Boba	innocent	innocents	t
202210042	Duncan	traitor	traitors	t
202210042	Ravs	innocent	innocents	t
202210042	Kirsty	hypnotist	traitors	t
202210042	Osie	innocent	innocents	t
202210042	Boba	deputy	innocents	t
202210043	Ben	zombie	zombies	t
202210043	Duncan	innocent	innocents	t
202210043	Ravs	innocent	innocents	t
202210043	Pedguin	mad scientist	zombies	t
202210043	Kirsty	traitor	traitors	t
202210043	Boba	hypnotist	traitors	t
202210010	Lewis	innocent	innocents	t
202210010	Ben	beggar	none	t
202210010	Osie	traitor	traitors	t
202210010	Zoey	paladin	innocents	t
202210010	Rythian	turncoat	innocents	t
202210010	Zylus	innocent	innocents	t
202210011	Lewis	parasite	traitors	t
202210011	Osie	traitor	traitors	t
202210011	Rythian	innocent	innocents	t
202210011	Zylus	innocent	innocents	t
202210012	Lewis	innocent	innocents	t
202210012	Ben	deputy	innocents	t
202210012	Kirsty	innocent	innocents	t
202210012	Rythian	tracker	innocents	t
202210013	Lewis	traitor	traitors	t
202210013	Osie	tracker	innocents	t
202210013	Kirsty	innocent	innocents	t
202210013	Zoey	innocent	innocents	t
202210013	Zylus	veteran	innocents	t
202210014	Osie	innocent	innocents	t
202210014	Kirsty	randoman	innocents	t
202210014	Zoey	innocent	innocents	t
202306060	Lewis	innocent	innocents	t
202209270	Ben	innocent	innocents	t
202209270	Osie	summoner	traitors	t
202209270	Kirsty	innocent	innocents	t
202209270	Zoey	veteran	innocents	t
202306060	Ravs	glitch	innocents	t
202306060	Zylus	beggar	innocents	t
202306060	Zoey	paladin	innocents	t
202306060	Nilesy	innocent	innocents	t
202306061	Ravs	traitor	traitors	t
202306061	Rythian	innocent	innocents	t
202306061	Zoey	traitor	traitors	t
202306062	Duncan	traitor	traitors	t
202306062	Ravs	innocent	innocents	t
202306062	Zoey	glitch	innocents	t
202306100	Ben	medium	innocents	t
202306100	Duncan	innocent	innocents	t
202306100	Rythian	innocent	innocents	t
202306100	Daltos	veteran	innocents	t
202306101	Lewis	veteran	innocents	t
202306101	Ben	summoner	traitors	t
202306101	Rythian	innocent	innocents	t
202306101	Zylus	traitor	traitors	t
202306101	Daltos	innocent	innocents	t
202306102	Zylus	innocent	innocents	t
202306102	Daltos	traitor	traitors	t
202306103	Lewis	randoman	innocents	t
202306103	Ben	mad scientist	zombies	t
202306103	Duncan	zombie	zombies	t
202306103	Zylus	zombie	zombies	t
202306103	Zoey	innocent	innocents	t
202306103	Nilesy	parasite	traitors	t
202306104	Ben	medium	innocents	t
202306104	Duncan	innocent	innocents	t
202306104	Rythian	traitor	traitors	t
202306104	Zoey	glitch	innocents	t
202306104	Nilesy	innocent	innocents	t
202209270	Lewis	jester	jester	t
202210040	Duncan	informant	traitors	t
202210041	Kirsty	informant	traitors	t
202306060	Duncan	shadow	none	t
202306061	Lewis	shadow	none	t
202306062	Rythian	shadow	none	t
202306100	Lewis	shadow	none	t
202306101	Nilesy	shadow	none	t
202306102	Nilesy	shadow	none	t
202306104	Zylus	shadow	none	t
202306101	Zoey	clown	clown	t
202306061	Kirsty	impersonator	traitors	t
202306062	Nilesy	impersonator	traitors	t
202306132	Zylus	glitch	innocents	t
202306132	Nilesy	medium	innocents	t
202306133	Lewis	medium	innocents	t
202306133	Ben	traitor	traitors	t
202306133	Duncan	summoner	traitors	t
202306133	Zylus	drunk	none	t
202306133	Nilesy	glitch	innocents	t
202306133	Daltos	innocent	innocents	t
202209271	Lewis	traitor	traitors	t
202209271	Ben	summoner	traitors	t
202209271	Osie	tracker	innocents	t
202209271	Kirsty	glitch	innocents	t
202209271	Rythian	innocent	innocents	t
202209272	Lewis	mad scientist	zombies	t
202209272	Ben	innocent	innocents	t
202209272	Osie	traitor	traitors	t
202209272	Zoey	innocent	innocents	t
202209272	Rythian	zombie	zombies	t
202209272	Zylus	zombie	zombies	t
202209273	Lewis	deputy	innocents	t
202209273	Ben	paladin	innocents	t
202209273	Kirsty	innocent	innocents	t
202209273	Zoey	innocent	innocents	t
202209274	Osie	paladin	innocents	t
202209274	Kirsty	innocent	innocents	t
202209274	Zoey	traitor	traitors	t
202209274	Rythian	innocent	innocents	t
202209274	Zylus	turncoat	traitors	t
202209275	Ben	innocent	innocents	t
202209275	Kirsty	turncoat	innocents	t
202209275	Zoey	medium	innocents	t
202209275	Rythian	innocent	innocents	t
202209240	Lewis	parasite	traitors	t
202209240	Kirsty	paramedic	innocents	t
202209240	Zoey	innocent	innocents	t
202209240	Rythian	innocent	innocents	t
202209240	Zylus	paladin	innocents	t
202209241	Lewis	innocent	innocents	t
202209241	Ben	traitor	traitors	t
202209241	Kirsty	innocent	innocents	t
202209241	Zylus	mad scientist	zombies	t
202209242	Lewis	mad scientist	zombies	t
202209242	Osie	innocent	innocents	t
202209242	Kirsty	innocent	innocents	t
202209242	Rythian	randoman	innocents	t
202209242	Zylus	glitch	innocents	t
202209243	Ben	innocent	innocents	t
202209243	Kirsty	randoman	innocents	t
202209243	Zoey	veteran	innocents	t
202209243	Rythian	innocent	innocents	t
202209244	Lewis	traitor	traitors	t
202209244	Ben	summoner	traitors	t
202209244	Osie	randoman	innocents	t
202209244	Kirsty	deputy	innocents	t
202306130	Ben	innocent	innocents	t
202306130	Duncan	tracker	innocents	t
202306130	Zoey	innocent	innocents	t
202306130	Daltos	traitor	traitors	t
202306131	Lewis	glitch	innocents	t
202306131	Ben	drunk	none	t
202306131	Duncan	summoner	traitors	t
202306131	Rythian	mad scientist	zombies	t
202306131	Zylus	paladin	innocents	t
202306131	Zoey	innocent	innocents	t
202306131	Nilesy	innocent	innocents	t
202306170	Lewis	innocent	innocents	t
202306170	Ben	summoner	traitors	t
202306170	Zylus	traitor	traitors	t
202306170	Zoey	veteran	innocents	t
202306170	Nilesy	innocent	innocents	t
202306170	Daltos	traitor	traitors	t
202306171	Ben	summoner	traitors	t
202306171	Duncan	mad scientist	zombies	t
202306171	Zylus	innocent	innocents	t
202306171	Zoey	innocent	innocents	t
202306171	Daltos	traitor	traitors	t
202306172	Lewis	beggar	traitors	t
202306172	Rythian	veteran	innocents	t
202306172	Zoey	innocent	innocents	t
202306172	Nilesy	tracker	innocents	t
202306172	Daltos	innocent	innocents	t
202306173	Lewis	mad scientist	zombies	t
202306132	Daltos	informant	traitors	t
202209273	Rythian	informant	traitors	t
202306130	Zylus	informant	traitors	t
202306132	Lewis	shadow	none	t
202306133	Zoey	shadow	none	t
202306130	Nilesy	shadow	none	t
202306171	Rythian	shadow	none	t
202306132	Zoey	clown	clown	t
202209271	Zylus	clown	clown	t
202209273	Osie	clown	clown	t
202306130	Rythian	clown	clown	t
202209241	Zoey	impersonator	traitors	t
202306174	Zoey	innocent	innocents	t
202306174	Nilesy	randoman	innocents	t
202306175	Rythian	traitor	traitors	t
202306175	Zylus	hypnotist	traitors	t
202306176	Lewis	mad scientist	zombies	t
202306176	Ben	deputy	innocents	t
202306176	Duncan	innocent	innocents	t
202306176	Nilesy	innocent	innocents	t
202306176	Daltos	randoman	innocents	t
202306200	Lewis	innocent	innocents	t
202306200	Ben	innocent	innocents	t
202306200	Duncan	mad scientist	zombies	t
202306200	Zoey	clowntective	clown	t
202306200	Nilesy	glitch	innocents	t
202306200	Daltos	marshal	innocents	t
202306201	Ben	innocent	innocents	t
202306201	Rythian	innocent	innocents	t
202306201	Zylus	drunk	none	t
202306201	Zoey	mad scientist	zombies	t
202306201	Nilesy	paladin	innocents	t
202306201	Daltos	veteran	innocents	t
202306202	Lewis	traitor	traitors	t
202306202	Zylus	innocent	innocents	t
202306202	Daltos	innocent	innocents	t
202306203	Lewis	traitor	traitors	t
202306203	Zylus	mad scientist	zombies	t
202306204	Lewis	veteran	innocents	t
202306204	Duncan	marshal	innocents	t
202306204	Rythian	traitor	traitors	t
202306204	Zylus	innocent	innocents	t
202306204	Zoey	innocent	innocents	t
202306205	Ben	glitch	innocents	t
202306205	Rythian	paladin	innocents	t
202306205	Zylus	summoner	traitors	t
202306205	Zoey	traitor	traitors	t
202306205	Nilesy	innocent	innocents	t
202306220	Lewis	innocent	innocents	t
202306220	Ben	veteran	innocents	t
202306220	Nilesy	traitor	traitors	t
202306221	Ben	paladin	innocents	t
202306221	Duncan	innocent	innocents	t
202306221	Ravs	veteran	innocents	t
202306221	Kirsty	innocent	innocents	t
202306222	Ben	innocent	innocents	t
202306222	Ravs	mad scientist	zombies	t
202306222	Zylus	zombie	zombies	t
202306222	Osie	deputy	innocents	t
202306222	Kirsty	traitor	traitors	t
202306222	Nilesy	marshal	innocents	t
202306240	Ben	veteran	innocents	t
202306240	Rythian	marshal	innocents	t
202306240	Nilesy	innocent	innocents	t
202306241	Ben	innocent	innocents	t
202306241	Duncan	innocent	innocents	t
202306241	Zylus	parasite	traitors	t
202306241	Pedguin	paramedic	innocents	t
202306241	Kirsty	randoman	innocents	t
202306242	Rythian	paramedic	innocents	t
202306242	Zylus	innocent	innocents	t
202306202	Zoey	informant	traitors	t
202306203	Ben	informant	traitors	t
202306221	Zylus	informant	traitors	t
202306222	Duncan	informant	traitors	t
202306202	Ben	shadow	none	t
202306205	Duncan	shadow	none	t
202306220	Ravs	shadow	none	t
202306221	Nilesy	shadow	none	t
202306242	Duncan	shadow	none	t
202306205	Daltos	clown	clown	t
202306220	Duncan	impersonator	traitors	t
202209200	Zylus	innocent	innocents	t
202209201	Ben	glitch	innocents	t
202209201	Ravs	innocent	innocents	t
202209201	Rythian	mad scientist	zombies	t
202209201	Zylus	parasite	traitors	t
202209201	Lolip	traitor	traitors	t
202209202	Ravs	deputy	innocents	t
202209202	Zylus	deputy	innocents	t
202209202	Lolip	beggar	traitors	t
202209203	Lewis	glitch	innocents	t
202209203	Ben	innocent	innocents	t
202209203	Duncan	medium	innocents	t
202209203	Rythian	innocent	innocents	t
202306280	Ben	innocent	innocents	t
202306280	Rythian	innocent	innocents	t
202306280	Zylus	randoman	innocents	t
202306280	Kirsty	paramedic	innocents	t
202306281	Ben	traitor	traitors	t
202306281	Zylus	paramedic	innocents	t
202306281	Nilesy	summoner	traitors	t
202306282	Ben	deputy	innocents	t
202306282	Zylus	randoman	innocents	t
202306282	Pedguin	innocent	innocents	t
202306282	Nilesy	innocent	innocents	t
202306283	Ben	innocent	innocents	t
202306283	Duncan	innocent	innocents	t
202306283	Rythian	tracker	innocents	t
202306283	Kirsty	traitor	traitors	t
202306284	Ben	summoner	traitors	t
202306284	Duncan	glitch	innocents	t
202306284	Rythian	paladin	innocents	t
202306284	Kirsty	innocent	innocents	t
202306284	Nilesy	innocent	innocents	t
202306290	Lewis	innocent	innocents	t
202306290	Duncan	traitor	traitors	t
202306290	Kirsty	innocent	innocents	t
202306290	Zoey	innocent	innocents	t
202306290	Nilesy	innocent	innocents	t
202306290	Lolip	paladin	innocents	t
202306290	Daltos	innocent	innocents	t
202306292	Lewis	glitch	innocents	t
202306292	Ben	beggar	none	t
202306292	Zoey	paladin	innocents	t
202306292	Nilesy	innocent	innocents	t
202306292	Daltos	innocent	innocents	t
202306293	Lewis	paladin	innocents	t
202306293	Ben	glitch	innocents	t
202306293	Kirsty	innocent	innocents	t
202306293	Nilesy	innocent	innocents	t
202306293	Lolip	traitor	traitors	t
202306294	Lewis	beggar	traitors	t
202306294	Ben	innocent	innocents	t
202306294	Duncan	innocent	innocents	t
202306294	Kirsty	traitor	traitors	t
202306294	Zoey	randoman	innocents	t
202306295	Ben	randoman	innocents	t
202306295	Duncan	randoman	innocents	t
202306295	Kirsty	traitor	traitors	t
202306295	Lolip	randoman	innocents	t
202307010	Lewis	innocent	innocents	t
202307010	Kirsty	deputy	innocents	t
202307010	Zoey	marshal	innocents	t
202307010	Nilesy	innocent	innocents	t
202209203	Ravs	informant	traitors	t
202306280	Pedguin	informant	traitors	t
202306282	Kirsty	informant	traitors	t
202306283	Nilesy	informant	traitors	t
202306280	Duncan	shadow	none	t
202307011	Ben	shadow	none	t
202209203	Zylus	clown	clown	t
202209202	Lewis	impersonator	traitors	t
202209202	Ben	impersonator	traitors	t
202306293	Daltos	impersonator	traitors	t
202307012	Zoey	innocent	innocents	t
202307012	Nilesy	veteran	innocents	t
202307012	Lolip	swapper	none	t
202307013	Lewis	traitor	traitors	t
202307013	Duncan	parasite	traitors	t
202307013	Nilesy	innocent	innocents	t
202307013	Daltos	mad scientist	zombies	t
202307042	Ben	innocent	innocents	t
202307042	Nilesy	paramedic	innocents	t
202307042	Lolip	tracker	innocents	t
202307042	Daltos	innocent	innocents	t
202307043	Lewis	innocent	innocents	t
202307043	Duncan	innocent	innocents	t
202307043	Zoey	veteran	innocents	t
202307043	Nilesy	innocent	innocents	t
202307043	Daltos	tracker	innocents	t
202307061	Rythian	zombie	zombies	t
202307061	Zylus	marshal	innocents	t
202307061	Zoey	innocent	innocents	t
202307061	Kirsty	glitch	innocents	t
202307061	Nilesy	innocent	innocents	t
202307064	Duncan	innocent	innocents	t
202307064	Rythian	paramedic	innocents	t
202307064	Zylus	medium	innocents	t
202307064	Kirsty	innocent	innocents	t
202307064	Breeh	traitor	traitors	t
202307065	Ben	marshal	innocents	t
202307065	Rythian	veteran	innocents	t
202307065	Zylus	innocent	innocents	t
202307065	Kirsty	innocent	innocents	t
202307014	Ben	parasite	traitors	t
202307014	Duncan	randoman	innocents	t
202307014	Zoey	innocent	innocents	t
202307014	Daltos	innocent	innocents	t
202307014	Lolip	traitor	traitors	t
202307040	Ben	glitch	innocents	t
202307040	Kirsty	traitor	traitors	t
202307040	Nilesy	randoman	innocents	t
202307040	Daltos	beggar	traitors	t
202307041	Lewis	innocent	innocents	t
202307041	Duncan	innocent	innocents	t
202307041	Nilesy	traitor	traitors	t
202307041	Lolip	parasite	traitors	t
202307044	Lewis	innocent	innocents	t
202307044	Duncan	veteran	innocents	t
202307044	Kirsty	traitor	traitors	t
202307044	Nilesy	hypnotist	traitors	t
202307044	Lolip	innocent	innocents	t
202307044	Daltos	paladin	innocents	t
202307045	Lewis	tracker	innocents	t
202307045	Ben	innocent	innocents	t
202307045	Kirsty	drunk	none	t
202307045	Nilesy	innocent	innocents	t
202307045	Lolip	paramedic	innocents	t
202307045	Daltos	parasite	traitors	t
202307060	Ben	innocent	innocents	t
202307060	Duncan	beggar	none	t
202307060	Zylus	veteran	innocents	t
202307060	Kirsty	innocent	innocents	t
202307060	Nilesy	tracker	innocents	t
202307060	Breeh	swapper	none	t
202307062	Ben	randoman	innocents	t
202307062	Zylus	zombie	zombies	t
202307062	Kirsty	traitor	traitors	t
202307062	Breeh	innocent	innocents	t
202307063	Ben	innocent	innocents	t
202307063	Duncan	traitor	traitors	t
202307063	Rythian	tracker	innocents	t
202307063	Zylus	traitor	traitors	t
202307061	Breeh	informant	traitors	t
202307064	Ben	informant	traitors	t
202307065	Duncan	informant	traitors	t
202307040	Lolip	informant	traitors	t
202307040	Duncan	shadow	none	t
202307065	Breeh	clown	clown	t
202307045	Zoey	clown	clown	t
202307065	Nilesy	impersonator	traitors	t
202307080	Rythian	zombie	zombies	t
202307080	Zoey	parasite	traitors	t
202307080	Kirsty	zombie	zombies	t
202307080	Nilesy	innocent	innocents	t
202307080	Zylus	zombie	zombies	t
202307081	Duncan	innocent	innocents	t
202307081	Zoey	traitor	traitors	t
202307081	Kirsty	glitch	innocents	t
202307081	Nilesy	innocent	innocents	t
202307081	Breeh	tracker	innocents	t
202307082	Duncan	mad scientist	zombies	t
202307082	Zoey	traitor	traitors	t
202307082	Kirsty	innocent	innocents	t
202307082	Nilesy	hypnotist	traitors	t
202307082	Breeh	traitor	traitors	t
202307082	Zylus	veteran	innocents	t
202307083	Ben	glitch	innocents	t
202307083	Duncan	innocent	innocents	t
202307083	Rythian	innocent	innocents	t
202307083	Zoey	innocent	innocents	t
202307083	Nilesy	marshal	innocents	t
202307110	Duncan	beggar	innocents	t
202307110	Rythian	mad scientist	zombies	t
202307110	Nilesy	traitor	traitors	t
202307111	Ben	zombie	zombies	t
202307111	Rythian	glitch	innocents	t
202307111	Zylus	summoner	traitors	t
202307111	Kirsty	mad scientist	zombies	t
202307111	Breeh	traitor	traitors	t
202307112	Ben	innocent	innocents	t
202307112	Zylus	tracker	innocents	t
202307112	Zoey	mad scientist	zombies	t
202307112	Kirsty	innocent	innocents	t
202307112	Nilesy	veteran	innocents	t
202307113	Duncan	innocent	innocents	t
202307113	Rythian	parasite	traitors	t
202307113	Kirsty	elf	elves	t
202307113	Nilesy	traitor	traitors	t
202307113	Breeh	paramedic	innocents	t
202307130	Ben	queen bee	bees	t
202307130	Duncan	marshal	innocents	t
202307130	Rythian	innocent	innocents	t
202307130	Zylus	glitch	innocents	t
202307130	Kirsty	bee	bees	t
202307130	Nilesy	mad scientist	zombies	t
202307131	Ben	paramedic	innocents	t
202307131	Duncan	innocent	innocents	t
202307131	Rythian	innocent	innocents	t
202307131	Zoey	innocent	innocents	t
202307131	Nilesy	traitor	traitors	t
202307131	Breeh	drunk	none	t
202307150	Duncan	tracker	innocents	t
202307150	Zoey	innocent	innocents	t
202307150	Nilesy	innocent	innocents	t
202307150	Shadow	traitor	traitors	t
202307151	Ben	innocent	innocents	t
202307151	Duncan	innocent	innocents	t
202307151	Rythian	deputy	innocents	t
202307151	Zoey	traitor	traitors	t
202307151	Kirsty	summoner	traitors	t
202307151	Nilesy	beggar	traitors	t
202307151	Shadow	mad scientist	zombies	t
202307152	Ben	innocent	innocents	t
202307152	Duncan	marshal	innocents	t
202307152	Zylus	zombie	zombies	t
202307152	Zoey	mad scientist	zombies	t
202307152	Kirsty	paramedic	innocents	t
202307153	Ben	mad scientist	zombies	t
202307153	Zoey	innocent	innocents	t
202307153	Kirsty	traitor	traitors	t
202307181	Ben	medium	innocents	t
202307181	Duncan	traitor	traitors	t
202307181	Zylus	innocent	innocents	t
202307181	Zoey	deputy	innocents	t
202307181	Kirsty	zombie	zombies	t
202307181	Nilesy	mad scientist	zombies	t
202307181	Shadow	parasite	traitors	t
202307184	Ben	innocent	innocents	t
202307184	Duncan	innocent	innocents	t
202307184	Rythian	traitor	traitors	t
202307184	Zylus	drunk	none	t
202307184	Zoey	paladin	innocents	t
202307081	Zylus	clown	clown	t
202307110	Kirsty	impersonator	traitors	t
202307131	Kirsty	impersonator	traitors	t
202307153	Duncan	impersonator	traitors	t
202307220	Zoey	glitch	innocents	t
202307220	Kirsty	innocent	innocents	t
202307220	Nilesy	innocent	innocents	t
202307221	Duncan	hypnotist	traitors	t
202307221	Rythian	drunk	none	t
202307221	Zylus	innocent	innocents	t
202307221	Zoey	innocent	innocents	t
202307221	Kirsty	traitor	traitors	t
202307223	Ravs	mad scientist	zombies	t
202307223	Rythian	zombie	zombies	t
202307223	Zylus	veteran	innocents	t
202307223	Kirsty	drunk	none	t
202307223	Nilesy	zombie	zombies	t
202307224	Duncan	innocent	innocents	t
202307224	Ravs	beggar	none	t
202307224	Zoey	traitor	traitors	t
202307224	Kirsty	innocent	innocents	t
202307226	Duncan	innocent	innocents	t
202307226	Ravs	innocent	innocents	t
202307226	Rythian	innocent	innocents	t
202307226	Zoey	traitor	traitors	t
202307226	Kirsty	detective	innocents	t
202307132	Rythian	paramedic	innocents	t
202307132	Zoey	innocent	innocents	t
202307132	Kirsty	innocent	innocents	t
202307132	Nilesy	tracker	innocents	t
202307132	Breeh	drunk	none	t
202307133	Zylus	glitch	innocents	t
202307133	Zoey	mad scientist	zombies	t
202307133	Kirsty	innocent	innocents	t
202307133	Nilesy	innocent	innocents	t
202307133	Breeh	zombie	zombies	t
202307134	Ben	mad scientist	zombies	t
202307134	Duncan	deputy	innocents	t
202307134	Rythian	zombie	zombies	t
202307134	Zylus	drunk	none	t
202307134	Nilesy	deputy	innocents	t
202307135	Ben	mad scientist	zombies	t
202307135	Duncan	swapper	none	t
202307135	Zylus	zombie	zombies	t
202307135	Kirsty	zombie	zombies	t
202307135	Nilesy	zombie	zombies	t
202307135	Breeh	summoner	traitors	t
202307154	Ben	hypnotist	traitors	t
202307154	Duncan	innocent	innocents	t
202307154	Zylus	traitor	traitors	t
202307154	Zoey	medium	innocents	t
202307154	Shadow	deputy	innocents	t
202307180	Ben	drunk	none	t
202307180	Zoey	innocent	innocents	t
202307182	Ben	mad scientist	zombies	t
202307182	Kirsty	traitor	traitors	t
202307182	Shadow	innocent	innocents	t
202307183	Ben	innocent	innocents	t
202307183	Zylus	drunk	none	t
202307183	Zoey	randoman	innocents	t
202307183	Kirsty	innocent	innocents	t
202307183	Shadow	paramedic	innocents	t
202307185	Ben	innocent	innocents	t
202307185	Zylus	veteran	innocents	t
202307185	Kirsty	innocent	innocents	t
202307185	Nilesy	traitor	traitors	t
202307200	Lewis	traitor	traitors	t
202307200	Duncan	glitch	innocents	t
202307200	Zoey	medium	innocents	t
202307200	Kirsty	innocent	innocents	t
202307200	Nilesy	innocent	innocents	t
202307201	Lewis	traitor	traitors	t
202307201	Rythian	medium	innocents	t
202307201	Zoey	innocent	innocents	t
202307223	Duncan	informant	traitors	t
202307224	Lewis	informant	traitors	t
202307185	Duncan	informant	traitors	t
202307224	Nilesy	clown	clown	t
202307154	Nilesy	clown	clown	t
202307200	Rythian	clown	clown	t
202307134	Kirsty	impersonator	traitors	t
202307134	Breeh	impersonator	traitors	t
202307202	Nilesy	traitor	traitors	t
202307203	Lewis	glitch	innocents	t
202307203	Duncan	glitch	innocents	t
202307203	Ravs	traitor	traitors	t
202307203	Rythian	glitch	innocents	t
202307203	Zoey	glitch	innocents	t
202307203	Kirsty	glitch	innocents	t
202307203	Nilesy	traitor	traitors	t
202307204	Duncan	innocent	innocents	t
202307204	Ravs	paramedic	innocents	t
202307204	Rythian	marshal	innocents	t
202307204	Zoey	parasite	traitors	t
202307204	Kirsty	innocent	innocents	t
202307205	Duncan	innocent	innocents	t
202307205	Ravs	beggar	innocents	t
202307205	Rythian	veteran	innocents	t
202307205	Zoey	innocent	innocents	t
202307205	Kirsty	tracker	innocents	t
202307206	Duncan	summoner	traitors	t
202307206	Ravs	innocent	innocents	t
202307206	Rythian	randoman	innocents	t
202307206	Zylus	innocent	innocents	t
202307206	Zoey	traitor	traitors	t
202307206	Kirsty	drunk	none	t
202307206	Nilesy	mad scientist	zombies	t
202307222	Lewis	innocent	innocents	t
202307222	Duncan	traitor	traitors	t
202307222	Ravs	parasite	traitors	t
202307222	Rythian	drunk	none	t
202307222	Zylus	innocent	innocents	t
202307222	Zoey	veteran	innocents	t
202307222	Kirsty	tracker	innocents	t
202307225	Duncan	marshal	innocents	t
202307225	Ravs	glitch	innocents	t
202307225	Rythian	traitor	traitors	t
202307225	Zoey	parasite	traitors	t
202307225	Kirsty	innocent	innocents	t
202307250	Lewis	glitch	innocents	t
202307250	Ravs	innocent	innocents	t
202307250	Zylus	innocent	innocents	t
202307250	Zoey	beggar	none	t
202307250	Daltos	tracker	innocents	t
202307251	Ben	parasite	traitors	t
202307251	Ravs	traitor	traitors	t
202307251	Zylus	glitch	innocents	t
202307251	Zoey	beggar	traitors	t
202307251	Nilesy	innocent	innocents	t
202307251	Daltos	innocent	innocents	t
202307252	Lewis	marshal	innocents	t
202307252	Ben	traitor	traitors	t
202307252	Zylus	innocent	innocents	t
202307252	Zoey	innocent	innocents	t
202307252	Kirsty	summoner	traitors	t
202307252	Nilesy	glitch	innocents	t
202307252	Daltos	traitor	traitors	t
202307253	Ben	tracker	innocents	t
202307253	Ravs	paramedic	innocents	t
202307253	Zylus	traitor	traitors	t
202307253	Zoey	innocent	innocents	t
202307253	Nilesy	drunk	none	t
202307253	Daltos	summoner	traitors	t
202307254	Ravs	randoman	innocents	t
202307254	Zoey	innocent	innocents	t
202307254	Kirsty	veteran	innocents	t
202307254	Nilesy	innocent	innocents	t
202307254	Daltos	mad scientist	zombies	t
202307270	Lewis	traitor	traitors	t
202307270	Ben	beggar	traitors	t
202307270	Ravs	innocent	innocents	t
202307270	Zoey	parasite	traitors	t
202307270	Kirsty	deputy	innocents	t
202307270	Nilesy	paladin	innocents	t
202307270	Daltos	innocent	innocents	t
202307271	Lewis	beggar	traitors	t
202307271	Ben	mad scientist	zombies	t
202307271	Ravs	zombie	zombies	t
202307271	Zylus	paladin	innocents	t
202307271	Zoey	zombie	zombies	t
202307271	Kirsty	innocent	innocents	t
202307271	Daltos	traitor	traitors	t
202307272	Ben	zombie	zombies	t
202307272	Ravs	zombie	zombies	t
202307272	Zoey	randoman	innocents	t
202307272	Kirsty	zombie	zombies	t
202307272	Nilesy	mad scientist	zombies	t
202307272	Daltos	zombie	zombies	t
202307273	Ben	deputy	innocents	t
202307273	Zoey	parasite	traitors	t
202307273	Zylus	jester	jester	t
202307202	Duncan	informant	traitors	t
202307204	Zylus	clown	clown	t
202307225	Nilesy	clown	clown	t
202307250	Ben	impersonator	traitors	t
202307275	Daltos	veteran	innocents	t
202307290	Duncan	beggar	none	t
202307290	Zylus	traitor	traitors	t
202307290	Rythian	glitch	innocents	t
202307290	Zoey	traitor	traitors	t
202307290	Kirsty	randoman	innocents	t
202307290	Briony	innocent	innocents	t
202307291	Ben	innocent	innocents	t
202307291	Duncan	tracker	innocents	t
202307291	Zylus	deputy	innocents	t
202307291	Rythian	summoner	traitors	t
202307291	Zoey	traitor	traitors	t
202307292	Lewis	traitor	traitors	t
202307292	Zylus	innocent	innocents	t
202307292	Rythian	innocent	innocents	t
202307292	Zoey	traitor	traitors	t
202307292	Kirsty	veteran	innocents	t
202307293	Lewis	veteran	innocents	t
202307293	Ben	traitor	traitors	t
202307293	Duncan	innocent	innocents	t
202307293	Zylus	mad scientist	zombies	t
202307293	Rythian	medium	innocents	t
202307293	Zoey	traitor	traitors	t
202307294	Ben	veteran	innocents	t
202307294	Zylus	innocent	innocents	t
202307294	Zoey	traitor	traitors	t
202307294	Kirsty	traitor	traitors	t
202307294	Briony	innocent	innocents	t
202307295	Duncan	traitor	traitors	t
202307295	Zoey	beggar	traitors	t
202308010	Lewis	randoman	innocents	t
202308010	Duncan	traitor	traitors	t
202308010	Zoey	paramedic	innocents	t
202308010	Kirsty	mad scientist	zombies	t
202308010	Briony	innocent	innocents	t
202308011	Duncan	innocent	innocents	t
202308011	Rythian	traitor	traitors	t
202308011	Zylus	innocent	innocents	t
202308011	Zoey	paramedic	innocents	t
202308011	Briony	medium	innocents	t
202308012	Duncan	traitor	traitors	t
202308012	Rythian	paladin	innocents	t
202308012	Zylus	innocent	innocents	t
202308012	Zoey	veteran	innocents	t
202308012	Kirsty	innocent	innocents	t
202308013	Zylus	paramedic	innocents	t
202308013	Zoey	marshal	innocents	t
202308014	Lewis	deputy	innocents	t
202308014	Ben	traitor	traitors	t
202308014	Rythian	randoman	innocents	t
202308014	Zoey	innocent	innocents	t
202308014	Kirsty	parasite	traitors	t
202308014	Briony	innocent	innocents	t
202308030	Ben	innocent	innocents	t
202308030	Duncan	innocent	innocents	t
202308030	Zoey	traitor	traitors	t
202308030	Kirsty	veteran	innocents	t
202308030	Nilesy	innocent	innocents	t
202308030	Briony	medium	innocents	t
202308031	Ben	summoner	traitors	t
202308031	Duncan	tracker	innocents	t
202308031	Zoey	traitor	traitors	t
202308031	Kirsty	innocent	innocents	t
202308032	Lewis	innocent	innocents	t
202308032	Ben	mad scientist	zombies	t
202308032	Duncan	hypnotist	traitors	t
202308032	Rythian	veteran	innocents	t
202308032	Zoey	traitor	traitors	t
202308032	Kirsty	marshal	innocents	t
202308032	Briony	deputy	innocents	t
202308033	Ben	drunk	none	t
202308011	Kirsty	jester	jester	t
202307290	Ben	informant	traitors	t
202307293	Briony	informant	traitors	t
202307295	Ben	informant	traitors	t
202308012	Ben	informant	traitors	t
202307294	Rythian	clown	clown	t
202308011	Ben	clown	clown	t
202307292	Briony	impersonator	traitors	t
202308010	Ben	impersonator	traitors	t
202308013	Rythian	impersonator	traitors	t
202308033	Nilesy	innocent	innocents	t
202308033	Briony	marshal	innocents	t
202308034	Lewis	traitor	traitors	t
202308034	Ben	paladin	innocents	t
202308034	Rythian	innocent	innocents	t
202308034	Zoey	beggar	traitors	t
202308034	Briony	mad scientist	zombies	t
202308035	Lewis	mad scientist	zombies	t
202308035	Rythian	innocent	innocents	t
202308035	Zoey	veteran	innocents	t
202308035	Kirsty	traitor	traitors	t
202308035	Briony	paladin	innocents	t
202308050	Ben	drunk	none	t
202308050	Duncan	innocent	innocents	t
202308050	Rythian	innocent	innocents	t
202308050	Zoey	medium	innocents	t
202308050	Briony	veteran	innocents	t
202308051	Lewis	mad scientist	zombies	t
202308051	Ben	paramedic	innocents	t
202308051	Rythian	paramedic	innocents	t
202308051	Kirsty	traitor	traitors	t
202308051	Nilesy	paramedic	innocents	t
202308051	Briony	paramedic	innocents	t
202308052	Lewis	innocent	innocents	t
202308052	Duncan	veteran	innocents	t
202308052	Zoey	traitor	traitors	t
202308052	Kirsty	traitor	traitors	t
202308052	Nilesy	traitor	traitors	t
202308053	Lewis	innocent	innocents	t
202308053	Duncan	innocent	innocents	t
202308053	Rythian	veteran	innocents	t
202308053	Zoey	traitor	traitors	t
202308053	Briony	mad scientist	zombies	t
202308120	Duncan	beggar	none	t
202308120	Rythian	innocent	innocents	t
202308120	Pedguin	traitor	traitors	t
202308120	Nilesy	marshal	innocents	t
202308120	Osie	veteran	innocents	t
202308125	Lewis	randoman	innocents	t
202308125	Duncan	innocent	innocents	t
202308125	Pedguin	traitor	traitors	t
202308125	Nilesy	parasite	traitors	t
202308125	Osie	innocent	innocents	t
202308080	Ben	deputy	innocents	t
202308080	Duncan	innocent	innocents	t
202308080	Zoey	paladin	innocents	t
202308080	Kirsty	innocent	innocents	t
202308081	Ben	traitor	traitors	t
202308081	Duncan	glitch	innocents	t
202308081	Kirsty	marshal	innocents	t
202308081	Nilesy	innocent	innocents	t
202308081	Briony	summoner	traitors	t
202308082	Ben	innocent	innocents	t
202308082	Zoey	drunk	none	t
202308082	Kirsty	glitch	innocents	t
202308082	Nilesy	innocent	innocents	t
202308082	Briony	tracker	innocents	t
202308083	Lewis	innocent	innocents	t
202308083	Duncan	beggar	traitors	t
202308084	Lewis	glitch	innocents	t
202308084	Ben	swapper	none	t
202308084	Duncan	innocent	innocents	t
202308084	Rythian	traitor	traitors	t
202308084	Kirsty	paladin	innocents	t
202308084	Nilesy	innocent	innocents	t
202308084	Briony	parasite	traitors	t
202308121	Lewis	glitch	innocents	t
202308121	Duncan	innocent	innocents	t
202308121	Rythian	innocent	innocents	t
202308121	Nilesy	parasite	traitors	t
202308121	Osie	traitor	traitors	t
202308122	Rythian	innocent	innocents	t
202308122	Nilesy	hypnotist	traitors	t
202308122	Osie	traitor	traitors	t
202308123	Duncan	innocent	innocents	t
202308123	Rythian	traitor	traitors	t
202308123	Zylus	traitor	traitors	t
202308053	Nilesy	jester	jester	t
202308081	Lewis	jester	jester	t
202308034	Duncan	informant	traitors	t
202308120	Zylus	informant	traitors	t
202308080	Nilesy	clown	clown	t
202308081	Rythian	clown	clown	t
202308084	Zoey	clown	clown	t
202308121	Zylus	clown	clown	t
202308035	Nilesy	impersonator	traitors	t
202308124	Duncan	innocent	innocents	t
202308124	Zylus	innocent	innocents	t
202308124	Nilesy	marshal	innocents	t
202308150	Duncan	drunk	none	t
202308150	Rythian	innocent	innocents	t
202308150	Nilesy	paladin	innocents	t
202308150	Kirsty	traitor	traitors	t
202308150	Briony	glitch	innocents	t
202308150	Lolip	innocent	innocents	t
202308151	Duncan	marshal	innocents	t
202308151	Rythian	veteran	innocents	t
202308151	Kirsty	innocent	innocents	t
202308151	Briony	innocent	innocents	t
202308152	Lewis	traitor	traitors	t
202308152	Duncan	innocent	innocents	t
202308152	Rythian	paladin	innocents	t
202308152	Nilesy	innocent	innocents	t
202308152	Kirsty	glitch	innocents	t
202308152	Briony	drunk	none	t
202308153	Duncan	glitch	innocents	t
202308153	Rythian	innocent	innocents	t
202308153	Nilesy	parasite	traitors	t
202308153	Kirsty	clowntective	clown	t
202308153	Briony	marshal	innocents	t
202308153	Lolip	innocent	innocents	t
202308154	Briony	parasite	traitors	t
202308154	Lolip	traitor	traitors	t
202308155	Duncan	veteran	innocents	t
202308155	Rythian	summoner	traitors	t
202308155	Kirsty	randoman	innocents	t
202308155	Lolip	traitor	traitors	t
202308190	Duncan	mad scientist	zombies	t
202308190	Rythian	hypnotist	traitors	t
202308190	Nilesy	paramedic	innocents	t
202308190	Kirsty	hypnotist	traitors	t
202308190	Lolip	paramedic	innocents	t
202308191	Rythian	traitor	traitors	t
202308191	Kirsty	glitch	innocents	t
202308191	Briony	tracker	innocents	t
202308191	Lolip	innocent	innocents	t
202308192	Rythian	innocent	innocents	t
202308192	Nilesy	innocent	innocents	t
202308192	Briony	veteran	innocents	t
202308192	Lolip	randoman	innocents	t
202308193	Lewis	randoman	innocents	t
202308193	Rythian	summoner	traitors	t
202308193	Nilesy	traitor	traitors	t
202308193	Lolip	traitor	traitors	t
202308194	Duncan	medium	innocents	t
202308194	Nilesy	veteran	innocents	t
202308194	Kirsty	queen bee	bees	t
202308194	Briony	bee	bees	t
202308194	Lolip	innocent	innocents	t
202308220	Ben	paladin	innocents	t
202308220	Ravs	mad scientist	zombies	t
202308220	Zoey	veteran	innocents	t
202308220	Nilesy	zombie	zombies	t
202308220	Daltos	zombie	zombies	t
202308221	Rythian	veteran	innocents	t
202308221	Zoey	medium	innocents	t
202308221	Nilesy	innocent	innocents	t
202308221	Daltos	traitor	traitors	t
202308222	Lewis	traitor	traitors	t
202308222	Ben	innocent	innocents	t
202308222	Ravs	deputy	innocents	t
202308222	Zoey	medium	innocents	t
202308222	Daltos	innocent	innocents	t
202308223	Ben	hypnotist	traitors	t
202308223	Ravs	glitch	innocents	t
202308223	Rythian	paladin	innocents	t
202308223	Daltos	innocent	innocents	t
202308250	Lewis	beggar	traitors	t
202308250	Ben	glitch	innocents	t
202308250	Rythian	paladin	innocents	t
202308250	Zoey	innocent	innocents	t
202308250	Nilesy	traitor	traitors	t
202308250	Daltos	innocent	innocents	t
202308251	Rythian	deputy	innocents	t
202308251	Nilesy	traitor	traitors	t
202308251	Daltos	innocent	innocents	t
202308192	Kirsty	jester	jester	t
202308223	Lewis	jester	jester	t
202308221	Ben	informant	traitors	t
202308155	Briony	clown	clown	t
202308222	Nilesy	clown	clown	t
202308191	Lewis	impersonator	traitors	t
202308252	Zoey	innocent	innocents	t
202308252	Nilesy	innocent	innocents	t
202308260	Ben	traitor	traitors	t
202308260	Duncan	veteran	innocents	t
202308260	Zylus	mad scientist	zombies	t
202308260	Kirsty	summoner	traitors	t
202308261	Lewis	innocent	innocents	t
202308261	Ben	glitch	innocents	t
202308261	Duncan	summoner	traitors	t
202308261	Rythian	innocent	innocents	t
202308261	Zoey	marshal	innocents	t
202308261	Kirsty	mad scientist	zombies	t
202308262	Lewis	paladin	innocents	t
202308262	Ben	innocent	innocents	t
202308262	Zylus	paramedic	innocents	t
202308262	Kirsty	innocent	innocents	t
202308263	Lewis	innocent	innocents	t
202308263	Rythian	beggar	none	t
202308263	Zylus	traitor	traitors	t
202308263	Zoey	innocent	innocents	t
202308263	Nilesy	randoman	innocents	t
202308263	Kirsty	veteran	innocents	t
202308264	Lewis	paladin	innocents	t
202308264	Duncan	innocent	innocents	t
202308264	Zoey	traitor	traitors	t
202308264	Nilesy	innocent	innocents	t
202308253	Ben	medium	innocents	t
202308253	Rythian	beggar	traitors	t
202308253	Zoey	innocent	innocents	t
202308253	Nilesy	veteran	innocents	t
202308253	Daltos	innocent	innocents	t
202308290	Ben	beggar	none	t
202308290	Duncan	traitor	traitors	t
202308290	Rythian	tracker	innocents	t
202308290	Kirsty	innocent	innocents	t
202308291	Ben	randoman	innocents	t
202308291	Rythian	swapper	none	t
202308291	Zylus	traitor	traitors	t
202308291	Zoey	innocent	innocents	t
202308291	Kirsty	summoner	traitors	t
202308292	Lewis	paramedic	innocents	t
202308292	Ben	paramedic	innocents	t
202308292	Duncan	paramedic	innocents	t
202308292	Zylus	beggar	traitors	t
202308292	Zoey	paramedic	innocents	t
202308292	Nilesy	hypnotist	traitors	t
202308292	Kirsty	hypnotist	traitors	t
202308293	Lewis	traitor	traitors	t
202308293	Ben	beggar	traitors	t
202308293	Duncan	innocent	innocents	t
202308293	Rythian	innocent	innocents	t
202308293	Zylus	randoman	innocents	t
202308293	Zoey	paramedic	innocents	t
202308293	Kirsty	parasite	traitors	t
202308294	Lewis	traitor	traitors	t
202308294	Ben	mad scientist	zombies	t
202308294	Zylus	innocent	innocents	t
202308294	Zoey	parasite	traitors	t
202308294	Kirsty	innocent	innocents	t
202308295	Duncan	parasite	traitors	t
202308295	Rythian	traitor	traitors	t
202308296	Ben	innocent	innocents	t
202308296	Duncan	innocent	innocents	t
202308296	Rythian	innocent	innocents	t
202308296	Zylus	innocent	innocents	t
202308296	Zoey	innocent	innocents	t
202308296	Nilesy	innocent	innocents	t
202308296	Kirsty	innocent	innocents	t
202308310	Lewis	drunk	none	t
202308310	Ben	innocent	innocents	t
202308310	Rythian	mad scientist	zombies	t
202308310	Nilesy	deputy	innocents	t
202308310	Kirsty	traitor	traitors	t
202308311	Ben	traitor	traitors	t
202308311	Rythian	veteran	innocents	t
202308311	Zylus	randoman	innocents	t
202308312	Lewis	zombie	zombies	t
202308312	Ben	paladin	innocents	t
202308262	Rythian	jester	jester	t
202308263	Duncan	informant	traitors	t
202308310	Zylus	informant	traitors	t
202308261	Nilesy	clown	clown	t
202308264	Zylus	clown	clown	t
202308294	Duncan	clown	clown	t
202308295	Ben	clown	clown	t
202308264	Kirsty	impersonator	traitors	t
202308290	Zylus	impersonator	traitors	t
202308313	Nilesy	traitor	traitors	t
202308313	Kirsty	veteran	innocents	t
202308314	Lewis	glitch	innocents	t
202308315	Lewis	innocent	innocents	t
202308315	Duncan	veteran	innocents	t
202308315	Rythian	marshal	innocents	t
202308315	Zoey	traitor	traitors	t
202308315	Nilesy	innocent	innocents	t
202308315	Kirsty	mad scientist	zombies	t
202309020	Ben	traitor	traitors	t
202309021	Ben	zombie	zombies	t
202309021	Duncan	summoner	traitors	t
202309021	Rythian	paramedic	innocents	t
202309021	Boba	paladin	innocents	t
202309021	Nilesy	innocent	innocents	t
202309021	Kirsty	innocent	innocents	t
202309022	Lewis	summoner	traitors	t
202309022	Boba	traitor	traitors	t
202309022	Kirsty	deputy	innocents	t
202309052	Kirsty	medium	innocents	t
202309053	Lewis	glitch	innocents	t
202309053	Duncan	paladin	innocents	t
202309053	Pedguin	innocent	innocents	t
202309053	Boba	innocent	innocents	t
202309053	Nilesy	traitor	traitors	t
202309053	Kirsty	beggar	innocents	t
202309073	Lewis	mad scientist	zombies	t
202309073	Ben	innocent	innocents	t
202309073	Zoey	glitch	innocents	t
202309073	Nilesy	traitor	traitors	t
202309073	Daltos	paladin	innocents	t
202309023	Ben	innocent	innocents	t
202309023	Duncan	mad scientist	zombies	t
202309023	Rythian	veteran	innocents	t
202309023	Pedguin	innocent	innocents	t
202309023	Kirsty	medium	innocents	t
202309024	Duncan	traitor	traitors	t
202309024	Rythian	paramedic	innocents	t
202309024	Pedguin	parasite	traitors	t
202309024	Kirsty	innocent	innocents	t
202309050	Ben	randoman	innocents	t
202309050	Boba	zombie	zombies	t
202309050	Nilesy	zombie	zombies	t
202309051	Lewis	randoman	innocents	t
202309051	Ben	innocent	innocents	t
202309051	Duncan	glitch	innocents	t
202309051	Rythian	innocent	innocents	t
202309051	Pedguin	mad scientist	zombies	t
202309054	Ben	innocent	innocents	t
202309054	Duncan	detective	innocents	t
202308314	Kirsty	jester	jester	t
202309020	Nilesy	jester	jester	t
202309052	Ben	jester	jester	t
202309073	Duncan	informant	traitors	t
202308312	Kirsty	clown	clown	t
202309022	Nilesy	clown	clown	t
202308315	Ben	impersonator	traitors	t
202309053	Rythian	impersonator	traitors	t
202309055	Pedguin	deputy	innocents	t
202309055	Nilesy	innocent	innocents	t
202309055	Kirsty	summoner	traitors	t
202309070	Ben	innocent	innocents	t
202309070	Rythian	innocent	innocents	t
202309070	Zoey	parasite	traitors	t
202309070	Daltos	traitor	traitors	t
202309071	Lewis	paramedic	innocents	t
202309071	Duncan	innocent	innocents	t
202309071	Ravs	beggar	traitors	t
202309071	Rythian	summoner	traitors	t
202309071	Daltos	innocent	innocents	t
202309072	Lewis	innocent	innocents	t
202309072	Ben	parasite	traitors	t
202309072	Duncan	traitor	traitors	t
202309072	Rythian	glitch	innocents	t
202309072	Nilesy	innocent	innocents	t
202309072	Daltos	randoman	innocents	t
202309074	Lewis	innocent	innocents	t
202309074	Duncan	paladin	innocents	t
202309074	Rythian	innocent	innocents	t
202309074	Zoey	traitor	traitors	t
202309074	Nilesy	beggar	none	t
202309074	Daltos	innocent	innocents	t
202309090	Lewis	innocent	innocents	t
202309090	Ben	innocent	innocents	t
202309090	Duncan	beggar	none	t
202309090	Ravs	summoner	traitors	t
202309090	Daltos	randoman	innocents	t
202309091	Ben	zombie	zombies	t
202309091	Rythian	parasite	traitors	t
202309091	Nilesy	zombie	zombies	t
202309091	Daltos	zombie	zombies	t
202309092	Ben	medium	innocents	t
202309092	Ravs	glitch	innocents	t
202309092	Rythian	innocent	innocents	t
202309092	Daltos	innocent	innocents	t
202309093	Ravs	paladin	innocents	t
202309093	Nilesy	innocent	innocents	t
202309093	Daltos	parasite	traitors	t
202309094	Lewis	paramedic	innocents	t
202309094	Duncan	paramedic	innocents	t
202309094	Ravs	paramedic	innocents	t
202309094	Nilesy	hypnotist	traitors	t
202309094	Daltos	traitor	traitors	t
202309120	Lewis	innocent	innocents	t
202309120	Duncan	randoman	innocents	t
202309120	Ravs	veteran	innocents	t
202309120	Zoey	traitor	traitors	t
202309121	Lewis	mad scientist	zombies	t
202309121	Duncan	innocent	innocents	t
202309121	Ravs	innocent	innocents	t
202309121	Zoey	traitor	traitors	t
202309121	Nilesy	marshal	innocents	t
202309121	Daltos	zombie	zombies	t
202309123	Ben	innocent	innocents	t
202309123	Ravs	beggar	traitors	t
202309123	Rythian	traitor	traitors	t
202309123	Daltos	parasite	traitors	t
202309124	Lewis	innocent	innocents	t
202309124	Ben	traitor	traitors	t
202309124	Duncan	innocent	innocents	t
202309124	Ravs	innocent	innocents	t
202309124	Rythian	traitor	traitors	t
202309124	Nilesy	traitor	traitors	t
202309124	Daltos	veteran	innocents	t
202309162	Ben	innocent	innocents	t
202309162	Duncan	summoner	traitors	t
202309162	Nilesy	deputy	innocents	t
202309162	Zoey	tracker	innocents	t
202309162	Kirsty	mad scientist	zombies	t
202309162	Osie	innocent	innocents	t
202309192	Ben	innocent	innocents	t
202309192	Duncan	tracker	innocents	t
202309192	Zoey	innocent	innocents	t
202309072	Zoey	jester	jester	t
202309090	Rythian	jester	jester	t
202309192	Nilesy	jester	jester	t
202309074	Ravs	informant	traitors	t
202309092	Lewis	informant	traitors	t
202309055	Boba	clown	clown	t
202309091	Zoey	clown	clown	t
202309071	Zoey	impersonator	traitors	t
202309120	Rythian	impersonator	traitors	t
202309230	Nilesy	parasite	traitors	t
202309230	Zoey	veteran	innocents	t
202309230	Kirsty	tracker	innocents	t
202309230	Osie	innocent	innocents	t
202309231	Lewis	deputy	innocents	t
202309231	Duncan	traitor	traitors	t
202309231	Ravs	tracker	innocents	t
202309231	Nilesy	drunk	none	t
202309231	Zoey	innocent	innocents	t
202309231	Osie	innocent	innocents	t
202309232	Ben	hypnotist	traitors	t
202309232	Ravs	marshal	innocents	t
202309232	Nilesy	innocent	innocents	t
202309232	Zoey	clowntective	clown	t
202309232	Kirsty	glitch	innocents	t
202309260	Lewis	medium	innocents	t
202309260	Ben	traitor	traitors	t
202309260	Duncan	innocent	innocents	t
202309260	Ravs	innocent	innocents	t
202309260	Nilesy	innocent	innocents	t
202309260	Kirsty	veteran	innocents	t
202309260	Osie	innocent	innocents	t
202309261	Lewis	randoman	innocents	t
202309261	Nilesy	innocent	innocents	t
202309261	Zoey	paramedic	innocents	t
202309261	Osie	innocent	innocents	t
202309262	Ben	deputy	innocents	t
202309262	Ravs	marshal	innocents	t
202309262	Nilesy	veteran	innocents	t
202309262	Zoey	innocent	innocents	t
202309262	Kirsty	mad scientist	zombies	t
202309263	Lewis	marshal	innocents	t
202309263	Ben	veteran	innocents	t
202309263	Ravs	innocent	innocents	t
202309263	Zoey	mad scientist	zombies	t
202309263	Osie	innocent	innocents	t
202309300	Lewis	innocent	innocents	t
202309300	Ben	mad scientist	zombies	t
202309300	Rythian	zombie	zombies	t
202309300	Zoey	randoman	innocents	t
202309300	Kirsty	hypnotist	traitors	t
202309300	Briony	innocent	innocents	t
202309301	Lewis	glitch	innocents	t
202309301	Ben	summoner	traitors	t
202309301	Duncan	mad scientist	zombies	t
202309301	Rythian	zombie	zombies	t
202309301	Kirsty	innocent	innocents	t
202309301	Briony	randoman	innocents	t
202309301	Zylus	traitor	traitors	t
202309302	Lewis	mad scientist	zombies	t
202309302	Ben	zombie	zombies	t
202309302	Rythian	innocent	innocents	t
202309302	Zoey	innocent	innocents	t
202309302	Kirsty	traitor	traitors	t
202309302	Briony	veteran	innocents	t
202309302	Zylus	zombie	zombies	t
202310030	Lewis	innocent	innocents	t
202310030	Ben	glitch	innocents	t
202310030	Rythian	mad scientist	zombies	t
202310030	Zoey	traitor	traitors	t
202309122	Lewis	innocent	innocents	t
202309122	Ben	summoner	traitors	t
202309122	Duncan	traitor	traitors	t
202309122	Zoey	veteran	innocents	t
202309122	Nilesy	beggar	traitors	t
202309122	Daltos	tracker	innocents	t
202309160	Lewis	innocent	innocents	t
202309160	Ben	tracker	innocents	t
202309160	Duncan	glitch	innocents	t
202309160	Kirsty	parasite	traitors	t
202309160	Osie	traitor	traitors	t
202309161	Lewis	innocent	innocents	t
202309161	Ben	innocent	innocents	t
202309161	Duncan	traitor	traitors	t
202309161	Zoey	mad scientist	zombies	t
202309161	Kirsty	glitch	innocents	t
202309190	Lewis	traitor	traitors	t
202309190	Ben	innocent	innocents	t
202309190	Duncan	traitor	traitors	t
202309190	Nilesy	medium	innocents	t
202309190	Kirsty	glitch	innocents	t
202309190	Osie	traitor	traitors	t
202309191	Lewis	deputy	innocents	t
202309191	Ben	deputy	innocents	t
202309191	Zoey	deputy	innocents	t
202309191	Kirsty	randoman	innocents	t
202309233	Ben	traitor	traitors	t
202309233	Duncan	marshal	innocents	t
202309233	Nilesy	innocent	innocents	t
202309233	Zoey	summoner	traitors	t
202309233	Kirsty	innocent	innocents	t
202309233	Osie	deputy	innocents	t
202309264	Lewis	summoner	traitors	t
202309232	Duncan	jester	jester	t
202309300	Zylus	jester	jester	t
202309263	Nilesy	informant	traitors	t
202309230	Lewis	clown	clown	t
202309231	Ben	clown	clown	t
202309261	Kirsty	impersonator	traitors	t
202309263	Kirsty	impersonator	traitors	t
202309191	Duncan	impersonator	traitors	t
202309191	Osie	impersonator	traitors	t
202309265	Kirsty	zombie	zombies	t
202310031	Lewis	drunk	none	t
202310031	Kirsty	traitor	traitors	t
202310031	Briony	hypnotist	traitors	t
202310032	Lewis	traitor	traitors	t
202310032	Ben	innocent	innocents	t
202310032	Duncan	swapper	none	t
202310032	Zoey	veteran	innocents	t
202310032	Zylus	randoman	innocents	t
202310033	Lewis	innocent	innocents	t
202310033	Duncan	summoner	traitors	t
202310033	Zoey	traitor	traitors	t
202310033	Kirsty	marshal	innocents	t
202310033	Zylus	innocent	innocents	t
202310101	Lewis	innocent	innocents	t
202310101	Ben	traitor	traitors	t
202310101	Kirsty	medium	innocents	t
202310101	Zylus	veteran	innocents	t
202310102	Lewis	beggar	none	t
202310102	Ben	innocent	innocents	t
202310102	Duncan	marshal	innocents	t
202310102	Kirsty	veteran	innocents	t
202310102	Zylus	innocent	innocents	t
202310142	Lewis	innocent	innocents	t
202310142	Ben	innocent	innocents	t
202310142	Duncan	parasite	traitors	t
202310142	Rythian	traitor	traitors	t
202310142	Briony	deputy	innocents	t
202310142	Zylus	paladin	innocents	t
202310143	Lewis	medium	innocents	t
202310143	Ben	beggar	none	t
202310143	Duncan	innocent	innocents	t
202310143	Rythian	traitor	traitors	t
202310143	Kirsty	glitch	innocents	t
202310143	Briony	innocent	innocents	t
202310144	Rythian	marshal	innocents	t
202310144	Zoey	innocent	innocents	t
202310144	Kirsty	veteran	innocents	t
202310030	Kirsty	parasite	traitors	t
202310030	Briony	medium	innocents	t
202310030	Zylus	innocent	innocents	t
202310070	Lewis	innocent	innocents	t
202310070	Zylus	tracker	innocents	t
202310070	Kirsty	innocent	innocents	t
202310070	Shadow	innocent	innocents	t
202310070	Duncan	paramedic	innocents	t
202310071	Ben	veteran	innocents	t
202310071	Rythian	innocent	innocents	t
202310071	Zylus	innocent	innocents	t
202310071	Zoey	randoman	innocents	t
202310071	Kirsty	traitor	traitors	t
202310071	Shadow	innocent	innocents	t
202310071	Duncan	mad scientist	zombies	t
202310100	Lewis	traitor	traitors	t
202310100	Ben	innocent	innocents	t
202310100	Duncan	glitch	innocents	t
202310100	Rythian	traitor	traitors	t
202310100	Zoey	marshal	innocents	t
202310100	Kirsty	innocent	innocents	t
202310100	Briony	innocent	innocents	t
202310104	Duncan	tracker	innocents	t
202310104	Rythian	parasite	traitors	t
202310104	Zoey	traitor	traitors	t
202310104	Kirsty	traitor	traitors	t
202310104	Briony	paramedic	innocents	t
202310140	Lewis	veteran	innocents	t
202309264	Ben	jester	jester	t
202310072	Zylus	jester	jester	t
202310032	Briony	informant	traitors	t
202310031	Zoey	clown	clown	t
202310033	Briony	clown	clown	t
202310142	Zoey	clown	clown	t
202310143	Zoey	clown	clown	t
202310141	Zylus	innocent	innocents	t
202310170	Lewis	parasite	traitors	t
202310170	Ben	marshal	innocents	t
202310170	Rythian	innocent	innocents	t
202310170	Zylus	traitor	traitors	t
202310170	Kirsty	innocent	innocents	t
202310170	Shadow	glitch	innocents	t
202310171	Lewis	traitor	traitors	t
202310171	Ben	innocent	innocents	t
202310171	Rythian	tracker	innocents	t
202310171	Zylus	innocent	innocents	t
202310171	Zoey	traitor	traitors	t
202310171	Kirsty	innocent	innocents	t
202310171	Shadow	hypnotist	traitors	t
202310173	Ben	innocent	innocents	t
202310173	Kirsty	summoner	traitors	t
202310173	Duncan	zombie	zombies	t
202310243	Rythian	beggar	none	t
202310243	Kirsty	veteran	innocents	t
202310243	Nilesy	innocent	innocents	t
202310243	Daltos	medium	innocents	t
202310243	Ben	innocent	innocents	t
202310244	Lewis	summoner	traitors	t
202310244	Breeh	drunk	none	t
202310244	Daltos	innocent	innocents	t
202310244	Ben	traitor	traitors	t
202310245	Lewis	innocent	innocents	t
202310245	Rythian	traitor	traitors	t
202310245	Zylus	veteran	innocents	t
202310245	Kirsty	paladin	innocents	t
202310245	Nilesy	traitor	traitors	t
202310245	Daltos	innocent	innocents	t
202310245	Ben	parasite	traitors	t
202310246	Rythian	marshal	innocents	t
202310246	Zylus	traitor	traitors	t
202310246	Kirsty	deputy	innocents	t
202310246	Breeh	innocent	innocents	t
202310246	Daltos	swapper	none	t
202310246	Ben	innocent	innocents	t
202310280	Lewis	zombie	zombies	t
202310280	Rythian	zombie	zombies	t
202310280	Zylus	zombie	zombies	t
202310280	Nilesy	zombie	zombies	t
202310280	Breeh	zombie	zombies	t
202310280	Ben	zombie	zombies	t
202310282	Kirsty	parasite	traitors	t
202310282	Nilesy	traitor	traitors	t
202310144	Briony	clowntective	clown	t
202310144	Zylus	innocent	innocents	t
202310172	Ben	veteran	innocents	t
202310172	Rythian	innocent	innocents	t
202310172	Kirsty	swapper	none	t
202310172	Shadow	marshal	innocents	t
202310172	Duncan	innocent	innocents	t
202310174	Ben	innocent	innocents	t
202310174	Rythian	beggar	none	t
202310174	Zylus	parasite	traitors	t
202310174	Zoey	veteran	innocents	t
202310174	Kirsty	traitor	traitors	t
202310174	Shadow	innocent	innocents	t
202310210	Lewis	traitor	traitors	t
202310210	Ben	innocent	innocents	t
202310210	Rythian	veteran	innocents	t
202310210	Zylus	innocent	innocents	t
202310210	Kirsty	traitor	traitors	t
202310210	Shadow	hypnotist	traitors	t
202310211	Lewis	innocent	innocents	t
202310211	Ben	innocent	innocents	t
202310211	Zylus	innocent	innocents	t
202310211	Zoey	innocent	innocents	t
202310211	Kirsty	traitor	traitors	t
202310211	Shadow	tracker	innocents	t
202310211	Duncan	deputy	innocents	t
202310212	Lewis	innocent	innocents	t
202310212	Zylus	innocent	innocents	t
202310212	Zoey	detective	innocents	t
202310212	Kirsty	hypnotist	traitors	t
202310212	Shadow	traitor	traitors	t
202310212	Duncan	glitch	innocents	t
202310213	Ben	innocent	innocents	t
202310213	Rythian	traitor	traitors	t
202310244	Nilesy	jester	jester	t
202310140	Kirsty	clown	clown	t
202310170	Zoey	clown	clown	t
202310171	Duncan	clown	clown	t
202310140	Zylus	impersonator	traitors	t
202310213	Shadow	traitor	traitors	t
202310214	Lewis	traitor	traitors	t
202310214	Ben	innocent	innocents	t
202310214	Rythian	tracker	innocents	t
202310214	Zylus	drunk	none	t
202310214	Shadow	veteran	innocents	t
202310214	Duncan	innocent	innocents	t
202310240	Lewis	traitor	traitors	t
202310240	Rythian	summoner	traitors	t
202310240	Zylus	innocent	innocents	t
202310240	Kirsty	randoman	innocents	t
202310241	Rythian	randoman	innocents	t
202310241	Nilesy	mad scientist	zombies	t
202310241	Daltos	innocent	innocents	t
202310241	Ben	traitor	traitors	t
202310281	Lewis	elf	elves	t
202310281	Rythian	traitor	traitors	t
202310281	Breeh	elf	elves	t
202310281	Ben	traitor	traitors	t
202310282	Daltos	innocent	innocents	t
202310282	Ben	deputy	innocents	t
202310310	Rythian	traitor	traitors	t
202310310	Nilesy	beggar	traitors	t
202310310	Breeh	innocent	innocents	t
202310310	Daltos	randoman	innocents	t
202310310	Ben	innocent	innocents	t
202310311	Zylus	traitor	traitors	t
202310311	Nilesy	beggar	traitors	t
202310311	Breeh	innocent	innocents	t
202310311	Ben	innocent	innocents	t
202310312	Lewis	beggar	traitors	t
202310312	Rythian	traitor	traitors	t
202310312	Zylus	innocent	innocents	t
202310312	Nilesy	randoman	innocents	t
202310312	Breeh	innocent	innocents	t
202310312	Daltos	summoner	traitors	t
202310312	Ben	glitch	innocents	t
202310313	Lewis	innocent	innocents	t
202310313	Rythian	innocent	innocents	t
202310313	Zylus	traitor	traitors	t
202310313	Kirsty	detective	innocents	t
202310313	Nilesy	innocent	innocents	t
202310313	Ben	traitor	traitors	t
202310314	Lewis	swapper	none	t
202310314	Rythian	tracker	innocents	t
202310314	Zylus	innocent	innocents	t
202310314	Kirsty	veteran	innocents	t
202310314	Breeh	parasite	traitors	t
202310314	Daltos	innocent	innocents	t
202311040	Duncan	innocent	innocents	t
202311040	Nilesy	traitor	traitors	t
202311040	Pedguin	summoner	traitors	t
202311040	Briony	veteran	innocents	t
202311041	Lewis	traitor	traitors	t
202311041	Duncan	innocent	innocents	t
202311041	Nilesy	veteran	innocents	t
202311041	Pedguin	summoner	traitors	t
202311041	Kirsty	innocent	innocents	t
202311041	Briony	paladin	innocents	t
202311042	Lewis	zombie	zombies	t
202311042	Duncan	zombie	zombies	t
202311042	Rythian	traitor	traitors	t
202311042	Nilesy	mad scientist	zombies	t
202311042	Kirsty	innocent	innocents	t
202311042	Briony	zombie	zombies	t
202311043	Rythian	traitor	traitors	t
202311043	Kirsty	mad scientist	zombies	t
202311070	Duncan	innocent	innocents	t
202311070	Rythian	tracker	innocents	t
202311070	Nilesy	paramedic	innocents	t
202311070	Briony	mad scientist	zombies	t
202311071	Duncan	innocent	innocents	t
202311071	Rythian	parasite	traitors	t
202311071	Nilesy	paramedic	innocents	t
202311071	Pedguin	innocent	innocents	t
202311071	Kirsty	traitor	traitors	t
202310242	Zylus	jester	jester	t
202310310	Kirsty	jester	jester	t
202310311	Rythian	informant	traitors	t
202311043	Briony	informant	traitors	t
202311070	Kirsty	informant	traitors	t
202310214	Kirsty	impersonator	traitors	t
202310241	Kirsty	impersonator	traitors	t
202310310	Lewis	impersonator	traitors	t
202311072	Nilesy	randoman	innocents	t
202311072	Pedguin	traitor	traitors	t
202311072	Kirsty	parasite	traitors	t
202311072	Briony	innocent	innocents	t
202311073	Lewis	veteran	innocents	t
202311073	Duncan	traitor	traitors	t
202311073	Rythian	innocent	innocents	t
202311073	Nilesy	paladin	innocents	t
202311073	Pedguin	drunk	none	t
202311073	Kirsty	taxidermist	traitors	t
202311073	Briony	innocent	innocents	t
202311074	Lewis	tracker	innocents	t
202311074	Duncan	mad scientist	zombies	t
202311074	Rythian	zombie	zombies	t
202311074	Nilesy	zombie	zombies	t
202311074	Pedguin	zombie	zombies	t
202311074	Briony	zombie	zombies	t
202311110	Ben	marshal	innocents	t
202311110	Duncan	summoner	traitors	t
202311110	Zylus	innocent	innocents	t
202311110	Nilesy	innocent	innocents	t
202311110	Osie	veteran	innocents	t
202311110	Daltos	innocent	innocents	t
202311111	Ben	traitor	traitors	t
202311111	Nilesy	summoner	traitors	t
202311112	Ben	randoman	innocents	t
202311112	Duncan	zombie	zombies	t
202311112	Zylus	zombie	zombies	t
202311112	Osie	mad scientist	zombies	t
202311173	Ben	innocent	innocents	t
202311173	Duncan	innocent	innocents	t
202311173	Ravs	innocent	innocents	t
202311173	Nilesy	innocent	innocents	t
202311173	Daltos	innocent	innocents	t
202311174	Ben	innocent	innocents	t
202311174	Ravs	glitch	innocents	t
202311174	Nilesy	innocent	innocents	t
202311174	Osie	tracker	innocents	t
202311180	Ben	zombie	zombies	t
202311180	Duncan	zombie	zombies	t
202311180	Zylus	parasite	traitors	t
202311180	Nilesy	zombie	zombies	t
202311180	Osie	randoman	innocents	t
202311180	Daltos	zombie	zombies	t
202311181	Ben	traitor	traitors	t
202311181	Duncan	innocent	innocents	t
202311181	Ravs	innocent	innocents	t
202311181	Zylus	hypnotist	traitors	t
202311181	Nilesy	traitor	traitors	t
202311181	Daltos	innocent	innocents	t
202311210	Lewis	zombie	zombies	t
202311210	Zylus	zombie	zombies	t
202311210	Boba	innocent	innocents	t
202311211	Lewis	traitor	traitors	t
202311211	Ben	marshal	innocents	t
202311211	Rythian	deputy	innocents	t
202311211	Zylus	innocent	innocents	t
202311211	Nilesy	parasite	traitors	t
202311211	Kirsty	paramedic	innocents	t
202311212	Rythian	mad scientist	zombies	t
202311212	Zylus	zombie	zombies	t
202311212	Nilesy	innocent	innocents	t
202311212	Kirsty	zombie	zombies	t
202311212	Pedguin	marshal	innocents	t
202311213	Rythian	clowntective	clown	t
202311213	Zylus	paramedic	innocents	t
202311213	Nilesy	innocent	innocents	t
202311213	Kirsty	innocent	innocents	t
202311213	Boba	traitor	traitors	t
202311213	Pedguin	beggar	traitors	t
202311113	Lewis	innocent	innocents	t
202311113	Ben	innocent	innocents	t
202311113	Duncan	parasite	traitors	t
202311113	Zylus	traitor	traitors	t
202311113	Nilesy	glitch	innocents	t
202311170	Lewis	randoman	innocents	t
202311170	Ben	innocent	innocents	t
202311112	Daltos	jester	jester	t
202311114	Ravs	jester	jester	t
202311174	Daltos	informant	traitors	t
202311213	Ben	informant	traitors	t
202311174	Zylus	clown	clown	t
202311180	Lewis	clown	clown	t
202311211	Boba	clown	clown	t
202311171	Osie	parasite	traitors	t
202311171	Daltos	innocent	innocents	t
202311172	Duncan	traitor	traitors	t
202311172	Ravs	innocent	innocents	t
202311172	Nilesy	innocent	innocents	t
202311172	Daltos	innocent	innocents	t
202311182	Lewis	innocent	innocents	t
202311182	Ben	mad scientist	zombies	t
202311182	Duncan	innocent	innocents	t
202311182	Ravs	randoman	innocents	t
202311182	Nilesy	veteran	innocents	t
202311183	Lewis	paladin	innocents	t
202311183	Duncan	innocent	innocents	t
202311183	Ravs	parasite	traitors	t
202311183	Nilesy	veteran	innocents	t
202311184	Lewis	traitor	traitors	t
202311184	Ben	innocent	innocents	t
202311184	Ravs	tracker	innocents	t
202311184	Zylus	innocent	innocents	t
202311184	Osie	glitch	innocents	t
202311250	Lewis	innocent	innocents	t
202311250	Ben	medium	innocents	t
202311250	Zylus	mad scientist	zombies	t
202311250	Nilesy	innocent	innocents	t
202311250	Kirsty	veteran	innocents	t
202311250	Boba	drunk	none	t
202311251	Lewis	mad scientist	zombies	t
202311251	Ben	innocent	innocents	t
202311251	Rythian	parasite	traitors	t
202311251	Nilesy	innocent	innocents	t
202311251	Kirsty	drunk	none	t
202311251	Boba	traitor	traitors	t
202311252	Ben	innocent	innocents	t
202311252	Zylus	innocent	innocents	t
202311252	Boba	deputy	innocents	t
202311253	Ben	veteran	innocents	t
202311253	Rythian	innocent	innocents	t
202311253	Zylus	beggar	none	t
202311253	Nilesy	innocent	innocents	t
202311253	Kirsty	traitor	traitors	t
202311253	Pedguin	tracker	innocents	t
202311253	Lewis	parasite	traitors	t
202311254	Ben	veteran	innocents	t
202311254	Zylus	innocent	innocents	t
202311254	Nilesy	innocent	innocents	t
202311254	Kirsty	tracker	innocents	t
202311254	Pedguin	innocent	innocents	t
202312040	Lewis	paramedic	innocents	t
202312040	Ben	traitor	traitors	t
202312040	Duncan	innocent	innocents	t
202312040	Osie	randoman	innocents	t
202312042	Lewis	traitor	traitors	t
202312042	Ben	zombie	zombies	t
202312042	Duncan	parasite	traitors	t
202312042	Rythian	zombie	zombies	t
202312042	Nilesy	innocent	innocents	t
202312043	Duncan	paladin	innocents	t
202312043	Mousie	traitor	traitors	t
202312044	Rythian	traitor	traitors	t
202311183	Daltos	jester	jester	t
202312041	Duncan	jester	jester	t
202312042	Osie	jester	jester	t
202311182	Osie	informant	traitors	t
202311184	Duncan	informant	traitors	t
202311252	Lewis	informant	traitors	t
202312040	Mousie	informant	traitors	t
202312044	Osie	informant	traitors	t
202311252	Pedguin	clown	clown	t
202311253	Boba	clown	clown	t
202312041	Ben	clown	clown	t
202311252	Nilesy	impersonator	traitors	t
202312094	Nilesy	innocent	innocents	t
202312094	Kirsty	medium	innocents	t
202312094	Mousie	innocent	innocents	t
202312141	Ben	traitor	traitors	t
202312141	Rythian	parasite	traitors	t
202312141	Zylus	innocent	innocents	t
202312141	Kirsty	innocent	innocents	t
202312141	Osie	marshal	innocents	t
202312142	Duncan	elf	elves	t
202312142	Rythian	traitor	traitors	t
202312143	Lewis	traitor	traitors	t
202312143	Duncan	paramedic	innocents	t
202312143	Rythian	traitor	traitors	t
202312143	Zylus	traitor	traitors	t
202312143	Kirsty	detective	innocents	t
202312143	Briony	innocent	innocents	t
202312230	Lewis	traitor	traitors	t
202312230	Ben	parasite	traitors	t
202312230	Duncan	innocent	innocents	t
202312230	Rythian	innocent	innocents	t
202312230	Zylus	randoman	innocents	t
202312230	Kirsty	deputy	innocents	t
202312230	Briony	innocent	innocents	t
202312231	Lewis	randoman	innocents	t
202312231	Ben	glitch	innocents	t
202312231	Duncan	beggar	innocents	t
202312231	Rythian	summoner	traitors	t
202312231	Zylus	innocent	innocents	t
202312231	Osie	innocent	innocents	t
202312231	Briony	traitor	traitors	t
202312232	Lewis	innocent	innocents	t
202312232	Rythian	innocent	innocents	t
202312232	Kirsty	veteran	innocents	t
202312232	Briony	tracker	innocents	t
202312233	Lewis	elf	elves	t
202312233	Ben	elf	elves	t
202312233	Rythian	traitor	traitors	t
202312233	Zylus	elf	elves	t
202312233	Kirsty	elf	elves	t
202312233	Osie	innocent	innocents	t
202312233	Briony	elf	elves	t
202312270	Zylus	summoner	traitors	t
202312270	Nilesy	innocent	innocents	t
202312270	Briony	traitor	traitors	t
202312092	Lewis	detective	innocents	t
202312092	Duncan	deputy	innocents	t
202312092	Rythian	innocent	innocents	t
202312092	Nilesy	innocent	innocents	t
202312092	Kirsty	beggar	traitors	t
202312092	Mousie	medium	innocents	t
202312095	Lewis	randoman	innocents	t
202312095	Ben	veteran	innocents	t
202312095	Duncan	innocent	innocents	t
202312095	Rythian	traitor	traitors	t
202312045	Kirsty	jester	jester	t
202312047	Lewis	informant	traitors	t
202312092	Ben	informant	traitors	t
202312232	Ben	clown	clown	t
202312140	Osie	drunk	none	t
202312140	Briony	innocent	innocents	t
202312273	Ben	traitor	traitors	t
202312273	Rythian	zombie	zombies	t
202312273	Zylus	zombie	zombies	t
202312273	Nilesy	paladin	innocents	t
202312273	Briony	parasite	traitors	t
202312273	Daltos	mad scientist	zombies	t
202312274	Zylus	traitor	traitors	t
202312274	Nilesy	paramedic	innocents	t
202312303	Ben	innocent	innocents	t
202312303	Rythian	veteran	innocents	t
202312303	Zylus	innocent	innocents	t
202312303	Nilesy	hypnotist	traitors	t
202312303	Daltos	traitor	traitors	t
202312304	Ben	veteran	innocents	t
202312304	Rythian	traitor	traitors	t
202312304	Nilesy	deputy	innocents	t
202312304	Kirsty	innocent	innocents	t
202312304	Briony	summoner	traitors	t
202312305	Ben	summoner	traitors	t
202312305	Kirsty	beggar	traitors	t
202312305	Briony	traitor	traitors	t
202401020	Lewis	innocent	innocents	t
202401020	Duncan	paladin	innocents	t
202401020	Rythian	glitch	innocents	t
202401020	Osie	innocent	innocents	t
202401021	Lewis	mad scientist	zombies	t
202401021	Duncan	paladin	innocents	t
202401021	Rythian	glitch	innocents	t
202401021	Kirsty	innocent	innocents	t
202401021	Osie	innocent	innocents	t
202401022	Ben	summoner	traitors	t
202401022	Duncan	traitor	traitors	t
202401022	Zylus	traitor	traitors	t
202401022	Briony	mad scientist	zombies	t
202312272	Ben	innocent	innocents	t
202312272	Kirsty	veteran	innocents	t
202312300	Ben	veteran	innocents	t
202312300	Rythian	innocent	innocents	t
202312300	Zylus	innocent	innocents	t
202312300	Nilesy	traitor	traitors	t
202312300	Kirsty	parasite	traitors	t
202312301	Ben	glitch	innocents	t
202312301	Kirsty	traitor	traitors	t
202312301	Briony	marshal	innocents	t
202312301	Daltos	innocent	innocents	t
202312302	Ben	innocent	innocents	t
202312302	Rythian	innocent	innocents	t
202312302	Nilesy	veteran	innocents	t
202312302	Daltos	tracker	innocents	t
202401023	Kirsty	veteran	innocents	t
202401060	Ben	innocent	innocents	t
202401060	Rythian	spy	traitors	t
202401060	Zylus	deputy	innocents	t
202401060	Kirsty	traitor	traitors	t
202401061	Ben	traitor	traitors	t
202401061	Duncan	marshal	innocents	t
202401061	Rythian	guesser	none	t
202401061	Kirsty	spy	traitors	t
202401062	Lewis	innocent	innocents	t
202401062	Ben	paramedic	innocents	t
202401062	Duncan	marshal	innocents	t
202312274	Kirsty	jester	jester	t
202312301	Rythian	informant	traitors	t
202401021	Briony	clown	clown	t
202312302	Kirsty	clown	clown	t
202401060	Nilesy	clown	clown	t
202312140	Kirsty	impersonator	traitors	t
202401063	Rythian	innocent	innocents	t
202401063	Zylus	guesser	none	t
202401063	Nilesy	spy	traitors	t
202401063	Kirsty	traitor	traitors	t
202401064	Duncan	tracker	innocents	t
202401064	Rythian	spy	traitors	t
202401064	Zylus	veteran	innocents	t
202401064	Nilesy	innocent	innocents	t
202401064	Briony	innocent	innocents	t
202401090	Lewis	guesser	none	t
202401090	Ben	medium	innocents	t
202401090	Rythian	spy	traitors	t
202401090	Zylus	innocent	innocents	t
202401090	Nilesy	innocent	innocents	t
202401090	Briony	traitor	traitors	t
202401091	Ben	traitor	traitors	t
202401091	Duncan	beggar	none	t
202401091	Zylus	innocent	innocents	t
202401091	Nilesy	spy	traitors	t
202401091	Briony	innocent	innocents	t
202401092	Duncan	innocent	innocents	t
202401092	Zylus	randoman	innocents	t
202401092	Nilesy	vindicator	none	t
202401092	Kirsty	detective	innocents	t
202401093	Lewis	guesser	none	t
202401093	Ben	spy	traitors	t
202401093	Duncan	veteran	innocents	t
202401093	Kirsty	traitor	traitors	t
202401094	Lewis	innocent	innocents	t
202401094	Duncan	vindicator	none	t
202401094	Rythian	traitor	traitors	t
202401094	Nilesy	innocent	innocents	t
202401094	Kirsty	spy	traitors	t
202401094	Briony	tracker	innocents	t
202401130	Zylus	traitor	traitors	t
202401131	Zylus	vindicator	none	t
202401131	Nilesy	traitor	traitors	t
202401132	Ben	innocent	innocents	t
202401132	Rythian	randoman	innocents	t
202401132	Nilesy	vindicator	innocents	t
202401133	Ben	innocent	innocents	t
202401133	Duncan	vindicator	innocents	t
202401133	Rythian	hive mind	hive mind	t
202401133	Zylus	hive mind	hive mind	t
202401133	Kirsty	mad scientist	zombies	t
202401133	Briony	zombie	zombies	t
202401134	Ben	traitor	traitors	t
202401134	Duncan	randoman	innocents	t
202401134	Rythian	innocent	innocents	t
202401134	Zylus	guesser	none	t
202401134	Nilesy	deputy	innocents	t
202401134	Kirsty	hive mind	hive mind	t
202401134	Briony	innocent	innocents	t
202401135	Ben	innocent	innocents	t
202401135	Nilesy	zombie	zombies	t
202401135	Kirsty	traitor	traitors	t
202401135	Briony	zombie	zombies	t
202302074	Rythian	loot goblin	none	t
202302111	Lewis	loot goblin	none	t
202401064	Ben	clown	clown	t
202302180	Pedguin	loot goblin	none	t
202303115	Zylus	loot goblin	none	t
202303143	Rythian	loot goblin	none	t
202303251	Ravs	loot goblin	none	t
202303252	Duncan	loot goblin	none	t
202303281	Lewis	loot goblin	none	t
202304082	Lewis	loot goblin	none	t
202304111	Lewis	loot goblin	none	t
202304151	Rythian	loot goblin	none	t
202304152	Ravs	loot goblin	none	t
202304225	Kirsty	loot goblin	none	t
202210181	Kirsty	loot goblin	none	t
202210184	Ravs	loot goblin	none	t
202210156	Zylus	loot goblin	none	t
202305302	Lewis	loot goblin	none	t
202210011	Kirsty	loot goblin	none	t
202209274	Lewis	loot goblin	none	t
202209275	Zylus	loot goblin	none	t
202306170	Rythian	loot goblin	none	t
202306204	Nilesy	loot goblin	none	t
202306221	Osie	loot goblin	none	t
202306240	Duncan	loot goblin	none	t
202306241	Nilesy	loot goblin	none	t
202306243	Duncan	loot goblin	none	t
202306292	Kirsty	loot goblin	none	t
202307012	Ben	loot goblin	none	t
202307014	Kirsty	loot goblin	none	t
202307184	Kirsty	loot goblin	none	t
202307133	Ben	loot goblin	none	t
202307205	Zylus	loot goblin	none	t
202307251	Lewis	loot goblin	none	t
202308014	Zylus	loot goblin	none	t
202308033	Lewis	loot goblin	none	t
202308052	Rythian	loot goblin	none	t
202308124	Rythian	loot goblin	none	t
202308191	Nilesy	loot goblin	none	t
202308262	Nilesy	loot goblin	none	t
202308314	Duncan	loot goblin	none	t
202309071	Ben	loot goblin	none	t
202309121	Rythian	loot goblin	none	t
202309233	Lewis	loot goblin	none	t
202310102	Zoey	loot goblin	none	t
202310070	Rythian	loot goblin	none	t
202310170	Duncan	loot goblin	none	t
202310212	Ben	loot goblin	none	t
202310240	Ben	loot goblin	none	t
202310314	Nilesy	loot goblin	none	t
202311174	Lewis	loot goblin	none	t
202311181	Lewis	loot goblin	none	t
202311113	Daltos	loot goblin	none	t
202311171	Lewis	loot goblin	none	t
202311182	Zylus	loot goblin	none	t
202311252	Rythian	loot goblin	none	t
202312043	Kirsty	loot goblin	none	t
202312044	Nilesy	loot goblin	none	t
202312045	Lewis	loot goblin	none	t
202312270	Kirsty	loot goblin	none	t
202312304	Daltos	loot goblin	none	t
202312301	Nilesy	loot goblin	none	t
202301311	Ravs	jester	jester	t
202301313	Duncan	jester	jester	t
202302253	Zylus	jester	jester	t
202303111	Duncan	jester	jester	t
202303182	Rythian	jester	jester	t
202303184	Ravs	jester	jester	t
202303211	Rythian	jester	jester	t
202303283	Zylus	jester	jester	t
202304012	Ben	jester	jester	t
202304112	Duncan	jester	jester	t
202304255	Zylus	jester	jester	t
202304258	Zylus	jester	jester	t
202305090	Ben	jester	jester	t
202305093	Pedguin	jester	jester	t
202306291	Nilesy	jester	jester	t
202306294	Lolip	jester	jester	t
202307132	Ben	jester	jester	t
202307150	Rythian	jester	jester	t
202308083	Ben	jester	jester	t
202309056	Lewis	jester	jester	t
202309025	Nilesy	jester	jester	t
202312047	Duncan	jester	jester	t
202312090	Nilesy	jester	jester	t
202312091	Kirsty	jester	jester	t
202312093	Lewis	jester	jester	t
202401023	Lewis	jester	jester	t
202401131	Lewis	jester	jester	t
202303043	Ravs	informant	traitors	t
202303070	Rythian	informant	traitors	t
202303072	Duncan	informant	traitors	t
202303074	Lewis	informant	traitors	t
202303110	Rythian	informant	traitors	t
202304250	Ben	informant	traitors	t
202210181	Ben	informant	traitors	t
202210150	Zylus	informant	traitors	t
202305275	Duncan	informant	traitors	t
202210080	Kirsty	informant	traitors	t
202306060	Kirsty	informant	traitors	t
202306100	Nilesy	informant	traitors	t
202306102	Ben	informant	traitors	t
202308251	Ravs	informant	traitors	t
202308311	Nilesy	informant	traitors	t
202305023	Zylus	shadow	none	t
202305095	Ben	shadow	none	t
202305131	Kirsty	shadow	none	t
202305202	Ben	shadow	none	t
202305203	Ben	shadow	none	t
202305275	Ben	shadow	none	t
202306032	Zylus	shadow	none	t
202302113	Kirsty	clown	clown	t
202308311	Duncan	clown	clown	t
202309092	Zoey	clown	clown	t
202309093	Ben	clown	clown	t
202309093	Duncan	clown	clown	t
202309120	Daltos	clown	clown	t
202309191	Nilesy	clown	clown	t
202310246	Lewis	clown	clown	t
202310174	Duncan	clown	clown	t
202311212	Boba	clown	clown	t
202401061	Zylus	clown	clown	t
202304183	Boba	impersonator	traitors	t
202304220	Lewis	impersonator	traitors	t
202307182	Nilesy	impersonator	traitors	t
202307201	Duncan	impersonator	traitors	t
202402010	Duncan	clown	clown	t
202402010	Lewis	paladin	innocents	f
202402010	Ben	glitch	innocents	f
202402010	Ravs	innocent	innocents	t
202402010	Boba	deputy	innocents	t
202402010	Nilesy	traitor	traitors	t
202402010	Zylus	summoner	traitors	t
202402011	Duncan	medium	innocents	f
202402011	Lewis	swapper	none	f
202402011	Ben	innocent	innocents	t
202402011	Ravs	traitor	traitors	t
202402011	Zylus	spy	traitors	t
202402011	Nilesy	glitch	innocents	t
202402011	Boba	deputy	innocents	t
202402012	Duncan	glitch	innocents	t
202402012	Lewis	announcer	innocents	f
202402012	Ben	veteran	innocents	f
202402012	Ravs	parasite	traitors	t
202402012	Zylus	traitor	traitors	t
202402012	Nilesy	guesser	none	t
202402012	Boba	innocent	innocents	f
202402013	Duncan	announcer	innocents	t
202402013	Lewis	veteran	innocents	f
202402013	Ben	guesser	none	f
202402013	Ravs	innocent	innocents	t
202402013	Zylus	parasite	traitors	t
202402013	Nilesy	traitor	traitors	t
202402013	Boba	glitch	innocents	f
202402014	Duncan	innocent	innocents	t
202402014	Lewis	faker	none	t
202402014	Ben	traitor	traitors	t
202402014	Ravs	announcer	innocents	t
202402014	Zylus	parasite	traitors	f
202402014	Nilesy	veteran	innocents	t
202402014	Boba	glitch	innocents	t
202402015	Duncan	faker	none	t
202402015	Lewis	innocent	innocents	f
202402015	Ben	innocent	innocents	f
202402015	Ravs	mercenary	innocents	f
202402015	Zylus	traitor	traitors	t
202402015	Nilesy	summoner	traitors	t
202402015	Boba	announcer	innocents	t
202402016	Duncan	paladin	innocents	t
202402016	Lewis	traitor	traitors	t
202402016	Ben	veteran	innocents	t
202402016	Ravs	innocent	innocents	t
202402016	Zylus	deputy	innocents	t
202402016	Nilesy	parasite	traitors	f
202402016	Boba	guesser	none	f
202402060	Duncan	innocent	innocents	t
202402060	Lewis	traitor	traitors	f
202402060	Ben	spy	traitors	f
202402060	Ravs	drunk	none	t
202402060	Zylus	innocent	innocents	t
202402060	Nilesy	faker	none	f
202402060	Kirsty	turncoat	traitors	t
202402060	Rythian	announcer	innocents	t
202402061	Duncan	guesser	none	t
202402061	Lewis	announcer	innocents	t
202402061	Ben	drunk	none	t
202402061	Ravs	innocent	innocents	f
202402061	Zylus	traitor	traitors	t
202402061	Nilesy	traitor	traitors	t
202402061	Kirsty	innocent	innocents	t
202402061	Rythian	innocent	innocents	f
202402062	Duncan	innocent	innocents	t
202402062	Lewis	guesser	none	t
202402062	Ben	announcer	innocents	t
202402062	Ravs	innocent	innocents	f
202402062	Zylus	innocent	innocents	t
202402062	Nilesy	informant	traitors	t
202402062	Kirsty	turncoat	traitors	t
202402062	Rythian	spy	traitors	t
202402063	Duncan	innocent	innocents	t
202402063	Lewis	innocent	innocents	f
202402063	Ben	guesser	none	f
202402063	Ravs	traitor	traitors	t
202402063	Zylus	innocent	innocents	t
202402063	Nilesy	innocent	innocents	f
202402063	Kirsty	announcer	innocents	f
202402063	Rythian	informant	traitors	t
202402064	Duncan	informant	traitors	t
202402064	Lewis	glitch	innocents	f
202402064	Ben	innocent	innocents	t
202402064	Ravs	guesser	none	t
202402064	Zylus	spy	traitors	t
202402064	Nilesy	deputy	innocents	t
202402064	Kirsty	drunk	none	t
202402064	Rythian	announcer	innocents	f
202402100	Lewis	innocent	innocents	t
202402100	Ben	informant	traitors	f
202402100	Duncan	turncoat	innocents	t
202402100	Ravs	announcer	innocents	t
202402100	Rythian	deputy	innocents	t
202402100	Zylus	mercenary	innocents	t
202402100	Nilesy	traitor	traitors	t
202402100	Kirsty	swapper	none	f
202402101	Lewis	spy	traitors	t
202402101	Ben	innocent	innocents	t
202402101	Duncan	impersonator	traitors	f
202402101	Ravs	swapper	none	f
202402101	Rythian	informant	traitors	t
202402101	Zylus	mercenary	innocents	t
202402101	Nilesy	announcer	innocents	t
202402101	Kirsty	glitch	innocents	t
202402102	Lewis	announcer	innocents	t
202402102	Ben	turncoat	innocents	t
202402102	Duncan	traitor	traitors	t
202402102	Ravs	innocent	innocents	f
202402102	Rythian	faker	none	f
202402102	Zylus	impersonator	traitors	t
202402102	Nilesy	mercenary	innocents	t
202402102	Kirsty	innocent	innocents	t
202402103	Lewis	announcer	innocents	f
202402103	Ben	glitch	innocents	t
202402103	Duncan	impersonator	traitors	t
202402103	Ravs	innocent	innocents	f
202402103	Rythian	mercenary	innocents	f
202402103	Zylus	informant	traitors	t
202402103	Nilesy	spy	traitors	t
202402103	Kirsty	swapper	none	f
202402104	Lewis	traitor	traitors	t
202402104	Ben	glitch	innocents	t
202402104	Duncan	innocent	innocents	f
202402104	Ravs	sponge	sponge	t
202402104	Rythian	drunk	none	t
202402104	Zylus	announcer	innocents	t
202402104	Nilesy	deputy	innocents	t
202402104	Kirsty	traitor	traitors	f
202402105	Lewis	innocent	innocents	t
202402105	Ben	innocent	innocents	t
202402105	Duncan	traitor	traitors	t
202402105	Ravs	glitch	innocents	t
202402105	Rythian	announcer	innocents	t
202402105	Zylus	drunk	none	t
202402105	Nilesy	traitor	traitors	t
202402105	Kirsty	deputy	innocents	f
\.


--
-- Data for Name: rounds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rounds (id, winning_team, video, round_start, round_end, jester_killer, guessed, vindicator_killer) FROM stdin;
202211010	innocents	Q5ErlVIH31Q	12	215	\N	\N	\N
202211011	traitors	Q5ErlVIH31Q	237	575	\N	\N	\N
202211012	traitors	Q5ErlVIH31Q	609	853	\N	\N	\N
202211013	innocents	Q5ErlVIH31Q	879	958	\N	\N	\N
202211014	innocents	Q5ErlVIH31Q	994	1087	\N	\N	\N
202211015	innocents	Q5ErlVIH31Q	1104	1242	\N	\N	\N
202210250	traitors	geRFB7ihD3M	13	96	\N	\N	\N
202210251	innocents	geRFB7ihD3M	131	164	\N	\N	\N
202210252	traitors	geRFB7ihD3M	173	565	\N	\N	\N
202210253	traitors	geRFB7ihD3M	611	848	\N	\N	\N
202210254	traitors	geRFB7ihD3M	866	1100	\N	\N	\N
202210290	traitors	fTM_5NZFhRY	16	155	\N	\N	\N
202210291	traitors	fTM_5NZFhRY	184	344	\N	\N	\N
202210294	zombies	fTM_5NZFhRY	711	907	\N	\N	\N
202211051	innocents	eIkEFaar-Qc	224	269	\N	\N	\N
202211052	zombies	eIkEFaar-Qc	304	442	\N	\N	\N
202211055	innocents	eIkEFaar-Qc	706	961	\N	\N	\N
202211080	innocents	H2dmsjSF0Wo	17	113	\N	\N	\N
202211081	innocents	H2dmsjSF0Wo	149	348	\N	\N	\N
202211082	innocents	H2dmsjSF0Wo	356	479	\N	\N	\N
202211083	clown	H2dmsjSF0Wo	495	594	\N	\N	\N
202211084	innocents	H2dmsjSF0Wo	616	718	\N	\N	\N
202211085	traitors	H2dmsjSF0Wo	751	852	\N	\N	\N
202211086	innocents	H2dmsjSF0Wo	871	1029	\N	\N	\N
202211120	traitors	tXmLUmbUJag	66	282	\N	\N	\N
202211121	traitors	tXmLUmbUJag	298	466	\N	\N	\N
202211122	traitors	tXmLUmbUJag	498	630	\N	\N	\N
202211123	traitors	tXmLUmbUJag	666	864	\N	\N	\N
202211150	traitors	u8MzP3B0bMw	7	256	\N	\N	\N
202211152	innocents	u8MzP3B0bMw	555	725	\N	\N	\N
202211153	traitors	u8MzP3B0bMw	743	896	\N	\N	\N
202211154	traitors	u8MzP3B0bMw	931	1114	\N	\N	\N
202211190	innocents	JSq1OPfhJ-Y	98	158	\N	\N	\N
202211191	innocents	JSq1OPfhJ-Y	189	429	\N	\N	\N
202211192	traitors	JSq1OPfhJ-Y	464	565	\N	\N	\N
202211193	innocents	JSq1OPfhJ-Y	603	783	\N	\N	\N
202211194	traitors	JSq1OPfhJ-Y	811	884	\N	\N	\N
202211195	traitors	JSq1OPfhJ-Y	916	993	\N	\N	\N
202211220	traitors	Gkak7LLJOqc	77	239	\N	\N	\N
202211221	innocents	Gkak7LLJOqc	269	330	\N	\N	\N
202211222	innocents	Gkak7LLJOqc	354	638	\N	\N	\N
202211223	innocents	Gkak7LLJOqc	660	765	\N	\N	\N
202211224	innocents	Gkak7LLJOqc	799	982	\N	\N	\N
202211225	innocents	Gkak7LLJOqc	1014	1091	\N	\N	\N
202211251	traitors	otqA9aYtejA	145	311	\N	\N	\N
202211252	zombies	otqA9aYtejA	335	483	\N	\N	\N
202211254	traitors	otqA9aYtejA	642	775	\N	\N	\N
202211255	innocents	otqA9aYtejA	799	930	\N	\N	\N
202211257	innocents	otqA9aYtejA	1046	1197	\N	\N	\N
202212010	traitors	PstAilWgMu4	12	242	\N	\N	\N
202212011	innocents	PstAilWgMu4	277	369	\N	\N	\N
202212012	innocents	PstAilWgMu4	398	568	\N	\N	\N
202212013	innocents	PstAilWgMu4	591	719	\N	\N	\N
202212014	traitors	PstAilWgMu4	752	936	\N	\N	\N
202212030	traitors	WFD4kmH_zpI	111	442	\N	\N	\N
202212031	traitors	WFD4kmH_zpI	474	725	\N	\N	\N
202212032	innocents	WFD4kmH_zpI	755	891	\N	\N	\N
202212033	innocents	WFD4kmH_zpI	925	1253	\N	\N	\N
202212060	innocents	463eWBId7jw	13	497	\N	\N	\N
202212061	zombies	463eWBId7jw	847	1006	\N	\N	\N
202212062	innocents	463eWBId7jw	1039	1344	\N	\N	\N
202212063	innocents	463eWBId7jw	1351	1680	\N	\N	\N
202212064	traitors	463eWBId7jw	1700	1777	\N	\N	\N
202212065	innocents	463eWBId7jw	1812	1895	\N	\N	\N
202212100	innocents	HBfgvCLx808	8	128	\N	\N	\N
202212101	traitors	HBfgvCLx808	162	327	\N	\N	\N
202212102	innocents	HBfgvCLx808	335	441	\N	\N	\N
202212103	innocents	HBfgvCLx808	470	601	\N	\N	\N
202212104	innocents	HBfgvCLx808	628	690	\N	\N	\N
202212105	innocents	HBfgvCLx808	706	793	\N	\N	\N
202212106	traitors	HBfgvCLx808	810	908	\N	\N	\N
202212170	traitors	HDfGua9hZzI	18	237	\N	\N	\N
202212171	innocents	HDfGua9hZzI	268	605	\N	\N	\N
202210292	jester	fTM_5NZFhRY	377	500	Rythian	\N	\N
202210293	jester	fTM_5NZFhRY	539	674	Pedguin	\N	\N
202211053	jester	eIkEFaar-Qc	474	509	Daltos	\N	\N
202211054	jester	eIkEFaar-Qc	543	671	Pedguin	\N	\N
202211151	jester	u8MzP3B0bMw	280	522	Ravs	\N	\N
202211250	jester	otqA9aYtejA	38	113	Zylus	\N	\N
202211253	jester	otqA9aYtejA	551	604	Duncan	\N	\N
202210220	innocents	VRLFaq9XcMc	36	181	\N	\N	\N
202212131	innocents	gIwbQJJlCxw	45	331	\N	\N	\N
202212130	jester	gIwbQJJlCxw	17	38	Rythian	\N	\N
202210221	traitors	VRLFaq9XcMc	214	330	\N	\N	\N
202210222	innocents	VRLFaq9XcMc	364	469	\N	\N	\N
202210223	innocents	VRLFaq9XcMc	509	678	\N	\N	\N
202210224	innocents	VRLFaq9XcMc	711	942	\N	\N	\N
202212172	traitors	HDfGua9hZzI	635	713	\N	\N	\N
202212173	elves	HDfGua9hZzI	738	895	\N	\N	\N
202212174	innocents	HDfGua9hZzI	920	1187	\N	\N	\N
202212200	zombies	0w1LHuToCXI	16	197	\N	\N	\N
202212201	innocents	0w1LHuToCXI	231	435	\N	\N	\N
202212202	innocents	0w1LHuToCXI	471	708	\N	\N	\N
202212203	zombies	0w1LHuToCXI	743	892	\N	\N	\N
202212241	elves	JqqN9U4D9CI	185	349	\N	\N	\N
202212242	innocents	JqqN9U4D9CI	384	521	\N	\N	\N
202212243	traitors	JqqN9U4D9CI	553	672	\N	\N	\N
202212244	elves	JqqN9U4D9CI	706	893	\N	\N	\N
202212245	innocents	JqqN9U4D9CI	926	1065	\N	\N	\N
202212246	traitors	JqqN9U4D9CI	1100	1148	\N	\N	\N
202212270	zombies	m40z1K1TIK4	8	156	\N	\N	\N
202212271	innocents	m40z1K1TIK4	190	342	\N	\N	\N
202212272	innocents	m40z1K1TIK4	375	433	\N	\N	\N
202212273	innocents	m40z1K1TIK4	468	604	\N	\N	\N
202212274	traitors	m40z1K1TIK4	638	770	\N	\N	\N
202212275	innocents	m40z1K1TIK4	806	1023	\N	\N	\N
202212311	innocents	lQ4RQPuvHr0	115	188	\N	\N	\N
202212312	innocents	lQ4RQPuvHr0	220	405	\N	\N	\N
202212313	innocents	lQ4RQPuvHr0	435	555	\N	\N	\N
202212314	traitors	lQ4RQPuvHr0	590	814	\N	\N	\N
202301030	innocents	l1I-S3xaiIY	10	126	\N	\N	\N
202301031	clown	l1I-S3xaiIY	161	440	\N	\N	\N
202301032	traitors	l1I-S3xaiIY	473	592	\N	\N	\N
202301033	traitors	l1I-S3xaiIY	626	782	\N	\N	\N
202301034	traitors	l1I-S3xaiIY	816	987	\N	\N	\N
202301070	innocents	GBrckzwMvTQ	28	230	\N	\N	\N
202301071	traitors	GBrckzwMvTQ	263	422	\N	\N	\N
202301072	zombies	GBrckzwMvTQ	457	593	\N	\N	\N
202301075	innocents	GBrckzwMvTQ	848	1022	\N	\N	\N
202301035	innocents	l1I-S3xaiIY	1017	1222	\N	\N	\N
202301100	traitors	YAf7W6AcqNs	14	147	\N	\N	\N
202301101	innocents	YAf7W6AcqNs	183	312	\N	\N	\N
202301102	traitors	YAf7W6AcqNs	344	463	\N	\N	\N
202301103	traitors	YAf7W6AcqNs	484	561	\N	\N	\N
202301104	traitors	YAf7W6AcqNs	585	796	\N	\N	\N
202301105	zombies	YAf7W6AcqNs	821	1029	\N	\N	\N
202301140	traitors	62m9fsf4iDM	14	50	\N	\N	\N
202301141	traitors	62m9fsf4iDM	85	202	\N	\N	\N
202301142	traitors	62m9fsf4iDM	236	547	\N	\N	\N
202301143	clown	62m9fsf4iDM	575	911	\N	\N	\N
202301170	clown	qJQsEevyU6U	9	213	\N	\N	\N
202301172	innocents	qJQsEevyU6U	302	414	\N	\N	\N
202301173	clown	qJQsEevyU6U	438	663	\N	\N	\N
202301174	zombies	qJQsEevyU6U	692	974	\N	\N	\N
202301210	traitors	v1pj4S1cxKw	8	194	\N	\N	\N
202301211	innocents	v1pj4S1cxKw	225	444	\N	\N	\N
202301212	clown	v1pj4S1cxKw	476	625	\N	\N	\N
202301213	innocents	v1pj4S1cxKw	643	767	\N	\N	\N
202301214	zombies	v1pj4S1cxKw	801	914	\N	\N	\N
202301215	innocents	v1pj4S1cxKw	925	1075	\N	\N	\N
202301240	traitors	329BUNbvbVo	52	318	\N	\N	\N
202301241	innocents	329BUNbvbVo	347	444	\N	\N	\N
202301242	innocents	329BUNbvbVo	478	595	\N	\N	\N
202301243	innocents	329BUNbvbVo	631	705	\N	\N	\N
202301244	innocents	329BUNbvbVo	715	1022	\N	\N	\N
202301280	innocents	_Bgupg2ga7Y	13	211	\N	\N	\N
202301281	innocents	_Bgupg2ga7Y	246	482	\N	\N	\N
202301282	innocents	_Bgupg2ga7Y	517	890	\N	\N	\N
202301283	traitors	_Bgupg2ga7Y	927	1041	\N	\N	\N
202301284	innocents	_Bgupg2ga7Y	1069	1313	\N	\N	\N
202301310	innocents	akn7Xny5wwk	9	368	\N	\N	\N
202301311	traitors	akn7Xny5wwk	382	602	\N	\N	\N
202301312	traitors	akn7Xny5wwk	632	971	\N	\N	\N
202302040	innocents	YMTPqW1koFs	13	209	\N	\N	\N
202302041	innocents	YMTPqW1koFs	242	383	\N	\N	\N
202302042	innocents	YMTPqW1koFs	414	617	\N	\N	\N
202302043	innocents	YMTPqW1koFs	650	855	\N	\N	\N
202302044	zombies	YMTPqW1koFs	884	1176	\N	\N	\N
202302045	clown	YMTPqW1koFs	884	1176	\N	\N	\N
202302070	innocents	vtpNzMa8dgo	145	349	\N	\N	\N
202302071	innocents	vtpNzMa8dgo	385	800	\N	\N	\N
202302072	traitors	vtpNzMa8dgo	834	1128	\N	\N	\N
202302073	traitors	vtpNzMa8dgo	1162	1374	\N	\N	\N
202302074	traitors	vtpNzMa8dgo	1401	1595	\N	\N	\N
202302075	traitors	vtpNzMa8dgo	1628	1857	\N	\N	\N
202302110	innocents	7luvwuhZs68	34	457	\N	\N	\N
202302111	innocents	7luvwuhZs68	490	769	\N	\N	\N
202302112	innocents	7luvwuhZs68	804	1107	\N	\N	\N
202302113	traitors	7luvwuhZs68	1131	1203	\N	\N	\N
202302114	innocents	7luvwuhZs68	1235	1324	\N	\N	\N
202302140	traitors	yvpvrg8UUEo	13	239	\N	\N	\N
202302141	clown	yvpvrg8UUEo	274	643	\N	\N	\N
202302142	traitors	yvpvrg8UUEo	677	838	\N	\N	\N
202302143	traitors	yvpvrg8UUEo	863	1147	\N	\N	\N
202302144	zombies	yvpvrg8UUEo	1170	1501	\N	\N	\N
202302180	innocents	NHVu3w_xEds	57	216	\N	\N	\N
202302181	traitors	NHVu3w_xEds	249	707	\N	\N	\N
202302182	traitors	NHVu3w_xEds	738	981	\N	\N	\N
202302210	zombies	qqLaBaXt250	9	301	\N	\N	\N
202302211	traitors	qqLaBaXt250	334	445	\N	\N	\N
202302212	innocents	qqLaBaXt250	478	685	\N	\N	\N
202302213	traitors	qqLaBaXt250	716	956	\N	\N	\N
202302250	innocents	JTF74TBWpfE	26	109	\N	\N	\N
202302251	zombies	JTF74TBWpfE	142	231	\N	\N	\N
202302252	traitors	JTF74TBWpfE	261	330	\N	\N	\N
202302254	innocents	JTF74TBWpfE	479	1033	\N	\N	\N
202302280	traitors	d-Y4w6OtDUY	7	306	\N	\N	\N
202302281	traitors	d-Y4w6OtDUY	335	550	\N	\N	\N
202302282	clown	d-Y4w6OtDUY	587	805	\N	\N	\N
202302283	innocents	d-Y4w6OtDUY	835	978	\N	\N	\N
202303040	innocents	UYdRM3O-iHk	64	404	\N	\N	\N
202303041	innocents	UYdRM3O-iHk	439	654	\N	\N	\N
202303042	innocents	UYdRM3O-iHk	689	848	\N	\N	\N
202303043	innocents	UYdRM3O-iHk	882	1113	\N	\N	\N
202303070	innocents	psGnF7Co8u4	13	81	\N	\N	\N
202303071	traitors	psGnF7Co8u4	115	367	\N	\N	\N
202303072	innocents	psGnF7Co8u4	393	625	\N	\N	\N
202212240	jester	JqqN9U4D9CI	14	151	Ben	\N	\N
202212310	jester	lQ4RQPuvHr0	10	84	Rythian	\N	\N
202301073	jester	GBrckzwMvTQ	624	683	Rythian	\N	\N
202301313	jester	akn7Xny5wwk	1014	1059	Rythian	\N	\N
202301074	jester	GBrckzwMvTQ	718	814	Lewis	\N	\N
202302253	jester	JTF74TBWpfE	362	444	Lewis	\N	\N
202303073	traitors	psGnF7Co8u4	654	766	\N	\N	\N
202303074	clown	psGnF7Co8u4	794	1042	\N	\N	\N
202303110	innocents	nGTbrrYQN5o	16	180	\N	\N	\N
202303112	traitors	nGTbrrYQN5o	397	444	\N	\N	\N
202303113	clown	nGTbrrYQN5o	476	641	\N	\N	\N
202303114	zombies	nGTbrrYQN5o	648	896	\N	\N	\N
202303115	traitors	nGTbrrYQN5o	921	1187	\N	\N	\N
202303140	traitors	zYTLFs8JWK4	13	186	\N	\N	\N
202303141	traitors	zYTLFs8JWK4	217	434	\N	\N	\N
202303142	traitors	zYTLFs8JWK4	465	621	\N	\N	\N
202303143	traitors	zYTLFs8JWK4	649	858	\N	\N	\N
202303144	innocents	zYTLFs8JWK4	887	1080	\N	\N	\N
202303180	innocents	5BQPEwqqT18	20	154	\N	\N	\N
202303181	traitors	5BQPEwqqT18	185	292	\N	\N	\N
202303183	innocents	5BQPEwqqT18	437	607	\N	\N	\N
202303185	innocents	5BQPEwqqT18	812	990	\N	\N	\N
202303186	innocents	5BQPEwqqT18	1025	1114	\N	\N	\N
202303210	zombies	GGaPX6mv_xg	14	283	\N	\N	\N
202303213	traitors	GGaPX6mv_xg	780	988	\N	\N	\N
202303214	traitors	GGaPX6mv_xg	1009	1301	\N	\N	\N
202303250	traitors	DsZz5oqFBq0	17	214	\N	\N	\N
202303251	innocents	DsZz5oqFBq0	244	457	\N	\N	\N
202303252	traitors	DsZz5oqFBq0	484	642	\N	\N	\N
202303254	traitors	DsZz5oqFBq0	761	1033	\N	\N	\N
202303280	traitors	-Oj4i3EswxA	11	209	\N	\N	\N
202303281	traitors	-Oj4i3EswxA	238	485	\N	\N	\N
202303282	traitors	-Oj4i3EswxA	507	867	\N	\N	\N
202303283	jester	-Oj4i3EswxA	507	867	Rythian	\N	\N
202211050	jester	eIkEFaar-Qc	50	180	Pedguin	\N	\N
202210295	jester	fTM_5NZFhRY	922	1079	Pedguin	\N	\N
202211256	jester	otqA9aYtejA	975	1013	Zoey	\N	\N
202212132	traitors	gIwbQJJlCxw	356	422	\N	\N	\N
202212133	innocents	gIwbQJJlCxw	437	496	\N	\N	\N
202212134	innocents	gIwbQJJlCxw	528	644	\N	\N	\N
202212135	innocents	gIwbQJJlCxw	677	755	\N	\N	\N
202212136	jester	gIwbQJJlCxw	785	916	Zoey	\N	\N
202212204	jester	0w1LHuToCXI	927	1045	Breeh	\N	\N
202301171	jester	qJQsEevyU6U	245	268	Osie	\N	\N
202303111	jester	nGTbrrYQN5o	208	364	Zylus	\N	\N
202303145	jester	zYTLFs8JWK4	1112	1192	Duncan	\N	\N
202303182	jester	5BQPEwqqT18	314	406	Ravs	\N	\N
202303184	jester	5BQPEwqqT18	641	777	Lolip	\N	\N
202303211	jester	GGaPX6mv_xg	308	390	Ravs	\N	\N
202303253	jester	DsZz5oqFBq0	670	729	Ravs	\N	\N
202304012	jester	FH_Pt-txUBA	355	388	Lewis	\N	\N
202304040	jester	T2L_7-fot2A	14	136	Duncan	\N	\N
202304045	jester	T2L_7-fot2A	492	634	Zylus	\N	\N
202304083	jester	iwjgWykqfcI	680	721	Zylus	\N	\N
202304112	jester	ZlD__4SY3tc	640	761	Lewis	\N	\N
202304255	jester	u5w4OBSySvQ	572	671	Ben	\N	\N
202304258	jester	u5w4OBSySvQ	919	1011	Boba	\N	\N
202305061	jester	1RRbgC7wRtU	242	367	Zylus	\N	\N
202305090	jester	Xb1avFSyJa0	9	63	Ravs	\N	\N
202304010	innocents	FH_Pt-txUBA	21	183	\N	\N	\N
202210226	innocents	VRLFaq9XcMc	1250	1425	\N	\N	\N
202210225	jester	VRLFaq9XcMc	976	1216	Ravs	\N	\N
202210150	jester	kKM7SJQZo0Y	82	151	Ravs	\N	\N
202210155	jester	kKM7SJQZo0Y	733	790	Zylus	\N	\N
202306030	jester	VCHT4u5kMvc	109	263	Rythian	\N	\N
202305230	jester	Jp-BuV0I1Uc	28	176	Duncan	\N	\N
202210112	jester	hEnLP19VM64	635	827	Kirsty	\N	\N
202209270	jester	9LYHs_9-P0M	78	329	Rythian	\N	\N
202306291	jester	q4pAikC1Fa8	194	300	Lolip	\N	\N
202306294	jester	q4pAikC1Fa8	823	1031	Daltos	\N	\N
202307150	jester	OVe8ddpGgZQ	52	287	Zylus	\N	\N
202307273	jester	q3A3FqDJTr4	602	708	Daltos	\N	\N
202308053	jester	hPk2VzNw_20	753	967	Kirsty	\N	\N
202308083	jester	Ge4gwl-E7vg	805	838	Rythian	\N	\N
202308223	jester	y7D6Mf89_Mk	1047	1351	Nilesy	\N	\N
202308314	jester	61F0zLUiQFk	713	775	Nilesy	\N	\N
202309020	jester	WSo3UdBs-xE	9	212	Boba	\N	\N
202309025	jester	WSo3UdBs-xE	950	1006	Rythian	\N	\N
202309052	jester	qQQt8YlMQlo	367	439	Lewis	\N	\N
202309056	jester	qQQt8YlMQlo	979	1024	Ben	\N	\N
202309192	jester	T-QB1SzoyDY	399	769	Lewis	\N	\N
202309264	jester	ImyENeSgooo	820	918	Duncan	\N	\N
202310072	jester	BoN4LT1_xBs	814	877	Lewis	\N	\N
202310103	jester	1T0soBuuPsA	685	741	Lewis	\N	\N
202311183	jester	DnckQs8ndFU	578	654	Osie	\N	\N
202310242	jester	CCcYumIOlfk	381	402	Ben	\N	\N
202311112	jester	uH0-098F3GM	383	631	Lewis	\N	\N
202311114	jester	uH0-098F3GM	1068	1073	Daltos	\N	\N
202312041	jester	xDyIcHVZ1hQ	187	208	Ben	\N	\N
202312046	jester	xDyIcHVZ1hQ	885	1062	Rythian	\N	\N
202312047	jester	xDyIcHVZ1hQ	1096	1154	Nilesy	\N	\N
202312090	jester	4TD7y2ktRFI	11	170	Mousie	\N	\N
202312091	jester	4TD7y2ktRFI	205	247	Duncan	\N	\N
202312271	jester	OMiRwInBZmM	229	393	Rythian	\N	\N
202312274	jester	OMiRwInBZmM	871	999	Rythian	\N	\N
202401023	jester	BgrCFRtjzB8	924	1007	Zylus	\N	\N
202303212	innocents	GGaPX6mv_xg	427	757	\N	\N	\N
202304011	lovers	FH_Pt-txUBA	218	320	\N	\N	\N
202304013	innocents	FH_Pt-txUBA	421	605	\N	\N	\N
202304014	innocents	FH_Pt-txUBA	637	714	\N	\N	\N
202304015	traitors	FH_Pt-txUBA	747	957	\N	\N	\N
202304041	innocents	T2L_7-fot2A	175	349	\N	\N	\N
202304042	innocents	T2L_7-fot2A	175	349	\N	\N	\N
202304043	traitors	T2L_7-fot2A	492	634	\N	\N	\N
202304044	innocents	T2L_7-fot2A	492	634	\N	\N	\N
202304080	traitors	iwjgWykqfcI	18	118	\N	\N	\N
202304081	innocents	iwjgWykqfcI	151	411	\N	\N	\N
202304082	zombies	iwjgWykqfcI	445	650	\N	\N	\N
202304084	innocents	iwjgWykqfcI	756	764	\N	\N	\N
202304110	innocents	ZlD__4SY3tc	73	288	\N	\N	\N
202304111	clown	ZlD__4SY3tc	318	607	\N	\N	\N
202304113	innocents	ZlD__4SY3tc	800	931	\N	\N	\N
202304150	innocents	5pDiQ3UMRXY	88	151	\N	\N	\N
202304151	innocents	5pDiQ3UMRXY	181	366	\N	\N	\N
202304152	innocents	5pDiQ3UMRXY	400	602	\N	\N	\N
202304153	traitors	5pDiQ3UMRXY	634	799	\N	\N	\N
202304154	traitors	5pDiQ3UMRXY	833	936	\N	\N	\N
202304180	traitors	vpO0wpjS2yI	14	380	\N	\N	\N
202304181	traitors	vpO0wpjS2yI	413	655	\N	\N	\N
202304182	innocents	vpO0wpjS2yI	690	815	\N	\N	\N
202304183	innocents	vpO0wpjS2yI	850	992	\N	\N	\N
202304184	traitors	vpO0wpjS2yI	1023	1275	\N	\N	\N
202304185	traitors	vpO0wpjS2yI	1286	1477	\N	\N	\N
202304220	innocents	n2o6HSz9YrE	15	115	\N	\N	\N
202304221	traitors	n2o6HSz9YrE	146	261	\N	\N	\N
202304222	innocents	n2o6HSz9YrE	291	492	\N	\N	\N
202304223	zombies	n2o6HSz9YrE	520	657	\N	\N	\N
202304224	innocents	n2o6HSz9YrE	690	761	\N	\N	\N
202304225	traitors	n2o6HSz9YrE	795	920	\N	\N	\N
202304226	traitors	n2o6HSz9YrE	947	1173	\N	\N	\N
202304227	innocents	n2o6HSz9YrE	1207	1329	\N	\N	\N
202304250	innocents	u5w4OBSySvQ	11	92	\N	\N	\N
202304251	traitors	u5w4OBSySvQ	123	221	\N	\N	\N
202304252	innocents	u5w4OBSySvQ	247	340	\N	\N	\N
202304253	innocents	u5w4OBSySvQ	361	431	\N	\N	\N
202304254	innocents	u5w4OBSySvQ	462	542	\N	\N	\N
202304256	innocents	u5w4OBSySvQ	706	753	\N	\N	\N
202304257	traitors	u5w4OBSySvQ	787	891	\N	\N	\N
202304290	traitors	9d86zysMK6k	96	362	\N	\N	\N
202304291	traitors	9d86zysMK6k	396	885	\N	\N	\N
202304292	traitors	9d86zysMK6k	913	1023	\N	\N	\N
202305020	innocents	ebVSH3L5hjM	7	145	\N	\N	\N
202305021	traitors	ebVSH3L5hjM	179	300	\N	\N	\N
202305022	zombies	ebVSH3L5hjM	331	538	\N	\N	\N
202305023	innocents	ebVSH3L5hjM	573	811	\N	\N	\N
202305024	traitors	ebVSH3L5hjM	842	1192	\N	\N	\N
202305060	innocents	1RRbgC7wRtU	105	228	\N	\N	\N
202305062	innocents	1RRbgC7wRtU	391	551	\N	\N	\N
202305063	traitors	1RRbgC7wRtU	581	829	\N	\N	\N
202305064	innocents	1RRbgC7wRtU	857	944	\N	\N	\N
202305065	innocents	1RRbgC7wRtU	977	1291	\N	\N	\N
202305091	innocents	Xb1avFSyJa0	93	206	\N	\N	\N
202305092	zombies	Xb1avFSyJa0	241	378	\N	\N	\N
202305093	innocents	Xb1avFSyJa0	400	575	\N	\N	\N
202305094	traitors	Xb1avFSyJa0	610	727	\N	\N	\N
202305095	clown	Xb1avFSyJa0	751	980	\N	\N	\N
202305130	innocents	hwMR1y4gbK4	17	174	\N	\N	\N
202305131	innocents	hwMR1y4gbK4	208	301	\N	\N	\N
202305132	traitors	hwMR1y4gbK4	336	603	\N	\N	\N
202305133	innocents	hwMR1y4gbK4	633	707	\N	\N	\N
202305134	innocents	hwMR1y4gbK4	742	977	\N	\N	\N
202305160	innocents	2i_-L6Dny3o	10	233	\N	\N	\N
202305161	innocents	2i_-L6Dny3o	265	715	\N	\N	\N
202305162	innocents	2i_-L6Dny3o	743	862	\N	\N	\N
202305163	bees	2i_-L6Dny3o	888	1044	\N	\N	\N
202305200	innocents	xQP3hdxOmCM	92	249	\N	\N	\N
202305201	innocents	xQP3hdxOmCM	280	364	\N	\N	\N
202305202	traitors	xQP3hdxOmCM	395	490	\N	\N	\N
202305203	traitors	xQP3hdxOmCM	521	702	\N	\N	\N
202305204	traitors	xQP3hdxOmCM	732	854	\N	\N	\N
202305205	innocents	xQP3hdxOmCM	888	968	\N	\N	\N
202210180	innocents	X_jNsbBS278	5	106	\N	\N	\N
202210181	innocents	X_jNsbBS278	139	357	\N	\N	\N
202210182	traitors	X_jNsbBS278	387	517	\N	\N	\N
202210183	innocents	X_jNsbBS278	553	670	\N	\N	\N
202210184	bees	X_jNsbBS278	699	966	\N	\N	\N
202210151	traitors	kKM7SJQZo0Y	176	353	\N	\N	\N
202210152	innocents	kKM7SJQZo0Y	366	503	\N	\N	\N
202210153	innocents	kKM7SJQZo0Y	520	597	\N	\N	\N
202210154	innocents	kKM7SJQZo0Y	631	711	\N	\N	\N
202210156	traitors	kKM7SJQZo0Y	825	1188	\N	\N	\N
202210113	innocents	hEnLP19VM64	862	1213	\N	\N	\N
202306031	zombies	VCHT4u5kMvc	296	430	\N	\N	\N
202306032	innocents	VCHT4u5kMvc	458	787	\N	\N	\N
202306033	innocents	VCHT4u5kMvc	818	1011	\N	\N	\N
202210080	innocents	EvESsiqrxs4	10	440	\N	\N	\N
202210081	innocents	EvESsiqrxs4	465	539	\N	\N	\N
202210082	innocents	EvESsiqrxs4	569	683	\N	\N	\N
202210083	traitors	EvESsiqrxs4	713	921	\N	\N	\N
202210084	traitors	EvESsiqrxs4	949	1086	\N	\N	\N
202210040	traitors	BCfa3ckSRws	39	194	\N	\N	\N
202210041	innocents	BCfa3ckSRws	229	505	\N	\N	\N
202210042	innocents	BCfa3ckSRws	538	720	\N	\N	\N
202305231	innocents	Jp-BuV0I1Uc	209	340	\N	\N	\N
202210043	innocents	BCfa3ckSRws	752	1030	\N	\N	\N
202305232	innocents	Jp-BuV0I1Uc	379	500	\N	\N	\N
202210010	traitors	JaqxhsfR4T4	10	318	\N	\N	\N
202305233	traitors	Jp-BuV0I1Uc	535	687	\N	\N	\N
202210011	innocents	JaqxhsfR4T4	328	474	\N	\N	\N
202305234	innocents	Jp-BuV0I1Uc	709	827	\N	\N	\N
202210012	traitors	JaqxhsfR4T4	503	659	\N	\N	\N
202305235	innocents	Jp-BuV0I1Uc	859	927	\N	\N	\N
202305270	innocents	zehDuZ-h1m8	39	207	\N	\N	\N
202305271	traitors	zehDuZ-h1m8	238	345	\N	\N	\N
202305272	traitors	zehDuZ-h1m8	376	490	\N	\N	\N
202305273	traitors	zehDuZ-h1m8	517	586	\N	\N	\N
202305274	traitors	zehDuZ-h1m8	621	661	\N	\N	\N
202305275	innocents	zehDuZ-h1m8	682	893	\N	\N	\N
202305276	innocents	zehDuZ-h1m8	928	1111	\N	\N	\N
202305300	traitors	1hvkhCMtuIw	10	147	\N	\N	\N
202305301	innocents	1hvkhCMtuIw	181	363	\N	\N	\N
202305302	traitors	1hvkhCMtuIw	397	658	\N	\N	\N
202305303	innocents	1hvkhCMtuIw	689	895	\N	\N	\N
202305304	traitors	1hvkhCMtuIw	930	1117	\N	\N	\N
202210110	traitors	hEnLP19VM64	38	346	\N	\N	\N
202210111	innocents	hEnLP19VM64	364	604	\N	\N	\N
202210013	traitors	JaqxhsfR4T4	686	850	\N	\N	\N
202210014	traitors	JaqxhsfR4T4	861	909	\N	\N	\N
202306060	traitors	3kvyGLpdltw	38	312	\N	\N	\N
202306061	innocents	3kvyGLpdltw	340	612	\N	\N	\N
202306062	innocents	3kvyGLpdltw	644	898	\N	\N	\N
202209271	innocents	9LYHs_9-P0M	364	448	\N	\N	\N
202209272	innocents	9LYHs_9-P0M	478	748	\N	\N	\N
202209273	traitors	9LYHs_9-P0M	770	945	\N	\N	\N
202209274	traitors	9LYHs_9-P0M	968	1086	\N	\N	\N
202209275	traitors	9LYHs_9-P0M	1101	1206	\N	\N	\N
202209240	traitors	WZKkd4gHMEM	93	430	\N	\N	\N
202209241	innocents	WZKkd4gHMEM	447	594	\N	\N	\N
202209242	traitors	WZKkd4gHMEM	629	879	\N	\N	\N
202209243	traitors	WZKkd4gHMEM	914	1013	\N	\N	\N
202209244	innocents	WZKkd4gHMEM	1048	1189	\N	\N	\N
202306100	traitors	gHoqpGgYNMA	120	384	\N	\N	\N
202306101	innocents	gHoqpGgYNMA	417	556	\N	\N	\N
202306102	innocents	gHoqpGgYNMA	588	708	\N	\N	\N
202306103	zombies	gHoqpGgYNMA	739	910	\N	\N	\N
202306104	traitors	gHoqpGgYNMA	938	1118	\N	\N	\N
202306130	innocents	4vDh9LHM73k	29	346	\N	\N	\N
202306131	traitors	4vDh9LHM73k	376	567	\N	\N	\N
202306132	traitors	4vDh9LHM73k	598	787	\N	\N	\N
202306133	innocents	4vDh9LHM73k	816	956	\N	\N	\N
202306170	innocents	4fkqC1pyQ2w	29	323	\N	\N	\N
202306171	innocents	4fkqC1pyQ2w	337	473	\N	\N	\N
202306172	traitors	4fkqC1pyQ2w	504	608	\N	\N	\N
202306173	zombies	4fkqC1pyQ2w	642	747	\N	\N	\N
202306174	traitors	4fkqC1pyQ2w	774	861	\N	\N	\N
202306175	innocents	4fkqC1pyQ2w	891	988	\N	\N	\N
202306176	traitors	4fkqC1pyQ2w	1021	1173	\N	\N	\N
202306200	traitors	jAeGy-VoDmc	21	155	\N	\N	\N
202306201	traitors	jAeGy-VoDmc	180	300	\N	\N	\N
202306202	innocents	jAeGy-VoDmc	318	474	\N	\N	\N
202306203	innocents	jAeGy-VoDmc	504	552	\N	\N	\N
202306204	traitors	jAeGy-VoDmc	576	749	\N	\N	\N
202306205	innocents	jAeGy-VoDmc	769	870	\N	\N	\N
202306220	innocents	jhfFsnAOpb0	21	399	\N	\N	\N
202306221	traitors	jhfFsnAOpb0	429	547	\N	\N	\N
202306222	innocents	jhfFsnAOpb0	577	878	\N	\N	\N
202306223	traitors	jhfFsnAOpb0	889	1011	\N	\N	\N
202306240	traitors	qDS3c1Rjc7o	11	208	\N	\N	\N
202306241	traitors	qDS3c1Rjc7o	238	438	\N	\N	\N
202306242	traitors	qDS3c1Rjc7o	452	678	\N	\N	\N
202306243	traitors	qDS3c1Rjc7o	705	850	\N	\N	\N
202209200	traitors	eK8Nwp_C-_c	9	110	\N	\N	\N
202209201	innocents	eK8Nwp_C-_c	134	230	\N	\N	\N
202209202	innocents	eK8Nwp_C-_c	260	483	\N	\N	\N
202209203	traitors	eK8Nwp_C-_c	514	842	\N	\N	\N
202306280	traitors	zFbMsWMwW6U	34	386	\N	\N	\N
202306281	innocents	zFbMsWMwW6U	420	544	\N	\N	\N
202306282	traitors	zFbMsWMwW6U	565	622	\N	\N	\N
202306283	innocents	zFbMsWMwW6U	639	759	\N	\N	\N
202306284	innocents	zFbMsWMwW6U	769	891	\N	\N	\N
202306290	traitors	q4pAikC1Fa8	9	161	\N	\N	\N
202306292	traitors	q4pAikC1Fa8	335	564	\N	\N	\N
202306293	innocents	q4pAikC1Fa8	595	789	\N	\N	\N
202306295	traitors	q4pAikC1Fa8	1060	1200	\N	\N	\N
202307010	traitors	n8flDSFaBUk	12	209	\N	\N	\N
202307011	traitors	n8flDSFaBUk	239	383	\N	\N	\N
202307012	traitors	n8flDSFaBUk	414	663	\N	\N	\N
202307013	innocents	n8flDSFaBUk	692	806	\N	\N	\N
202307014	innocents	n8flDSFaBUk	837	971	\N	\N	\N
202307015	traitors	n8flDSFaBUk	999	1267	\N	\N	\N
202307040	innocents	0ePAy9ON6aM	90	248	\N	\N	\N
202307041	innocents	0ePAy9ON6aM	278	359	\N	\N	\N
202307042	traitors	0ePAy9ON6aM	391	434	\N	\N	\N
202307043	traitors	0ePAy9ON6aM	473	665	\N	\N	\N
202307044	traitors	0ePAy9ON6aM	691	825	\N	\N	\N
202307045	traitors	0ePAy9ON6aM	852	950	\N	\N	\N
202307060	traitors	boSGesFpomU	11	188	\N	\N	\N
202307061	zombies	boSGesFpomU	225	385	\N	\N	\N
202307062	zombies	boSGesFpomU	414	569	\N	\N	\N
202307063	innocents	boSGesFpomU	605	778	\N	\N	\N
202307064	traitors	boSGesFpomU	807	958	\N	\N	\N
202307065	traitors	boSGesFpomU	991	1260	\N	\N	\N
202307080	zombies	iLZ69BAe0HE	10	212	\N	\N	\N
202307081	traitors	iLZ69BAe0HE	240	583	\N	\N	\N
202307082	innocents	iLZ69BAe0HE	613	842	\N	\N	\N
202307083	traitors	iLZ69BAe0HE	878	917	\N	\N	\N
202307110	innocents	NN9A8L8expU	31	218	\N	\N	\N
202307111	innocents	NN9A8L8expU	244	452	\N	\N	\N
202307112	traitors	NN9A8L8expU	482	696	\N	\N	\N
202307113	elves	NN9A8L8expU	726	992	\N	\N	\N
202307130	innocents	ELKjkoyU21A	20	264	\N	\N	\N
202307131	zombies	ELKjkoyU21A	289	423	\N	\N	\N
202307132	traitors	ELKjkoyU21A	455	537	\N	\N	\N
202307133	zombies	ELKjkoyU21A	567	668	\N	\N	\N
202307134	innocents	ELKjkoyU21A	700	899	\N	\N	\N
202307135	zombies	ELKjkoyU21A	937	1087	\N	\N	\N
202307151	innocents	OVe8ddpGgZQ	322	500	\N	\N	\N
202307152	traitors	OVe8ddpGgZQ	539	719	\N	\N	\N
202307153	innocents	OVe8ddpGgZQ	744	846	\N	\N	\N
202307154	traitors	OVe8ddpGgZQ	864	1242	\N	\N	\N
202307180	innocents	XqzsityJF7I	57	93	\N	\N	\N
202307181	innocents	XqzsityJF7I	122	340	\N	\N	\N
202307182	innocents	XqzsityJF7I	369	540	\N	\N	\N
202307183	traitors	XqzsityJF7I	574	680	\N	\N	\N
202307184	traitors	XqzsityJF7I	714	915	\N	\N	\N
202307185	innocents	XqzsityJF7I	946	1071	\N	\N	\N
202307200	traitors	6Oa-lMt4HXM	15	133	\N	\N	\N
202307201	innocents	6Oa-lMt4HXM	164	268	\N	\N	\N
202307202	innocents	6Oa-lMt4HXM	290	564	\N	\N	\N
202307203	innocents	6Oa-lMt4HXM	592	763	\N	\N	\N
202307204	traitors	6Oa-lMt4HXM	788	882	\N	\N	\N
202307205	traitors	6Oa-lMt4HXM	912	1066	\N	\N	\N
202307206	innocents	6Oa-lMt4HXM	1091	1281	\N	\N	\N
202307220	traitors	M_VWQt-qtLw	18	79	\N	\N	\N
202307222	clown	M_VWQt-qtLw	200	407	\N	\N	\N
202307221	innocents	M_VWQt-qtLw	113	168	\N	\N	\N
202307223	innocents	M_VWQt-qtLw	441	556	\N	\N	\N
202307224	innocents	M_VWQt-qtLw	587	692	\N	\N	\N
202307226	traitors	M_VWQt-qtLw	880	973	\N	\N	\N
202307225	innocents	M_VWQt-qtLw	718	855	\N	\N	\N
202307250	traitors	c5AwkqJimFY	9	209	\N	\N	\N
202307251	innocents	c5AwkqJimFY	224	402	\N	\N	\N
202307252	clown	c5AwkqJimFY	419	757	\N	\N	\N
202307253	innocents	c5AwkqJimFY	779	853	\N	\N	\N
202307254	traitors	c5AwkqJimFY	881	1052	\N	\N	\N
202307270	clown	q3A3FqDJTr4	11	90	\N	\N	\N
202307271	innocents	q3A3FqDJTr4	126	252	\N	\N	\N
202307272	traitors	q3A3FqDJTr4	282	569	\N	\N	\N
202307274	zombies	q3A3FqDJTr4	738	875	\N	\N	\N
202307275	innocents	q3A3FqDJTr4	897	1094	\N	\N	\N
202307290	innocents	tG7nh3No6e0	8	100	\N	\N	\N
202307291	innocents	tG7nh3No6e0	133	306	\N	\N	\N
202307292	innocents	tG7nh3No6e0	332	423	\N	\N	\N
202307293	innocents	tG7nh3No6e0	441	672	\N	\N	\N
202307294	traitors	tG7nh3No6e0	699	808	\N	\N	\N
202307295	innocents	tG7nh3No6e0	841	1037	\N	\N	\N
202308010	innocents	CSp850uMz98	89	213	\N	\N	\N
202308011	traitors	CSp850uMz98	243	463	\N	\N	\N
202308012	traitors	CSp850uMz98	477	630	\N	\N	\N
202308013	zombies	CSp850uMz98	643	1003	\N	\N	\N
202308014	innocents	CSp850uMz98	1017	1285	\N	\N	\N
202308030	traitors	HjBz5xKAfv8	82	254	\N	\N	\N
202308031	innocents	HjBz5xKAfv8	285	493	\N	\N	\N
202308032	innocents	HjBz5xKAfv8	527	799	\N	\N	\N
202308033	traitors	HjBz5xKAfv8	831	1004	\N	\N	\N
202308034	innocents	HjBz5xKAfv8	1033	1106	\N	\N	\N
202308035	innocents	HjBz5xKAfv8	1135	1341	\N	\N	\N
202308050	traitors	hPk2VzNw_20	79	223	\N	\N	\N
202308051	traitors	hPk2VzNw_20	250	426	\N	\N	\N
202308052	innocents	hPk2VzNw_20	457	720	\N	\N	\N
202308080	traitors	Ge4gwl-E7vg	12	224	\N	\N	\N
202308081	innocents	Ge4gwl-E7vg	250	587	\N	\N	\N
202308082	traitors	Ge4gwl-E7vg	620	772	\N	\N	\N
202308084	bees	Ge4gwl-E7vg	872	1222	\N	\N	\N
202308120	innocents	RqABuPTymQ8	14	149	\N	\N	\N
202308121	innocents	RqABuPTymQ8	181	381	\N	\N	\N
202308122	innocents	RqABuPTymQ8	397	538	\N	\N	\N
202308123	traitors	RqABuPTymQ8	573	745	\N	\N	\N
202308124	traitors	RqABuPTymQ8	772	956	\N	\N	\N
202308125	innocents	RqABuPTymQ8	980	1098	\N	\N	\N
202308150	traitors	jA94_TZQy24	8	64	\N	\N	\N
202308151	traitors	jA94_TZQy24	94	207	\N	\N	\N
202308152	traitors	jA94_TZQy24	241	371	\N	\N	\N
202308153	traitors	jA94_TZQy24	384	486	\N	\N	\N
202308154	innocents	jA94_TZQy24	521	767	\N	\N	\N
202308155	innocents	jA94_TZQy24	801	900	\N	\N	\N
202308190	traitors	ViwjczL50NA	12	320	\N	\N	\N
202308191	innocents	ViwjczL50NA	353	446	\N	\N	\N
202308192	traitors	ViwjczL50NA	479	570	\N	\N	\N
202308193	innocents	ViwjczL50NA	595	675	\N	\N	\N
202308194	innocents	ViwjczL50NA	698	903	\N	\N	\N
202308220	traitors	y7D6Mf89_Mk	9	350	\N	\N	\N
202308221	innocents	y7D6Mf89_Mk	377	650	\N	\N	\N
202308222	traitors	y7D6Mf89_Mk	681	1013	\N	\N	\N
202308250	traitors	2SMlc_4LsR8	13	254	\N	\N	\N
202308251	innocents	2SMlc_4LsR8	280	387	\N	\N	\N
202308252	innocents	2SMlc_4LsR8	390	708	\N	\N	\N
202308253	traitors	2SMlc_4LsR8	717	1137	\N	\N	\N
202308260	innocents	RraNHJ4jPFg	16	319	\N	\N	\N
202308261	traitors	RraNHJ4jPFg	354	652	\N	\N	\N
202308262	traitors	RraNHJ4jPFg	680	779	\N	\N	\N
202308263	clown	RraNHJ4jPFg	815	972	\N	\N	\N
202308264	innocents	RraNHJ4jPFg	1007	1263	\N	\N	\N
202308290	innocents	6_BXq1ENmBs	10	180	\N	\N	\N
202308291	innocents	6_BXq1ENmBs	208	357	\N	\N	\N
202308292	zombies	6_BXq1ENmBs	391	523	\N	\N	\N
202308293	traitors	6_BXq1ENmBs	556	808	\N	\N	\N
202308294	innocents	6_BXq1ENmBs	832	912	\N	\N	\N
202308295	innocents	6_BXq1ENmBs	943	1001	\N	\N	\N
202308296	innocents	6_BXq1ENmBs	1035	1062	\N	\N	\N
202308310	innocents	61F0zLUiQFk	16	94	\N	\N	\N
202308311	innocents	61F0zLUiQFk	121	285	\N	\N	\N
202308312	traitors	61F0zLUiQFk	311	477	\N	\N	\N
202308313	innocents	61F0zLUiQFk	511	679	\N	\N	\N
202308315	clown	61F0zLUiQFk	805	968	\N	\N	\N
202309021	zombies	WSo3UdBs-xE	247	434	\N	\N	\N
202309022	innocents	WSo3UdBs-xE	468	657	\N	\N	\N
202309023	traitors	WSo3UdBs-xE	687	788	\N	\N	\N
202309024	innocents	WSo3UdBs-xE	818	917	\N	\N	\N
202309050	zombies	qQQt8YlMQlo	7	157	\N	\N	\N
202309051	traitors	qQQt8YlMQlo	184	337	\N	\N	\N
202309053	innocents	qQQt8YlMQlo	471	726	\N	\N	\N
202309054	innocents	qQQt8YlMQlo	744	791	\N	\N	\N
202309055	traitors	qQQt8YlMQlo	811	947	\N	\N	\N
202309070	innocents	0gG18aSXHnI	10	251	\N	\N	\N
202309071	traitors	0gG18aSXHnI	286	453	\N	\N	\N
202309072	clown	0gG18aSXHnI	488	591	\N	\N	\N
202309073	innocents	0gG18aSXHnI	626	759	\N	\N	\N
202309074	innocents	0gG18aSXHnI	778	1010	\N	\N	\N
202309090	traitors	U1sdGCDBqHs	13	111	\N	\N	\N
202309091	zombies	U1sdGCDBqHs	141	318	\N	\N	\N
202309092	traitors	U1sdGCDBqHs	345	504	\N	\N	\N
202309093	innocents	U1sdGCDBqHs	514	571	\N	\N	\N
202309094	zombies	U1sdGCDBqHs	602	779	\N	\N	\N
202309120	innocents	NdW0AA_gD88	6	96	\N	\N	\N
202309121	traitors	NdW0AA_gD88	127	302	\N	\N	\N
202309122	innocents	NdW0AA_gD88	334	497	\N	\N	\N
202309123	innocents	NdW0AA_gD88	525	640	\N	\N	\N
202309124	innocents	NdW0AA_gD88	669	921	\N	\N	\N
202309160	innocents	LWyxwnmup9Y	11	279	\N	\N	\N
202309161	traitors	LWyxwnmup9Y	312	797	\N	\N	\N
202309162	traitors	LWyxwnmup9Y	831	994	\N	\N	\N
202309190	innocents	T-QB1SzoyDY	11	86	\N	\N	\N
202309191	bees	T-QB1SzoyDY	118	367	\N	\N	\N
202309230	clown	qj-rGf7F04g	15	154	\N	\N	\N
202309231	traitors	qj-rGf7F04g	186	404	\N	\N	\N
202309232	traitors	qj-rGf7F04g	432	634	\N	\N	\N
202309233	traitors	qj-rGf7F04g	664	894	\N	\N	\N
202309260	traitors	ImyENeSgooo	42	138	\N	\N	\N
202309261	traitors	ImyENeSgooo	152	360	\N	\N	\N
202309262	traitors	ImyENeSgooo	385	509	\N	\N	\N
202309263	clown	ImyENeSgooo	542	798	\N	\N	\N
202309265	zombies	ImyENeSgooo	951	1101	\N	\N	\N
202309300	traitors	L08HY3H66uM	11	229	\N	\N	\N
202309301	clown	L08HY3H66uM	251	507	\N	\N	\N
202309302	traitors	L08HY3H66uM	543	992	\N	\N	\N
202310030	innocents	l5UfRRmEZOs	6	118	\N	\N	\N
202310031	innocents	l5UfRRmEZOs	154	314	\N	\N	\N
202310032	innocents	l5UfRRmEZOs	348	486	\N	\N	\N
202310033	innocents	l5UfRRmEZOs	520	795	\N	\N	\N
202310070	traitors	BoN4LT1_xBs	27	470	\N	\N	\N
202310071	traitors	BoN4LT1_xBs	502	779	\N	\N	\N
202310100	innocents	1T0soBuuPsA	9	115	\N	\N	\N
202310101	traitors	1T0soBuuPsA	149	402	\N	\N	\N
202310102	traitors	1T0soBuuPsA	434	650	\N	\N	\N
202310104	innocents	1T0soBuuPsA	775	847	\N	\N	\N
202310140	traitors	frIpOc3HK14	12	148	\N	\N	\N
202310141	innocents	frIpOc3HK14	173	234	\N	\N	\N
202310142	traitors	frIpOc3HK14	269	378	\N	\N	\N
202310143	traitors	frIpOc3HK14	400	559	\N	\N	\N
202310144	traitors	frIpOc3HK14	593	923	\N	\N	\N
202310170	bees	0F9oohSh4gw	9	254	\N	\N	\N
202310171	bees	0F9oohSh4gw	263	460	\N	\N	\N
202310172	traitors	0F9oohSh4gw	495	622	\N	\N	\N
202310173	zombies	0F9oohSh4gw	659	825	\N	\N	\N
202310243	traitors	CCcYumIOlfk	435	539	\N	\N	\N
202310244	innocents	CCcYumIOlfk	573	691	\N	\N	\N
202310245	clown	CCcYumIOlfk	703	834	\N	\N	\N
202310246	traitors	CCcYumIOlfk	868	988	\N	\N	\N
202310280	traitors	mFpIvwkVtHo	8	200	\N	\N	\N
202310282	innocents	mFpIvwkVtHo	584	856	\N	\N	\N
202310310	innocents	MQNcCyzpOkQ	16	150	\N	\N	\N
202310311	innocents	MQNcCyzpOkQ	179	276	\N	\N	\N
202310312	traitors	MQNcCyzpOkQ	305	455	\N	\N	\N
202310313	innocents	MQNcCyzpOkQ	489	670	\N	\N	\N
202310314	traitors	MQNcCyzpOkQ	698	853	\N	\N	\N
202311070	innocents	5pvxVBVgEJ8	16	225	\N	\N	\N
202311071	innocents	5pvxVBVgEJ8	259	383	\N	\N	\N
202311072	traitors	5pvxVBVgEJ8	403	639	\N	\N	\N
202311073	bees	5pvxVBVgEJ8	669	796	\N	\N	\N
202311074	traitors	5pvxVBVgEJ8	830	948	\N	\N	\N
202311113	innocents	uH0-098F3GM	657	1036	\N	\N	\N
202311170	traitors	1h-EW3JI-GM	35	328	\N	\N	\N
202311171	clown	1h-EW3JI-GM	361	500	\N	\N	\N
202311172	innocents	1h-EW3JI-GM	530	671	\N	\N	\N
202311182	traitors	DnckQs8ndFU	436	545	\N	\N	\N
202311184	innocents	DnckQs8ndFU	679	908	\N	\N	\N
202310174	innocents	0F9oohSh4gw	843	935	\N	\N	\N
202310210	clown	Yi24WMIqsHg	10	173	\N	\N	\N
202310211	traitors	Yi24WMIqsHg	207	381	\N	\N	\N
202310212	innocents	Yi24WMIqsHg	412	539	\N	\N	\N
202310213	traitors	Yi24WMIqsHg	573	872	\N	\N	\N
202310214	clown	Yi24WMIqsHg	890	991	\N	\N	\N
202310240	innocents	CCcYumIOlfk	11	257	\N	\N	\N
202310241	innocents	CCcYumIOlfk	291	353	\N	\N	\N
202310281	elves	mFpIvwkVtHo	229	561	\N	\N	\N
202311040	innocents	ACxqZiOpY5o	15	162	\N	\N	\N
202311041	clown	ACxqZiOpY5o	195	440	\N	\N	\N
202311042	innocents	ACxqZiOpY5o	475	778	\N	\N	\N
202311043	innocents	ACxqZiOpY5o	813	900	\N	\N	\N
202311110	traitors	uH0-098F3GM	60	282	\N	\N	\N
202311111	innocents	uH0-098F3GM	315	353	\N	\N	\N
202311173	innocents	1h-EW3JI-GM	705	848	\N	\N	\N
202311174	traitors	1h-EW3JI-GM	870	1111	\N	\N	\N
202311180	zombies	DnckQs8ndFU	7	155	\N	\N	\N
202311181	innocents	DnckQs8ndFU	190	404	\N	\N	\N
202311210	zombies	7HYpBNlsPQc	14	374	\N	\N	\N
202311211	traitors	7HYpBNlsPQc	409	640	\N	\N	\N
202311212	traitors	7HYpBNlsPQc	675	923	\N	\N	\N
202311213	innocents	7HYpBNlsPQc	957	1175	\N	\N	\N
202311250	traitors	pHypufJTIjw	67	161	\N	\N	\N
202311251	innocents	pHypufJTIjw	194	361	\N	\N	\N
202311252	traitors	pHypufJTIjw	396	614	\N	\N	\N
202311253	bees	pHypufJTIjw	648	928	\N	\N	\N
202311254	traitors	pHypufJTIjw	959	1167	\N	\N	\N
202312040	innocents	xDyIcHVZ1hQ	8	154	\N	\N	\N
202312042	zombies	xDyIcHVZ1hQ	243	385	\N	\N	\N
202312043	innocents	xDyIcHVZ1hQ	418	498	\N	\N	\N
202312044	innocents	xDyIcHVZ1hQ	532	643	\N	\N	\N
202312045	innocents	xDyIcHVZ1hQ	678	851	\N	\N	\N
202312092	traitors	4TD7y2ktRFI	280	605	\N	\N	\N
202312093	innocents	4TD7y2ktRFI	638	674	\N	\N	\N
202312094	traitors	4TD7y2ktRFI	708	950	\N	\N	\N
202312095	traitors	4TD7y2ktRFI	980	1256	\N	\N	\N
202312140	innocents	-FIaLXuVp-E	13	315	\N	\N	\N
202312141	innocents	-FIaLXuVp-E	349	678	\N	\N	\N
202312142	elves	-FIaLXuVp-E	719	868	\N	\N	\N
202312143	innocents	-FIaLXuVp-E	886	1110	\N	\N	\N
202312230	clown	7vnvAvKjWp4	10	242	\N	\N	\N
202312231	innocents	7vnvAvKjWp4	252	564	\N	\N	\N
202312232	traitors	7vnvAvKjWp4	599	725	\N	\N	\N
202312233	innocents	7vnvAvKjWp4	821	1074	\N	\N	\N
202312270	innocents	OMiRwInBZmM	9	196	\N	\N	\N
202312272	zombies	OMiRwInBZmM	427	588	\N	\N	\N
202312273	innocents	OMiRwInBZmM	624	841	\N	\N	\N
202312300	innocents	YlfUfIQwmWg	17	218	\N	\N	\N
202312301	innocents	YlfUfIQwmWg	249	396	\N	\N	\N
202312302	traitors	YlfUfIQwmWg	430	558	\N	\N	\N
202312303	innocents	YlfUfIQwmWg	564	623	\N	\N	\N
202312304	innocents	YlfUfIQwmWg	657	912	\N	\N	\N
202312305	innocents	YlfUfIQwmWg	957	1058	\N	\N	\N
202401020	traitors	BgrCFRtjzB8	11	423	\N	\N	\N
202401021	traitors	BgrCFRtjzB8	455	731	\N	\N	\N
202401022	innocents	BgrCFRtjzB8	765	893	\N	\N	\N
202401061	innocents	Y27XhFtCcqs	354	632	\N	\N	\N
202401062	traitors	Y27XhFtCcqs	665	749	\N	\N	\N
202401063	innocents	Y27XhFtCcqs	776	1030	\N	\N	\N
202401064	traitors	Y27XhFtCcqs	1059	1234	\N	\N	\N
202401091	innocents	6aTeNzPMeOI	324	504	\N	\N	\N
202401130	hive mind	0qmTEopro6Y	7	154	\N	\N	\N
202401132	traitors	0qmTEopro6Y	341	456	\N	\N	\N
202401133	traitors	0qmTEopro6Y	490	613	\N	\N	\N
202401134	traitors	0qmTEopro6Y	648	872	\N	\N	\N
202401135	zombies	0qmTEopro6Y	906	1091	\N	\N	\N
202401060	innocents	Y27XhFtCcqs	8	319	\N	Zylus	\N
202401090	traitors	6aTeNzPMeOI	13	288	\N	Zylus	\N
202401093	innocents	6aTeNzPMeOI	725	966	\N	Zylus	\N
202401092	traitors	6aTeNzPMeOI	535	700	\N	Briony	Lewis
202401094	innocents	6aTeNzPMeOI	1001	1155	\N	Zylus	Rythian
202401131	jester	0qmTEopro6Y	186	308	Duncan	\N	Nilesy
202402010	innocents	1ZU7e2bN1Wo	17	290	\N	\N	\N
202402011	innocents	1ZU7e2bN1Wo	321	403	\N	\N	\N
202402012	innocents	1ZU7e2bN1Wo	436	545	\N	\N	\N
202402013	innocents	1ZU7e2bN1Wo	571	713	\N	Nilesy	\N
202402014	traitors	1ZU7e2bN1Wo	737	894	\N	\N	\N
202402015	innocents	1ZU7e2bN1Wo	923	1065	\N	\N	\N
202402016	traitors	1ZU7e2bN1Wo	1090	1178	\N	\N	\N
202402060	traitors	acn57YA4-C8	13	123	\N	\N	\N
202402061	innocents	acn57YA4-C8	152	405	\N	Ben	\N
202402062	innocents	acn57YA4-C8	435	663	\N	\N	\N
202402063	innocents	acn57YA4-C8	683	979	\N	\N	\N
202402064	innocents	acn57YA4-C8	1005	1219	\N	Ben	\N
202402100	traitors	TwxlKoCbERE	12	158	\N	\N	\N
202402101	traitors	TwxlKoCbERE	181	395	\N	\N	\N
202402102	innocents	TwxlKoCbERE	423	658	\N	\N	\N
202402103	innocents	TwxlKoCbERE	667	858	\N	\N	\N
202402104	sponge	TwxlKoCbERE	884	1014	\N	\N	\N
202402105	innocents	TwxlKoCbERE	1044	1129	\N	\N	\N
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team, can_win) FROM stdin;
innocents	t
traitors	t
zombies	t
bees	t
jester	t
clown	t
elves	t
communists	t
lovers	t
hive mind	t
none	f
sponge	t
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videos (video_id, title, intro_death, date) FROM stdin;
1hvkhCMtuIw	This map is Mr Blobby nightmare!! | Gmod TTT	t	2023-05-30
iwjgWykqfcI	Lewis vs Zylus: A Feud Reignited!! | Gmod TTT	t	2023-04-08
u5w4OBSySvQ	The Button Map... but SIXTEEN TIMES WORSE | Gmod TTT	t	2023-04-25
9d86zysMK6k	Detectoclown Zoey border controls Area 3! | Gmod TTT	t	2023-04-29
ebVSH3L5hjM	When one person shoots... EVERYONE SHOOTS?! | Gmod TTT	t	2023-05-02
1RRbgC7wRtU	Riddle Master Ben gives away his traitor buddy | Gmod TTT	t	2023-05-06
Xb1avFSyJa0	We're being hunted by the immortal SUPER COP!! | Gmod TTT	t	2023-05-09
hwMR1y4gbK4	Lewis finally cracks, thinks EVERYONE is a prop | Gmod TTT	t	2023-05-13
2i_-L6Dny3o	NEW PLAYER Nilesy paid £1,000 for this skin in Gmod TTT!!	t	2023-05-16
xQP3hdxOmCM	These cats have NINE LIVES?! | Gmod TTT	t	2023-05-20
X_jNsbBS278	It's MORE-BEEn Time! | Gmod TTT	t	2022-10-18
kKM7SJQZo0Y	Revenge of the flying Pikachu! | Gmod TTT	t	2022-10-15
6-QLX5wHwt0	We're replacing Ben with a sound board | Gmod TTT	t	2023-05-23
Jp-BuV0I1Uc	We're replacing Ben with a sound board | Gmod TTT	t	2023-05-23
zehDuZ-h1m8	Duncan turns Pro, uses items correctly | Gmod TTT	t	2023-05-27
hEnLP19VM64	Groverhaus is tearing us APART!! | Gmod TTT	t	2022-10-11
VCHT4u5kMvc	Don't save the Cat Pants Pinata!! | Gmod TTT	t	2023-06-03
EvESsiqrxs4	What happens to Dugtrio if one of the Digletts DIES?! | Gmod TTT	t	2022-10-08
BCfa3ckSRws	THIS is how EVERY round should end! | Gmod TTT	t	2022-10-04
JaqxhsfR4T4	The Best Map for the Bat | Gmod TTT	t	2022-10-01
3kvyGLpdltw	The Rise and Fall of Queen Zoey | Gmod TTT	t	2023-06-06
9LYHs_9-P0M	The Zombies have turned on their creator! | Gmod TTT	t	2022-09-27
WZKkd4gHMEM	Zoey uses a TRAIN as a weapon | Gmod TTT	t	2022-09-24
gHoqpGgYNMA	Rythian and Ben's corpse fishing adventure in Gmod TTT!	t	2023-06-10
4vDh9LHM73k	You can't dodge the CAR GUN! | Gmod TTT	t	2023-06-13
akn7Xny5wwk	Is there anything the Dingus Hunters won't do!? | Gmod TTT	f	2023-01-31
YMTPqW1koFs	This PARASITE can raise the DEAD!! | Gmod TTT	f	2023-02-04
vtpNzMa8dgo	Osie's Insane Life Stories | Gmod TTT XL	f	2023-02-07
7luvwuhZs68	Achieving the Traitor Trap Multi-Kill in Gmod TTT!	f	2023-02-11
yvpvrg8UUEo	Don't use this BROKEN NEW Roles in Gmod TTT!	f	2023-02-14
NHVu3w_xEds	The hardest achievement ever: Don't Vote Zylus! | Gmod TTT	f	2023-02-18
qqLaBaXt250	How many CUSTOM ACHIEVEMENTS can we get in Gmod TTT!?	f	2023-02-21
JTF74TBWpfE	Can we survive the ENDLESS Zombie Horde in Gmod TTT!?	f	2023-02-25
d-Y4w6OtDUY	Don't go in the BODY PIT!! | Gmod TTT	f	2023-02-28
UYdRM3O-iHk	We're going on a romantic Wild West boat ride! | Gmod TTT	f	2023-03-04
psGnF7Co8u4	Rythian LOVES Barrel Justice now?! | Gmod TTT	f	2023-03-07
nGTbrrYQN5o	L + Ratio + Beggar + Play Better | Gmod TTT	f	2023-03-11
zYTLFs8JWK4	NEVER betray your Zombie friends!! | Gmod TTT	f	2023-03-14
5BQPEwqqT18	Duncan revolutionises the Fashion Industry! | Gmod TTT	f	2023-03-18
GGaPX6mv_xg	Osie becomes GOD, wastes power on pizza | Gmod TTT	f	2023-03-21
DsZz5oqFBq0	This video DIDN'T get demonetised?! | Gmod TTT	f	2023-03-25
-Oj4i3EswxA	Beware the Jester Beam of DOOM! | Gmod TTT	f	2023-03-28
FH_Pt-txUBA	This randomat is driving us CRAZY! | Gmod TTT	f	2023-04-01
T2L_7-fot2A	DUNCAN is BACK in Gmod TTT!!!	f	2023-04-04
ZlD__4SY3tc	Admin Abuser gets outted by an achievement | Gmod TTT	f	2023-04-11
5pDiQ3UMRXY	Zoey spices things up, ruins an entire round | Gmod TTT	f	2023-04-15
vpO0wpjS2yI	Tiny Kirsty's stupid player model almost breaks Rythian | Gmod TTT	f	2023-04-18
n2o6HSz9YrE	Everyone SUCKS but Rythian (including YOU!) | Gmod TTT	f	2023-04-22
4fkqC1pyQ2w	Who poisoned Ben... TWICE?! | Gmod TTT	t	2023-06-17
jAeGy-VoDmc	This legendary round never happened | Gmod TTT	t	2023-06-20
jhfFsnAOpb0	Lewis' billion dollar trading card idea | Gmod TTT	t	2023-06-22
qDS3c1Rjc7o	We escape Melon hell to kill some bots | Gmod TTT	t	2023-06-24
eK8Nwp_C-_c	This Randomat combo is ALMOST unplayable! | Gmod TTT	t	2022-09-20
zFbMsWMwW6U	The fastest No Scoper in the West | Gmod TTT	t	2023-06-28
q4pAikC1Fa8	It's time to get SERIOUS | Gmod TTT	t	2023-06-29
n8flDSFaBUk	This traitor trap is WAY TOO DANGEROUS | Gmod TTT	t	2023-07-01
0ePAy9ON6aM	What are you doing, Step Marine? | Gmod TTT	t	2023-07-04
boSGesFpomU	We're giving away Zoey's Secret Strats in Gmod TTT!	t	2023-07-06
iLZ69BAe0HE	Ben's been cursed with Lewis Vision in Gmod TTT!	t	2023-07-08
NN9A8L8expU	Zoey goes full Cryptid, spreads cursed joy in Gmod TTT!	t	2023-07-11
ELKjkoyU21A	Rythian breaks character, finally embraces the Zombies in Gmod TTT!	t	2023-07-13
OVe8ddpGgZQ	We combined two deadly weapons in Gmod TTT!	t	2023-07-15
XqzsityJF7I	We brought back something nobody asked for in Gmod TTT!	t	2023-07-18
6Oa-lMt4HXM	How to ruin a GUARANTEED WIN in Gmod TTT!	t	2023-07-20
M_VWQt-qtLw	Grab a detonator to win in the GREAT CORPSE RACE! | Gmod TTT	t	2023-07-22
c5AwkqJimFY	We love (and hate) the GIANT BF BEE!! | Gmod TTT	t	2023-07-25
q3A3FqDJTr4	Let's do the Zombie Conga! | Gmod TTT	t	2023-07-27
tG7nh3No6e0	Exactly zero traitors remembered this randomat | Gmod TTT	t	2023-07-29
CSp850uMz98	We need a good lie down after this map... | Gmod TTT	t	2023-08-01
HjBz5xKAfv8	Great Big Yogs Holiday 2023 | Gmod TTT	t	2023-08-03
hPk2VzNw_20	Every fail compilation has THIS round of Gmod TTT!	t	2023-08-05
Ge4gwl-E7vg	We're HYPNOTISED by this Lava Pit in Gmod TTT!	t	2023-08-08
RqABuPTymQ8	Traitors DON'T always win this Randomat!! | Gmod TTT	t	2023-08-12
jA94_TZQy24	The Infinite Swapper Glitch! | Gmod TTT	t	2023-08-15
ViwjczL50NA	Where could we BEE?! | Gmod TTT	t	2023-08-19
y7D6Mf89_Mk	Zylus can't defend himself, shames his entire family | Gmod TTT	t	2023-08-22
2SMlc_4LsR8	TTT but everyone gets ONE FREE RESPAWN	t	2023-08-25
RraNHJ4jPFg	Duncan's new favourite tool: The Disguiser! | Gmod TTT	t	2023-08-26
6_BXq1ENmBs	Everyone played these rounds ~perfectly~ | Gmod TTT	t	2023-08-29
61F0zLUiQFk	We're adding some very dumb new rules to Gmod TTT!	t	2023-08-31
WSo3UdBs-xE	Every Jester Role in one video?! | Gmod TTT	t	2023-09-02
qQQt8YlMQlo	Can you win Gmod TTT BLINDFOLDED?!? ... no.	t	2023-09-05
0gG18aSXHnI	Classy Ghost kills Lewis 5 times | Gmod TTT	t	2023-09-07
U1sdGCDBqHs	Ben gets more lives, uses them terribly | Gmod TTT	t	2023-09-09
NdW0AA_gD88	We try an ancient, hidden technique... Listening | Gmod TTT	t	2023-09-12
LWyxwnmup9Y	Traitors! Stop this CURSED CHAT!! | Gmod TTT	t	2023-09-16
T-QB1SzoyDY	Solve this puzzle to win the lottery!! | Gmod TTT	t	2023-09-19
qj-rGf7F04g	Zoey makes the most DANGEROUS room in Gmod TTT!	t	2023-09-23
ImyENeSgooo	Don't let the MAGIC TURTLES touch!! | Gmod TTT	t	2023-09-26
L08HY3H66uM	The Buddy System NEVER WORKS! | Gmod TTT	t	2023-09-30
l5UfRRmEZOs	Kirsty builds the dumbest randomat yet | Gmod TTT	t	2023-10-03
BoN4LT1_xBs	Don't eat my Speedy Borgir!! | Gmod TTT	t	2023-10-07
1T0soBuuPsA	Ben's accidental 1000 IQ Jester Play | Gmod TTT	t	2023-10-10
frIpOc3HK14	The Worst Detectives are ON THE CASE! | Gmod TTT	t	2023-10-14
0F9oohSh4gw	We destroy this map with NUKES and MORE! | Gmod TTT	t	2023-10-17
Yi24WMIqsHg	lmao bang | Gmod TTT	t	2023-10-21
CCcYumIOlfk	A vote for Zylus is a vote for ADMIN ABUSE | Gmod TTT	t	2023-10-24
mFpIvwkVtHo	We voted for some TERRIBLE Randomats!! | Gmod TTT	t	2023-10-28
MQNcCyzpOkQ	Betrayed by my own SHADOW?! | Gmod TTT	t	2023-10-31
ACxqZiOpY5o	The DONATIONS made me do this!! | Gmod TTT	t	2023-11-04
5pvxVBVgEJ8	Duncan's unbelievable AFK Strat | Gmod TTT	t	2023-11-07
uH0-098F3GM	The Life or Death Roulette! | Gmod TTT	t	2023-11-11
1h-EW3JI-GM	It's Table and Barrel!! | Gmod TTT	t	2023-11-14
DnckQs8ndFU	Shoot me... but not me! | Gmod TTT	t	2023-11-18
7HYpBNlsPQc	The Loot Goblin is in charge now!! | Gmod TTT	t	2023-11-21
pHypufJTIjw	This is the coolest map we've ever played! | Gmod TTT	t	2023-11-25
xDyIcHVZ1hQ	This NEW ITEM lets us upgrade EVERYTHING?! | Gmod TTT	t	2023-12-04
4TD7y2ktRFI	Osie's Most Beautiful Game | Gmod TTT	t	2023-12-09
-FIaLXuVp-E	He's checking his list! | Gmod TTT Xmas Special	t	2023-12-14
7vnvAvKjWp4	Happy Holidays from Santa and Dead Monkey | Gmod TTT	t	2023-12-23
OMiRwInBZmM	Say the line, Rythian! | Gmod TTT	t	2023-12-27
YlfUfIQwmWg	Ugh, Zylus is being SO CRINGE right now... | Gmod TTT	t	2023-12-30
BgrCFRtjzB8	What we want from Gmod TTT in 2024	t	2024-01-02
Y27XhFtCcqs	We added TWO NEW ROLES to Gmod TTT!	t	2024-01-06
6aTeNzPMeOI	Watch this without ripping your headphones off CHALLENGE | Gmod TTT	t	2024-01-09
0qmTEopro6Y	Even more roles mean even weirder bugs! | Gmod TTT	t	2024-01-13
Q5ErlVIH31Q	Who's the FASTEST GUN in the Yogscast!? | Gmod TTT	f	2022-11-01
eIkEFaar-Qc	How to Win Rock, Paper, Scissors (and kill your soulmate) | Gmod TTT	f	2022-11-05
geRFB7ihD3M	The Magical Flying Shed | Gmod TTT (w/ RTGame)	f	2022-10-25
fTM_5NZFhRY	NEW Spooky Scary Skeleton Gun in Gmod TTT | Halloween Special!	f	2022-10-29
H2dmsjSF0Wo	You Will Die In 5 Seconds | Gmod TTT (w/ RTGame)	f	2022-11-08
tXmLUmbUJag	Rythian's Favourite Round of All Time | Gmod TTT (w/ RTGame)	f	2022-11-12
u8MzP3B0bMw	The WORST trade deal in Gmod TTT!	f	2022-11-15
JSq1OPfhJ-Y	There's more traitors than innocents inGmod TTT!?	f	2022-11-19
Gkak7LLJOqc	Come into my Goblin Hole!! | Gmod TTT	f	2022-11-22
otqA9aYtejA	The scream that destroyed YogTowers! | Gmod TTT	f	2022-11-25
PstAilWgMu4	7 DISGUSTING mutants learn how to kill | Gmod TTT	f	2022-12-01
WFD4kmH_zpI	We're FINALLY breaking the meta in Gmod TTT!	f	2022-12-03
463eWBId7jw	TTT XL! The most INCREDIBLE map we've ever played!	f	2022-12-06
HBfgvCLx808	We increased prop damage again... | Gmod TTT	f	2022-12-10
glwQJJICxw	The most dangerous hiding place in GmodTTT!	f	2022-12-13
HDfGua9hZzI	NEW ROLE: The ELVES are rising up!! | Christmas TTT Special	f	2022-12-17
0w1LHuToCXI	Why won't Santa wake up!? | Christmas TTT Special	f	2022-12-20
JqqN9U4D9CI	No one wants a DEFUSER for CHRISTMAS!! | Christmas TTT Special!	f	2022-12-24
m40z1K1TIK4	The rise of Benthazar Hellstrand II | Gmod TTT	f	2022-12-27
lQ4RQPuvHr0	Don't fall in the Plot Twist Pit!! | Gmod TTT	f	2022-12-31
l1I-S3xaiIY	Lewis and Boba's Big Adventure! | Gmod TTT	f	2023-01-03
GBrckzwMvTQ	Curse of the FOREVER SWAPPER! | Gmod TTT	f	2023-01-07
YAf7W6AcqNs	Pikachu is the TRUE Mad Scientist!! | Gmod TTT	f	2023-01-10
62m9fsf4iDM	Return to Doncon Temple!! | Gmod TTT	f	2023-01-14
qJQsEevyU6U	Zomies are taking over the MOON! | Gmod TTT	f	2023-01-17
v1pj4S1cxKw	There's a little Doncon inside us all! | Gmod TTT	f	2023-01-21
329BUNbvbVo	Would YOU excecute Ravs? | Gmod TTT	f	2023-01-24
_Bgupg2ga7Y	No dingus? | Gmod TTT	f	2023-01-28
gIwbQJJlCxw	The most dangerous hiding place in GmodTTT!	f	2022-12-13
VRLFaq9XcMc	Only admin abuse can end this AWFUL round of Gmod TTT!	f	2022-10-22
1ZU7e2bN1Wo	New server, new roles, new EVERYTHING in Gmod TTT!	f	2024-02-01
acn57YA4-C8	Don't put my name in the Death Note! | Gmod TTT	f	2024-02-06
TwxlKoCbERE	Ben's revolutionary new Traitor Tester! | Gmod TTT	f	2024-02-10
\.


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
-- Name: rounds rounds_guessed_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_guessed_fkey FOREIGN KEY (guessed) REFERENCES public.players(name);


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
-- Name: rounds rounds_vindicator_killer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_vindicator_killer_fkey FOREIGN KEY (vindicator_killer) REFERENCES public.players(name);


--
-- Name: rounds rounds_winning_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_winning_team_fkey FOREIGN KEY (winning_team) REFERENCES public.teams(team);


--
-- PostgreSQL database dump complete
--

