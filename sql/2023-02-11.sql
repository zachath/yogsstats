--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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
    team text,
    died text DEFAULT 'not_tracked'::text NOT NULL
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
    vid text NOT NULL,
    intro_death text DEFAULT 'not_tracked'::text NOT NULL
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
202301170	2023-01-17	clown	\N	qJQsEevyU6U	9	213
202301171	2023-01-17	jester	\N	qJQsEevyU6U	245	268
202301172	2023-01-17	innocents	\N	qJQsEevyU6U	302	414
202301173	2023-01-17	clown	\N	qJQsEevyU6U	438	663
202301174	2023-01-17	zombies	\N	qJQsEevyU6U	692	974
202301210	2023-01-21	traitors	\N	v1pj4S1cxKw	8	194
202301211	2023-01-21	innocents	\N	v1pj4S1cxKw	225	444
202301212	2023-01-21	clown	\N	v1pj4S1cxKw	476	625
202301213	2023-01-21	innocents	\N	v1pj4S1cxKw	643	767
202301214	2023-01-21	zombies	\N	v1pj4S1cxKw	801	914
202301215	2023-01-21	innocents	\N	v1pj4S1cxKw	925	1075
202301240	2023-01-24	traitors	\N	329BUNbvbVo	52	318
202301241	2023-01-24	innocents	\N	329BUNbvbVo	347	444
202301242	2023-01-24	innocents	\N	329BUNbvbVo	478	595
202301243	2023-01-24	innocents	\N	329BUNbvbVo	631	705
202301244	2023-01-24	innocents	\N	329BUNbvbVo	715	1022
202301280	2023-01-28	innocents	\N	_Bgupg2ga7Y	13	211
202301281	2023-01-28	innocents	\N	_Bgupg2ga7Y	246	482
202301282	2023-01-28	innocents	\N	_Bgupg2ga7Y	517	890
202301283	2023-01-28	traitors	\N	_Bgupg2ga7Y	927	1041
202301284	2023-01-28	innocents	\N	_Bgupg2ga7Y	1069	1313
202301310	2023-01-31	innocents	\N	akn7Xny5wwk	9	368
202301311	2023-01-31	traitors	\N	akn7Xny5wwk	382	602
202301312	2023-01-31	traitors	\N	akn7Xny5wwk	632	971
202301313	2023-01-31	jester	\N	akn7Xny5wwk	1014	1059
202302040	2023-02-04	innocents	\N	YMTPqW1koFs	13	209
202302041	2023-02-04	innocents	\N	YMTPqW1koFs	242	383
202302042	2023-02-04	innocents	\N	YMTPqW1koFs	414	617
202302043	2023-02-04	innocents	\N	YMTPqW1koFs	650	855
202302044	2023-02-04	zombies	\N	YMTPqW1koFs	884	1176
202302045	2023-02-04	clown	\N	YMTPqW1koFs	884	1176
202302070	2023-02-07	innocents	\N	vtpNzMa8dgo	145	349
202302071	2023-02-07	innocents	\N	vtpNzMa8dgo	385	800
202302072	2023-02-07	traitors	\N	vtpNzMa8dgo	834	1128
202302073	2023-02-07	traitors	\N	vtpNzMa8dgo	1162	1374
202302074	2023-02-07	traitors	\N	vtpNzMa8dgo	1401	1595
202302075	2023-02-07	traitors	\N	vtpNzMa8dgo	1628	1857
\.


--
-- Data for Name: round_participation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.round_participation (id, player, role, team, died) FROM stdin;
202210250	Ben	paladin	innocents	not_tracked
202210250	Duncan	traitor	traitors	not_tracked
202210250	Pedguin	turncoat	traitors	not_tracked
202210250	Boba	innocent	innocents	not_tracked
202210250	Rythian	innocent	innocents	not_tracked
202210250	RTGame	summoner	traitors	not_tracked
202210251	Lewis	innocent	innocents	not_tracked
202210251	Ben	turncoat	innocents	not_tracked
202210251	Duncan	innocent	innocents	not_tracked
202210251	Pedguin	parasite	traitors	not_tracked
202210251	Boba	medium	innocents	not_tracked
202210251	Rythian	traitor	traitors	not_tracked
202210252	Lewis	innocent	innocents	not_tracked
202210252	Ben	turncoat	innocents	not_tracked
202210252	Duncan	innocent	innocents	not_tracked
202210252	Pedguin	impersonator	traitors	not_tracked
202210252	Boba	traitor	traitors	not_tracked
202210252	Rythian	randoman	innocents	not_tracked
202210252	RTGame	jester	jester	not_tracked
202210253	Lewis	veteran	innocents	not_tracked
202210253	Ben	innocent	innocents	not_tracked
202210253	Pedguin	traitor	traitors	not_tracked
202210253	Boba	innocent	innocents	not_tracked
202210253	Rythian	paladin	innocents	not_tracked
202210253	RTGame	informant	traitors	not_tracked
202210254	Lewis	summoner	traitors	not_tracked
202210254	Ben	paladin	innocents	not_tracked
202210254	Duncan	glitch	innocents	not_tracked
202210254	Pedguin	traitor	traitors	not_tracked
202210254	Boba	innocent	innocents	not_tracked
202210254	Rythian	jester	jester	not_tracked
202210254	RTGame	innocent	innocents	not_tracked
202210290	Lewis	mad scientist	zombies	not_tracked
202210290	Ben	innocent	innocents	not_tracked
202210290	Duncan	innocent	innocents	not_tracked
202210290	Pedguin	traitor	traitors	not_tracked
202210290	Breeh	tracker	innocents	not_tracked
202210290	Rythian	jester	jester	not_tracked
202210290	Ravs	parasite	traitors	not_tracked
202210290	Kirsty	turncoat	traitors	not_tracked
202210291	Lewis	innocent	innocents	not_tracked
202210291	Ben	jester	jester	not_tracked
202210291	Duncan	innocent	innocents	not_tracked
202210291	Pedguin	traitor	traitors	not_tracked
202210291	Breeh	informant	traitors	not_tracked
202210291	Rythian	paramedic	innocents	not_tracked
202210291	Ravs	tracker	innocents	not_tracked
202210291	Kirsty	mad scientist	zombies	not_tracked
202210292	Lewis	veteran	innocents	not_tracked
202210292	Ben	informant	traitors	not_tracked
202210292	Duncan	traitor	traitors	not_tracked
202210292	Pedguin	innocent	innocents	not_tracked
202210292	Breeh	mad scientist	zombies	not_tracked
202210292	Rythian	tracker	innocents	not_tracked
202210292	Ravs	jester	jester	not_tracked
202210292	Kirsty	innocent	innocents	not_tracked
202210293	Lewis	summoner	traitors	not_tracked
202210293	Ben	medium	innocents	not_tracked
202210293	Duncan	traitor	traitors	not_tracked
202210293	Pedguin	zombie	zombies	not_tracked
202210293	Breeh	innocent	innocents	not_tracked
202210293	Rythian	turncoat	innocents	not_tracked
202210293	Ravs	mad scientist	zombies	not_tracked
202210293	Kirsty	jester	jester	not_tracked
202210294	Lewis	traitor	traitors	not_tracked
202210294	Ben	zombie	zombies	not_tracked
202210294	Duncan	zombie	zombies	not_tracked
202210294	Pedguin	innocent	innocents	not_tracked
202210294	Breeh	zombie	zombies	not_tracked
202210294	Rythian	zombie	zombies	not_tracked
202210294	Ravs	mad scientist	zombies	not_tracked
202210220	Lewis	mad scientist	zombies	not_tracked
202210220	Ben	parasite	traitors	not_tracked
202210220	Duncan	deputy	innocents	not_tracked
202210250	Lewis	drunk	none	not_tracked
202210251	RTGame	beggar	none	not_tracked
202210253	Duncan	swapper	none	not_tracked
202210220	Ravs	traitor	traitors	not_tracked
202210220	Pedguin	innocent	innocents	not_tracked
202210220	Boba	jester	jester	not_tracked
202210294	Kirsty	zombie	zombies	not_tracked
202210295	Lewis	veteran	innocents	not_tracked
202210295	Ben	jester	jester	not_tracked
202210295	Duncan	impersonator	traitors	not_tracked
202210295	Pedguin	randoman	innocents	not_tracked
202210295	Breeh	parasite	traitors	not_tracked
202210295	Rythian	innocent	innocents	not_tracked
202210295	Ravs	traitor	traitors	not_tracked
202210295	Kirsty	innocent	innocents	not_tracked
202211010	Lewis	traitor	traitors	not_tracked
202211010	Ben	mad scientist	zombies	not_tracked
202211010	Duncan	innocent	innocents	not_tracked
202211010	Pedguin	innocent	innocents	not_tracked
202211010	Breeh	zombie	zombies	not_tracked
202211010	Boba	swapper	jester	not_tracked
202211010	Ravs	glitch	innocents	not_tracked
202211010	Daltos	tracker	innocents	not_tracked
202211011	Lewis	traitor	traitors	not_tracked
202211011	Ben	summoner	traitors	not_tracked
202211011	Duncan	randoman	innocents	not_tracked
202211011	Pedguin	loot goblin	jester	not_tracked
202211011	Breeh	impersonator	traitors	not_tracked
202211011	Boba	innocent	innocents	not_tracked
202211011	Ravs	innocent	innocents	not_tracked
202211011	Daltos	glitch	innocents	not_tracked
202211012	Lewis	beggar	traitors	not_tracked
202211012	Ben	mad scientist	zombies	not_tracked
202211012	Duncan	veteran	innocents	not_tracked
202211012	Pedguin	tracker	innocents	not_tracked
202211012	Breeh	summoner	traitors	not_tracked
202211012	Boba	traitor	traitors	not_tracked
202211012	Ravs	innocent	innocents	not_tracked
202211012	Daltos	innocent	innocents	not_tracked
202211013	Lewis	innocent	innocents	not_tracked
202211013	Ben	parasite	traitors	not_tracked
202211013	Duncan	turncoat	innocents	not_tracked
202211013	Pedguin	randoman	innocents	not_tracked
202211013	Breeh	innocent	innocents	not_tracked
202211013	Boba	innocent	innocents	not_tracked
202211013	Ravs	innocent	innocents	not_tracked
202211013	Daltos	traitor	traitors	not_tracked
202211014	Lewis	innocent	innocents	not_tracked
202211014	Ben	paramedic	innocents	not_tracked
202211014	Duncan	innocent	innocents	not_tracked
202211014	Pedguin	traitor	traitors	not_tracked
202211014	Breeh	randoman	innocents	not_tracked
202211014	Boba	innocent	innocents	not_tracked
202211014	Ravs	innocent	innocents	not_tracked
202211014	Daltos	summoner	traitors	not_tracked
202211015	Lewis	informant	traitors	not_tracked
202211015	Ben	glitch	innocents	not_tracked
202211015	Duncan	tracker	innocents	not_tracked
202211015	Pedguin	traitor	traitors	not_tracked
202211015	Breeh	traitor	traitors	not_tracked
202211015	Boba	innocent	innocents	not_tracked
202211015	Ravs	innocent	innocents	not_tracked
202211015	Daltos	innocent	innocents	not_tracked
202211050	Lewis	turncoat	traitors	not_tracked
202211050	Ben	hypnotist	traitors	not_tracked
202211050	Duncan	jester	jester	not_tracked
202211050	Pedguin	innocent	innocents	not_tracked
202211050	Boba	randoman	innocents	not_tracked
202211050	Ravs	traitor	traitors	not_tracked
202211050	Daltos	innocent	innocents	not_tracked
202211051	Lewis	parasite	traitors	not_tracked
202211051	Ben	tracker	innocents	not_tracked
202211051	Duncan	glitch	innocents	not_tracked
202211051	Pedguin	innocent	innocents	not_tracked
202211051	Breeh	innocent	innocents	not_tracked
202211051	Boba	informant	traitors	not_tracked
202211051	Ravs	traitor	traitors	not_tracked
202211052	Lewis	traitor	traitors	not_tracked
202211052	Ben	jester	jester	not_tracked
202211052	Duncan	innocent	innocents	not_tracked
202211052	Pedguin	mad scientist	zombies	not_tracked
202211052	Breeh	impersonator	traitors	not_tracked
202211052	Boba	zombie	zombies	not_tracked
202211052	Ravs	tracker	innocents	not_tracked
202211052	Daltos	innocent	innocents	not_tracked
202211053	Ben	innocent	innocents	not_tracked
202211053	Duncan	jester	jester	not_tracked
202211053	Pedguin	traitor	traitors	not_tracked
202211053	Breeh	deputy	innocents	not_tracked
202211053	Boba	summoner	traitors	not_tracked
202211053	Ravs	innocent	innocents	not_tracked
202211053	Daltos	randoman	innocents	not_tracked
202211054	Lewis	glitch	innocents	not_tracked
202211054	Ben	randoman	innocents	not_tracked
202211054	Duncan	impersonator	traitors	not_tracked
202211054	Pedguin	innocent	innocents	not_tracked
202211054	Breeh	jester	jester	not_tracked
202211054	Boba	innocent	innocents	not_tracked
202211054	Ravs	mad scientist	zombies	not_tracked
202211054	Daltos	traitor	traitors	not_tracked
202211055	Lewis	tracker	innocents	not_tracked
202211055	Duncan	traitor	traitors	not_tracked
202211055	Pedguin	traitor	traitors	not_tracked
202211055	Breeh	innocent	innocents	not_tracked
202211055	Boba	beggar	innocents	not_tracked
202211055	Ravs	turncoat	traitors	not_tracked
202211050	Breeh	drunk	none	not_tracked
202211051	Daltos	swapper	none	not_tracked
202211053	Lewis	drunk	none	not_tracked
202211055	Daltos	drunk	none	not_tracked
202211055	Ben	impersonator	traitors	not_tracked
202211080	Lewis	innocent	innocents	not_tracked
202211080	Ben	traitor	traitors	not_tracked
202211080	Duncan	hypnotist	traitors	not_tracked
202211080	Pedguin	veteran	innocents	not_tracked
202211080	RTGame	innocent	innocents	not_tracked
202211080	Boba	paladin	innocents	not_tracked
202211080	Rythian	drunk	none	not_tracked
202211081	Lewis	zombie	zombies	not_tracked
202211081	Ben	paladin	innocents	not_tracked
202211081	Duncan	innocent	innocents	not_tracked
202211081	Pedguin	turncoat	traitors	not_tracked
202211081	RTGame	innocent	innocents	not_tracked
202211081	Boba	traitor	traitors	not_tracked
202211081	Rythian	mad scientist	zombies	not_tracked
202211082	Lewis	jester	jester	not_tracked
202211082	Ben	impersonator	traitors	not_tracked
202211082	Duncan	medium	innocents	not_tracked
202211082	Pedguin	turncoat	traitors	not_tracked
202211082	RTGame	traitor	traitors	not_tracked
202211082	Boba	innocent	innocents	not_tracked
202211082	Rythian	innocent	innocents	not_tracked
202211083	Lewis	traitor	traitors	not_tracked
202211083	Ben	hypnotist	traitors	not_tracked
202211083	Duncan	clown	clown	not_tracked
202211083	Pedguin	innocent	innocents	not_tracked
202211083	RTGame	traitor	traitors	not_tracked
202211083	Boba	veteran	innocents	not_tracked
202211083	Rythian	randoman	innocents	not_tracked
202211084	Lewis	traitor	traitors	not_tracked
202211084	Ben	turncoat	innocents	not_tracked
202211084	Duncan	innocent	innocents	not_tracked
202211084	Pedguin	tracker	innocents	not_tracked
202211084	RTGame	zombie	zombies	not_tracked
202211084	Boba	mad scientist	zombies	not_tracked
202211084	Rythian	summoner	traitors	not_tracked
202211085	Lewis	innocent	innocents	not_tracked
202211085	Ben	innocent	innocents	not_tracked
202211085	Duncan	paladin	innocents	not_tracked
202211085	Pedguin	veteran	innocents	not_tracked
202211085	RTGame	traitor	traitors	not_tracked
202211085	Boba	swapper	none	not_tracked
202211085	Rythian	parasite	traitors	not_tracked
202211086	Lewis	innocent	innocents	not_tracked
202211086	Ben	informant	traitors	not_tracked
202211086	Duncan	innocent	innocents	not_tracked
202211086	Pedguin	swapper	none	not_tracked
202211086	RTGame	paladin	innocents	not_tracked
202211086	Boba	traitor	traitors	not_tracked
202211086	Rythian	deputy	innocents	not_tracked
202211120	Lewis	jester	jester	not_tracked
202211120	Ben	veteran	innocents	not_tracked
202211120	Duncan	tracker	innocents	not_tracked
202211120	Pedguin	innocent	innocents	not_tracked
202211120	RTGame	innocent	innocents	not_tracked
202211120	Boba	summoner	traitors	not_tracked
202211120	Rythian	traitor	traitors	not_tracked
202211121	Lewis	deputy	innocents	not_tracked
202211121	Ben	tracker	innocents	not_tracked
202211121	Duncan	innocent	innocents	not_tracked
202211121	Pedguin	innocent	innocents	not_tracked
202211121	RTGame	traitor	traitors	not_tracked
202211121	Boba	summoner	traitors	not_tracked
202211121	Rythian	turncoat	traitors	not_tracked
202211122	Lewis	glitch	innocents	not_tracked
202211122	Ben	tracker	innocents	not_tracked
202211122	Duncan	innocent	innocents	not_tracked
202211122	Pedguin	loot goblin	none	not_tracked
202211122	RTGame	traitor	traitors	not_tracked
202211122	Boba	innocent	innocents	not_tracked
202211122	Rythian	summoner	traitors	not_tracked
202211123	Lewis	traitor	traitors	not_tracked
202211123	Ben	paramedic	innocents	not_tracked
202211123	Duncan	beggar	traitors	not_tracked
202211123	Pedguin	innocent	innocents	not_tracked
202211123	RTGame	parasite	traitors	not_tracked
202211123	Boba	innocent	innocents	not_tracked
202211123	Rythian	innocent	innocents	not_tracked
202211150	Lewis	innocent	innocents	not_tracked
202211150	Ben	zombie	zombies	not_tracked
202211150	Duncan	mad scientist	zombies	not_tracked
202211150	Pedguin	tracker	innocents	not_tracked
202211150	Ravs	traitor	traitors	not_tracked
202211150	Breeh	summoner	traitors	not_tracked
202211150	Rythian	zombie	zombies	not_tracked
202211150	Kirsty	turncoat	innocents	not_tracked
202211151	Lewis	mad scientist	zombies	not_tracked
202211151	Ben	innocent	innocents	not_tracked
202211151	Duncan	traitor	traitors	not_tracked
202211151	Pedguin	innocent	innocents	not_tracked
202211151	Ravs	paladin	innocents	not_tracked
202211151	Breeh	turncoat	innocents	not_tracked
202211151	Rythian	parasite	traitors	not_tracked
202211151	Kirsty	jester	jester	not_tracked
202211152	Lewis	innocent	innocents	not_tracked
202211152	Ben	informant	traitors	not_tracked
202211152	Duncan	veteran	innocents	not_tracked
202211152	Pedguin	innocent	innocents	not_tracked
202211152	Ravs	beggar	none	not_tracked
202211152	Breeh	randoman	innocents	not_tracked
202211152	Rythian	parasite	traitors	not_tracked
202211152	Kirsty	mad scientist	zombies	not_tracked
202211153	Lewis	traitor	traitors	not_tracked
202211153	Ben	randoman	innocents	not_tracked
202211153	Duncan	impersonator	traitors	not_tracked
202211153	Pedguin	innocent	innocents	not_tracked
202211153	Ravs	hypnotist	traitors	not_tracked
202211153	Breeh	glitch	innocents	not_tracked
202211153	Rythian	parasite	traitors	not_tracked
202211153	Kirsty	mad scientist	zombies	not_tracked
202211154	Lewis	drunk	none	not_tracked
202211154	Ben	loot goblin	none	not_tracked
202211154	Duncan	innocent	innocents	not_tracked
202211154	Pedguin	tracker	innocents	not_tracked
202211154	Ravs	veteran	innocents	not_tracked
202211154	Breeh	summoner	traitors	not_tracked
202211154	Rythian	innocent	innocents	not_tracked
202211154	Kirsty	traitor	traitors	not_tracked
202211190	Ben	innocent	innocents	not_tracked
202211190	Duncan	veteran	innocents	not_tracked
202211190	Pedguin	traitor	traitors	not_tracked
202211190	Ravs	innocent	innocents	not_tracked
202211190	Breeh	mad scientist	zombies	not_tracked
202211190	Rythian	randoman	innocents	not_tracked
202211190	Kirsty	impersonator	traitors	not_tracked
202211191	Ben	traitor	traitors	not_tracked
202211191	Duncan	hypnotist	traitors	not_tracked
202211191	Pedguin	innocent	innocents	not_tracked
202211191	Ravs	traitor	traitors	not_tracked
202211191	Breeh	innocent	innocents	not_tracked
202211191	Rythian	medium	innocents	not_tracked
202211191	Kirsty	turncoat	traitors	not_tracked
202211192	Ben	parasite	traitors	not_tracked
202211192	Duncan	innocent	innocents	not_tracked
202211192	Pedguin	impersonator	traitors	not_tracked
202211192	Ravs	veteran	innocents	not_tracked
202211192	Breeh	innocent	innocents	not_tracked
202211192	Rythian	traitor	traitors	not_tracked
202211192	Kirsty	loot goblin	none	not_tracked
202211193	Ben	medium	innocents	not_tracked
202211193	Duncan	summoner	traitors	not_tracked
202211193	Pedguin	deputy	innocents	not_tracked
202211193	Ravs	innocent	innocents	not_tracked
202211193	Breeh	innocent	innocents	not_tracked
202211193	Rythian	traitor	traitors	not_tracked
202211193	Kirsty	clown	clown	not_tracked
202211194	Ben	beggar	traitors	not_tracked
202211194	Duncan	traitor	traitors	not_tracked
202211194	Pedguin	turncoat	traitors	not_tracked
202211194	Ravs	informant	traitors	not_tracked
202211194	Breeh	innocent	innocents	not_tracked
202211194	Rythian	paladin	innocents	not_tracked
202211194	Kirsty	innocent	innocents	not_tracked
202211195	Ben	traitor	traitors	not_tracked
202211195	Duncan	summoner	traitors	not_tracked
202211195	Pedguin	medium	innocents	not_tracked
202211195	Ravs	innocent	innocents	not_tracked
202211195	Breeh	innocent	innocents	not_tracked
202211195	Rythian	swapper	none	not_tracked
202211195	Kirsty	paramedic	innocents	not_tracked
202211220	Ben	summoner	traitors	not_tracked
202211220	Duncan	randoman	innocents	not_tracked
202211220	Shadow	innocent	innocents	not_tracked
202211220	Lolip	traitor	traitors	not_tracked
202211220	Zoey	turncoat	innocents	not_tracked
202211220	Zylus	innocent	innocents	not_tracked
202211220	Lewis	jester	jester	not_tracked
202211221	Ben	informant	traitors	not_tracked
202211221	Duncan	traitor	traitors	not_tracked
202211221	Shadow	tracker	innocents	not_tracked
202211221	Lolip	veteran	innocents	not_tracked
202211221	Zoey	innocent	innocents	not_tracked
202211221	Zylus	loot goblin	none	not_tracked
202211221	Lewis	innocent	innocents	not_tracked
202211222	Ben	innocent	innocents	not_tracked
202211222	Duncan	innocent	innocents	not_tracked
202211222	Shadow	beggar	traitors	not_tracked
202211222	Lolip	paladin	innocents	not_tracked
202211222	Zoey	summoner	traitors	not_tracked
202211222	Zylus	traitor	traitors	not_tracked
202211222	Lewis	paramedic	innocents	not_tracked
202211223	Ben	innocent	innocents	not_tracked
202211223	Duncan	traitor	traitors	not_tracked
202211223	Shadow	informant	traitors	not_tracked
202211223	Lolip	turncoat	traitors	not_tracked
202211223	Zoey	loot goblin	none	not_tracked
202211223	Zylus	paladin	innocents	not_tracked
202211223	Lewis	innocent	innocents	not_tracked
202211224	Ben	innocent	innocents	not_tracked
202211224	Duncan	medium	innocents	not_tracked
202211224	Shadow	innocent	innocents	not_tracked
202211224	Lolip	innocent	innocents	not_tracked
202211224	Zoey	informant	traitors	not_tracked
202211224	Zylus	veteran	innocents	not_tracked
202211224	Lewis	loot goblin	none	not_tracked
202211225	Ben	paramedic	innocents	not_tracked
202211225	Duncan	randoman	innocents	not_tracked
202211225	Shadow	innocent	innocents	not_tracked
202211225	Lolip	informant	traitors	not_tracked
202211225	Zoey	traitor	traitors	not_tracked
202211225	Zylus	hypnotist	traitors	not_tracked
202211225	Lewis	innocent	innocents	not_tracked
202211250	Ben	jester	jester	not_tracked
202211250	Duncan	paramedic	innocents	not_tracked
202211250	Shadow	informant	traitors	not_tracked
202211250	Lolip	randoman	innocents	not_tracked
202211250	Zoey	innocent	innocents	not_tracked
202211250	Lewis	traitor	traitors	not_tracked
202211251	Ben	traitor	traitors	not_tracked
202211251	Duncan	paladin	innocents	not_tracked
202211251	Shadow	glitch	innocents	not_tracked
202211251	Lolip	innocent	innocents	not_tracked
202211251	Zoey	innocent	innocents	not_tracked
202211251	Zylus	clown	clown	not_tracked
202211251	Lewis	summoner	traitors	not_tracked
202211252	Ben	zombie	zombies	not_tracked
202211252	Duncan	mad scientist	zombies	not_tracked
202211252	Shadow	paladin	innocents	not_tracked
202211252	Lolip	innocent	innocents	not_tracked
202211252	Zoey	zombie	zombies	not_tracked
202211252	Zylus	zombie	zombies	not_tracked
202211252	Lewis	paramedic	innocents	not_tracked
202211253	Ben	jester	jester	not_tracked
202211253	Duncan	paladin	innocents	not_tracked
202211253	Shadow	innocent	innocents	not_tracked
202211253	Lolip	innocent	innocents	not_tracked
202211253	Zoey	deputy	innocents	not_tracked
202211253	Zylus	summoner	traitors	not_tracked
202211253	Lewis	traitor	traitors	not_tracked
202211254	Ben	innocent	innocents	not_tracked
202211254	Duncan	beggar	traitors	not_tracked
202211254	Shadow	innocent	innocents	not_tracked
202211254	Lolip	tracker	innocents	not_tracked
202211254	Zoey	informant	traitors	not_tracked
202211254	Zylus	turncoat	traitors	not_tracked
202211254	Lewis	traitor	traitors	not_tracked
202211255	Ben	informant	traitors	not_tracked
202211255	Duncan	innocent	innocents	not_tracked
202211255	Shadow	innocent	innocents	not_tracked
202211255	Lolip	traitor	traitors	not_tracked
202211255	Zoey	clown	clown	not_tracked
202211255	Zylus	tracker	innocents	not_tracked
202211255	Lewis	glitch	innocents	not_tracked
202211256	Ben	traitor	traitors	not_tracked
202211256	Duncan	randoman	innocents	not_tracked
202211256	Shadow	jester	jester	not_tracked
202211256	Lolip	turncoat	innocents	not_tracked
202211256	Zoey	traitor	traitors	not_tracked
202211256	Zylus	innocent	innocents	not_tracked
202211256	Lewis	innocent	innocents	not_tracked
202211257	Ben	parasite	traitors	not_tracked
202211257	Duncan	traitor	traitors	not_tracked
202211257	Shadow	medium	innocents	not_tracked
202211257	Lolip	drunk	none	not_tracked
202211257	Zoey	innocent	innocents	not_tracked
202211257	Zylus	veteran	innocents	not_tracked
202211257	Lewis	innocent	innocents	not_tracked
202212010	Ben	innocent	innocents	not_tracked
202212010	Duncan	tracker	innocents	not_tracked
202212010	Shadow	loot goblin	none	not_tracked
202212010	Lolip	traitor	traitors	not_tracked
202212010	Zoey	parasite	traitors	not_tracked
202212010	Zylus	innocent	innocents	not_tracked
202212010	Lewis	veteran	innocents	not_tracked
202212011	Ben	turncoat	innocents	not_tracked
202212011	Duncan	innocent	innocents	not_tracked
202212011	Shadow	tracker	innocents	not_tracked
202212011	Lolip	traitor	traitors	not_tracked
202212011	Zoey	loot goblin	none	not_tracked
202212011	Zylus	traitor	traitors	not_tracked
202212011	Lewis	innocent	innocents	not_tracked
202212012	Ben	innocent	innocents	not_tracked
202212012	Duncan	traitor	traitors	not_tracked
202211250	Zylus	innocent	innocents	not_tracked
202212012	Shadow	glitch	innocents	not_tracked
202212012	Lolip	informant	traitors	not_tracked
202212012	Zoey	beggar	innocents	not_tracked
202212012	Zylus	randoman	innocents	not_tracked
202212012	Lewis	innocent	innocents	not_tracked
202212013	Ben	informant	traitors	not_tracked
202212013	Duncan	innocent	innocents	not_tracked
202212013	Shadow	veteran	innocents	not_tracked
202212013	Lolip	traitor	traitors	not_tracked
202212013	Zoey	paladin	innocents	not_tracked
202212013	Zylus	innocent	innocents	not_tracked
202212013	Lewis	drunk	none	not_tracked
202212014	Ben	beggar	none	not_tracked
202212014	Duncan	impersonator	traitors	not_tracked
202212014	Shadow	traitor	traitors	not_tracked
202212014	Lolip	veteran	innocents	not_tracked
202212014	Zoey	innocent	innocents	not_tracked
202212014	Zylus	randoman	innocents	not_tracked
202212014	Lewis	traitor	traitors	not_tracked
202212030	Ben	innocent	innocents	not_tracked
202212030	Duncan	zombie	zombies	not_tracked
202212030	Ravs	informant	traitors	not_tracked
202212030	Rythian	traitor	traitors	not_tracked
202212030	Zoey	mad scientist	zombies	not_tracked
202212030	Osie	innocent	innocents	not_tracked
202212030	Lewis	zombie	zombies	not_tracked
202212031	Ben	innocent	innocents	not_tracked
202212031	Duncan	clown	clown	not_tracked
202212031	Ravs	parasite	traitors	not_tracked
202212031	Rythian	medium	innocents	not_tracked
202212031	Zoey	traitor	traitors	not_tracked
202212031	Osie	innocent	innocents	not_tracked
202212031	Lewis	turncoat	innocents	not_tracked
202212032	Ben	medium	innocents	not_tracked
202212032	Duncan	mad scientist	zombies	not_tracked
202212032	Ravs	informant	traitors	not_tracked
202212032	Rythian	zombie	zombies	not_tracked
202212032	Zoey	innocent	innocents	not_tracked
202212032	Osie	traitor	traitors	not_tracked
202212032	Lewis	innocent	innocents	not_tracked
202212033	Ben	beggar	innocents	not_tracked
202212033	Duncan	summoner	traitors	not_tracked
202212033	Ravs	medium	innocents	not_tracked
202212033	Rythian	glitch	innocents	not_tracked
202212033	Zoey	traitor	traitors	not_tracked
202212033	Osie	innocent	innocents	not_tracked
202212033	Lewis	innocent	innocents	not_tracked
202210220	Breeh	randoman	innocents	not_tracked
202210220	Daltos	innocent	innocents	not_tracked
202210221	Lewis	informant	traitors	not_tracked
202210221	Ben	traitor	traitors	not_tracked
202210221	Duncan	innocent	innocents	not_tracked
202210221	Ravs	turncoat	traitors	not_tracked
202210221	Pedguin	medium	innocents	not_tracked
202210221	Boba	jester	jester	not_tracked
202210221	Breeh	drunk	none	not_tracked
202210221	Daltos	innocent	innocents	not_tracked
202210222	Lewis	informant	traitors	not_tracked
202210222	Ben	paladin	innocents	not_tracked
202210222	Duncan	innocent	innocents	not_tracked
202210222	Ravs	innocent	innocents	not_tracked
202210222	Pedguin	traitor	traitors	not_tracked
202210222	Boba	veteran	innocents	not_tracked
202210222	Breeh	loot goblin	jester	not_tracked
202210222	Daltos	parasite	traitors	not_tracked
202210223	Lewis	innocent	innocents	not_tracked
202210223	Ben	traitor	traitors	not_tracked
202210223	Duncan	parasite	traitors	not_tracked
202210223	Ravs	mad scientist	zombies	not_tracked
202210223	Pedguin	innocent	innocents	not_tracked
202210223	Boba	beggar	none	not_tracked
202210223	Breeh	turncoat	traitors	not_tracked
202210223	Daltos	medium	innocents	not_tracked
202210224	Lewis	jester	jester	not_tracked
202210224	Ben	paladin	innocents	not_tracked
202210224	Duncan	traitor	traitors	not_tracked
202210224	Ravs	traitor	traitors	not_tracked
202210224	Pedguin	glitch	innocents	not_tracked
202210224	Boba	informant	traitors	not_tracked
202210224	Breeh	innocent	innocents	not_tracked
202210224	Daltos	hypnotist	traitors	not_tracked
202210225	Lewis	glitch	innocents	not_tracked
202210225	Ben	jester	jester	not_tracked
202210225	Duncan	zombie	zombies	not_tracked
202210225	Ravs	zombie	zombies	not_tracked
202210225	Pedguin	mad scientist	zombies	not_tracked
202210225	Boba	innocent	innocents	not_tracked
202210225	Breeh	zombie	zombies	not_tracked
202210225	Daltos	zombie	zombies	not_tracked
202210226	Lewis	innocent	innocents	not_tracked
202210226	Ben	jester	jester	not_tracked
202210226	Duncan	traitor	traitors	not_tracked
202210226	Ravs	paramedic	innocents	not_tracked
202210226	Pedguin	randoman	innocents	not_tracked
202210226	Boba	innocent	innocents	not_tracked
202210226	Breeh	informant	traitors	not_tracked
202210226	Daltos	innocent	innocents	not_tracked
202212060	Ben	randoman	innocents	not_tracked
202212060	Duncan	innocent	innocents	not_tracked
202212060	Ravs	traitor	traitors	not_tracked
202212060	Rythian	veteran	innocents	not_tracked
202212060	Zoey	innocent	innocents	not_tracked
202212060	Osie	impersonator	traitors	not_tracked
202212060	Lewis	mad scientist	zombies	not_tracked
202212061	Ben	zombie	zombies	not_tracked
202212061	Duncan	zombie	zombies	not_tracked
202212061	Ravs	zombie	zombies	not_tracked
202212061	Rythian	zombie	zombies	not_tracked
202212061	Zoey	innocent	innocents	not_tracked
202212061	Osie	zombie	zombies	not_tracked
202212061	Lewis	zombie	zombies	not_tracked
202212062	Ben	glitch	innocents	not_tracked
202212062	Duncan	jester	jester	not_tracked
202212062	Ravs	innocent	innocents	not_tracked
202212062	Rythian	traitor	traitors	not_tracked
202212062	Zoey	innocent	innocents	not_tracked
202212062	Osie	informant	traitors	not_tracked
202212062	Lewis	paladin	innocents	not_tracked
202212063	Ben	randoman	innocents	not_tracked
202212063	Duncan	innocent	innocents	not_tracked
202212063	Ravs	loot goblin	none	not_tracked
202212063	Rythian	glitch	innocents	not_tracked
202212063	Zoey	innocent	innocents	not_tracked
202212063	Osie	impersonator	traitors	not_tracked
202212063	Lewis	traitor	traitors	not_tracked
202212064	Ben	traitor	traitors	not_tracked
202212064	Duncan	innocent	innocents	not_tracked
202212064	Ravs	traitor	traitors	not_tracked
202212064	Rythian	innocent	innocents	not_tracked
202212064	Zoey	innocent	innocents	not_tracked
202212064	Osie	innocent	innocents	not_tracked
202212064	Lewis	innocent	innocents	not_tracked
202212065	Ben	innocent	innocents	not_tracked
202212065	Duncan	innocent	innocents	not_tracked
202212065	Ravs	tracker	innocents	not_tracked
202212065	Rythian	beggar	none	not_tracked
202212065	Zoey	traitor	traitors	not_tracked
202212065	Osie	turncoat	innocents	not_tracked
202212065	Lewis	informant	traitors	not_tracked
202212100	Ben	traitor	traitors	not_tracked
202212100	Duncan	glitch	innocents	not_tracked
202212100	Ravs	paladin	innocents	not_tracked
202212100	Rythian	jester	jester	not_tracked
202212100	Zoey	informant	traitors	not_tracked
202212100	Osie	turncoat	innocents	not_tracked
202212100	Lewis	innocent	innocents	not_tracked
202212101	Ben	innocent	innocents	not_tracked
202212101	Duncan	mad scientist	zombies	not_tracked
202212101	Ravs	parasite	traitors	not_tracked
202212101	Rythian	innocent	innocents	not_tracked
202212101	Zoey	traitor	traitors	not_tracked
202212101	Osie	tracker	innocents	not_tracked
202212101	Lewis	veteran	innocents	not_tracked
202212102	Ben	paladin	innocents	not_tracked
202212102	Duncan	innocent	innocents	not_tracked
202212102	Ravs	swapper	none	not_tracked
202212102	Rythian	traitor	traitors	not_tracked
202212102	Zoey	innocent	innocents	not_tracked
202212102	Osie	glitch	innocents	not_tracked
202212102	Lewis	informant	traitors	not_tracked
202212103	Ben	tracker	innocents	not_tracked
202212103	Duncan	traitor	traitors	not_tracked
202212103	Ravs	innocent	innocents	not_tracked
202212103	Rythian	veteran	innocents	not_tracked
202212103	Zoey	beggar	innocents	not_tracked
202212103	Osie	parasite	traitors	not_tracked
202212103	Lewis	innocent	innocents	not_tracked
202212104	Ben	traitor	traitors	not_tracked
202212104	Duncan	innocent	innocents	not_tracked
202212104	Ravs	tracker	innocents	not_tracked
202212104	Rythian	informant	traitors	not_tracked
202212104	Zoey	beggar	innocents	not_tracked
202212104	Osie	parasite	traitors	not_tracked
202212104	Lewis	glitch	innocents	not_tracked
202212105	Ben	traitor	traitors	not_tracked
202212105	Duncan	glitch	innocents	not_tracked
202212105	Ravs	randoman	innocents	not_tracked
202212105	Rythian	innocent	innocents	not_tracked
202212105	Zoey	innocent	innocents	not_tracked
202212105	Osie	jester	jester	not_tracked
202212105	Lewis	glitch	innocents	not_tracked
202212106	Ben	innocent	innocents	not_tracked
202212106	Duncan	randoman	innocents	not_tracked
202212106	Ravs	parasite	traitors	not_tracked
202212106	Rythian	beggar	traitors	not_tracked
202212106	Zoey	innocent	innocents	not_tracked
202212106	Osie	traitor	traitors	not_tracked
202212106	Lewis	glitch	innocents	not_tracked
202212130	Ben	traitor	traitors	not_tracked
202212130	Duncan	informant	traitors	not_tracked
202212130	Ravs	paladin	innocents	not_tracked
202212130	Rythian	veteran	innocents	not_tracked
202212130	Zoey	jester	jester	not_tracked
202212130	Osie	innocent	innocents	not_tracked
202212130	Lewis	innocent	innocents	not_tracked
202212131	Ben	innocent	innocents	not_tracked
202212131	Duncan	innocent	innocents	not_tracked
202212131	Ravs	paladin	innocents	not_tracked
202212131	Rythian	deputy	innocents	not_tracked
202212131	Zoey	swapper	none	not_tracked
202212131	Osie	traitor	traitors	not_tracked
202212131	Lewis	informant	traitors	not_tracked
202212132	Ben	randoman	innocents	not_tracked
202212132	Duncan	innocent	innocents	not_tracked
202212132	Ravs	swapper	none	not_tracked
202212132	Rythian	innocent	innocents	not_tracked
202212132	Zoey	summoner	traitors	not_tracked
202212132	Osie	turncoat	innocents	not_tracked
202212132	Lewis	traitor	traitors	not_tracked
202212133	Ben	parasite	traitors	not_tracked
202212133	Duncan	innocent	innocents	not_tracked
202212133	Ravs	traitor	traitors	not_tracked
202212133	Rythian	paramedic	innocents	not_tracked
202212133	Zoey	randoman	innocents	not_tracked
202212133	Osie	jester	jester	not_tracked
202212133	Lewis	innocent	innocents	not_tracked
202212134	Ben	traitor	traitors	not_tracked
202212134	Duncan	innocent	innocents	not_tracked
202212134	Ravs	paramedic	innocents	not_tracked
202212134	Rythian	randoman	innocents	not_tracked
202212134	Zoey	innocent	innocents	not_tracked
202212134	Osie	impersonator	traitors	not_tracked
202212134	Lewis	loot goblin	traitors	not_tracked
202212135	Ben	traitor	traitors	not_tracked
202212135	Duncan	innocent	innocents	not_tracked
202212135	Ravs	innocent	innocents	not_tracked
202212135	Rythian	glitch	innocents	not_tracked
202212135	Zoey	randoman	innocents	not_tracked
202212135	Osie	jester	jester	not_tracked
202212135	Lewis	summoner	traitors	not_tracked
202212136	Ben	informant	traitors	not_tracked
202212136	Duncan	tracker	innocents	not_tracked
202212136	Ravs	jester	jester	not_tracked
202212136	Rythian	mad scientist	zombies	not_tracked
202212136	Zoey	deputy	innocents	not_tracked
202212136	Osie	informant	traitors	not_tracked
202212136	Lewis	deputy	innocents	not_tracked
202212170	Lewis	innocent	innocents	not_tracked
202212170	Ben	summoner	traitors	not_tracked
202212170	Duncan	santa	innocents	not_tracked
202212170	Osie	drunk	none	not_tracked
202212170	Shadow	veteran	innocents	not_tracked
202212170	Breeh	innocent	innocents	not_tracked
202212170	Lolip	traitor	traitors	not_tracked
202212170	Rythian	traitor	traitors	not_tracked
202212171	Lewis	zombie	zombies	not_tracked
202212171	Ben	innocent	innocents	not_tracked
202212171	Duncan	santa	innocents	not_tracked
202212171	Rythian	jester	jester	not_tracked
202212171	Osie	traitor	traitors	not_tracked
202212171	Shadow	glitch	innocents	not_tracked
202212171	Breeh	mad scientist	zombies	not_tracked
202212171	Lolip	innocent	innocents	not_tracked
202212172	Lewis	parasite	traitors	not_tracked
202212172	Ben	traitor	traitors	not_tracked
202212172	Duncan	santa	innocents	not_tracked
202212172	Rythian	innocent	innocents	not_tracked
202212172	Osie	innocent	innocents	not_tracked
202212172	Shadow	veteran	innocents	not_tracked
202212172	Breeh	loot goblin	none	not_tracked
202212172	Lolip	glitch	innocents	not_tracked
202212173	Lewis	elf	elves	not_tracked
202212173	Ben	elf	elves	not_tracked
202212173	Duncan	elf	elves	not_tracked
202212173	Rythian	elf	elves	not_tracked
202212173	Osie	elf	elves	not_tracked
202212173	Shadow	elf	elves	not_tracked
202212173	Breeh	elf	elves	not_tracked
202212173	Lolip	elf	elves	not_tracked
202212174	Lewis	elf	elves	not_tracked
202212174	Ben	elf	elves	not_tracked
202212174	Duncan	elf	elves	not_tracked
202212174	Rythian	elf	elves	not_tracked
202212174	Osie	detective	innocents	not_tracked
202212174	Shadow	traitor	traitors	not_tracked
202212174	Breeh	elf	elves	not_tracked
202212174	Lolip	elf	elves	not_tracked
202212200	Lewis	innocent	innocents	not_tracked
202212200	Ben	zombie	zombies	not_tracked
202212200	Duncan	zombie	zombies	not_tracked
202212200	Rythian	swapper	none	not_tracked
202212200	Osie	zombie	zombies	not_tracked
202212200	Shadow	zombie	zombies	not_tracked
202212200	Breeh	mad scientist	zombies	not_tracked
202212200	Lolip	zombie	zombies	not_tracked
202212201	Lewis	santa	innocents	not_tracked
202212201	Ben	innocent	innocents	not_tracked
202212201	Duncan	impersonator	traitors	not_tracked
202212201	Rythian	loot goblin	none	not_tracked
202212201	Osie	innocent	innocents	not_tracked
202212201	Shadow	veteran	innocents	not_tracked
202212201	Breeh	traitor	traitors	not_tracked
202212201	Lolip	mad scientist	zombies	not_tracked
202212202	Lewis	traitor	traitors	not_tracked
202212202	Ben	innocent	innocents	not_tracked
202212202	Duncan	glitch	innocents	not_tracked
202212202	Rythian	jester	none	not_tracked
202212202	Osie	santa	innocents	not_tracked
202212202	Shadow	parasite	traitors	not_tracked
202212202	Breeh	innocent	innocents	not_tracked
202212202	Lolip	innocent	innocents	not_tracked
202212203	Lewis	mad scientist	zombies	not_tracked
202212203	Ben	zombie	zombies	not_tracked
202212203	Duncan	traitor	traitors	not_tracked
202212203	Rythian	zombie	zombies	not_tracked
202212203	Osie	zombie	zombies	not_tracked
202212203	Shadow	beggar	none	not_tracked
202212203	Breeh	innocent	innocents	not_tracked
202212203	Lolip	zombie	zombies	not_tracked
202212204	Lewis	parasite	traitors	not_tracked
202212204	Ben	jester	jester	not_tracked
202212204	Duncan	innocent	innocents	not_tracked
202212204	Rythian	innocent	innocents	not_tracked
202212204	Osie	paramedic	innocents	not_tracked
202212204	Shadow	traitor	traitors	not_tracked
202212204	Breeh	medium	innocents	not_tracked
202212204	Lolip	mad scientist	zombies	not_tracked
202212240	Lewis	informant	traitors	not_tracked
202212240	Ben	innocent	innocents	not_tracked
202212240	Duncan	jester	jester	not_tracked
202212240	Rythian	santa	innocents	not_tracked
202212240	Osie	innocent	innocents	not_tracked
202212240	Shadow	traitor	traitors	not_tracked
202212240	Breeh	drunk	none	not_tracked
202212240	Lolip	turncoat	traitors	not_tracked
202212241	Lewis	randoman	innocents	not_tracked
202212241	Ben	innocent	innocents	not_tracked
202212241	Duncan	elf	elves	not_tracked
202212241	Rythian	elf	elves	not_tracked
202212241	Osie	elf	elves	not_tracked
202212241	Shadow	traitor	traitors	not_tracked
202212241	Breeh	elf	elves	not_tracked
202212241	Lolip	elf	elves	not_tracked
202212242	Lewis	loot goblin	none	not_tracked
202212242	Ben	summoner	traitors	not_tracked
202212242	Duncan	traitor	traitors	not_tracked
202212242	Rythian	innocent	innocents	not_tracked
202212242	Osie	elf	elves	not_tracked
202212242	Shadow	veteran	innocents	not_tracked
202212242	Breeh	detective	innocents	not_tracked
202212242	Lolip	innocent	innocents	not_tracked
202212243	Lewis	hypnotist	traitors	not_tracked
202212243	Ben	paramedic	innocents	not_tracked
202212243	Duncan	paramedic	innocents	not_tracked
202212243	Rythian	traitor	traitors	not_tracked
202212243	Osie	paramedic	innocents	not_tracked
202212243	Shadow	mad scientist	zombies	not_tracked
202212243	Breeh	hypnotist	traitors	not_tracked
202212243	Lolip	paramedic	innocents	not_tracked
202212244	Lewis	elf	elves	not_tracked
202212244	Ben	elf	elves	not_tracked
202212244	Duncan	elf	elves	not_tracked
202212244	Rythian	elf	elves	not_tracked
202212244	Osie	elf	elves	not_tracked
202212244	Shadow	elf	elves	not_tracked
202212244	Breeh	elf	elves	not_tracked
202212244	Lolip	elf	elves	not_tracked
202212245	Lewis	innocent	innocents	not_tracked
202212245	Ben	turncoat	innocents	not_tracked
202212245	Duncan	jester	jester	not_tracked
202212245	Rythian	innocent	innocents	not_tracked
202212245	Osie	traitor	traitors	not_tracked
202212245	Shadow	informant	traitors	not_tracked
202212245	Breeh	innocent	innocents	not_tracked
202212245	Lolip	santa	innocents	not_tracked
202212246	Lewis	innocent	innocents	not_tracked
202212246	Ben	turncoat	innocents	not_tracked
202212246	Duncan	paladin	innocents	not_tracked
202212246	Rythian	traitor	traitors	not_tracked
202212246	Osie	jester	jester	not_tracked
202212246	Shadow	deputy	innocents	not_tracked
202212246	Breeh	innocent	innocents	not_tracked
202212246	Lolip	parasite	traitors	not_tracked
202212270	Lewis	mad scientist	zombies	not_tracked
202212270	Ben	traitor	traitors	not_tracked
202212270	Rythian	turncoat	innocents	not_tracked
202212270	Boba	zombie	zombies	not_tracked
202212270	Kirsty	zombie	zombies	not_tracked
202212270	Ravs	zombie	zombies	not_tracked
202212271	Lewis	paramedic	innocents	not_tracked
202212271	Ben	traitor	traitors	not_tracked
202212271	Rythian	paladin	innocents	not_tracked
202212271	Boba	innocent	innocents	not_tracked
202212271	Kirsty	summoner	traitors	not_tracked
202212271	Ravs	mad scientist	zombies	not_tracked
202212272	Lewis	innocent	innocents	not_tracked
202212272	Ben	paladin	innocents	not_tracked
202212272	Rythian	beggar	none	not_tracked
202212272	Boba	innocent	innocents	not_tracked
202212272	Kirsty	traitor	traitors	not_tracked
202212272	Ravs	turncoat	innocents	not_tracked
202212273	Lewis	beggar	none	not_tracked
202212273	Ben	innocent	innocents	not_tracked
202212273	Rythian	summoner	traitors	not_tracked
202212273	Boba	turncoat	innocents	not_tracked
202212273	Kirsty	innocent	innocents	not_tracked
202212273	Ravs	paladin	innocents	not_tracked
202212274	Lewis	veteran	innocents	not_tracked
202212274	Ben	traitor	traitors	not_tracked
202212274	Rythian	traitor	traitors	not_tracked
202212274	Boba	informant	traitors	not_tracked
202212274	Kirsty	traitor	traitors	not_tracked
202212274	Ravs	randoman	innocents	not_tracked
202212275	Lewis	medium	innocents	not_tracked
202212275	Ben	innocent	innocents	not_tracked
202212275	Rythian	innocent	innocents	not_tracked
202212275	Boba	veteran	innocents	not_tracked
202212275	Kirsty	clown	clown	not_tracked
202212275	Ravs	traitor	traitors	not_tracked
202212270	Zylus	zombie	zombies	not_tracked
202212271	Zylus	innocent	innocents	not_tracked
202212272	Zylus	informant	traitors	not_tracked
202212273	Zylus	traitor	traitors	not_tracked
202212274	Zylus	traitor	traitors	not_tracked
202212275	Zylus	informant	traitors	not_tracked
202212310	Lewis	paramedic	innocents	not_tracked
202212310	Ben	jester	jester	not_tracked
202212310	Zylus	innocent	innocents	not_tracked
202212310	Rythian	innocent	innocents	not_tracked
202212310	Boba	traitor	traitors	not_tracked
202212310	Kirsty	informant	traitors	not_tracked
202212310	Ravs	paladin	innocents	not_tracked
202212311	Lewis	beggar	none	not_tracked
202212311	Ben	parasite	traitors	not_tracked
202212311	Zylus	traitor	traitors	not_tracked
202212311	Rythian	innocent	innocents	not_tracked
202212311	Boba	randoman	innocents	not_tracked
202212311	Kirsty	paramedic	innocents	not_tracked
202212311	Ravs	innocent	innocents	not_tracked
202212312	Lewis	jester	jester	not_tracked
202212312	Ben	paladin	innocents	not_tracked
202212312	Zylus	veteran	innocents	not_tracked
202212312	Rythian	innocent	innocents	not_tracked
202212312	Boba	informant	traitors	not_tracked
202212312	Kirsty	traitor	traitors	not_tracked
202212312	Ravs	innocent	innocents	not_tracked
202212313	Lewis	traitor	traitors	not_tracked
202212313	Ben	paladin	innocents	not_tracked
202212313	Zylus	innocent	innocents	not_tracked
202212313	Rythian	impersonator	traitors	not_tracked
202212313	Boba	swapper	none	not_tracked
202212313	Kirsty	veteran	innocents	not_tracked
202212313	Ravs	innocent	innocents	not_tracked
202212314	Lewis	innocent	innocents	not_tracked
202212314	Ben	traitor	traitors	not_tracked
202212314	Zylus	innocent	innocents	not_tracked
202212314	Rythian	paramedic	innocents	not_tracked
202212314	Boba	impersonator	traitors	not_tracked
202212314	Kirsty	innocent	innocents	not_tracked
202212314	Ravs	swapper	none	not_tracked
202301030	Lewis	turncoat	innocents	not_tracked
202301030	Ben	innocent	innocents	not_tracked
202301030	Zylus	medium	innocents	not_tracked
202301030	Rythian	traitor	traitors	not_tracked
202301030	Boba	parasite	traitors	not_tracked
202301030	Kirsty	drunk	traitors	not_tracked
202301030	Ravs	innocent	innocents	not_tracked
202301031	Lewis	innocent	innocents	not_tracked
202301031	Ben	innocent	innocents	not_tracked
202301031	Zylus	clown	clown	not_tracked
202301031	Rythian	tracker	innocents	not_tracked
202301031	Boba	traitor	traitors	not_tracked
202301031	Kirsty	informant	traitors	not_tracked
202301031	Ravs	veteran	innocents	not_tracked
202301032	Lewis	impersonator	traitors	not_tracked
202301032	Ben	traitor	traitors	not_tracked
202301032	Zylus	innocent	innocents	not_tracked
202301032	Rythian	innocent	innocents	not_tracked
202301032	Boba	paramedic	innocents	not_tracked
202301032	Kirsty	drunk	none	not_tracked
202301032	Ravs	tracker	innocents	not_tracked
202301033	Lewis	parasite	traitors	not_tracked
202301033	Ben	medium	innocents	not_tracked
202301033	Zylus	innocent	innocents	not_tracked
202301033	Rythian	jester	jester	not_tracked
202301033	Boba	traitor	traitors	not_tracked
202301033	Kirsty	innocent	innocents	not_tracked
202301033	Ravs	turncoat	traitors	not_tracked
202301034	Lewis	summoner	traitors	not_tracked
202301034	Ben	tracker	innocents	not_tracked
202301034	Zylus	innocent	innocents	not_tracked
202301034	Rythian	beggar	innocents	not_tracked
202301034	Boba	traitor	traitors	not_tracked
202301034	Kirsty	innocent	innocents	not_tracked
202301034	Ravs	turncoat	traitors	not_tracked
202301070	Lewis	randoman	innocents	not_tracked
202301070	Ben	innocent	innocents	not_tracked
202301070	Zylus	traitor	traitors	not_tracked
202301070	Rythian	swapper	none	not_tracked
202301070	Duncan	impersonator	traitors	not_tracked
202301070	Kirsty	innocent	innocents	not_tracked
202301070	Ravs	turncoat	innocents	not_tracked
202301071	Lewis	innocent	innocents	not_tracked
202301071	Ben	turncoat	innocents	not_tracked
202301071	Zylus	innocent	innocents	not_tracked
202301071	Rythian	parasite	traitors	not_tracked
202301071	Duncan	traitor	traitors	not_tracked
202301071	Kirsty	tracker	innocents	not_tracked
202301071	Ravs	swapper	none	not_tracked
202301072	Lewis	innocent	innocents	not_tracked
202301072	Ben	zombie	zombies	not_tracked
202301072	Zylus	zombie	zombies	not_tracked
202301072	Rythian	veteran	innocents	not_tracked
202301072	Duncan	zombie	zombies	not_tracked
202301072	Kirsty	zombie	zombies	not_tracked
202301072	Ravs	mad scientist	zombies	not_tracked
202301073	Lewis	innocent	innocents	not_tracked
202301073	Ben	traitor	traitors	not_tracked
202301073	Zylus	informant	traitors	not_tracked
202301073	Rythian	paladin	innocents	not_tracked
202301073	Duncan	veteran	innocents	not_tracked
202301073	Kirsty	innocent	innocents	not_tracked
202301073	Ravs	jester	jester	not_tracked
202301074	Lewis	innocent	innocents	not_tracked
202301074	Ben	parasite	traitors	not_tracked
202301074	Zylus	traitor	traitors	not_tracked
202301074	Rythian	randoman	innocents	not_tracked
202301074	Duncan	glitch	innocents	not_tracked
202301074	Kirsty	jester	jester	not_tracked
202301074	Ravs	innocent	innocents	not_tracked
202301075	Lewis	hypnotist	traitors	not_tracked
202301075	Ben	traitor	traitors	not_tracked
202301075	Zylus	jester	jester	not_tracked
202301075	Rythian	innocent	innocents	not_tracked
202301075	Duncan	traitor	traitors	not_tracked
202301075	Kirsty	innocent	innocents	not_tracked
202301075	Ravs	veteran	innocents	not_tracked
202301035	Lewis	swapper	none	not_tracked
202301035	Ben	informant	traitors	not_tracked
202301035	Zylus	traitor	traitors	not_tracked
202301035	Rythian	glitch	innocents	not_tracked
202301035	Boba	innocent	innocents	not_tracked
202301035	Kirsty	innocent	innocents	not_tracked
202301035	Ravs	innocent	innocents	not_tracked
202301100	Lewis	medium	innocents	not_tracked
202301100	Ben	jester	jester	not_tracked
202301100	Zylus	traitor	traitors	not_tracked
202301100	Rythian	jester	jester	not_tracked
202301100	Duncan	jester	jester	not_tracked
202301100	Kirsty	jester	jester	not_tracked
202301100	Ravs	jester	jester	not_tracked
202301101	Lewis	innocent	innocents	not_tracked
202301101	Ben	paramedic	innocents	not_tracked
202301101	Zylus	traitor	traitors	not_tracked
202301101	Rythian	medium	innocents	not_tracked
202301101	Duncan	jester	jester	not_tracked
202301101	Kirsty	summoner	traitors	not_tracked
202301101	Ravs	innocent	innocents	not_tracked
202301102	Lewis	medium	innocents	not_tracked
202301102	Ben	innocent	innocents	not_tracked
202301102	Zylus	glitch	innocents	not_tracked
202301102	Rythian	innocent	innocents	not_tracked
202301102	Duncan	traitor	traitors	not_tracked
202301102	Kirsty	clown	clown	not_tracked
202301102	Ravs	summoner	traitors	not_tracked
202301103	Lewis	innocent	innocents	not_tracked
202301103	Ben	innocent	innocents	not_tracked
202301103	Zylus	traitor	traitors	not_tracked
202301103	Rythian	hypnotist	traitors	not_tracked
202301103	Duncan	beggar	traitors	not_tracked
202301103	Kirsty	traitor	traitors	not_tracked
202301103	Ravs	medium	innocents	not_tracked
202301104	Lewis	traitor	traitors	not_tracked
202301104	Ben	tracker	innocents	not_tracked
202301104	Zylus	glitch	innocents	not_tracked
202301104	Rythian	innocent	innocents	not_tracked
202301104	Duncan	informant	traitors	not_tracked
202301104	Kirsty	clown	clown	not_tracked
202301104	Ravs	innocent	innocents	not_tracked
202301105	Lewis	zombie	zombies	not_tracked
202301105	Ben	zombie	zombies	not_tracked
202301105	Zylus	mad scientist	zombies	not_tracked
202301105	Rythian	zombie	zombies	not_tracked
202301105	Duncan	zombie	zombies	not_tracked
202301105	Kirsty	paramedic	innocents	not_tracked
202301105	Ravs	zombie	zombies	not_tracked
202301140	Lewis	mad scientist	zombies	not_tracked
202301140	Ben	veteran	innocents	not_tracked
202301140	Osie	loot goblin	none	not_tracked
202301140	Rythian	summoner	traitors	not_tracked
202301140	Duncan	randoman	innocents	not_tracked
202301140	Kirsty	innocent	innocents	not_tracked
202301140	Ravs	traitor	traitors	not_tracked
202301140	Zoey	innocent	innocents	not_tracked
202301141	Lewis	beggar	innocents	not_tracked
202301141	Ben	traitor	traitors	not_tracked
202301141	Osie	drunk	none	not_tracked
202301141	Rythian	informant	traitors	not_tracked
202301141	Duncan	innocent	innocents	not_tracked
202301141	Kirsty	innocent	innocents	not_tracked
202301141	Ravs	paladin	innocents	not_tracked
202301141	Zoey	glitch	innocents	not_tracked
202301142	Lewis	traitor	traitors	not_tracked
202301142	Ben	traitor	traitors	not_tracked
202301142	Osie	detective	innocents	not_tracked
202301142	Rythian	hypnotist	traitors	not_tracked
202301142	Duncan	medium	innocents	not_tracked
202301142	Kirsty	glitch	innocents	not_tracked
202301142	Ravs	jester	jester	not_tracked
202301142	Zoey	innocent	innocents	not_tracked
202301143	Lewis	drunk	none	not_tracked
202301143	Ben	paladin	innocents	not_tracked
202301143	Osie	turncoat	innocents	not_tracked
202301143	Rythian	innocent	innocents	not_tracked
202301143	Duncan	innocent	innocents	not_tracked
202301143	Kirsty	impersonator	traitors	not_tracked
202301143	Ravs	clown	clown	not_tracked
202301143	Zoey	traitor	traitors	not_tracked
202301170	Lewis	clown	clown	not_tracked
202301170	Ben	innocent	innocents	not_tracked
202301170	Osie	innocent	innocents	not_tracked
202301170	Rythian	deputy	innocents	not_tracked
202301170	Duncan	summoner	traitors	not_tracked
202301170	Kirsty	traitor	traitors	not_tracked
202301170	Ravs	medium	innocents	not_tracked
202301170	Zoey	traitor	traitors	not_tracked
202301171	Lewis	jester	jester	not_tracked
202301171	Ben	veteran	innocents	not_tracked
202301171	Osie	traitor	traitors	not_tracked
202301171	Rythian	innocent	innocents	not_tracked
202301171	Duncan	impersonator	traitors	not_tracked
202301171	Kirsty	drunk	none	not_tracked
202301171	Ravs	innocent	innocents	not_tracked
202301171	Zoey	paladin	innocents	not_tracked
202301172	Lewis	traitor	traitors	not_tracked
202301172	Ben	innocent	innocents	not_tracked
202301172	Osie	tracker	innocents	not_tracked
202301172	Rythian	swapper	none	not_tracked
202301172	Duncan	innocent	innocents	not_tracked
202301172	Kirsty	drunk	none	not_tracked
202301172	Ravs	glitch	innocents	not_tracked
202301172	Zoey	hypnotist	traitors	not_tracked
202301173	Lewis	innocent	innocents	not_tracked
202301173	Ben	impersonator	traitors	not_tracked
202301173	Osie	traitor	traitors	not_tracked
202301173	Rythian	paladin	innocents	not_tracked
202301173	Duncan	innocent	innocents	not_tracked
202301173	Kirsty	glitch	innocents	not_tracked
202301173	Ravs	mad scientist	zombies	not_tracked
202301173	Zoey	clown	clown	not_tracked
202301174	Lewis	zombie	zombies	not_tracked
202301174	Ben	mad scientist	zombies	not_tracked
202301174	Osie	traitor	traitors	not_tracked
202301174	Rythian	innocent	innocents	not_tracked
202301174	Duncan	deputy	innocents	not_tracked
202301174	Kirsty	zombie	zombies	not_tracked
202301174	Ravs	zombie	zombies	not_tracked
202301174	Zoey	zombie	zombies	not_tracked
202301210	Lewis	jester	jester	not_tracked
202301210	Ben	parasite	traitors	not_tracked
202301210	Osie	hypnotist	traitors	not_tracked
202301210	Rythian	innocent	innocents	not_tracked
202301210	Duncan	traitor	traitors	not_tracked
202301210	Kirsty	turncoat	innocents	not_tracked
202301210	Ravs	innocent	innocents	not_tracked
202301210	Zoey	medium	innocents	not_tracked
202301211	Lewis	beggar	traitors	not_tracked
202301211	Ben	traitor	traitors	not_tracked
202301211	Osie	innocent	innocents	not_tracked
202301211	Rythian	veteran	innocents	not_tracked
202301211	Duncan	randoman	innocents	not_tracked
202301211	Kirsty	turncoat	traitors	not_tracked
202301211	Ravs	informant	traitors	not_tracked
202301211	Zoey	innocent	innocents	not_tracked
202301212	Lewis	summoner	traitors	not_tracked
202301212	Ben	drunk	none	not_tracked
202301212	Osie	medium	innocents	not_tracked
202301212	Rythian	innocent	innocents	not_tracked
202301212	Duncan	innocent	innocents	not_tracked
202301212	Kirsty	traitor	traitors	not_tracked
202301212	Ravs	clown	clown	not_tracked
202301212	Zoey	turncoat	innocents	not_tracked
202301213	Lewis	drunk	none	not_tracked
202301213	Ben	jester	jester	not_tracked
202301213	Osie	innocent	innocents	not_tracked
202301213	Rythian	traitor	traitors	not_tracked
202301213	Duncan	summoner	traitors	not_tracked
202301213	Kirsty	paladin	innocents	not_tracked
202301213	Ravs	innocent	innocents	not_tracked
202301213	Zoey	turncoat	innocents	not_tracked
202301214	Lewis	zombie	zombies	not_tracked
202301214	Ben	traitor	traitors	not_tracked
202301214	Osie	zombie	zombies	not_tracked
202301214	Rythian	zombie	zombies	not_tracked
202301214	Duncan	zombie	zombies	not_tracked
202301214	Kirsty	zombie	zombies	not_tracked
202301214	Ravs	zombie	zombies	not_tracked
202301214	Zoey	zombie	zombies	not_tracked
202301215	Lewis	innocent	innocents	not_tracked
202301215	Ben	clown	clown	not_tracked
202301215	Osie	turncoat	innocents	not_tracked
202301215	Rythian	innocent	innocents	not_tracked
202301215	Duncan	summoner	traitors	not_tracked
202301215	Kirsty	mad scientist	zombies	not_tracked
202301215	Ravs	traitor	traitors	not_tracked
202301215	Zoey	tracker	innocents	not_tracked
202301240	Ben	clown	clown	not_tracked
202301240	Osie	summoner	traitors	not_tracked
202301240	Rythian	traitor	traitors	not_tracked
202301240	Duncan	innocent	innocents	not_tracked
202301240	Kirsty	paladin	innocents	not_tracked
202301240	Ravs	innocent	innocents	not_tracked
202301240	Zoey	turncoat	traitors	not_tracked
202301241	Lewis	glitch	innocents	not_tracked
202301241	Ben	innocent	innocents	not_tracked
202301241	Osie	jester	jester	not_tracked
202301241	Rythian	paladin	innocents	not_tracked
202301241	Duncan	summoner	traitors	not_tracked
202301241	Kirsty	traitor	traitors	not_tracked
202301241	Ravs	innocent	innocents	not_tracked
202301241	Zoey	mad scientist	zombies	not_tracked
202301242	Lewis	veteran	innocents	not_tracked
202301242	Ben	innocent	innocents	not_tracked
202301242	Osie	randoman	innocents	not_tracked
202301242	Rythian	innocent	innocents	not_tracked
202301242	Duncan	parasite	traitors	not_tracked
202301242	Kirsty	traitor	traitors	not_tracked
202301242	Ravs	swapper	none	not_tracked
202301242	Zoey	summoner	traitors	not_tracked
202301243	Lewis	parasite	traitors	not_tracked
202301243	Ben	drunk	none	not_tracked
202301243	Osie	traitor	traitors	not_tracked
202301243	Rythian	glitch	innocents	not_tracked
202301243	Duncan	paladin	innocents	not_tracked
202301243	Kirsty	clown	clown	not_tracked
202301243	Ravs	innocent	innocents	not_tracked
202301243	Zoey	innocent	innocents	not_tracked
202301244	Lewis	innocent	innocents	not_tracked
202301244	Ben	innocent	innocents	not_tracked
202301244	Osie	innocent	innocents	not_tracked
202301244	Rythian	innocent	innocents	not_tracked
202301244	Duncan	innocent	innocents	not_tracked
202301244	Kirsty	innocent	innocents	not_tracked
202301244	Ravs	innocent	innocents	not_tracked
202301244	Zoey	innocent	innocents	not_tracked
202301280	Lewis	turncoat	innocents	not_tracked
202301280	Ben	innocent	innocents	not_tracked
202301280	Zylus	innocent	innocents	not_tracked
202301280	Rythian	medium	innocents	not_tracked
202301280	Duncan	loot goblin	none	not_tracked
202301280	Boba	parasite	traitors	not_tracked
202301280	Ravs	traitor	traitors	not_tracked
202301280	Pedguin	drunk	none	not_tracked
202301281	Lewis	innocent	innocents	not_tracked
202301281	Ben	innocent	innocents	not_tracked
202301281	Zylus	innocent	innocents	not_tracked
202301281	Rythian	innocent	innocents	not_tracked
202301281	Duncan	innocent	innocents	not_tracked
202301281	Boba	innocent	innocents	not_tracked
202301281	Ravs	innocent	innocents	not_tracked
202301281	Pedguin	innocent	innocents	not_tracked
202301282	Lewis	veteran	innocents	not_tracked
202301282	Ben	hypnotist	traitors	not_tracked
202301282	Zylus	beggar	none	not_tracked
202301282	Rythian	innocent	innocents	not_tracked
202301282	Duncan	traitor	traitors	not_tracked
202301282	Boba	mad scientist	zombies	not_tracked
202301282	Ravs	innocent	innocents	not_tracked
202301282	Pedguin	paladin	innocents	not_tracked
202301283	Lewis	innocent	innocents	not_tracked
202301283	Ben	summoner	traitors	not_tracked
202301283	Zylus	veteran	innocents	not_tracked
202301283	Rythian	innocent	innocents	not_tracked
202301283	Duncan	traitor	traitors	not_tracked
202301283	Boba	swapper	none	not_tracked
202301283	Ravs	drunk	none	not_tracked
202301283	Pedguin	randoman	innocents	not_tracked
202301284	Lewis	glitch	innocents	not_tracked
202301284	Ben	traitor	traitors	not_tracked
202301284	Zylus	parasite	traitors	not_tracked
202301284	Rythian	swapper	none	not_tracked
202301284	Duncan	innocent	innocents	not_tracked
202301284	Boba	paladin	innocents	not_tracked
202301284	Ravs	veteran	innocents	not_tracked
202301284	Pedguin	innocent	innocents	not_tracked
202301310	Lewis	traitor	traitors	yes
202301310	Ben	zombie	zombies	yes
202301310	Zylus	summoner	traitors	yes
202301310	Rythian	mad scientist	zombies	yes
202301310	Duncan	zombie	zombies	yes
202301310	Boba	innocent	innocents	no
202301310	Ravs	paramedic	innocents	yes
202301310	Pedguin	paladin	innocents	no
202301311	Lewis	innocent	innocents	yes
202301311	Ben	summoner	traitors	yes
202301311	Zylus	innocent	innocents	yes
202301311	Rythian	traitor	traitors	no
202301311	Duncan	drunk	none	yes
202301311	Boba	paramedic	innocents	yes
202301311	Ravs	jester	jester	yes
202301311	Pedguin	medium	innocents	yes
202301312	Lewis	summoner	traitors	no
202301312	Ben	randoman	innocents	yes
202301312	Zylus	innocent	innocents	yes
202301312	Rythian	innocent	innocents	yes
202301312	Duncan	traitor	traitors	yes
202301312	Boba	parasite	traitors	yes
202301312	Ravs	veteran	innocents	yes
202301312	Pedguin	swapper	none	no
202301313	Lewis	innocent	innocents	no
202301313	Ben	medium	innocents	no
202301313	Zylus	paramedic	innocents	no
202301313	Rythian	innocent	innocents	no
202301313	Duncan	jester	jester	yes
202301313	Boba	traitor	traitors	no
202301313	Ravs	innocent	innocents	no
202301313	Pedguin	informant	traitors	no
202302040	Lewis	turncoat	traitors	yes
202302040	Ben	hypnotist	traitors	yes
202302040	Zylus	traitor	traitors	yes
202302040	Rythian	randoman	innocents	no
202302040	Duncan	traitor	traitors	yes
202302040	Boba	innocent	innocents	no
202302040	Ravs	jester	jester	no
202302040	Pedguin	drunk	none	yes
202302041	Lewis	clown	clown	yes
202302041	Ben	innocent	innocents	yes
202302041	Zylus	traitor	traitors	yes
202302041	Rythian	innocent	innocents	no
202302041	Duncan	traitor	traitors	yes
202302041	Boba	summoner	traitors	yes
202302041	Ravs	veteran	innocents	no
202302041	Pedguin	tracker	innocents	yes
202302042	Lewis	traitor	traitors	yes
202302042	Ben	turncoat	innocents	yes
202302042	Zylus	innocent	innocents	no
202302042	Rythian	swapper	none	no
202302042	Duncan	paladin	innocents	yes
202302042	Boba	informant	traitors	yes
202302042	Ravs	innocent	innocents	yes
202302042	Pedguin	veteran	innocents	yes
202302043	Lewis	turncoat	innocents	no
202302043	Ben	impersonator	traitors	yes
202302043	Zylus	traitor	traitors	yes
202302043	Rythian	swapper	none	yes
202302043	Duncan	innocent	innocents	no
202302043	Boba	innocent	innocents	no
202302043	Ravs	deputy	innocents	no
202302043	Pedguin	paladin	innocents	no
202302044	Lewis	traitor	traitors	yes
202302044	Ben	zombie	zombies	yes
202302044	Zylus	zombie	zombies	yes
202302044	Rythian	zombie	zombies	no
202302044	Duncan	zombie	zombies	no
202302044	Boba	zombie	zombies	yes
202302044	Ravs	zombie	zombies	no
202302044	Pedguin	zombie	zombies	no
202302045	Lewis	mad scientist	zombies	yes
202302045	Ben	clown	clown	no
202302045	Zylus	paramedic	innocents	yes
202302045	Rythian	traitor	traitors	yes
202302045	Duncan	paladin	innocents	yes
202302045	Boba	summoner	traitors	yes
202302045	Ravs	innocent	innocents	yes
202302045	Pedguin	innocent	innocents	yes
202302070	Lewis	traitor	traitors	yes
202302070	Ben	parasite	traitors	yes
202302070	Zylus	innocent	innocents	yes
202302070	Rythian	innocent	innocents	no
202302070	Duncan	glitch	innocents	yes
202302070	Kirsty	randoman	innocents	no
202302070	Osie	clown	clown	yes
202302071	Lewis	innocent	innocents	yes
202302071	Ben	innocent	innocents	yes
202302071	Zylus	traitor	traitors	yes
202302071	Rythian	tracker	innocents	no
202302071	Duncan	traitor	traitors	yes
202302071	Kirsty	glitch	innocents	yes
202302071	Osie	hypnotist	traitors	yes
202302072	Lewis	paladin	innocents	yes
202302072	Ben	jester	jester	yes
202302072	Zylus	innocent	innocents	yes
202302072	Rythian	traitor	traitors	no
202302072	Duncan	veteran	innocents	yes
202302072	Kirsty	informant	traitors	yes
202302072	Osie	innocent	innocents	yes
202302073	Lewis	traitor	traitors	no
202302073	Ben	tracker	innocents	yes
202302073	Zylus	innocent	innocents	yes
202302073	Rythian	informant	traitors	no
202302073	Duncan	veteran	innocents	yes
202302073	Kirsty	innocent	innocents	yes
202302073	Osie	paramedic	innocents	yes
202302074	Lewis	turncoat	traitors	no
202302074	Ben	summoner	traitors	no
202302074	Zylus	innocent	innocents	yes
202302074	Rythian	loot goblin	none	yes
202302074	Duncan	innocent	innocents	yes
202302074	Kirsty	traitor	traitors	yes
202302074	Osie	medium	innocents	yes
202302075	Lewis	paladin	innocents	yes
202302075	Ben	turncoat	innocents	yes
202302075	Zylus	traitor	traitors	no
202302075	Rythian	impersonator	traitors	no
202302075	Duncan	swapper	none	yes
202302075	Kirsty	innocent	innocents	yes
202302075	Osie	innocent	innocents	yes
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

COPY public.video (title, vid, intro_death) FROM stdin;
Only admin abuse can end this AWFUL round of Gmod TTT!	VRLFaq9XcMc	not_tracked
The Magical Flying Shed | Gmod TTT (w/ RTGame)	geRFB7ihD3M	not_tracked
NEW Spooky Scary Skeleton Gun in Gmod TTT | Halloween Special!	fTM_5NZFhRY	not_tracked
Who's the FASTEST GUN in the Yogscast!? | Gmod TTT	Q5ErlVIH31Q	not_tracked
How to Win Rock, Paper, Scissors (and kill your soulmate) | Gmod TTT	eIkEFaar-Qc	not_tracked
You Will Die In 5 Seconds | Gmod TTT (w/ RTGame)	H2dmsjSF0Wo	not_tracked
Rythian's Favourite Round of All Time | Gmod TTT (w/ RTGame)	tXmLUmbUJag	not_tracked
The WORST trade deal in Gmod TTT!	u8MzP3B0bMw	not_tracked
There's more traitors than innocents inGmod TTT!?	JSq1OPfhJ-Y	not_tracked
Come into my Goblin Hole!! | Gmod TTT	Gkak7LLJOqc	not_tracked
The scream that destroyed YogTowers! | Gmod TTT	otqA9aYtejA	not_tracked
7 DISGUSTING mutants learn how to kill | Gmod TTT	PstAilWgMu4	not_tracked
We're FINALLY breaking the meta in Gmod TTT!	WFD4kmH_zpI	not_tracked
TTT XL! The most INCREDIBLE map we've ever played!	463eWBId7jw	not_tracked
We increased prop damage again... | Gmod TTT	HBfgvCLx808	not_tracked
The most dangerous hiding place in GmodTTT!	glwQJJICxw	not_tracked
NEW ROLE: The ELVES are rising up!! | Christmas TTT Special	HDfGua9hZzI	not_tracked
Why won't Santa wake up!? | Christmas TTT Special	0w1LHuToCXI	not_tracked
No one wants a DEFUSER for CHRISTMAS!! | Christmas TTT Special!	JqqN9U4D9CI	not_tracked
The rise of Benthazar Hellstrand II | Gmod TTT	m40z1K1TIK4	not_tracked
Don't fall in the Plot Twist Pit!! | Gmod TTT	lQ4RQPuvHr0	not_tracked
Lewis and Boba's Big Adventure! | Gmod TTT	l1I-S3xaiIY	not_tracked
Curse of the FOREVER SWAPPER! | Gmod TTT	GBrckzwMvTQ	not_tracked
Pikachu is the TRUE Mad Scientist!! | Gmod TTT	YAf7W6AcqNs	not_tracked
Return to Doncon Temple!! | Gmod TTT	62m9fsf4iDM	not_tracked
Zomies are taking over the MOON! | Gmod TTT	qJQsEevyU6U	not_tracked
There's a little Doncon inside us all! | Gmod TTT	v1pj4S1cxKw	not_tracked
Would YOU excecute Ravs? | Gmod TTT	329BUNbvbVo	not_tracked
No dingus? | Gmod TTT	_Bgupg2ga7Y	not_tracked
Is there anything the Dingus Hunters won't do!? | Gmod TTT	akn7Xny5wwk	no
This PARASITE can raise the DEAD!! | Gmod TTT	YMTPqW1koFs	no
Osie's Insane Life Stories | Gmod TTT XL	vtpNzMa8dgo	no
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

