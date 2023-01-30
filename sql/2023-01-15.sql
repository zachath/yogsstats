--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
    detective text
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
    vid_end integer
);


ALTER TABLE public.round OWNER TO postgres;

--
-- Name: round_participation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.round_participation (
    id integer NOT NULL,
    player text NOT NULL,
    role text,
    team text
);


ALTER TABLE public.round_participation OWNER TO postgres;

--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    team text NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: video; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video (
    title text NOT NULL,
    vid text NOT NULL
);


ALTER TABLE public.video OWNER TO postgres;

--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (name) FROM stdin;
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
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role, detective) FROM stdin;
innocent	\N
traitor	\N
jester	\N
drunk	\N
randoman	\N
impersonator	\N
informant	\N
swapper	\N
clown	\N
hypnotist	\N
veteran	\N
beggar	\N
zombie	\N
turncoat	\N
mad scientist	\N
summoner	\N
parasite	\N
deputy	\N
loot goblin	\N
glitch	\N
paramedic	\N
elf	\N
detective	d
paladin	d
medium	d
tracker	d
santa	d
\.


--
-- Data for Name: round; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.round (id, date, winning_team, randomat, video, vid_start, vid_end) FROM stdin;
202211010	2022-11-01	innocents	none	Q5ErlVIH31Q	12	215
202211011	2022-11-01	traitors	Wasted	Q5ErlVIH31Q	237	575
202211012	2022-11-01	traitors	RISE FROM YOUR BEE	Q5ErlVIH31Q	609	853
202211013	2022-11-01	innocents	The innocent the traitors and the ugly	Q5ErlVIH31Q	879	958
202211014	2022-11-01	innocents	The innocent the traitors and the ugly	Q5ErlVIH31Q	994	1087
202211015	2022-11-01	innocents	The innocent the traitors and the ugly	Q5ErlVIH31Q	1104	1242
202211050	2022-11-05	jester	I dont think you realise the gravity of the situation	eIkEFaar-Qc	50	180
202210220	2022-10-23	innocents	none	VRLFaq9XcMc	36	181
202210221	2022-10-23	traitors	Its Breeh!	VRLFaq9XcMc	214	330
202210222	2022-10-23	innocents	Événement Aléatoire	VRLFaq9XcMc	364	469
202210223	2022-10-23	innocents	Everyone has their favourites	VRLFaq9XcMc	509	678
202210224	2022-10-23	innocents	You just triggered my trap card!	VRLFaq9XcMc	711	942
202210225	2022-10-23	jester	Unbelievable Guilt	VRLFaq9XcMc	976	1216
202210226	2022-10-23	innocents	Bullets my only weakness!	VRLFaq9XcMc	1250	1425
202210250	2022-10-25	traitors	none	geRFB7ihD3M	13	96
202210251	2022-10-25	innocents	NOT THE BEES!	geRFB7ihD3M	131	164
202210252	2022-10-25	traitors	You just triggered my trap card!	geRFB7ihD3M	173	565
202210253	2022-10-25	traitors	none	geRFB7ihD3M	611	848
202210254	2022-10-25	traitors	Gaseous Snake	geRFB7ihD3M	866	1100
202210290	2022-10-29	traitors	none	fTM_5NZFhRY	16	155
202210291	2022-10-29	traitors	none	fTM_5NZFhRY	184	344
202210292	2022-10-29	jester	none	fTM_5NZFhRY	377	500
202210293	2022-10-29	jester	none	fTM_5NZFhRY	539	674
202210294	2022-10-29	zombies	Random Deathmatch	fTM_5NZFhRY	711	907
202210295	2022-10-29	jester	Communism! Time to learn how to share	fTM_5NZFhRY	922	1079
202211051	2022-11-05	innocents	O Ruber Tree	eIkEFaar-Qc	224	269
202211052	2022-11-05	zombies	none	eIkEFaar-Qc	304	442
202211053	2022-11-05	jester	The Cake is a Lie	eIkEFaar-Qc	474	509
202211054	2022-11-05	jester	Rock Paper Scissors	eIkEFaar-Qc	543	671
202211055	2022-11-05	innocents	Gun Game	eIkEFaar-Qc	706	961
202211080	2022-11-08	innocents	Super Boing	H2dmsjSF0Wo	17	113
202211081	2022-11-08	innocents	We learned how to heal	H2dmsjSF0Wo	149	348
202211082	2022-11-08	innocents	Outcome? Prop go boom	H2dmsjSF0Wo	356	479
202211083	2022-11-08	clown	I love democracy I love the republic	H2dmsjSF0Wo	495	594
202211084	2022-11-08	innocents	Delayed Reaction	H2dmsjSF0Wo	616	718
202211085	2022-11-08	traitors	Unbelievable Guilt	H2dmsjSF0Wo	751	852
202211086	2022-11-08	innocents	Soulmates	H2dmsjSF0Wo	871	1029
202211120	2022-11-12	traitors	none	tXmLUmbUJag	66	282
202211121	2022-11-12	traitors	none	tXmLUmbUJag	298	466
202211122	2022-11-12	traitors	none	tXmLUmbUJag	498	630
202211123	2022-11-12	traitors	none	tXmLUmbUJag	666	864
202211150	2022-11-15	traitors	none	u8MzP3B0bMw	7	256
202211151	2022-11-15	jester	none	u8MzP3B0bMw	280	522
202211152	2022-11-15	innocents	Earthquake	u8MzP3B0bMw	555	725
202211153	2022-11-15	traitors	Paranormal Activity	u8MzP3B0bMw	743	896
202211154	2022-11-15	traitors	Oof	u8MzP3B0bMw	931	1114
202211190	2022-11-19	innocents	Suicide Squad	JSq1OPfhJ-Y	98	158
202211191	2022-11-19	innocents	Bad trip	JSq1OPfhJ-Y	189	429
202211192	2022-11-19	traitors	The detective is acting suspicious	JSq1OPfhJ-Y	464	565
202211193	2022-11-19	innocents	No one can hide from my sight	JSq1OPfhJ-Y	603	783
202211194	2022-11-19	traitors	not shown	JSq1OPfhJ-Y	811	884
202211195	2022-11-19	traitors	Unbelievable Guilt	JSq1OPfhJ-Y	916	993
202211220	2022-11-22	traitors	Second Chance	Gkak7LLJOqc	77	239
202211221	2022-11-22	innocents	A random person will explode	Gkak7LLJOqc	269	330
202211222	2022-11-22	innocents	Trickle-Down economics	Gkak7LLJOqc	354	638
202211223	2022-11-22	innocents	Opposite day	Gkak7LLJOqc	660	765
202211224	2022-11-22	innocents	Second chance	Gkak7LLJOqc	799	982
202211225	2022-11-22	innocents	not shown	Gkak7LLJOqc	1014	1091
202211250	2022-11-25	jester	Deflation	otqA9aYtejA	38	113
202211251	2022-11-25	traitors	none	otqA9aYtejA	145	311
202211252	2022-11-25	zombies	none	otqA9aYtejA	335	483
202211253	2022-11-25	jester	none	otqA9aYtejA	551	604
202211254	2022-11-25	traitors	none	otqA9aYtejA	642	775
202211255	2022-11-25	innocents	none	otqA9aYtejA	799	930
202211256	2022-11-25	jester	They have a cave troll	otqA9aYtejA	975	1013
202211257	2022-11-25	innocents	Who's Who	otqA9aYtejA	1046	1197
202212010	2022-12-01	traitors	none	PstAilWgMu4	12	242
202212011	2022-12-01	innocents	none	PstAilWgMu4	277	369
202212012	2022-12-01	innocents	Welcome back to TTT	PstAilWgMu4	398	568
202212013	2022-12-01	innocents	none	PstAilWgMu4	591	719
202212014	2022-12-01	traitors	none	PstAilWgMu4	752	936
202212030	2022-12-03	traitors	none	WFD4kmH_zpI	111	442
202212031	2022-12-03	traitors	none	WFD4kmH_zpI	474	725
202212032	2022-12-03	innocents	none	WFD4kmH_zpI	755	891
202212033	2022-12-03	innocents	none	WFD4kmH_zpI	925	1253
202212060	2022-12-06	innocents	Welcome back to TTT!	463eWBId7jw	13	497
202212061	2022-12-06	zombies	The Randochat	463eWBId7jw	847	1006
202212062	2022-12-06	innocents	Dead Weather	463eWBId7jw	1039	1344
202212063	2022-12-06	innocents	OMG WHATS MY HEALTH	463eWBId7jw	1351	1680
202212064	2022-12-06	traitors	AMOGUS	463eWBId7jw	1700	1777
202212065	2022-12-06	innocents	Dnt do it	463eWBId7jw	1812	1895
202212100	2022-12-10	innocents	Deathly Chaos	HBfgvCLx808	8	128
202212101	2022-12-10	traitors	Dead Men Tell ALL Tales	HBfgvCLx808	162	327
202212102	2022-12-10	innocents	I love democracy, I love the republic.	HBfgvCLx808	335	441
202212103	2022-12-10	innocents	The bar has been raised!	HBfgvCLx808	470	601
202212104	2022-12-10	innocents	Ghostly Revenge	HBfgvCLx808	628	690
202212105	2022-12-10	innocents	Ghostly Revenge	HBfgvCLx808	706	793
202212106	2022-12-10	traitors	none	HBfgvCLx808	810	908
202212130	2022-12-13	jester	droping this	glwQJJICxw	17	38
202212131	2022-12-13	innocents	droping this	glwQJJICxw	45	331
202212132	2022-12-13	traitors	droping this	glwQJJICxw	356	422
202212133	2022-12-13	innocents	droping this	glwQJJICxw	437	496
202212134	2022-12-13	innocents	droping this	glwQJJICxw	528	644
202212135	2022-12-13	innocents	droping this	glwQJJICxw	677	755
202212136	2022-12-13	jester	droping this	glwQJJICxw	785	916
202212170	2022-12-17	traitors	droping this	HDfGua9hZzI	18	237
202212171	2022-12-17	innocents	droping this	HDfGua9hZzI	268	605
202212172	2022-12-17	traitors	droping this	HDfGua9hZzI	635	713
202212173	2022-12-17	elves	droping this	HDfGua9hZzI	738	895
202212174	2022-12-17	innocents	droping this	HDfGua9hZzI	920	1187
202212200	2022-12-20	zombies	\N	0w1LHuToCXI	16	197
202212201	2022-12-20	innocents	\N	0w1LHuToCXI	231	435
202212202	2022-12-20	innocents	\N	0w1LHuToCXI	471	708
202212203	2022-12-20	zombies	\N	0w1LHuToCXI	743	892
202212204	2022-12-20	jester	\N	0w1LHuToCXI	927	1045
202212240	2022-12-24	jester	\N	JqqN9U4D9CI	14	151
202212241	2022-12-24	elves	\N	JqqN9U4D9CI	185	349
202212242	2022-12-24	innocents	\N	JqqN9U4D9CI	384	521
202212243	2022-12-24	traitors	\N	JqqN9U4D9CI	553	672
202212244	2022-12-24	elves	\N	JqqN9U4D9CI	706	893
202212245	2022-12-24	innocents	\N	JqqN9U4D9CI	926	1065
202212246	2022-12-24	traitors	\N	JqqN9U4D9CI	1100	1148
202212270	2022-12-27	zombies	\N	m40z1K1TIK4	8	156
202212271	2022-12-27	innocents	\N	m40z1K1TIK4	190	342
202212272	2022-12-27	innocents	\N	m40z1K1TIK4	375	433
202212273	2022-12-27	innocents	\N	m40z1K1TIK4	468	604
202212274	2022-12-27	traitors	\N	m40z1K1TIK4	638	770
202212275	2022-12-27	innocents	\N	m40z1K1TIK4	806	1023
202212310	2022-12-31	jester	\N	lQ4RQPuvHr0	10	84
202212311	2022-12-31	innocents	\N	lQ4RQPuvHr0	115	188
202212312	2022-12-31	innocents	\N	lQ4RQPuvHr0	220	405
202212313	2022-12-31	innocents	\N	lQ4RQPuvHr0	435	555
202212314	2022-12-31	traitors	\N	lQ4RQPuvHr0	590	814
202301030	2023-01-03	innocents	\N	l1I-S3xaiIY	10	126
202301031	2023-01-03	clown	\N	l1I-S3xaiIY	161	440
202301032	2023-01-03	traitors	\N	l1I-S3xaiIY	473	592
202301033	2023-01-03	traitors	\N	l1I-S3xaiIY	626	782
202301034	2023-01-03	traitors	\N	l1I-S3xaiIY	816	987
202301070	2023-01-07	innocents	\N	GBrckzwMvTQ	28	230
202301071	2023-01-07	traitors	\N	GBrckzwMvTQ	263	422
202301072	2023-01-07	zombies	\N	GBrckzwMvTQ	457	593
202301073	2023-01-07	jester	\N	GBrckzwMvTQ	624	683
202301074	2023-01-07	jester	\N	GBrckzwMvTQ	718	814
202301075	2023-01-07	innocents	\N	GBrckzwMvTQ	848	1022
202301035	2023-01-03	innocents	\N	l1I-S3xaiIY	1017	1222
202301100	2023-01-10	traitors	\N	YAf7W6AcqNs	14	147
202301101	2023-01-10	innocents	\N	YAf7W6AcqNs	183	312
202301102	2023-01-10	traitors	\N	YAf7W6AcqNs	344	463
202301103	2023-01-10	traitors	\N	YAf7W6AcqNs	484	561
202301104	2023-01-10	traitors	\N	YAf7W6AcqNs	585	796
202301105	2023-01-10	zombies	\N	YAf7W6AcqNs	821	1029
202301140	2023-01-14	traitors	\N	62m9fsf4iDM	14	50
202301141	2023-01-14	traitors	\N	62m9fsf4iDM	85	202
202301142	2023-01-14	traitors	\N	62m9fsf4iDM	236	547
202301143	2023-01-14	clown	\N	62m9fsf4iDM	575	911
\.


--
-- Data for Name: round_participation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.round_participation (id, player, role, team) FROM stdin;
202210250	Ben	paladin	innocents
202210250	Duncan	traitor	traitors
202210250	Pedguin	turncoat	traitors
202210250	Boba	innocent	innocents
202210250	Rythian	innocent	innocents
202210250	RTGame	summoner	traitors
202210251	Lewis	innocent	innocents
202210251	Ben	turncoat	innocents
202210251	Duncan	innocent	innocents
202210251	Pedguin	parasite	traitors
202210251	Boba	medium	innocents
202210251	Rythian	traitor	traitors
202210252	Lewis	innocent	innocents
202210252	Ben	turncoat	innocents
202210252	Duncan	innocent	innocents
202210252	Pedguin	impersonator	traitors
202210252	Boba	traitor	traitors
202210252	Rythian	randoman	innocents
202210252	RTGame	jester	jester
202210253	Lewis	veteran	innocents
202210253	Ben	innocent	innocents
202210253	Pedguin	traitor	traitors
202210253	Boba	innocent	innocents
202210253	Rythian	paladin	innocents
202210253	RTGame	informant	traitors
202210254	Lewis	summoner	traitors
202210254	Ben	paladin	innocents
202210254	Duncan	glitch	innocents
202210254	Pedguin	traitor	traitors
202210254	Boba	innocent	innocents
202210254	Rythian	jester	jester
202210254	RTGame	innocent	innocents
202210290	Lewis	mad scientist	zombies
202210290	Ben	innocent	innocents
202210290	Duncan	innocent	innocents
202210290	Pedguin	traitor	traitors
202210290	Breeh	tracker	innocents
202210290	Rythian	jester	jester
202210290	Ravs	parasite	traitors
202210290	Kirsty	turncoat	traitors
202210291	Lewis	innocent	innocents
202210291	Ben	jester	jester
202210291	Duncan	innocent	innocents
202210291	Pedguin	traitor	traitors
202210291	Breeh	informant	traitors
202210291	Rythian	paramedic	innocents
202210291	Ravs	tracker	innocents
202210291	Kirsty	mad scientist	zombies
202210292	Lewis	veteran	innocents
202210292	Ben	informant	traitors
202210292	Duncan	traitor	traitors
202210292	Pedguin	innocent	innocents
202210292	Breeh	mad scientist	zombies
202210292	Rythian	tracker	innocents
202210292	Ravs	jester	jester
202210292	Kirsty	innocent	innocents
202210293	Lewis	summoner	traitors
202210293	Ben	medium	innocents
202210293	Duncan	traitor	traitors
202210293	Pedguin	zombie	zombies
202210293	Breeh	innocent	innocents
202210293	Rythian	turncoat	innocents
202210293	Ravs	mad scientist	zombies
202210293	Kirsty	jester	jester
202210294	Lewis	traitor	traitors
202210294	Ben	zombie	zombies
202210294	Duncan	zombie	zombies
202210294	Pedguin	innocent	innocents
202210294	Breeh	zombie	zombies
202210294	Rythian	zombie	zombies
202210294	Ravs	mad scientist	zombies
202210220	Lewis	mad scientist	zombies
202210220	Ben	parasite	traitors
202210220	Duncan	deputy	innocents
202210250	Lewis	drunk	none
202210251	RTGame	beggar	none
202210253	Duncan	swapper	none
202210220	Ravs	traitor	traitors
202210220	Pedguin	innocent	innocents
202210220	Boba	jester	jester
202210294	Kirsty	zombie	zombies
202210295	Lewis	veteran	innocents
202210295	Ben	jester	jester
202210295	Duncan	impersonator	traitors
202210295	Pedguin	randoman	innocents
202210295	Breeh	parasite	traitors
202210295	Rythian	innocent	innocents
202210295	Ravs	traitor	traitors
202210295	Kirsty	innocent	innocents
202211010	Lewis	traitor	traitors
202211010	Ben	mad scientist	zombies
202211010	Duncan	innocent	innocents
202211010	Pedguin	innocent	innocents
202211010	Breeh	zombie	zombies
202211010	Boba	swapper	jester
202211010	Ravs	glitch	innocents
202211010	Daltos	tracker	innocents
202211011	Lewis	traitor	traitors
202211011	Ben	summoner	traitors
202211011	Duncan	randoman	innocents
202211011	Pedguin	loot goblin	jester
202211011	Breeh	impersonator	traitors
202211011	Boba	innocent	innocents
202211011	Ravs	innocent	innocents
202211011	Daltos	glitch	innocents
202211012	Lewis	beggar	traitors
202211012	Ben	mad scientist	zombies
202211012	Duncan	veteran	innocents
202211012	Pedguin	tracker	innocents
202211012	Breeh	summoner	traitors
202211012	Boba	traitor	traitors
202211012	Ravs	innocent	innocents
202211012	Daltos	innocent	innocents
202211013	Lewis	innocent	innocents
202211013	Ben	parasite	traitors
202211013	Duncan	turncoat	innocents
202211013	Pedguin	randoman	innocents
202211013	Breeh	innocent	innocents
202211013	Boba	innocent	innocents
202211013	Ravs	innocent	innocents
202211013	Daltos	traitor	traitors
202211014	Lewis	innocent	innocents
202211014	Ben	paramedic	innocents
202211014	Duncan	innocent	innocents
202211014	Pedguin	traitor	traitors
202211014	Breeh	randoman	innocents
202211014	Boba	innocent	innocents
202211014	Ravs	innocent	innocents
202211014	Daltos	summoner	traitors
202211015	Lewis	informant	traitors
202211015	Ben	glitch	innocents
202211015	Duncan	tracker	innocents
202211015	Pedguin	traitor	traitors
202211015	Breeh	traitor	traitors
202211015	Boba	innocent	innocents
202211015	Ravs	innocent	innocents
202211015	Daltos	innocent	innocents
202211050	Lewis	turncoat	traitors
202211050	Ben	hypnotist	traitors
202211050	Duncan	jester	jester
202211050	Pedguin	innocent	innocents
202211050	Boba	randoman	innocents
202211050	Ravs	traitor	traitors
202211050	Daltos	innocent	innocents
202211051	Lewis	parasite	traitors
202211051	Ben	tracker	innocents
202211051	Duncan	glitch	innocents
202211051	Pedguin	innocent	innocents
202211051	Breeh	innocent	innocents
202211051	Boba	informant	traitors
202211051	Ravs	traitor	traitors
202211052	Lewis	traitor	traitors
202211052	Ben	jester	jester
202211052	Duncan	innocent	innocents
202211052	Pedguin	mad scientist	zombies
202211052	Breeh	impersonator	traitors
202211052	Boba	zombie	zombies
202211052	Ravs	tracker	innocents
202211052	Daltos	innocent	innocents
202211053	Ben	innocent	innocents
202211053	Duncan	jester	jester
202211053	Pedguin	traitor	traitors
202211053	Breeh	deputy	innocents
202211053	Boba	summoner	traitors
202211053	Ravs	innocent	innocents
202211053	Daltos	randoman	innocents
202211054	Lewis	glitch	innocents
202211054	Ben	randoman	innocents
202211054	Duncan	impersonator	traitors
202211054	Pedguin	innocent	innocents
202211054	Breeh	jester	jester
202211054	Boba	innocent	innocents
202211054	Ravs	mad scientist	zombies
202211054	Daltos	traitor	traitors
202211055	Lewis	tracker	innocents
202211055	Duncan	traitor	traitors
202211055	Pedguin	traitor	traitors
202211055	Breeh	innocent	innocents
202211055	Boba	beggar	innocents
202211055	Ravs	turncoat	traitors
202211050	Breeh	drunk	none
202211051	Daltos	swapper	none
202211053	Lewis	drunk	none
202211055	Daltos	drunk	none
202211055	Ben	impersonator	traitors
202211080	Lewis	innocent	innocents
202211080	Ben	traitor	traitors
202211080	Duncan	hypnotist	traitors
202211080	Pedguin	veteran	innocents
202211080	RTGame	innocent	innocents
202211080	Boba	paladin	innocents
202211080	Rythian	drunk	none
202211081	Lewis	zombie	zombies
202211081	Ben	paladin	innocents
202211081	Duncan	innocent	innocents
202211081	Pedguin	turncoat	traitors
202211081	RTGame	innocent	innocents
202211081	Boba	traitor	traitors
202211081	Rythian	mad scientist	zombies
202211082	Lewis	jester	jester
202211082	Ben	impersonator	traitors
202211082	Duncan	medium	innocents
202211082	Pedguin	turncoat	traitors
202211082	RTGame	traitor	traitors
202211082	Boba	innocent	innocents
202211082	Rythian	innocent	innocents
202211083	Lewis	traitor	traitors
202211083	Ben	hypnotist	traitors
202211083	Duncan	clown	clown
202211083	Pedguin	innocent	innocents
202211083	RTGame	traitor	traitors
202211083	Boba	veteran	innocents
202211083	Rythian	randoman	innocents
202211084	Lewis	traitor	traitors
202211084	Ben	turncoat	innocents
202211084	Duncan	innocent	innocents
202211084	Pedguin	tracker	innocents
202211084	RTGame	zombie	zombies
202211084	Boba	mad scientist	zombies
202211084	Rythian	summoner	traitors
202211085	Lewis	innocent	innocents
202211085	Ben	innocent	innocents
202211085	Duncan	paladin	innocents
202211085	Pedguin	veteran	innocents
202211085	RTGame	traitor	traitors
202211085	Boba	swapper	none
202211085	Rythian	parasite	traitors
202211086	Lewis	innocent	innocents
202211086	Ben	informant	traitors
202211086	Duncan	innocent	innocents
202211086	Pedguin	swapper	none
202211086	RTGame	paladin	innocents
202211086	Boba	traitor	traitors
202211086	Rythian	deputy	innocents
202211120	Lewis	jester	jester
202211120	Ben	veteran	innocents
202211120	Duncan	tracker	innocents
202211120	Pedguin	innocent	innocents
202211120	RTGame	innocent	innocents
202211120	Boba	summoner	traitors
202211120	Rythian	traitor	traitors
202211121	Lewis	deputy	innocents
202211121	Ben	tracker	innocents
202211121	Duncan	innocent	innocents
202211121	Pedguin	innocent	innocents
202211121	RTGame	traitor	traitors
202211121	Boba	summoner	traitors
202211121	Rythian	turncoat	traitors
202211122	Lewis	glitch	innocents
202211122	Ben	tracker	innocents
202211122	Duncan	innocent	innocents
202211122	Pedguin	loot goblin	none
202211122	RTGame	traitor	traitors
202211122	Boba	innocent	innocents
202211122	Rythian	summoner	traitors
202211123	Lewis	traitor	traitors
202211123	Ben	paramedic	innocents
202211123	Duncan	beggar	traitors
202211123	Pedguin	innocent	innocents
202211123	RTGame	parasite	traitors
202211123	Boba	innocent	innocents
202211123	Rythian	innocent	innocents
202211150	Lewis	innocent	innocents
202211150	Ben	zombie	zombies
202211150	Duncan	mad scientist	zombies
202211150	Pedguin	tracker	innocents
202211150	Ravs	traitor	traitors
202211150	Breeh	summoner	traitors
202211150	Rythian	zombie	zombies
202211150	Kirsty	turncoat	innocents
202211151	Lewis	mad scientist	zombies
202211151	Ben	innocent	innocents
202211151	Duncan	traitor	traitors
202211151	Pedguin	innocent	innocents
202211151	Ravs	paladin	innocents
202211151	Breeh	turncoat	innocents
202211151	Rythian	parasite	traitors
202211151	Kirsty	jester	jester
202211152	Lewis	innocent	innocents
202211152	Ben	informant	traitors
202211152	Duncan	veteran	innocents
202211152	Pedguin	innocent	innocents
202211152	Ravs	beggar	none
202211152	Breeh	randoman	innocents
202211152	Rythian	parasite	traitors
202211152	Kirsty	mad scientist	zombies
202211153	Lewis	traitor	traitors
202211153	Ben	randoman	innocents
202211153	Duncan	impersonator	traitors
202211153	Pedguin	innocent	innocents
202211153	Ravs	hypnotist	traitors
202211153	Breeh	glitch	innocents
202211153	Rythian	parasite	traitors
202211153	Kirsty	mad scientist	zombies
202211154	Lewis	drunk	none
202211154	Ben	loot goblin	none
202211154	Duncan	innocent	innocents
202211154	Pedguin	tracker	innocents
202211154	Ravs	veteran	innocents
202211154	Breeh	summoner	traitors
202211154	Rythian	innocent	innocents
202211154	Kirsty	traitor	traitors
202211190	Ben	innocent	innocents
202211190	Duncan	veteran	innocents
202211190	Pedguin	traitor	traitors
202211190	Ravs	innocent	innocents
202211190	Breeh	mad scientist	zombies
202211190	Rythian	randoman	innocents
202211190	Kirsty	impersonator	traitors
202211191	Ben	traitor	traitors
202211191	Duncan	hypnotist	traitors
202211191	Pedguin	innocent	innocents
202211191	Ravs	traitor	traitors
202211191	Breeh	innocent	innocents
202211191	Rythian	medium	innocents
202211191	Kirsty	turncoat	traitors
202211192	Ben	parasite	traitors
202211192	Duncan	innocent	innocents
202211192	Pedguin	impersonator	traitors
202211192	Ravs	veteran	innocents
202211192	Breeh	innocent	innocents
202211192	Rythian	traitor	traitors
202211192	Kirsty	loot goblin	none
202211193	Ben	medium	innocents
202211193	Duncan	summoner	traitors
202211193	Pedguin	deputy	innocents
202211193	Ravs	innocent	innocents
202211193	Breeh	innocent	innocents
202211193	Rythian	traitor	traitors
202211193	Kirsty	clown	clown
202211194	Ben	beggar	traitors
202211194	Duncan	traitor	traitors
202211194	Pedguin	turncoat	traitors
202211194	Ravs	informant	traitors
202211194	Breeh	innocent	innocents
202211194	Rythian	paladin	innocents
202211194	Kirsty	innocent	innocents
202211195	Ben	traitor	traitors
202211195	Duncan	summoner	traitors
202211195	Pedguin	medium	innocents
202211195	Ravs	innocent	innocents
202211195	Breeh	innocent	innocents
202211195	Rythian	swapper	none
202211195	Kirsty	paramedic	innocents
202211220	Ben	summoner	traitors
202211220	Duncan	randoman	innocents
202211220	Shadow	innocent	innocents
202211220	Lolip	traitor	traitors
202211220	Zoey	turncoat	innocents
202211220	Zylus	innocent	innocents
202211220	Lewis	jester	jester
202211221	Ben	informant	traitors
202211221	Duncan	traitor	traitors
202211221	Shadow	tracker	innocents
202211221	Lolip	veteran	innocents
202211221	Zoey	innocent	innocents
202211221	Zylus	loot goblin	none
202211221	Lewis	innocent	innocents
202211222	Ben	innocent	innocents
202211222	Duncan	innocent	innocents
202211222	Shadow	beggar	traitors
202211222	Lolip	paladin	innocents
202211222	Zoey	summoner	traitors
202211222	Zylus	traitor	traitors
202211222	Lewis	paramedic	innocents
202211223	Ben	innocent	innocents
202211223	Duncan	traitor	traitors
202211223	Shadow	informant	traitors
202211223	Lolip	turncoat	traitors
202211223	Zoey	loot goblin	none
202211223	Zylus	paladin	innocents
202211223	Lewis	innocent	innocents
202211224	Ben	innocent	innocents
202211224	Duncan	medium	innocents
202211224	Shadow	innocent	innocents
202211224	Lolip	innocent	innocents
202211224	Zoey	informant	traitors
202211224	Zylus	veteran	innocents
202211224	Lewis	loot goblin	none
202211225	Ben	paramedic	innocents
202211225	Duncan	randoman	innocents
202211225	Shadow	innocent	innocents
202211225	Lolip	informant	traitors
202211225	Zoey	traitor	traitors
202211225	Zylus	hypnotist	traitors
202211225	Lewis	innocent	innocents
202211250	Ben	jester	jester
202211250	Duncan	paramedic	innocents
202211250	Shadow	informant	traitors
202211250	Lolip	randoman	innocents
202211250	Zoey	innocent	innocents
202211250	Lewis	traitor	traitors
202211251	Ben	traitor	traitors
202211251	Duncan	paladin	innocents
202211251	Shadow	glitch	innocents
202211251	Lolip	innocent	innocents
202211251	Zoey	innocent	innocents
202211251	Zylus	clown	clown
202211251	Lewis	summoner	traitors
202211252	Ben	zombie	zombies
202211252	Duncan	mad scientist	zombies
202211252	Shadow	paladin	innocents
202211252	Lolip	innocent	innocents
202211252	Zoey	zombie	zombies
202211252	Zylus	zombie	zombies
202211252	Lewis	paramedic	innocents
202211253	Ben	jester	jester
202211253	Duncan	paladin	innocents
202211253	Shadow	innocent	innocents
202211253	Lolip	innocent	innocents
202211253	Zoey	deputy	innocents
202211253	Zylus	summoner	traitors
202211253	Lewis	traitor	traitors
202211254	Ben	innocent	innocents
202211254	Duncan	beggar	traitors
202211254	Shadow	innocent	innocents
202211254	Lolip	tracker	innocents
202211254	Zoey	informant	traitors
202211254	Zylus	turncoat	traitors
202211254	Lewis	traitor	traitors
202211255	Ben	informant	traitors
202211255	Duncan	innocent	innocents
202211255	Shadow	innocent	innocents
202211255	Lolip	traitor	traitors
202211255	Zoey	clown	clown
202211255	Zylus	tracker	innocents
202211255	Lewis	glitch	innocents
202211256	Ben	traitor	traitors
202211256	Duncan	randoman	innocents
202211256	Shadow	jester	jester
202211256	Lolip	turncoat	innocents
202211256	Zoey	traitor	traitors
202211256	Zylus	innocent	innocents
202211256	Lewis	innocent	innocents
202211257	Ben	parasite	traitors
202211257	Duncan	traitor	traitors
202211257	Shadow	medium	innocents
202211257	Lolip	drunk	none
202211257	Zoey	innocent	innocents
202211257	Zylus	veteran	innocents
202211257	Lewis	innocent	innocents
202212010	Ben	innocent	innocents
202212010	Duncan	tracker	innocents
202212010	Shadow	loot goblin	none
202212010	Lolip	traitor	traitors
202212010	Zoey	parasite	traitors
202212010	Zylus	innocent	innocents
202212010	Lewis	veteran	innocents
202212011	Ben	turncoat	innocents
202212011	Duncan	innocent	innocents
202212011	Shadow	tracker	innocents
202212011	Lolip	traitor	traitors
202212011	Zoey	loot goblin	none
202212011	Zylus	traitor	traitors
202212011	Lewis	innocent	innocents
202212012	Ben	innocent	innocents
202212012	Duncan	traitor	traitors
202211250	Zylus	innocent	innocents
202212012	Shadow	glitch	innocents
202212012	Lolip	informant	traitors
202212012	Zoey	beggar	innocents
202212012	Zylus	randoman	innocents
202212012	Lewis	innocent	innocents
202212013	Ben	informant	traitors
202212013	Duncan	innocent	innocents
202212013	Shadow	veteran	innocents
202212013	Lolip	traitor	traitors
202212013	Zoey	paladin	innocents
202212013	Zylus	innocent	innocents
202212013	Lewis	drunk	none
202212014	Ben	beggar	none
202212014	Duncan	impersonator	traitors
202212014	Shadow	traitor	traitors
202212014	Lolip	veteran	innocents
202212014	Zoey	innocent	innocents
202212014	Zylus	randoman	innocents
202212014	Lewis	traitor	traitors
202212030	Ben	innocent	innocents
202212030	Duncan	zombie	zombies
202212030	Ravs	informant	traitors
202212030	Rythian	traitor	traitors
202212030	Zoey	mad scientist	zombies
202212030	Osie	innocent	innocents
202212030	Lewis	zombie	zombies
202212031	Ben	innocent	innocents
202212031	Duncan	clown	clown
202212031	Ravs	parasite	traitors
202212031	Rythian	medium	innocents
202212031	Zoey	traitor	traitors
202212031	Osie	innocent	innocents
202212031	Lewis	turncoat	innocents
202212032	Ben	medium	innocents
202212032	Duncan	mad scientist	zombies
202212032	Ravs	informant	traitors
202212032	Rythian	zombie	zombies
202212032	Zoey	innocent	innocents
202212032	Osie	traitor	traitors
202212032	Lewis	innocent	innocents
202212033	Ben	beggar	innocents
202212033	Duncan	summoner	traitors
202212033	Ravs	medium	innocents
202212033	Rythian	glitch	innocents
202212033	Zoey	traitor	traitors
202212033	Osie	innocent	innocents
202212033	Lewis	innocent	innocents
202210220	Breeh	randoman	innocents
202210220	Daltos	innocent	innocents
202210221	Lewis	informant	traitors
202210221	Ben	traitor	traitors
202210221	Duncan	innocent	innocents
202210221	Ravs	turncoat	traitors
202210221	Pedguin	medium	innocents
202210221	Boba	jester	jester
202210221	Breeh	drunk	none
202210221	Daltos	innocent	innocents
202210222	Lewis	informant	traitors
202210222	Ben	paladin	innocents
202210222	Duncan	innocent	innocents
202210222	Ravs	innocent	innocents
202210222	Pedguin	traitor	traitors
202210222	Boba	veteran	innocents
202210222	Breeh	loot goblin	jester
202210222	Daltos	parasite	traitors
202210223	Lewis	innocent	innocents
202210223	Ben	traitor	traitors
202210223	Duncan	parasite	traitors
202210223	Ravs	mad scientist	zombies
202210223	Pedguin	innocent	innocents
202210223	Boba	beggar	none
202210223	Breeh	turncoat	traitors
202210223	Daltos	medium	innocents
202210224	Lewis	jester	jester
202210224	Ben	paladin	innocents
202210224	Duncan	traitor	traitors
202210224	Ravs	traitor	traitors
202210224	Pedguin	glitch	innocents
202210224	Boba	informant	traitors
202210224	Breeh	innocent	innocents
202210224	Daltos	hypnotist	traitors
202210225	Lewis	glitch	innocents
202210225	Ben	jester	jester
202210225	Duncan	zombie	zombies
202210225	Ravs	zombie	zombies
202210225	Pedguin	mad scientist	zombies
202210225	Boba	innocent	innocents
202210225	Breeh	zombie	zombies
202210225	Daltos	zombie	zombies
202210226	Lewis	innocent	innocents
202210226	Ben	jester	jester
202210226	Duncan	traitor	traitors
202210226	Ravs	paramedic	innocents
202210226	Pedguin	randoman	innocents
202210226	Boba	innocent	innocents
202210226	Breeh	informant	traitors
202210226	Daltos	innocent	innocents
202212060	Ben	randoman	innocents
202212060	Duncan	innocent	innocents
202212060	Ravs	traitor	traitors
202212060	Rythian	veteran	innocents
202212060	Zoey	innocent	innocents
202212060	Osie	impersonator	traitors
202212060	Lewis	mad scientist	zombies
202212061	Ben	zombie	zombies
202212061	Duncan	zombie	zombies
202212061	Ravs	zombie	zombies
202212061	Rythian	zombie	zombies
202212061	Zoey	innocent	innocents
202212061	Osie	zombie	zombies
202212061	Lewis	zombie	zombies
202212062	Ben	glitch	innocents
202212062	Duncan	jester	jester
202212062	Ravs	innocent	innocents
202212062	Rythian	traitor	traitors
202212062	Zoey	innocent	innocents
202212062	Osie	informant	traitors
202212062	Lewis	paladin	innocents
202212063	Ben	randoman	innocents
202212063	Duncan	innocent	innocents
202212063	Ravs	loot goblin	none
202212063	Rythian	glitch	innocents
202212063	Zoey	innocent	innocents
202212063	Osie	impersonator	traitors
202212063	Lewis	traitor	traitors
202212064	Ben	traitor	traitors
202212064	Duncan	innocent	innocents
202212064	Ravs	traitor	traitors
202212064	Rythian	innocent	innocents
202212064	Zoey	innocent	innocents
202212064	Osie	innocent	innocents
202212064	Lewis	innocent	innocents
202212065	Ben	innocent	innocents
202212065	Duncan	innocent	innocents
202212065	Ravs	tracker	innocents
202212065	Rythian	beggar	none
202212065	Zoey	traitor	traitors
202212065	Osie	turncoat	innocents
202212065	Lewis	informant	traitors
202212100	Ben	traitor	traitors
202212100	Duncan	glitch	innocents
202212100	Ravs	paladin	innocents
202212100	Rythian	jester	jester
202212100	Zoey	informant	traitors
202212100	Osie	turncoat	innocents
202212100	Lewis	innocent	innocents
202212101	Ben	innocent	innocents
202212101	Duncan	mad scientist	zombies
202212101	Ravs	parasite	traitors
202212101	Rythian	innocent	innocents
202212101	Zoey	traitor	traitors
202212101	Osie	tracker	innocents
202212101	Lewis	veteran	innocents
202212102	Ben	paladin	innocents
202212102	Duncan	innocent	innocents
202212102	Ravs	swapper	none
202212102	Rythian	traitor	traitors
202212102	Zoey	innocent	innocents
202212102	Osie	glitch	innocents
202212102	Lewis	informant	traitors
202212103	Ben	tracker	innocents
202212103	Duncan	traitor	traitors
202212103	Ravs	innocent	innocents
202212103	Rythian	veteran	innocents
202212103	Zoey	beggar	innocents
202212103	Osie	parasite	traitors
202212103	Lewis	innocent	innocents
202212104	Ben	traitor	traitors
202212104	Duncan	innocent	innocents
202212104	Ravs	tracker	innocents
202212104	Rythian	informant	traitors
202212104	Zoey	beggar	innocents
202212104	Osie	parasite	traitors
202212104	Lewis	glitch	innocents
202212105	Ben	traitor	traitors
202212105	Duncan	glitch	innocents
202212105	Ravs	randoman	innocents
202212105	Rythian	innocent	innocents
202212105	Zoey	innocent	innocents
202212105	Osie	jester	jester
202212105	Lewis	glitch	innocents
202212106	Ben	innocent	innocents
202212106	Duncan	randoman	innocents
202212106	Ravs	parasite	traitors
202212106	Rythian	beggar	traitors
202212106	Zoey	innocent	innocents
202212106	Osie	traitor	traitors
202212106	Lewis	glitch	innocents
202212130	Ben	traitor	traitors
202212130	Duncan	informant	traitors
202212130	Ravs	paladin	innocents
202212130	Rythian	veteran	innocents
202212130	Zoey	jester	jester
202212130	Osie	innocent	innocents
202212130	Lewis	innocent	innocents
202212131	Ben	innocent	innocents
202212131	Duncan	innocent	innocents
202212131	Ravs	paladin	innocents
202212131	Rythian	deputy	innocents
202212131	Zoey	swapper	none
202212131	Osie	traitor	traitors
202212131	Lewis	informant	traitors
202212132	Ben	randoman	innocents
202212132	Duncan	innocent	innocents
202212132	Ravs	swapper	none
202212132	Rythian	innocent	innocents
202212132	Zoey	summoner	traitors
202212132	Osie	turncoat	innocents
202212132	Lewis	traitor	traitors
202212133	Ben	parasite	traitors
202212133	Duncan	innocent	innocents
202212133	Ravs	traitor	traitors
202212133	Rythian	paramedic	innocents
202212133	Zoey	randoman	innocents
202212133	Osie	jester	jester
202212133	Lewis	innocent	innocents
202212134	Ben	traitor	traitors
202212134	Duncan	innocent	innocents
202212134	Ravs	paramedic	innocents
202212134	Rythian	randoman	innocents
202212134	Zoey	innocent	innocents
202212134	Osie	impersonator	traitors
202212134	Lewis	loot goblin	traitors
202212135	Ben	traitor	traitors
202212135	Duncan	innocent	innocents
202212135	Ravs	innocent	innocents
202212135	Rythian	glitch	innocents
202212135	Zoey	randoman	innocents
202212135	Osie	jester	jester
202212135	Lewis	summoner	traitors
202212136	Ben	informant	traitors
202212136	Duncan	tracker	innocents
202212136	Ravs	jester	jester
202212136	Rythian	mad scientist	zombies
202212136	Zoey	deputy	innocents
202212136	Osie	informant	traitors
202212136	Lewis	deputy	innocents
202212170	Lewis	innocent	innocents
202212170	Ben	summoner	traitors
202212170	Duncan	santa	innocents
202212170	Osie	drunk	none
202212170	Shadow	veteran	innocents
202212170	Breeh	innocent	innocents
202212170	Lolip	traitor	traitors
202212170	Rythian	traitor	traitors
202212171	Lewis	zombie	zombies
202212171	Ben	innocent	innocents
202212171	Duncan	santa	innocents
202212171	Rythian	jester	jester
202212171	Osie	traitor	traitors
202212171	Shadow	glitch	innocents
202212171	Breeh	mad scientist	zombies
202212171	Lolip	innocent	innocents
202212172	Lewis	parasite	traitors
202212172	Ben	traitor	traitors
202212172	Duncan	santa	innocents
202212172	Rythian	innocent	innocents
202212172	Osie	innocent	innocents
202212172	Shadow	veteran	innocents
202212172	Breeh	loot goblin	none
202212172	Lolip	glitch	innocents
202212173	Lewis	elf	elves
202212173	Ben	elf	elves
202212173	Duncan	elf	elves
202212173	Rythian	elf	elves
202212173	Osie	elf	elves
202212173	Shadow	elf	elves
202212173	Breeh	elf	elves
202212173	Lolip	elf	elves
202212174	Lewis	elf	elves
202212174	Ben	elf	elves
202212174	Duncan	elf	elves
202212174	Rythian	elf	elves
202212174	Osie	detective	innocents
202212174	Shadow	traitor	traitors
202212174	Breeh	elf	elves
202212174	Lolip	elf	elves
202212200	Lewis	innocent	innocents
202212200	Ben	zombie	zombies
202212200	Duncan	zombie	zombies
202212200	Rythian	swapper	none
202212200	Osie	zombie	zombies
202212200	Shadow	zombie	zombies
202212200	Breeh	mad scientist	zombies
202212200	Lolip	zombie	zombies
202212201	Lewis	santa	innocents
202212201	Ben	innocent	innocents
202212201	Duncan	impersonator	traitors
202212201	Rythian	loot goblin	none
202212201	Osie	innocent	innocents
202212201	Shadow	veteran	innocents
202212201	Breeh	traitor	traitors
202212201	Lolip	mad scientist	zombies
202212202	Lewis	traitor	traitors
202212202	Ben	innocent	innocents
202212202	Duncan	glitch	innocents
202212202	Rythian	jester	none
202212202	Osie	santa	innocents
202212202	Shadow	parasite	traitors
202212202	Breeh	innocent	innocents
202212202	Lolip	innocent	innocents
202212203	Lewis	mad scientist	zombies
202212203	Ben	zombie	zombies
202212203	Duncan	traitor	traitors
202212203	Rythian	zombie	zombies
202212203	Osie	zombie	zombies
202212203	Shadow	beggar	none
202212203	Breeh	innocent	innocents
202212203	Lolip	zombie	zombies
202212204	Lewis	parasite	traitors
202212204	Ben	jester	jester
202212204	Duncan	innocent	innocents
202212204	Rythian	innocent	innocents
202212204	Osie	paramedic	innocents
202212204	Shadow	traitor	traitors
202212204	Breeh	medium	innocents
202212204	Lolip	mad scientist	zombies
202212240	Lewis	informant	traitors
202212240	Ben	innocent	innocents
202212240	Duncan	jester	jester
202212240	Rythian	santa	innocents
202212240	Osie	innocent	innocents
202212240	Shadow	traitor	traitors
202212240	Breeh	drunk	none
202212240	Lolip	turncoat	traitors
202212241	Lewis	randoman	innocents
202212241	Ben	innocent	innocents
202212241	Duncan	elf	elves
202212241	Rythian	elf	elves
202212241	Osie	elf	elves
202212241	Shadow	traitor	traitors
202212241	Breeh	elf	elves
202212241	Lolip	elf	elves
202212242	Lewis	loot goblin	none
202212242	Ben	summoner	traitors
202212242	Duncan	traitor	traitors
202212242	Rythian	innocent	innocents
202212242	Osie	elf	elves
202212242	Shadow	veteran	innocents
202212242	Breeh	detective	innocents
202212242	Lolip	innocent	innocents
202212243	Lewis	hypnotist	traitors
202212243	Ben	paramedic	innocents
202212243	Duncan	paramedic	innocents
202212243	Rythian	traitor	traitors
202212243	Osie	paramedic	innocents
202212243	Shadow	mad scientist	zombies
202212243	Breeh	hypnotist	traitors
202212243	Lolip	paramedic	innocents
202212244	Lewis	elf	elves
202212244	Ben	elf	elves
202212244	Duncan	elf	elves
202212244	Rythian	elf	elves
202212244	Osie	elf	elves
202212244	Shadow	elf	elves
202212244	Breeh	elf	elves
202212244	Lolip	elf	elves
202212245	Lewis	innocent	innocents
202212245	Ben	turncoat	innocents
202212245	Duncan	jester	jester
202212245	Rythian	innocent	innocents
202212245	Osie	traitor	traitors
202212245	Shadow	informant	traitors
202212245	Breeh	innocent	innocents
202212245	Lolip	santa	innocents
202212246	Lewis	innocent	innocents
202212246	Ben	turncoat	innocents
202212246	Duncan	paladin	innocents
202212246	Rythian	traitor	traitors
202212246	Osie	jester	jester
202212246	Shadow	deputy	innocents
202212246	Breeh	innocent	innocents
202212246	Lolip	parasite	traitors
202212270	Lewis	mad scientist	zombies
202212270	Ben	traitor	traitors
202212270	Rythian	turncoat	innocents
202212270	Boba	zombie	zombies
202212270	Kirsty	zombie	zombies
202212270	Ravs	zombie	zombies
202212271	Lewis	paramedic	innocents
202212271	Ben	traitor	traitors
202212271	Rythian	paladin	innocents
202212271	Boba	innocent	innocents
202212271	Kirsty	summoner	traitors
202212271	Ravs	mad scientist	zombies
202212272	Lewis	innocent	innocents
202212272	Ben	paladin	innocents
202212272	Rythian	beggar	none
202212272	Boba	innocent	innocents
202212272	Kirsty	traitor	traitors
202212272	Ravs	turncoat	innocents
202212273	Lewis	beggar	none
202212273	Ben	innocent	innocents
202212273	Rythian	summoner	traitors
202212273	Boba	turncoat	innocents
202212273	Kirsty	innocent	innocents
202212273	Ravs	paladin	innocents
202212274	Lewis	veteran	innocents
202212274	Ben	traitor	traitors
202212274	Rythian	traitor	traitors
202212274	Boba	informant	traitors
202212274	Kirsty	traitor	traitors
202212274	Ravs	randoman	innocents
202212275	Lewis	medium	innocents
202212275	Ben	innocent	innocents
202212275	Rythian	innocent	innocents
202212275	Boba	veteran	innocents
202212275	Kirsty	clown	clown
202212275	Ravs	traitor	traitors
202212270	Zylus	zombie	zombies
202212271	Zylus	innocent	innocents
202212272	Zylus	informant	traitors
202212273	Zylus	traitor	traitors
202212274	Zylus	traitor	traitors
202212275	Zylus	informant	traitors
202212310	Lewis	paramedic	innocents
202212310	Ben	jester	jester
202212310	Zylus	innocent	innocents
202212310	Rythian	innocent	innocents
202212310	Boba	traitor	traitors
202212310	Kirsty	informant	traitors
202212310	Ravs	paladin	innocents
202212311	Lewis	beggar	none
202212311	Ben	parasite	traitors
202212311	Zylus	traitor	traitors
202212311	Rythian	innocent	innocents
202212311	Boba	randoman	innocents
202212311	Kirsty	paramedic	innocents
202212311	Ravs	innocent	innocents
202212312	Lewis	jester	jester
202212312	Ben	paladin	innocents
202212312	Zylus	veteran	innocents
202212312	Rythian	innocent	innocents
202212312	Boba	informant	traitors
202212312	Kirsty	traitor	traitors
202212312	Ravs	innocent	innocents
202212313	Lewis	traitor	traitors
202212313	Ben	paladin	innocents
202212313	Zylus	innocent	innocents
202212313	Rythian	impersonator	traitors
202212313	Boba	swapper	none
202212313	Kirsty	veteran	innocents
202212313	Ravs	innocent	innocents
202212314	Lewis	innocent	innocents
202212314	Ben	traitor	traitors
202212314	Zylus	innocent	innocents
202212314	Rythian	paramedic	innocents
202212314	Boba	impersonator	traitors
202212314	Kirsty	innocent	innocents
202212314	Ravs	swapper	none
202301030	Lewis	turncoat	innocents
202301030	Ben	innocent	innocents
202301030	Zylus	medium	innocents
202301030	Rythian	traitor	traitors
202301030	Boba	parasite	traitors
202301030	Kirsty	drunk	traitors
202301030	Ravs	innocent	innocents
202301031	Lewis	innocent	innocents
202301031	Ben	innocent	innocents
202301031	Zylus	clown	clown
202301031	Rythian	tracker	innocents
202301031	Boba	traitor	traitors
202301031	Kirsty	informant	traitors
202301031	Ravs	veteran	innocents
202301032	Lewis	impersonator	traitors
202301032	Ben	traitor	traitors
202301032	Zylus	innocent	innocents
202301032	Rythian	innocent	innocents
202301032	Boba	paramedic	innocents
202301032	Kirsty	drunk	none
202301032	Ravs	tracker	innocents
202301033	Lewis	parasite	traitors
202301033	Ben	medium	innocents
202301033	Zylus	innocent	innocents
202301033	Rythian	jester	jester
202301033	Boba	traitor	traitors
202301033	Kirsty	innocent	innocents
202301033	Ravs	turncoat	traitors
202301034	Lewis	summoner	traitors
202301034	Ben	tracker	innocents
202301034	Zylus	innocent	innocents
202301034	Rythian	beggar	innocents
202301034	Boba	traitor	traitors
202301034	Kirsty	innocent	innocents
202301034	Ravs	turncoat	traitors
202301070	Lewis	randoman	innocents
202301070	Ben	innocent	innocents
202301070	Zylus	traitor	traitors
202301070	Rythian	swapper	none
202301070	Duncan	impersonator	traitors
202301070	Kirsty	innocent	innocents
202301070	Ravs	turncoat	innocents
202301071	Lewis	innocent	innocents
202301071	Ben	turncoat	innocents
202301071	Zylus	innocent	innocents
202301071	Rythian	parasite	traitors
202301071	Duncan	traitor	traitors
202301071	Kirsty	tracker	innocents
202301071	Ravs	swapper	none
202301072	Lewis	innocent	innocents
202301072	Ben	zombie	zombies
202301072	Zylus	zombie	zombies
202301072	Rythian	veteran	innocents
202301072	Duncan	zombie	zombies
202301072	Kirsty	zombie	zombies
202301072	Ravs	mad scientist	zombies
202301073	Lewis	innocent	innocents
202301073	Ben	traitor	traitors
202301073	Zylus	informant	traitors
202301073	Rythian	paladin	innocents
202301073	Duncan	veteran	innocents
202301073	Kirsty	innocent	innocents
202301073	Ravs	jester	jester
202301074	Lewis	innocent	innocents
202301074	Ben	parasite	traitors
202301074	Zylus	traitor	traitors
202301074	Rythian	randoman	innocents
202301074	Duncan	glitch	innocents
202301074	Kirsty	jester	jester
202301074	Ravs	innocent	innocents
202301075	Lewis	hypnotist	traitors
202301075	Ben	traitor	traitors
202301075	Zylus	jester	jester
202301075	Rythian	innocent	innocents
202301075	Duncan	traitor	traitors
202301075	Kirsty	innocent	innocents
202301075	Ravs	veteran	innocents
202301035	Lewis	swapper	none
202301035	Ben	informant	traitors
202301035	Zylus	traitor	traitors
202301035	Rythian	glitch	innocents
202301035	Boba	innocent	innocents
202301035	Kirsty	innocent	innocents
202301035	Ravs	innocent	innocents
202301100	Lewis	medium	innocents
202301100	Ben	jester	jester
202301100	Zylus	traitor	traitors
202301100	Rythian	jester	jester
202301100	Duncan	jester	jester
202301100	Kirsty	jester	jester
202301100	Ravs	jester	jester
202301101	Lewis	innocent	innocents
202301101	Ben	paramedic	innocents
202301101	Zylus	traitor	traitors
202301101	Rythian	medium	innocents
202301101	Duncan	jester	jester
202301101	Kirsty	summoner	traitors
202301101	Ravs	innocent	innocents
202301102	Lewis	medium	innocents
202301102	Ben	innocent	innocents
202301102	Zylus	glitch	innocents
202301102	Rythian	innocent	innocents
202301102	Duncan	traitor	traitors
202301102	Kirsty	clown	clown
202301102	Ravs	summoner	traitors
202301103	Lewis	innocent	innocents
202301103	Ben	innocent	innocents
202301103	Zylus	traitor	traitors
202301103	Rythian	hypnotist	traitors
202301103	Duncan	beggar	traitors
202301103	Kirsty	traitor	traitors
202301103	Ravs	medium	innocents
202301104	Lewis	traitor	traitors
202301104	Ben	tracker	innocents
202301104	Zylus	glitch	innocents
202301104	Rythian	innocent	innocents
202301104	Duncan	informant	traitors
202301104	Kirsty	clown	clown
202301104	Ravs	innocent	innocents
202301105	Lewis	zombie	zombies
202301105	Ben	zombie	zombies
202301105	Zylus	mad scientist	zombies
202301105	Rythian	zombie	zombies
202301105	Duncan	zombie	zombies
202301105	Kirsty	paramedic	innocents
202301105	Ravs	zombie	zombies
202301140	Lewis	mad scientist	zombies
202301140	Ben	veteran	innocents
202301140	Osie	loot goblin	none
202301140	Rythian	summoner	traitors
202301140	Duncan	randoman	innocents
202301140	Kirsty	innocent	innocents
202301140	Ravs	traitor	traitors
202301140	Zoey	innocent	innocents
202301141	Lewis	beggar	innocents
202301141	Ben	traitor	traitors
202301141	Osie	drunk	none
202301141	Rythian	informant	traitors
202301141	Duncan	innocent	innocents
202301141	Kirsty	innocent	innocents
202301141	Ravs	paladin	innocents
202301141	Zoey	glitch	innocents
202301142	Lewis	traitor	traitors
202301142	Ben	traitor	traitors
202301142	Osie	detective	innocents
202301142	Rythian	hypnotist	traitors
202301142	Duncan	medium	innocents
202301142	Kirsty	glitch	innocents
202301142	Ravs	jester	jester
202301142	Zoey	innocent	innocents
202301143	Lewis	drunk	none
202301143	Ben	paladin	innocents
202301143	Osie	turncoat	innocents
202301143	Rythian	innocent	innocents
202301143	Duncan	innocent	innocents
202301143	Kirsty	impersonator	traitors
202301143	Ravs	clown	clown
202301143	Zoey	traitor	traitors
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (team) FROM stdin;
innocents
traitors
zombies
jester
none
clown
elves
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.video (title, vid) FROM stdin;
Only admin abuse can end this AWFUL round of Gmod TTT!	VRLFaq9XcMc
The Magical Flying Shed | Gmod TTT (w/ RTGame)	geRFB7ihD3M
NEW Spooky Scary Skeleton Gun in Gmod TTT | Halloween Special!	fTM_5NZFhRY
Who's the FASTEST GUN in the Yogscast!? | Gmod TTT	Q5ErlVIH31Q
How to Win Rock, Paper, Scissors (and kill your soulmate) | Gmod TTT	eIkEFaar-Qc
You Will Die In 5 Seconds | Gmod TTT (w/ RTGame)	H2dmsjSF0Wo
Rythian's Favourite Round of All Time | Gmod TTT (w/ RTGame)	tXmLUmbUJag
The WORST trade deal in Gmod TTT!	u8MzP3B0bMw
There's more traitors than innocents inGmod TTT!?	JSq1OPfhJ-Y
Come into my Goblin Hole!! | Gmod TTT	Gkak7LLJOqc
The scream that destroyed YogTowers! | Gmod TTT	otqA9aYtejA
7 DISGUSTING mutants learn how to kill | Gmod TTT	PstAilWgMu4
We're FINALLY breaking the meta in Gmod TTT!	WFD4kmH_zpI
TTT XL! The most INCREDIBLE map we've ever played!	463eWBId7jw
We increased prop damage again... | Gmod TTT	HBfgvCLx808
The most dangerous hiding place in GmodTTT!	glwQJJICxw
NEW ROLE: The ELVES are rising up!! | Christmas TTT Special	HDfGua9hZzI
Why won't Santa wake up!? | Christmas TTT Special	0w1LHuToCXI
No one wants a DEFUSER for CHRISTMAS!! | Christmas TTT Special!	JqqN9U4D9CI
The rise of Benthazar Hellstrand II | Gmod TTT	m40z1K1TIK4
Don't fall in the Plot Twist Pit!! | Gmod TTT	lQ4RQPuvHr0
Lewis and Boba's Big Adventure! | Gmod TTT	l1I-S3xaiIY
Curse of the FOREVER SWAPPER! | Gmod TTT	GBrckzwMvTQ
Pikachu is the TRUE Mad Scientist!! | Gmod TTT	YAf7W6AcqNs
Return to Doncon Temple!! | Gmod TTT	62m9fsf4iDM
\.


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

