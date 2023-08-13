--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
    detective text,
    win boolean
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
Nilesy
Gee
Briony
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role, detective, win) FROM stdin;
innocent	\N	t
traitor	\N	t
jester	\N	t
impersonator	\N	t
informant	\N	t
clown	\N	t
hypnotist	\N	t
veteran	\N	t
beggar	\N	t
zombie	\N	t
turncoat	\N	t
mad scientist	\N	t
summoner	\N	t
parasite	\N	t
deputy	\N	t
glitch	\N	t
paramedic	\N	t
elf	\N	t
detective	d	t
paladin	d	t
medium	d	t
tracker	d	t
santa	d	t
communist	\N	t
cupid	\N	t
taxidermist	\N	t
boxer	\N	t
drunk	\N	f
loot goblin	\N	f
swapper	\N	f
marshal	d	t
randoman	d	t
shadow	\N	f
clowntective	\N	t
queen bee		t
bee		t
mud scientist		f
\.


--
-- Data for Name: round; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.round (id, date, winning_team, randomat, video, vid_start, vid_end, jester_killer) FROM stdin;
202211010	2022-11-01	innocents	none	Q5ErlVIH31Q	12	215	\N
202211011	2022-11-01	traitors	Wasted	Q5ErlVIH31Q	237	575	\N
202211012	2022-11-01	traitors	RISE FROM YOUR BEE	Q5ErlVIH31Q	609	853	\N
202211013	2022-11-01	innocents	The innocent the traitors and the ugly	Q5ErlVIH31Q	879	958	\N
202211014	2022-11-01	innocents	The innocent the traitors and the ugly	Q5ErlVIH31Q	994	1087	\N
202211015	2022-11-01	innocents	The innocent the traitors and the ugly	Q5ErlVIH31Q	1104	1242	\N
202210250	2022-10-25	traitors	none	geRFB7ihD3M	13	96	\N
202210251	2022-10-25	innocents	NOT THE BEES!	geRFB7ihD3M	131	164	\N
202210252	2022-10-25	traitors	You just triggered my trap card!	geRFB7ihD3M	173	565	\N
202210253	2022-10-25	traitors	none	geRFB7ihD3M	611	848	\N
202210254	2022-10-25	traitors	Gaseous Snake	geRFB7ihD3M	866	1100	\N
202210290	2022-10-29	traitors	none	fTM_5NZFhRY	16	155	\N
202210291	2022-10-29	traitors	none	fTM_5NZFhRY	184	344	\N
202210294	2022-10-29	zombies	Random Deathmatch	fTM_5NZFhRY	711	907	\N
202211051	2022-11-05	innocents	O Ruber Tree	eIkEFaar-Qc	224	269	\N
202211052	2022-11-05	zombies	none	eIkEFaar-Qc	304	442	\N
202211055	2022-11-05	innocents	Gun Game	eIkEFaar-Qc	706	961	\N
202211080	2022-11-08	innocents	Super Boing	H2dmsjSF0Wo	17	113	\N
202211081	2022-11-08	innocents	We learned how to heal	H2dmsjSF0Wo	149	348	\N
202211082	2022-11-08	innocents	Outcome? Prop go boom	H2dmsjSF0Wo	356	479	\N
202211083	2022-11-08	clown	I love democracy I love the republic	H2dmsjSF0Wo	495	594	\N
202211084	2022-11-08	innocents	Delayed Reaction	H2dmsjSF0Wo	616	718	\N
202211085	2022-11-08	traitors	Unbelievable Guilt	H2dmsjSF0Wo	751	852	\N
202211086	2022-11-08	innocents	Soulmates	H2dmsjSF0Wo	871	1029	\N
202211120	2022-11-12	traitors	none	tXmLUmbUJag	66	282	\N
202211121	2022-11-12	traitors	none	tXmLUmbUJag	298	466	\N
202211122	2022-11-12	traitors	none	tXmLUmbUJag	498	630	\N
202211123	2022-11-12	traitors	none	tXmLUmbUJag	666	864	\N
202211150	2022-11-15	traitors	none	u8MzP3B0bMw	7	256	\N
202211152	2022-11-15	innocents	Earthquake	u8MzP3B0bMw	555	725	\N
202211153	2022-11-15	traitors	Paranormal Activity	u8MzP3B0bMw	743	896	\N
202211154	2022-11-15	traitors	Oof	u8MzP3B0bMw	931	1114	\N
202211190	2022-11-19	innocents	Suicide Squad	JSq1OPfhJ-Y	98	158	\N
202211191	2022-11-19	innocents	Bad trip	JSq1OPfhJ-Y	189	429	\N
202211192	2022-11-19	traitors	The detective is acting suspicious	JSq1OPfhJ-Y	464	565	\N
202211193	2022-11-19	innocents	No one can hide from my sight	JSq1OPfhJ-Y	603	783	\N
202211194	2022-11-19	traitors	not shown	JSq1OPfhJ-Y	811	884	\N
202211195	2022-11-19	traitors	Unbelievable Guilt	JSq1OPfhJ-Y	916	993	\N
202211220	2022-11-22	traitors	Second Chance	Gkak7LLJOqc	77	239	\N
202211221	2022-11-22	innocents	A random person will explode	Gkak7LLJOqc	269	330	\N
202211222	2022-11-22	innocents	Trickle-Down economics	Gkak7LLJOqc	354	638	\N
202211223	2022-11-22	innocents	Opposite day	Gkak7LLJOqc	660	765	\N
202211224	2022-11-22	innocents	Second chance	Gkak7LLJOqc	799	982	\N
202211225	2022-11-22	innocents	not shown	Gkak7LLJOqc	1014	1091	\N
202211251	2022-11-25	traitors	none	otqA9aYtejA	145	311	\N
202211252	2022-11-25	zombies	none	otqA9aYtejA	335	483	\N
202211254	2022-11-25	traitors	none	otqA9aYtejA	642	775	\N
202211255	2022-11-25	innocents	none	otqA9aYtejA	799	930	\N
202211257	2022-11-25	innocents	Who's Who	otqA9aYtejA	1046	1197	\N
202212010	2022-12-01	traitors	none	PstAilWgMu4	12	242	\N
202212011	2022-12-01	innocents	none	PstAilWgMu4	277	369	\N
202212012	2022-12-01	innocents	Welcome back to TTT	PstAilWgMu4	398	568	\N
202212013	2022-12-01	innocents	none	PstAilWgMu4	591	719	\N
202212014	2022-12-01	traitors	none	PstAilWgMu4	752	936	\N
202212030	2022-12-03	traitors	none	WFD4kmH_zpI	111	442	\N
202212031	2022-12-03	traitors	none	WFD4kmH_zpI	474	725	\N
202212032	2022-12-03	innocents	none	WFD4kmH_zpI	755	891	\N
202212033	2022-12-03	innocents	none	WFD4kmH_zpI	925	1253	\N
202212060	2022-12-06	innocents	Welcome back to TTT!	463eWBId7jw	13	497	\N
202212061	2022-12-06	zombies	The Randochat	463eWBId7jw	847	1006	\N
202212062	2022-12-06	innocents	Dead Weather	463eWBId7jw	1039	1344	\N
202212063	2022-12-06	innocents	OMG WHATS MY HEALTH	463eWBId7jw	1351	1680	\N
202212064	2022-12-06	traitors	AMOGUS	463eWBId7jw	1700	1777	\N
202212065	2022-12-06	innocents	Dnt do it	463eWBId7jw	1812	1895	\N
202212100	2022-12-10	innocents	Deathly Chaos	HBfgvCLx808	8	128	\N
202212101	2022-12-10	traitors	Dead Men Tell ALL Tales	HBfgvCLx808	162	327	\N
202212102	2022-12-10	innocents	I love democracy, I love the republic.	HBfgvCLx808	335	441	\N
202212103	2022-12-10	innocents	The bar has been raised!	HBfgvCLx808	470	601	\N
202212104	2022-12-10	innocents	Ghostly Revenge	HBfgvCLx808	628	690	\N
202212105	2022-12-10	innocents	Ghostly Revenge	HBfgvCLx808	706	793	\N
202212106	2022-12-10	traitors	none	HBfgvCLx808	810	908	\N
202212170	2022-12-17	traitors	droping this	HDfGua9hZzI	18	237	\N
202212171	2022-12-17	innocents	droping this	HDfGua9hZzI	268	605	\N
202210292	2022-10-29	jester	none	fTM_5NZFhRY	377	500	Rythian
202210293	2022-10-29	jester	none	fTM_5NZFhRY	539	674	Pedguin
202211053	2022-11-05	jester	The Cake is a Lie	eIkEFaar-Qc	474	509	Daltos
202211054	2022-11-05	jester	Rock Paper Scissors	eIkEFaar-Qc	543	671	Pedguin
202211151	2022-11-15	jester	none	u8MzP3B0bMw	280	522	Ravs
202211250	2022-11-25	jester	Deflation	otqA9aYtejA	38	113	Zylus
202211253	2022-11-25	jester	none	otqA9aYtejA	551	604	Duncan
202210220	2022-10-22	innocents	none	VRLFaq9XcMc	36	181	\N
202212131	2022-12-13	innocents	droping this	gIwbQJJlCxw	45	331	\N
202212130	2022-12-13	jester	droping this	gIwbQJJlCxw	17	38	Rythian
202210221	2022-10-22	traitors	Its Breeh!	VRLFaq9XcMc	214	330	\N
202210222	2022-10-22	innocents	Événement Aléatoire	VRLFaq9XcMc	364	469	\N
202210223	2022-10-22	innocents	Everyone has their favourites	VRLFaq9XcMc	509	678	\N
202210224	2022-10-22	innocents	You just triggered my trap card!	VRLFaq9XcMc	711	942	\N
202212172	2022-12-17	traitors	droping this	HDfGua9hZzI	635	713	\N
202212173	2022-12-17	elves	droping this	HDfGua9hZzI	738	895	\N
202212174	2022-12-17	innocents	droping this	HDfGua9hZzI	920	1187	\N
202212200	2022-12-20	zombies	\N	0w1LHuToCXI	16	197	\N
202212201	2022-12-20	innocents	\N	0w1LHuToCXI	231	435	\N
202212202	2022-12-20	innocents	\N	0w1LHuToCXI	471	708	\N
202212203	2022-12-20	zombies	\N	0w1LHuToCXI	743	892	\N
202212241	2022-12-24	elves	\N	JqqN9U4D9CI	185	349	\N
202212242	2022-12-24	innocents	\N	JqqN9U4D9CI	384	521	\N
202212243	2022-12-24	traitors	\N	JqqN9U4D9CI	553	672	\N
202212244	2022-12-24	elves	\N	JqqN9U4D9CI	706	893	\N
202212245	2022-12-24	innocents	\N	JqqN9U4D9CI	926	1065	\N
202212246	2022-12-24	traitors	\N	JqqN9U4D9CI	1100	1148	\N
202212270	2022-12-27	zombies	\N	m40z1K1TIK4	8	156	\N
202212271	2022-12-27	innocents	\N	m40z1K1TIK4	190	342	\N
202212272	2022-12-27	innocents	\N	m40z1K1TIK4	375	433	\N
202212273	2022-12-27	innocents	\N	m40z1K1TIK4	468	604	\N
202212274	2022-12-27	traitors	\N	m40z1K1TIK4	638	770	\N
202212275	2022-12-27	innocents	\N	m40z1K1TIK4	806	1023	\N
202212311	2022-12-31	innocents	\N	lQ4RQPuvHr0	115	188	\N
202212312	2022-12-31	innocents	\N	lQ4RQPuvHr0	220	405	\N
202212313	2022-12-31	innocents	\N	lQ4RQPuvHr0	435	555	\N
202212314	2022-12-31	traitors	\N	lQ4RQPuvHr0	590	814	\N
202301030	2023-01-03	innocents	\N	l1I-S3xaiIY	10	126	\N
202301031	2023-01-03	clown	\N	l1I-S3xaiIY	161	440	\N
202301032	2023-01-03	traitors	\N	l1I-S3xaiIY	473	592	\N
202301033	2023-01-03	traitors	\N	l1I-S3xaiIY	626	782	\N
202301034	2023-01-03	traitors	\N	l1I-S3xaiIY	816	987	\N
202301070	2023-01-07	innocents	\N	GBrckzwMvTQ	28	230	\N
202301071	2023-01-07	traitors	\N	GBrckzwMvTQ	263	422	\N
202301072	2023-01-07	zombies	\N	GBrckzwMvTQ	457	593	\N
202301075	2023-01-07	innocents	\N	GBrckzwMvTQ	848	1022	\N
202301035	2023-01-03	innocents	\N	l1I-S3xaiIY	1017	1222	\N
202301100	2023-01-10	traitors	\N	YAf7W6AcqNs	14	147	\N
202301101	2023-01-10	innocents	\N	YAf7W6AcqNs	183	312	\N
202301102	2023-01-10	traitors	\N	YAf7W6AcqNs	344	463	\N
202301103	2023-01-10	traitors	\N	YAf7W6AcqNs	484	561	\N
202301104	2023-01-10	traitors	\N	YAf7W6AcqNs	585	796	\N
202301105	2023-01-10	zombies	\N	YAf7W6AcqNs	821	1029	\N
202301140	2023-01-14	traitors	\N	62m9fsf4iDM	14	50	\N
202301141	2023-01-14	traitors	\N	62m9fsf4iDM	85	202	\N
202301142	2023-01-14	traitors	\N	62m9fsf4iDM	236	547	\N
202301143	2023-01-14	clown	\N	62m9fsf4iDM	575	911	\N
202301170	2023-01-17	clown	\N	qJQsEevyU6U	9	213	\N
202301172	2023-01-17	innocents	\N	qJQsEevyU6U	302	414	\N
202301173	2023-01-17	clown	\N	qJQsEevyU6U	438	663	\N
202301174	2023-01-17	zombies	\N	qJQsEevyU6U	692	974	\N
202301210	2023-01-21	traitors	\N	v1pj4S1cxKw	8	194	\N
202301211	2023-01-21	innocents	\N	v1pj4S1cxKw	225	444	\N
202301212	2023-01-21	clown	\N	v1pj4S1cxKw	476	625	\N
202301213	2023-01-21	innocents	\N	v1pj4S1cxKw	643	767	\N
202301214	2023-01-21	zombies	\N	v1pj4S1cxKw	801	914	\N
202301215	2023-01-21	innocents	\N	v1pj4S1cxKw	925	1075	\N
202301240	2023-01-24	traitors	\N	329BUNbvbVo	52	318	\N
202301241	2023-01-24	innocents	\N	329BUNbvbVo	347	444	\N
202301242	2023-01-24	innocents	\N	329BUNbvbVo	478	595	\N
202301243	2023-01-24	innocents	\N	329BUNbvbVo	631	705	\N
202301244	2023-01-24	innocents	\N	329BUNbvbVo	715	1022	\N
202301280	2023-01-28	innocents	\N	_Bgupg2ga7Y	13	211	\N
202301281	2023-01-28	innocents	\N	_Bgupg2ga7Y	246	482	\N
202301282	2023-01-28	innocents	\N	_Bgupg2ga7Y	517	890	\N
202301283	2023-01-28	traitors	\N	_Bgupg2ga7Y	927	1041	\N
202301284	2023-01-28	innocents	\N	_Bgupg2ga7Y	1069	1313	\N
202301310	2023-01-31	innocents	\N	akn7Xny5wwk	9	368	\N
202301311	2023-01-31	traitors	\N	akn7Xny5wwk	382	602	\N
202301312	2023-01-31	traitors	\N	akn7Xny5wwk	632	971	\N
202302040	2023-02-04	innocents	\N	YMTPqW1koFs	13	209	\N
202302041	2023-02-04	innocents	\N	YMTPqW1koFs	242	383	\N
202302042	2023-02-04	innocents	\N	YMTPqW1koFs	414	617	\N
202302043	2023-02-04	innocents	\N	YMTPqW1koFs	650	855	\N
202302044	2023-02-04	zombies	\N	YMTPqW1koFs	884	1176	\N
202302045	2023-02-04	clown	\N	YMTPqW1koFs	884	1176	\N
202302070	2023-02-07	innocents	\N	vtpNzMa8dgo	145	349	\N
202302071	2023-02-07	innocents	\N	vtpNzMa8dgo	385	800	\N
202302072	2023-02-07	traitors	\N	vtpNzMa8dgo	834	1128	\N
202302073	2023-02-07	traitors	\N	vtpNzMa8dgo	1162	1374	\N
202302074	2023-02-07	traitors	\N	vtpNzMa8dgo	1401	1595	\N
202302075	2023-02-07	traitors	\N	vtpNzMa8dgo	1628	1857	\N
202302110	2023-02-11	innocents	\N	7luvwuhZs68	34	457	\N
202302111	2023-02-11	innocents	\N	7luvwuhZs68	490	769	\N
202302112	2023-02-11	innocents	\N	7luvwuhZs68	804	1107	\N
202302113	2023-02-11	traitors	\N	7luvwuhZs68	1131	1203	\N
202302114	2023-02-11	innocents	\N	7luvwuhZs68	1235	1324	\N
202302140	2023-02-14	traitors	\N	yvpvrg8UUEo	13	239	\N
202302141	2023-02-14	clown	\N	yvpvrg8UUEo	274	643	\N
202302142	2023-02-14	traitors	\N	yvpvrg8UUEo	677	838	\N
202302143	2023-02-14	traitors	\N	yvpvrg8UUEo	863	1147	\N
202302144	2023-02-14	zombies	\N	yvpvrg8UUEo	1170	1501	\N
202302180	2023-02-18	innocents	\N	NHVu3w_xEds	57	216	\N
202302181	2023-02-18	traitors	\N	NHVu3w_xEds	249	707	\N
202302182	2023-02-18	traitors	\N	NHVu3w_xEds	738	981	\N
202302210	2023-02-21	zombies	\N	qqLaBaXt250	9	301	\N
202302211	2023-02-21	traitors	\N	qqLaBaXt250	334	445	\N
202302212	2023-02-21	innocents	\N	qqLaBaXt250	478	685	\N
202302213	2023-02-21	traitors	\N	qqLaBaXt250	716	956	\N
202302250	2023-02-25	innocents	\N	JTF74TBWpfE	26	109	\N
202302251	2023-02-25	zombies	\N	JTF74TBWpfE	142	231	\N
202302252	2023-02-25	traitors	\N	JTF74TBWpfE	261	330	\N
202302254	2023-02-25	innocents	\N	JTF74TBWpfE	479	1033	\N
202302280	2023-02-28	traitors	\N	d-Y4w6OtDUY	7	306	\N
202302281	2023-02-28	traitors	\N	d-Y4w6OtDUY	335	550	\N
202302282	2023-02-28	clown	\N	d-Y4w6OtDUY	587	805	\N
202302283	2023-02-28	innocents	\N	d-Y4w6OtDUY	835	978	\N
202303040	2023-03-04	innocents	\N	UYdRM3O-iHk	64	404	\N
202303041	2023-03-04	innocents	\N	UYdRM3O-iHk	439	654	\N
202303042	2023-03-04	innocents	\N	UYdRM3O-iHk	689	848	\N
202303043	2023-03-04	innocents	\N	UYdRM3O-iHk	882	1113	\N
202303070	2023-03-07	innocents	\N	psGnF7Co8u4	13	81	\N
202303071	2023-03-07	traitors	\N	psGnF7Co8u4	115	367	\N
202303072	2023-03-07	innocents	\N	psGnF7Co8u4	393	625	\N
202212240	2022-12-24	jester	\N	JqqN9U4D9CI	14	151	Ben
202212310	2022-12-31	jester	\N	lQ4RQPuvHr0	10	84	Rythian
202301073	2023-01-07	jester	\N	GBrckzwMvTQ	624	683	Rythian
202301313	2023-01-31	jester	\N	akn7Xny5wwk	1014	1059	Rythian
202301074	2023-01-07	jester	\N	GBrckzwMvTQ	718	814	Lewis
202302253	2023-02-25	jester	\N	JTF74TBWpfE	362	444	Lewis
202303073	2023-03-07	traitors	\N	psGnF7Co8u4	654	766	\N
202303074	2023-03-07	clown	\N	psGnF7Co8u4	794	1042	\N
202303110	2023-03-11	innocents	\N	nGTbrrYQN5o	16	180	\N
202303112	2023-03-11	traitors	\N	nGTbrrYQN5o	397	444	\N
202303113	2023-03-11	clown	\N	nGTbrrYQN5o	476	641	\N
202303114	2023-03-11	zombies	\N	nGTbrrYQN5o	648	896	\N
202303115	2023-03-11	traitors	\N	nGTbrrYQN5o	921	1187	\N
202303140	2023-03-14	traitors	\N	zYTLFs8JWK4	13	186	\N
202303141	2023-03-14	traitors	\N	zYTLFs8JWK4	217	434	\N
202303142	2023-03-14	traitors	\N	zYTLFs8JWK4	465	621	\N
202303143	2023-03-14	traitors	\N	zYTLFs8JWK4	649	858	\N
202303144	2023-03-14	innocents	\N	zYTLFs8JWK4	887	1080	\N
202303180	2023-03-18	innocents	\N	5BQPEwqqT18	20	154	\N
202303181	2023-03-18	traitors	\N	5BQPEwqqT18	185	292	\N
202303183	2023-03-18	innocents	\N	5BQPEwqqT18	437	607	\N
202303185	2023-03-18	innocents	\N	5BQPEwqqT18	812	990	\N
202303186	2023-03-18	innocents	\N	5BQPEwqqT18	1025	1114	\N
202303210	2023-03-21	zombies	\N	GGaPX6mv_xg	14	283	\N
202303212	2023-03-21	innocent	\N	GGaPX6mv_xg	427	757	\N
202303213	2023-03-21	traitors	\N	GGaPX6mv_xg	780	988	\N
202303214	2023-03-21	traitors	\N	GGaPX6mv_xg	1009	1301	\N
202303250	2023-03-25	traitors	\N	DsZz5oqFBq0	17	214	\N
202303251	2023-03-25	innocents	\N	DsZz5oqFBq0	244	457	\N
202303252	2023-03-25	traitors	\N	DsZz5oqFBq0	484	642	\N
202303254	2023-03-25	traitors	\N	DsZz5oqFBq0	761	1033	\N
202303280	2023-03-28	traitors	\N	-Oj4i3EswxA	11	209	\N
202303281	2023-03-28	traitors	\N	-Oj4i3EswxA	238	485	\N
202303282	2023-03-28	traitors	\N	-Oj4i3EswxA	507	867	\N
202303283	2023-03-28	jester	\N	-Oj4i3EswxA	507	867	Rythian
202211050	2022-11-05	jester	I dont think you realise the gravity of the situation	eIkEFaar-Qc	50	180	Pedguin
202210295	2022-10-29	jester	Communism! Time to learn how to share	fTM_5NZFhRY	922	1079	Pedguin
202211256	2022-11-25	jester	They have a cave troll	otqA9aYtejA	975	1013	Zoey
202212132	2022-12-13	traitors	droping this	gIwbQJJlCxw	356	422	\N
202212133	2022-12-13	innocents	droping this	gIwbQJJlCxw	437	496	\N
202212134	2022-12-13	innocents	droping this	gIwbQJJlCxw	528	644	\N
202212135	2022-12-13	innocents	droping this	gIwbQJJlCxw	677	755	\N
202212136	2022-12-13	jester	droping this	gIwbQJJlCxw	785	916	Zoey
202212204	2022-12-20	jester	\N	0w1LHuToCXI	927	1045	Breeh
202301171	2023-01-17	jester	\N	qJQsEevyU6U	245	268	Osie
202303111	2023-03-11	jester	\N	nGTbrrYQN5o	208	364	Zylus
202303145	2023-03-14	jester	\N	zYTLFs8JWK4	1112	1192	Duncan
202303182	2023-03-18	jester	\N	5BQPEwqqT18	314	406	Ravs
202303184	2023-03-18	jester	\N	5BQPEwqqT18	641	777	Lolip
202303211	2023-03-21	jester	\N	GGaPX6mv_xg	308	390	Ravs
202303253	2023-03-25	jester	\N	DsZz5oqFBq0	670	729	Ravs
202304010	2023-04-01	innocents	\N	FH_Pt-txUBA	21	183	
202304011	2023-04-01	lovers	\N	FH_Pt-txUBA	218	320	
202304012	2023-04-01	jester	\N	FH_Pt-txUBA	355	388	Lewis
202304013	2023-04-01	innocents	\N	FH_Pt-txUBA	421	605	
202304014	2023-04-01	innocents	\N	FH_Pt-txUBA	637	714	
202304015	2023-04-01	traitors	\N	FH_Pt-txUBA	747	957	
202304040	2023-04-04	jester	\N	T2L_7-fot2A	14	136	Duncan
202304041	2023-04-04	innocents	\N	T2L_7-fot2A	175	349	
202304042	2023-04-04	innocents	\N	T2L_7-fot2A	175	349	
202304043	2023-04-04	traitors	\N	T2L_7-fot2A	492	634	
202304044	2023-04-04	innocents	\N	T2L_7-fot2A	492	634	
202304045	2023-04-04	jester	\N	T2L_7-fot2A	492	634	Zylus
202304080	2023-04-08	traitors	\N	iwjgWykqfcI	18	118	
202304081	2023-04-08	innocents	\N	iwjgWykqfcI	151	411	
202304082	2023-04-08	zombies	\N	iwjgWykqfcI	445	650	
202304083	2023-04-08	jester	\N	iwjgWykqfcI	680	721	Zylus
202304084	2023-04-08	innocents	\N	iwjgWykqfcI	756	764	
202304110	2023-04-11	innocents	\N	ZlD__4SY3tc	73	288	
202304111	2023-04-11	clown	\N	ZlD__4SY3tc	318	607	
202304112	2023-04-11	jester	\N	ZlD__4SY3tc	640	761	Lewis
202304113	2023-04-11	innocents	\N	ZlD__4SY3tc	800	931	
202304150	2023-04-15	innocents	\N	5pDiQ3UMRXY	88	151	
202304151	2023-04-15	innocents	\N	5pDiQ3UMRXY	181	366	
202304152	2023-04-15	innocents	\N	5pDiQ3UMRXY	400	602	
202304153	2023-04-15	traitors	\N	5pDiQ3UMRXY	634	799	
202304154	2023-04-15	traitors	\N	5pDiQ3UMRXY	833	936	
202304180	2023-04-18	traitors	\N	vpO0wpjS2yI	14	380	
202304181	2023-04-18	traitors	\N	vpO0wpjS2yI	413	655	
202304182	2023-04-18	innocents	\N	vpO0wpjS2yI	690	815	
202304183	2023-04-18	innocents	\N	vpO0wpjS2yI	850	992	
202304184	2023-04-18	traitors	\N	vpO0wpjS2yI	1023	1275	
202304185	2023-04-18	traitors	\N	vpO0wpjS2yI	1286	1477	
202304220	2023-04-22	innocents	\N	n2o6HSz9YrE	15	115	
202304221	2023-04-22	traitors	\N	n2o6HSz9YrE	146	261	
202304222	2023-04-22	innocents	\N	n2o6HSz9YrE	291	492	
202304223	2023-04-22	zombies	\N	n2o6HSz9YrE	520	657	
202304224	2023-04-22	innocents	\N	n2o6HSz9YrE	690	761	
202304225	2023-04-22	traitors	\N	n2o6HSz9YrE	795	920	
202304226	2023-04-22	traitors	\N	n2o6HSz9YrE	947	1173	
202304227	2023-04-22	innocents	\N	n2o6HSz9YrE	1207	1329	
202304250	2023-04-25	innocents	\N	u5w4OBSySvQ	11	92	
202304251	2023-04-25	traitors	\N	u5w4OBSySvQ	123	221	
202304252	2023-04-25	innocents	\N	u5w4OBSySvQ	247	340	
202304253	2023-04-25	innocents	\N	u5w4OBSySvQ	361	431	
202304254	2023-04-25	innocents	\N	u5w4OBSySvQ	462	542	
202304255	2023-04-25	jester	\N	u5w4OBSySvQ	572	671	Ben
202304256	2023-04-25	innocents	\N	u5w4OBSySvQ	706	753	
202304257	2023-04-25	traitors	\N	u5w4OBSySvQ	787	891	
202304258	2023-04-25	jester	\N	u5w4OBSySvQ	919	1011	Boba
202304290	2023-04-29	traitors	\N	9d86zysMK6k	96	362	
202304291	2023-04-29	traitors	\N	9d86zysMK6k	396	885	
202304292	2023-04-29	traitors	\N	9d86zysMK6k	913	1023	
202305020	2023-05-02	innocents	\N	ebVSH3L5hjM	7	145	
202305021	2023-05-02	traitors	\N	ebVSH3L5hjM	179	300	
202305022	2023-05-02	zombies	\N	ebVSH3L5hjM	331	538	
202305023	2023-05-02	innocents	\N	ebVSH3L5hjM	573	811	
202305024	2023-05-02	traitors	\N	ebVSH3L5hjM	842	1192	
202305060	2023-05-06	innocents	\N	1RRbgC7wRtU	105	228	
202305061	2023-05-06	jester	\N	1RRbgC7wRtU	242	367	Zylus
202305062	2023-05-06	innocents	\N	1RRbgC7wRtU	391	551	
202305063	2023-05-06	traitors	\N	1RRbgC7wRtU	581	829	
202305064	2023-05-06	innocents	\N	1RRbgC7wRtU	857	944	
202305065	2023-05-06	innocents	\N	1RRbgC7wRtU	977	1291	
202305090	2023-05-09	jester	\N	Xb1avFSyJa0	9	63	Ravs
202305091	2023-05-09	innocents	\N	Xb1avFSyJa0	93	206	
202305092	2023-05-09	zombies	\N	Xb1avFSyJa0	241	378	
202305093	2023-05-09	innocents	\N	Xb1avFSyJa0	400	575	
202305094	2023-05-09	traitors	\N	Xb1avFSyJa0	610	727	
202305095	2023-05-09	clown	\N	Xb1avFSyJa0	751	980	
202305130	2023-05-13	innocents	\N	hwMR1y4gbK4	17	174	
202305131	2023-05-13	innocents	\N	hwMR1y4gbK4	208	301	
202305132	2023-05-13	traitors	\N	hwMR1y4gbK4	336	603	
202305133	2023-05-13	innocents	\N	hwMR1y4gbK4	633	707	
202305134	2023-05-13	innocents	\N	hwMR1y4gbK4	742	977	
202305160	2023-05-16	innocents	\N	2i_-L6Dny3o	10	233	
202305161	2023-05-16	innocents	\N	2i_-L6Dny3o	265	715	
202305162	2023-05-16	innocents	\N	2i_-L6Dny3o	743	862	
202305163	2023-05-16	bees	\N	2i_-L6Dny3o	888	1044	
202305200	2023-05-20	innocents	\N	xQP3hdxOmCM	92	249	
202305201	2023-05-20	innocents	\N	xQP3hdxOmCM	280	364	
202305202	2023-05-20	traitors	\N	xQP3hdxOmCM	395	490	
202305203	2023-05-20	traitors	\N	xQP3hdxOmCM	521	702	
202305204	2023-05-20	traitors	\N	xQP3hdxOmCM	732	854	
202305205	2023-05-20	innocents	\N	xQP3hdxOmCM	888	968	
202210226	2022-10-22	innocents	Bullets my only weakness!	VRLFaq9XcMc	1250	1425	\N
202210225	2022-10-22	jester	Unbelievable Guilt	VRLFaq9XcMc	976	1216	Ravs
202210180	2022-10-18	innocents	\N	X_jNsbBS278	5	106	
202210181	2022-10-18	innocents	\N	X_jNsbBS278	139	357	
202210182	2022-10-18	traitors	\N	X_jNsbBS278	387	517	
202210183	2022-10-18	innocents	\N	X_jNsbBS278	553	670	
202210184	2022-10-18	bees	\N	X_jNsbBS278	699	966	
202210150	2022-10-15	jester	\N	kKM7SJQZo0Y	82	151	Ravs
202210151	2022-10-15	traitors	\N	kKM7SJQZo0Y	176	353	
202210152	2022-10-15	innocents	\N	kKM7SJQZo0Y	366	503	
202210153	2022-10-15	innocents	\N	kKM7SJQZo0Y	520	597	
202210154	2022-10-15	innocents	\N	kKM7SJQZo0Y	631	711	
202210155	2022-10-15	jester	\N	kKM7SJQZo0Y	733	790	Zylus
202210156	2022-10-15	traitors	\N	kKM7SJQZo0Y	825	1188	
202210113	2022-10-11	innocents	\N	hEnLP19VM64	862	1213	
202306030	2023-06-03	jester	\N	VCHT4u5kMvc	109	263	Rythian
202306031	2023-06-03	zombies	\N	VCHT4u5kMvc	296	430	
202306032	2023-06-03	innocents	\N	VCHT4u5kMvc	458	787	
202306033	2023-06-03	innocents	\N	VCHT4u5kMvc	818	1011	
202210080	2022-10-08	innocents	\N	EvESsiqrxs4	10	440	
202210081	2022-10-08	innocents	\N	EvESsiqrxs4	465	539	
202210082	2022-10-08	innocents	\N	EvESsiqrxs4	569	683	
202210083	2022-10-08	traitors	\N	EvESsiqrxs4	713	921	
202210084	2022-10-08	traitors	\N	EvESsiqrxs4	949	1086	
202210040	2022-10-04	traitors	\N	BCfa3ckSRws	39	194	
202210041	2022-10-04	innocents	\N	BCfa3ckSRws	229	505	
202305230	2023-05-23	jester	\N	Jp-BuV0I1Uc	28	176	Duncan
202210042	2022-10-04	innocents	\N	BCfa3ckSRws	538	720	
202305231	2023-05-23	innocents	\N	Jp-BuV0I1Uc	209	340	
202210043	2022-10-04	innocents	\N	BCfa3ckSRws	752	1030	
202305232	2023-05-23	innocents	\N	Jp-BuV0I1Uc	379	500	
202210010	2022-10-01	traitors	\N	JaqxhsfR4T4	10	318	
202305233	2023-05-23	traitors	\N	Jp-BuV0I1Uc	535	687	
202210011	2022-10-01	innocents	\N	JaqxhsfR4T4	328	474	
202305234	2023-05-23	innocents	\N	Jp-BuV0I1Uc	709	827	
202210012	2022-10-01	traitors	\N	JaqxhsfR4T4	503	659	
202305235	2023-05-23	innocents	\N	Jp-BuV0I1Uc	859	927	
202305270	2023-05-27	innocents	\N	zehDuZ-h1m8	39	207	
202305271	2023-05-27	traitors	\N	zehDuZ-h1m8	238	345	
202305272	2023-05-27	traitors	\N	zehDuZ-h1m8	376	490	
202305273	2023-05-27	traitors	\N	zehDuZ-h1m8	517	586	
202305274	2023-05-27	traitors	\N	zehDuZ-h1m8	621	661	
202305275	2023-05-27	innocents	\N	zehDuZ-h1m8	682	893	
202305276	2023-05-27	innocents	\N	zehDuZ-h1m8	928	1111	
202305300	2023-05-30	traitors	\N	1hvkhCMtuIw	10	147	
202305301	2023-05-30	innocents	\N	1hvkhCMtuIw	181	363	
202305302	2023-05-30	traitors	\N	1hvkhCMtuIw	397	658	
202305303	2023-05-30	innocents	\N	1hvkhCMtuIw	689	895	
202305304	2023-05-30	traitors	\N	1hvkhCMtuIw	930	1117	
202210110	2022-10-11	traitors	\N	hEnLP19VM64	38	346	
202210111	2022-10-11	innocents	\N	hEnLP19VM64	364	604	
202210112	2022-10-11	jester	\N	hEnLP19VM64	635	827	Kirsty
202210013	2022-10-01	traitors	\N	JaqxhsfR4T4	686	850	
202210014	2022-10-01	traitors	\N	JaqxhsfR4T4	861	909	
202306060	2023-06-06	traitors	\N	3kvyGLpdltw	38	312	
202306061	2023-06-06	innocents	\N	3kvyGLpdltw	340	612	
202306062	2023-06-06	innocents	\N	3kvyGLpdltw	644	898	
202209270	2022-09-27	jester	\N	9LYHs_9-P0M	78	329	Rythian
202209271	2022-09-27	innocents	\N	9LYHs_9-P0M	364	448	
202209272	2022-09-27	innocents	\N	9LYHs_9-P0M	478	748	
202209273	2022-09-27	traitors	\N	9LYHs_9-P0M	770	945	
202209274	2022-09-27	traitors	\N	9LYHs_9-P0M	968	1086	
202209275	2022-09-27	traitors	\N	9LYHs_9-P0M	1101	1206	
202209240	2022-09-24	traitors	\N	WZKkd4gHMEM	93	430	
202209241	2022-09-24	innocents	\N	WZKkd4gHMEM	447	594	
202209242	2022-09-24	traitors	\N	WZKkd4gHMEM	629	879	
202209243	2022-09-24	traitors	\N	WZKkd4gHMEM	914	1013	
202209244	2022-09-24	innocents	\N	WZKkd4gHMEM	1048	1189	
202306100	2023-06-10	traitors	\N	gHoqpGgYNMA	120	384	
202306101	2023-06-10	innocents	\N	gHoqpGgYNMA	417	556	
202306102	2023-06-10	innocents	\N	gHoqpGgYNMA	588	708	
202306103	2023-06-10	zombies	\N	gHoqpGgYNMA	739	910	
202306104	2023-06-10	traitors	\N	gHoqpGgYNMA	938	1118	
202306130	2023-06-13	innocents	\N	4vDh9LHM73k	29	346	
202306131	2023-06-13	traitors	\N	4vDh9LHM73k	376	567	
202306132	2023-06-13	traitors	\N	4vDh9LHM73k	598	787	
202306133	2023-06-13	innocents	\N	4vDh9LHM73k	816	956	
202306170	2023-06-17	innocents	\N	4fkqC1pyQ2w	29	323	
202306171	2023-06-17	innocents	\N	4fkqC1pyQ2w	337	473	
202306172	2023-06-17	traitors	\N	4fkqC1pyQ2w	504	608	
202306173	2023-06-17	zombies	\N	4fkqC1pyQ2w	642	747	
202306174	2023-06-17	traitors	\N	4fkqC1pyQ2w	774	861	
202306175	2023-06-17	innocents	\N	4fkqC1pyQ2w	891	988	
202306176	2023-06-17	traitors	\N	4fkqC1pyQ2w	1021	1173	
202306200	2023-06-20	traitors	\N	jAeGy-VoDmc	21	155	
202306201	2023-06-20	traitors	\N	jAeGy-VoDmc	180	300	
202306202	2023-06-20	innocents	\N	jAeGy-VoDmc	318	474	
202306203	2023-06-20	innocents	\N	jAeGy-VoDmc	504	552	
202306204	2023-06-20	traitors	\N	jAeGy-VoDmc	576	749	
202306205	2023-06-20	innocents	\N	jAeGy-VoDmc	769	870	
202306220	2023-06-22	innocents	\N	jhfFsnAOpb0	21	399	
202306221	2023-06-22	traitors	\N	jhfFsnAOpb0	429	547	
202306222	2023-06-22	innocents	\N	jhfFsnAOpb0	577	878	
202306223	2023-06-22	traitors	\N	jhfFsnAOpb0	889	1011	
202306240	2023-06-24	traitors	\N	qDS3c1Rjc7o	11	208	
202306241	2023-06-24	traitors	\N	qDS3c1Rjc7o	238	438	
202306242	2023-06-24	traitors	\N	qDS3c1Rjc7o	452	678	
202306243	2023-06-24	traitors	\N	qDS3c1Rjc7o	705	850	
202209200	2022-09-20	traitors	\N	eK8Nwp_C-_c	9	110	
202209201	2022-09-20	innocents	\N	eK8Nwp_C-_c	134	230	
202209202	2022-09-20	innocents	\N	eK8Nwp_C-_c	260	483	
202209203	2022-09-20	traitors	\N	eK8Nwp_C-_c	514	842	
202306280	2023-06-28	traitors	\N	zFbMsWMwW6U	34	386	
202306281	2023-06-28	innocents	\N	zFbMsWMwW6U	420	544	
202306282	2023-06-28	traitors	\N	zFbMsWMwW6U	565	622	
202306283	2023-06-28	innocents	\N	zFbMsWMwW6U	639	759	
202306284	2023-06-28	innocents	\N	zFbMsWMwW6U	769	891	
202306290	2023-06-29	traitors	\N	q4pAikC1Fa8	9	161	
202306292	2023-06-29	traitors	\N	q4pAikC1Fa8	335	564	
202306293	2023-06-29	innocents	\N	q4pAikC1Fa8	595	789	
202306291	2023-06-29	jester	\N	q4pAikC1Fa8	194	300	Lolip
202306294	2023-06-29	jester	\N	q4pAikC1Fa8	823	1031	Daltos
202306295	2023-06-29	traitors	\N	q4pAikC1Fa8	1060	1200	
202307010	2023-07-01	traitors	\N	n8flDSFaBUk	12	209	
202307011	2023-07-01	traitors	\N	n8flDSFaBUk	239	383	
202307012	2023-07-01	traitors	\N	n8flDSFaBUk	414	663	
202307013	2023-07-01	innocents	\N	n8flDSFaBUk	692	806	
202307014	2023-07-01	innocents	\N	n8flDSFaBUk	837	971	
202307015	2023-07-01	traitors	\N	n8flDSFaBUk	999	1267	
202307040	2023-07-04	innocents	\N	0ePAy9ON6aM	90	248	
202307041	2023-07-04	innocents	\N	0ePAy9ON6aM	278	359	
202307042	2023-07-04	traitors	\N	0ePAy9ON6aM	391	434	
202307043	2023-07-04	traitors	\N	0ePAy9ON6aM	473	665	
202307044	2023-07-04	traitors	\N	0ePAy9ON6aM	691	825	
202307045	2023-07-04	traitors	\N	0ePAy9ON6aM	852	950	
202307060	2023-07-06	traitors	\N	boSGesFpomU	11	188	
202307061	2023-07-06	zombies	\N	boSGesFpomU	225	385	
202307062	2023-07-06	zombies	\N	boSGesFpomU	414	569	
202307063	2023-07-06	innocents	\N	boSGesFpomU	605	778	
202307064	2023-07-06	traitors	\N	boSGesFpomU	807	958	
202307065	2023-07-06	traitors	\N	boSGesFpomU	991	1260	
202307080	2023-07-08	zombies	\N	iLZ69BAe0HE	10	212	
202307081	2023-07-08	traitors	\N	iLZ69BAe0HE	240	583	
202307082	2023-07-08	innocents	\N	iLZ69BAe0HE	613	842	
202307083	2023-07-08	traitors	\N	iLZ69BAe0HE	878	917	
202307110	2023-07-11	innocents	\N	NN9A8L8expU	31	218	
202307111	2023-07-11	innocents	\N	NN9A8L8expU	244	452	
202307112	2023-07-11	traitors	\N	NN9A8L8expU	482	696	
202307113	2023-07-11	elves	\N	NN9A8L8expU	726	992	
202307130	2023-07-13	innocents	\N	ELKjkoyU21A	20	264	
202307131	2023-07-13	zombies	\N	ELKjkoyU21A	289	423	
202307132	2023-07-13	traitors	\N	ELKjkoyU21A	455	537	
202307133	2023-07-13	zombies	\N	ELKjkoyU21A	567	668	
202307134	2023-07-13	innocents	\N	ELKjkoyU21A	700	899	
202307135	2023-07-13	zombies	\N	ELKjkoyU21A	937	1087	
202307150	2023-07-15	jester	\N	OVe8ddpGgZQ	52	287	Zylus
202307151	2023-07-15	innocents	\N	OVe8ddpGgZQ	322	500	
202307152	2023-07-15	traitors	\N	OVe8ddpGgZQ	539	719	
202307153	2023-07-15	innocents	\N	OVe8ddpGgZQ	744	846	
202307154	2023-07-15	traitors	\N	OVe8ddpGgZQ	864	1242	
202307180	2023-07-18	innocents	\N	XqzsityJF7I	57	93	
202307181	2023-07-18	innocents	\N	XqzsityJF7I	122	340	
202307182	2023-07-18	innocents	\N	XqzsityJF7I	369	540	
202307183	2023-07-18	traitors	\N	XqzsityJF7I	574	680	
202307184	2023-07-18	traitors	\N	XqzsityJF7I	714	915	
202307185	2023-07-18	innocents	\N	XqzsityJF7I	946	1071	
202307200	2023-07-20	traitors	\N	6Oa-lMt4HXM	15	133	
202307201	2023-07-20	innocents	\N	6Oa-lMt4HXM	164	268	
202307202	2023-07-20	innocents	\N	6Oa-lMt4HXM	290	564	
202307203	2023-07-20	innocents	\N	6Oa-lMt4HXM	592	763	
202307204	2023-07-20	traitors	\N	6Oa-lMt4HXM	788	882	
202307205	2023-07-20	traitors	\N	6Oa-lMt4HXM	912	1066	
202307206	2023-07-20	innocents	\N	6Oa-lMt4HXM	1091	1281	
202307220	2023-07-22	traitors	\N	M_VWQt-qtLw	18	79	
202307222	2023-07-22	clown	\N	M_VWQt-qtLw	200	407	
202307221	2023-07-22	innocents	\N	M_VWQt-qtLw	113	168	
202307223	2023-07-22	innocents	\N	M_VWQt-qtLw	441	556	
202307224	2023-07-22	innocents	\N	M_VWQt-qtLw	587	692	
202307226	2023-07-22	traitors	\N	M_VWQt-qtLw	880	973	
202307225	2023-07-22	innocents	\N	M_VWQt-qtLw	718	855	
202307250	2023-07-25	traitors	\N	c5AwkqJimFY	9	209	
202307251	2023-07-25	innocents	\N	c5AwkqJimFY	224	402	
202307252	2023-07-25	clown	\N	c5AwkqJimFY	419	757	
202307253	2023-07-25	innocents	\N	c5AwkqJimFY	779	853	
202307254	2023-07-25	traitors	\N	c5AwkqJimFY	881	1052	
202307270	2023-07-27	clown	\N	q3A3FqDJTr4	11	90	
202307271	2023-07-27	innocents	\N	q3A3FqDJTr4	126	252	
202307272	2023-07-27	traitors	\N	q3A3FqDJTr4	282	569	
202307273	2023-07-27	jester	\N	q3A3FqDJTr4	602	708	Daltos
202307274	2023-07-27	zombies	\N	q3A3FqDJTr4	738	875	
202307275	2023-07-27	innocents	\N	q3A3FqDJTr4	897	1094	
202307290	2023-07-29	innocents	\N	tG7nh3No6e0	8	100	
202307291	2023-07-29	innocents	\N	tG7nh3No6e0	133	306	
202307292	2023-07-29	innocents	\N	tG7nh3No6e0	332	423	
202307293	2023-07-29	innocents	\N	tG7nh3No6e0	441	672	
202307294	2023-07-29	traitors	\N	tG7nh3No6e0	699	808	
202307295	2023-07-29	innocents	\N	tG7nh3No6e0	841	1037	
202308010	2023-08-01	innocents	\N	CSp850uMz98	89	213	
202308011	2023-08-01	traitors	\N	CSp850uMz98	243	463	
202308012	2023-08-01	traitors	\N	CSp850uMz98	477	630	
202308013	2023-08-01	zombies	\N	CSp850uMz98	643	1003	
202308014	2023-08-01	innocents	\N	CSp850uMz98	1017	1285	
202308030	2023-08-03	traitors	\N	HjBz5xKAfv8	82	254	
202308031	2023-08-03	innocents	\N	HjBz5xKAfv8	285	493	
202308032	2023-08-03	innocents	\N	HjBz5xKAfv8	527	799	
202308033	2023-08-03	traitors	\N	HjBz5xKAfv8	831	1004	
202308034	2023-08-03	innocents	\N	HjBz5xKAfv8	1033	1106	
202308035	2023-08-03	innocents	\N	HjBz5xKAfv8	1135	1341	
202308050	2023-08-05	traitors	\N	hPk2VzNw_20	79	223	
202308051	2023-08-05	traitors	\N	hPk2VzNw_20	250	426	
202308052	2023-08-05	innocents	\N	hPk2VzNw_20	457	720	
202308053	2023-08-05	jester	\N	hPk2VzNw_20	753	967	Kirsty
202308080	2023-08-08	traitors	\N	Ge4gwl-E7vg	12	224	
202308081	2023-08-08	innocents	\N	Ge4gwl-E7vg	250	587	
202308082	2023-08-08	traitors	\N	Ge4gwl-E7vg	620	772	
202308083	2023-08-08	jester	\N	Ge4gwl-E7vg	805	838	Rythian
202308084	2023-08-08	bees	\N	Ge4gwl-E7vg	872	1222	
202308120	2023-08-12	innocents	\N	RqABuPTymQ8	14	149	
202308121	2023-08-12	innocents	\N	RqABuPTymQ8	181	381	
202308122	2023-08-12	innocents	\N	RqABuPTymQ8	397	538	
202308123	2023-08-12	traitors	\N	RqABuPTymQ8	573	745	
202308124	2023-08-12	traitors	\N	RqABuPTymQ8	772	956	
202308125	2023-08-12	innocents	\N	RqABuPTymQ8	980	1098	
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
202302110	Lewis	paladin	innocents	no
202302110	Ben	innocent	innocents	yes
202302110	Zylus	traitor	traitors	yes
202302110	Rythian	veteran	innocents	yes
202302110	Duncan	turncoat	innocents	yes
202302110	Kirsty	traitor	traitors	yes
202302110	Osie	innocent	innocents	yes
202302111	Lewis	loot goblin	none	yes
202302111	Ben	glitch	innocents	yes
202302111	Zylus	paladin	innocents	yes
202302111	Rythian	innocent	innocents	yes
202302111	Duncan	innocent	innocents	no
202302111	Kirsty	traitor	traitors	yes
202302111	Osie	parasite	traitors	yes
202302112	Lewis	traitor	traitors	yes
202302112	Ben	innocent	innocents	no
202302112	Zylus	impersonator	traitors	yes
202302112	Rythian	glitch	innocents	no
202302112	Duncan	randoman	innocents	yes
202302112	Kirsty	jester	jester	no
202302112	Osie	innocent	innocents	yes
202302113	Lewis	paladin	innocents	yes
202302113	Ben	summoner	traitors	no
202302113	Zylus	innocent	innocents	yes
202302113	Rythian	veteran	innocents	yes
202302113	Duncan	traitor	traitors	yes
202302113	Kirsty	clown	clown	yes
202302113	Osie	innocent	innocents	yes
202302114	Lewis	mad scientist	zombies	yes
202302114	Ben	traitor	traitors	yes
202302114	Zylus	glitch	innocents	yes
202302114	Rythian	parasite	traitors	yes
202302114	Duncan	innocent	innocents	no
202302114	Kirsty	innocent	innocents	yes
202302114	Osie	medium	innocents	yes
202302140	Lewis	loot goblin	none	no
202302140	Ben	summoner	traitors	no
202302140	Zylus	innocent	innocents	yes
202302140	Rythian	deputy	innocents	yes
202302140	Duncan	paladin	innocents	yes
202302140	Osie	innocent	innocents	yes
202302141	Lewis	paramedic	innocents	yes
202302141	Ben	clown	clown	no
202302141	Zylus	traitor	traitors	yes
202302141	Rythian	innocent	innocents	yes
202302141	Duncan	medium	innocents	yes
202302141	Kirsty	summoner	traitors	yes
202302141	Osie	innocent	innocents	yes
202302142	Lewis	innocent	innocents	yes
202302142	Ben	randoman	innocents	yes
202302142	Zylus	turncoat	innocents	yes
202302142	Rythian	traitor	traitors	yes
202302142	Duncan	innocent	innocents	yes
202302142	Kirsty	informant	traitors	no
202302142	Osie	mad scientist	zombies	yes
202302143	Lewis	medium	innocents	yes
202302143	Ben	traitor	traitors	yes
202302143	Zylus	innocent	innocents	yes
202302143	Rythian	innocent	innocents	yes
202302143	Duncan	informant	traitors	no
202302143	Osie	deputy	innocents	yes
202302144	Lewis	zombie	zombies	no
202302144	Zylus	zombie	zombies	no
202302144	Rythian	zombie	zombies	no
202302144	Duncan	mad scientist	zombies	yes
202302144	Kirsty	loot goblin	none	no
202302180	Lewis	innocent	innocents	yes
202302180	Ben	glitch	innocents	yes
202302180	Zylus	innocent	innocents	yes
202302180	Pedguin	loot goblin	none	yes
202302180	Duncan	traitor	traitors	yes
202302180	Kirsty	turncoat	innocents	no
202302180	Osie	hypnotist	traitors	yes
202302180	Ravs	tracker	innocents	no
202302181	Lewis	swapper	none	no
202302181	Ben	innocent	innocents	yes
202302181	Zylus	traitor	traitors	no
202302181	Pedguin	zombie	zombies	yes
202302181	Duncan	mad scientist	zombies	yes
202302181	Kirsty	deputy	innocents	yes
202302181	Osie	parasite	traitors	yes
202302181	Ravs	innocent	innocents	yes
202302182	Lewis	deputy	innocents	yes
202302182	Ben	mad scientist	zombies	yes
202302182	Zylus	traitor	traitors	no
202302182	Pedguin	randoman	innocents	yes
202302182	Duncan	informant	traitors	no
202302182	Kirsty	innocent	innocents	yes
202302182	Osie	jester	jester	yes
202302182	Ravs	zombie	zombies	yes
202302210	Lewis	mad scientist	zombies	no
202302210	Ben	zombie	zombies	yes
202302210	Zylus	zombie	zombies	yes
202302210	Pedguin	zombie	zombies	yes
202302210	Duncan	loot goblin	none	no
202302210	Kirsty	zombie	zombies	yes
202302210	Osie	innocent	innocents	yes
202302210	Ravs	zombie	zombies	no
202302211	Lewis	innocent	innocents	yes
202302211	Ben	tracker	innocents	yes
202302211	Zylus	glitch	innocents	yes
202302211	Pedguin	informant	traitors	no
202302211	Duncan	innocent	innocents	yes
202302211	Kirsty	traitor	traitors	yes
202302211	Osie	mad scientist	zombies	yes
202302211	Ravs	beggar	traitors	yes
202302212	Lewis	beggar	innocents	no
202302212	Ben	zombie	zombies	yes
202302212	Zylus	zombie	zombies	yes
202302212	Pedguin	mad scientist	zombies	yes
202302212	Duncan	tracker	innocents	yes
202302212	Kirsty	zombie	zombies	yes
202302212	Osie	traitor	traitors	yes
202302212	Ravs	innocent	innocents	yes
202302213	Lewis	innocent	innocents	yes
202302213	Ben	drunk	none	yes
202302213	Zylus	traitor	traitors	no
202302213	Pedguin	paladin	innocents	yes
202302213	Duncan	parasite	traitors	yes
202302213	Kirsty	clown	clown	yes
202302213	Osie	innocent	innocents	yes
202302213	Ravs	glitch	innocents	yes
202302250	Lewis	innocent	innocents	no
202302250	Ben	glitch	innocents	no
202302250	Zylus	mad scientist	zombies	yes
202302250	Pedguin	paladin	innocents	no
202302250	Duncan	innocent	innocents	no
202302250	Kirsty	jester	jester	no
202302250	Osie	traitor	traitors	yes
202302250	Ravs	parasite	traitors	yes
202302251	Lewis	swapper	none	no
202302251	Ben	zombie	zombies	no
202302251	Zylus	zombie	zombies	no
202302143	Kirsty	communist	communists	yes
202302144	Ben	taxidermist	traitors	yes
202302144	Osie	boxer	none	yes
202302251	Pedguin	mad scientist	zombies	no
202302251	Duncan	zombie	zombies	no
202302251	Kirsty	zombie	zombies	no
202302251	Osie	veteran	innocents	yes
202302251	Ravs	zombie	zombies	no
202302252	Lewis	randoman	innocents	yes
202302252	Ben	innocent	innocents	yes
202302252	Zylus	hypnotist	traitors	yes
202302252	Pedguin	traitor	traitors	yes
202302252	Duncan	jester	jester	no
202302252	Kirsty	innocent	innocents	yes
202302252	Osie	drunk	none	yes
202302252	Ravs	turncoat	innocents	yes
202302253	Lewis	innocent	innocents	yes
202302253	Ben	turncoat	innocents	no
202302253	Zylus	jester	jester	yes
202302253	Pedguin	zombie	zombies	no
202302253	Duncan	traitor	traitors	no
202302253	Kirsty	hypnotist	traitors	no
202302253	Osie	traitor	traitors	no
202302253	Ravs	mad scientist	zombies	no
202302254	Lewis	zombie	zombies	yes
202302254	Ben	zombie	zombies	yes
202302254	Zylus	clown	clown	no
202302254	Pedguin	veteran	innocents	no
202302254	Duncan	zombie	zombies	no
202302254	Kirsty	mad scientist	zombies	no
202302254	Osie	zombie	zombies	no
202302254	Ravs	zombie	zombies	no
202302280	Lewis	veteran	innocents	yes
202302280	Ben	traitor	traitors	no
202302280	Zylus	summoner	traitors	yes
202302280	Pedguin	clown	clown	yes
202302280	Duncan	drunk	none	yes
202302280	Kirsty	innocent	innocents	yes
202302280	Osie	paladin	innocents	yes
202302280	Ravs	innocent	innocents	yes
202302281	Lewis	loot goblin	none	yes
202302281	Ben	paramedic	innocents	yes
202302281	Zylus	deputy	innocents	yes
202302281	Pedguin	innocent	innocents	yes
202302281	Duncan	informant	traitors	no
202302281	Kirsty	traitor	traitors	yes
202302281	Osie	innocent	innocents	yes
202302281	Ravs	medium	innocents	yes
202302282	Lewis	traitor	traitors	yes
202302282	Ben	medium	innocents	yes
202302282	Zylus	mad scientist	zombies	yes
202302282	Pedguin	clown	clown	no
202302282	Duncan	innocent	innocents	yes
202302282	Kirsty	zombie	zombies	yes
202302282	Osie	hypnotist	traitors	yes
202302282	Ravs	glitch	innocents	yes
202302283	Lewis	paramedic	innocents	no
202302283	Ben	innocent	innocents	no
202302283	Zylus	traitor	traitors	yes
202302283	Pedguin	loot goblin	none	no
202302283	Duncan	innocent	innocents	yes
202302283	Kirsty	turncoat	traitors	yes
202302283	Osie	tracker	innocents	yes
202302283	Ravs	informant	traitors	yes
202303040	Lewis	jester	jester	no
202303040	Ben	turncoat	innocents	no
202303040	Zylus	swapper	none	no
202303040	Shadow	innocent	innocents	yes
202303040	Duncan	summoner	traitors	yes
202303040	Kirsty	traitor	traitors	yes
202303040	Rythian	innocent	innocents	no
202303040	Ravs	paladin	innocents	yes
202303041	Lewis	beggar	traitors	yes
202303041	Ben	mad scientist	zombies	yes
202303041	Zylus	informant	traitors	yes
202303041	Shadow	medium	innocents	no
202303041	Duncan	innocent	innocents	yes
202303041	Kirsty	innocent	innocents	no
202303041	Rythian	traitor	traitors	yes
202303041	Ravs	veteran	innocents	no
202303042	Lewis	innocent	innocents	no
202303042	Ben	innocent	innocents	yes
202303042	Zylus	mad scientist	zombies	yes
202303042	Shadow	drunk	none	yes
202303042	Duncan	traitor	traitors	yes
202303042	Kirsty	hypnotist	traitors	yes
202303042	Rythian	veteran	innocents	no
202303042	Ravs	tracker	innocents	no
202303043	Lewis	randoman	innocents	no
202303043	Ben	paramedic	innocents	yes
202303043	Zylus	clown	clown	yes
202303043	Shadow	traitor	traitors	yes
202303043	Duncan	innocent	innocents	no
202303043	Kirsty	innocent	innocents	no
202303043	Rythian	swapper	none	no
202303043	Ravs	informant	traitors	yes
202303070	Lewis	traitor	traitors	yes
202303070	Ben	innocent	innocents	no
202303070	Zylus	swapper	none	no
202303070	Shadow	innocent	innocents	yes
202303070	Duncan	medium	innocents	yes
202303070	Kirsty	beggar	none	no
202303070	Rythian	informant	traitors	yes
202303070	Ravs	paramedic	innocents	no
202303071	Lewis	randoman	innocents	yes
202303071	Ben	parasite	traitors	yes
202303071	Zylus	parasite	traitors	no
202303071	Shadow	parasite	traitors	yes
202303071	Duncan	randoman	innocents	yes
202303071	Kirsty	drunk	none	yes
202303071	Rythian	parasite	traitors	yes
202303071	Ravs	randoman	innocents	yes
202303072	Lewis	turncoat	innocents	yes
202303072	Ben	innocent	innocents	yes
202303072	Zylus	swapper	none	no
202303072	Shadow	beggar	traitors	yes
202303072	Duncan	informant	traitors	yes
202303072	Kirsty	medium	innocents	no
202303072	Rythian	innocent	innocents	no
202303072	Ravs	traitor	traitors	yes
202303073	Lewis	innocent	innocents	yes
202303073	Ben	innocent	innocents	yes
202303073	Zylus	deputy	innocents	yes
202303073	Shadow	medium	innocents	yes
202303073	Duncan	swapper	none	no
202303073	Kirsty	traitor	traitors	no
202303073	Rythian	jester	jester	no
202303073	Ravs	summoner	traitors	no
202303074	Lewis	informant	traitors	yes
202303074	Ben	glitch	innocents	yes
202303074	Zylus	clown	clown	no
202303074	Shadow	innocent	innocents	yes
202303074	Duncan	paladin	innocents	yes
202303074	Kirsty	innocent	innocents	yes
202303074	Rythian	mad scientist	zombies	yes
202303074	Ravs	traitor	traitors	yes
202303110	Lewis	innocent	innocents	yes
202303110	Ben	mad scientist	zombies	yes
202303110	Zylus	zombie	zombies	yes
202303110	Shadow	veteran	innocents	no
202303110	Duncan	innocent	innocents	yes
202303110	Kirsty	beggar	none	yes
202303110	Rythian	informant	traitors	yes
202303110	Ravs	randoman	innocents	yes
202303111	Lewis	traitor	traitors	yes
202303111	Ben	innocent	innocents	no
202303111	Zylus	innocent	innocents	no
202303111	Shadow	turncoat	traitors	yes
202303111	Duncan	jester	jester	yes
202303111	Kirsty	parasite	traitors	no
202303111	Rythian	clown	clown	yes
202303111	Ravs	medium	innocents	yes
202303112	Lewis	innocent	innocents	yes
202303112	Ben	turncoat	traitors	no
202303112	Zylus	parasite	traitors	no
202303112	Shadow	medium	innocents	yes
202303112	Duncan	innocent	innocents	yes
202303112	Kirsty	jester	jester	no
202303112	Rythian	traitor	traitors	no
202303112	Ravs	beggar	traitors	no
202303113	Lewis	clown	clown	no
202303113	Ben	paladin	innocents	yes
202303113	Zylus	turncoat	innocents	yes
202303113	Shadow	innocent	innocents	yes
202303113	Duncan	traitor	traitors	yes
202303113	Kirsty	swapper	none	no
202303113	Rythian	innocent	innocents	yes
202303113	Ravs	summoner	traitors	yes
202303114	Lewis	zombie	zombies	yes
202303114	Ben	zombie	zombies	yes
202303114	Zylus	innocent	innocents	yes
202303114	Shadow	mad scientist	zombies	yes
202303114	Duncan	zombie	zombies	no
202303114	Kirsty	zombie	zombies	no
202303114	Rythian	zombie	zombies	no
202303114	Ravs	zombie	zombies	no
202303115	Lewis	traitor	traitors	no
202303115	Ben	summoner	traitors	yes
202303115	Zylus	loot goblin	none	yes
202303115	Shadow	traitor	traitors	yes
202303115	Duncan	paladin	innocents	yes
202303115	Kirsty	drunk	none	yes
202303115	Rythian	innocent	innocents	yes
202303115	Ravs	veteran	innocents	yes
202303140	Lewis	traitor	traitors	no
202303140	Ben	tracker	innocents	yes
202303140	Zylus	innocent	innocents	yes
202303140	Shadow	swapper	none	no
202303140	Duncan	deputy	innocents	yes
202303140	Kirsty	jester	jester	no
202303140	Rythian	informant	traitors	no
202303140	Ravs	innocent	innocents	yes
202303141	Lewis	innocent	innocents	yes
202303141	Ben	paladin	innocents	yes
202303141	Zylus	summoner	traitors	yes
202303141	Shadow	swapper	none	yes
202303141	Duncan	innocent	innocents	yes
202303141	Kirsty	veteran	innocents	yes
202303141	Rythian	traitor	traitors	no
202303141	Ravs	beggar	innocents	yes
202303142	Lewis	paladin	innocents	yes
202303142	Ben	deputy	innocents	yes
202303142	Zylus	traitor	traitors	yes
202303142	Shadow	clown	clown	yes
202303142	Duncan	innocent	innocents	yes
202303142	Kirsty	jester	jester	no
202303142	Rythian	parasite	traitors	no
202303142	Ravs	innocent	innocents	yes
202303143	Lewis	tracker	innocents	yes
202303143	Ben	innocent	innocents	yes
202303143	Zylus	zombie	zombies	yes
202303143	Shadow	turncoat	traitors	yes
202303143	Duncan	traitor	traitors	no
202303143	Kirsty	zombie	zombies	yes
202303143	Rythian	loot goblin	none	yes
202303143	Ravs	mad scientist	zombies	yes
202303144	Lewis	traitor	traitors	yes
202303144	Ben	zombie	zombies	yes
202303144	Zylus	zombie	zombies	yes
202303144	Shadow	innocent	innocents	no
202303144	Duncan	mad scientist	zombies	yes
202303144	Kirsty	zombie	zombies	yes
202303144	Rythian	paladin	innocents	no
202303144	Ravs	veteran	innocents	yes
202303145	Lewis	beggar	traitors	no
202303145	Ben	innocent	innocents	no
202303145	Zylus	turncoat	traitors	yes
202303145	Shadow	informant	traitors	yes
202303145	Duncan	innocent	innocents	no
202303145	Kirsty	tracker	innocents	no
202303145	Rythian	jester	jester	yes
202303145	Ravs	traitor	traitors	no
202303180	Lolip	innocent	innocents	yes
202303180	Zoey	innocent	innocents	no
202303180	Osie	summoner	traitors	yes
202303180	Duncan	traitor	traitors	yes
202303180	Kirsty	randoman	innocents	yes
202303180	Rythian	veteran	innocents	no
202303180	Ravs	swapper	none	no
202303181	Lolip	summoner	traitors	no
202303181	Zoey	paladin	innocents	yes
202303181	Osie	innocent	innocents	yes
202303181	Duncan	innocent	innocents	yes
202303181	Kirsty	traitor	traitors	yes
202303181	Rythian	beggar	traitors	yes
202303181	Ravs	glitch	innocents	yes
202303182	Lolip	paramedic	innocents	yes
202303182	Zoey	randoman	innocents	yes
202303182	Osie	parasite	traitors	no
202303182	Duncan	traitor	traitors	yes
202303182	Kirsty	innocent	innocents	yes
202303182	Rythian	jester	jester	yes
202303182	Ravs	innocent	innocents	no
202303183	Lolip	mad scientist	zombies	yes
202303183	Zoey	zombie	zombies	yes
202303183	Osie	traitor	traitors	yes
202303183	Duncan	innocent	innocents	yes
202303183	Kirsty	glitch	innocents	yes
202303183	Rythian	impersonator	traitors	yes
202303183	Ravs	tracker	innocents	no
202303184	Lolip	veteran	innocents	no
202303184	Zoey	innocent	innocents	no
202303184	Osie	impersonator	traitors	yes
202303184	Duncan	paladin	innocents	no
202303184	Kirsty	traitor	traitors	no
202303184	Rythian	innocent	innocents	yes
202303184	Ravs	jester	jester	yes
202303185	Lolip	innocent	innocents	yes
202303185	Zoey	veteran	innocents	no
202303185	Osie	innocent	innocents	yes
202303185	Duncan	summoner	traitors	yes
202303185	Kirsty	tracker	innocents	yes
202303185	Rythian	traitor	traitors	yes
202303185	Ravs	innocent	innocents	yes
202303186	Lolip	innocent	innocents	no
202303186	Zoey	loot goblin	none	no
202303186	Osie	glitch	innocents	no
202303186	Duncan	summoner	traitors	yes
202303186	Kirsty	traitor	traitors	yes
202303186	Rythian	innocent	innocents	yes
202303186	Ravs	medium	innocents	no
202303210	Lewis	zombie	zombies	yes
202303210	Lolip	zombie	zombies	no
202303210	Zoey	zombie	zombies	no
202303210	Osie	mad scientist	zombies	no
202303210	Duncan	zombie	zombies	yes
202303210	Kirsty	zombie	zombies	yes
202303210	Rythian	zombie	zombies	no
202303210	Ravs	innocent	innocents	yes
202303211	Lolip	innocent	innocents	yes
202303211	Zoey	parasite	traitors	no
202303211	Osie	innocent	innocents	no
202303211	Duncan	traitor	traitors	no
202303211	Kirsty	tracker	innocents	no
202303211	Rythian	jester	jester	yes
202303211	Ravs	veteran	innocents	no
202303212	Lewis	innocent	innocents	no
202303212	Lolip	glitch	innocents	no
202303212	Zoey	traitor	traitors	yes
202303212	Osie	summoner	traitors	yes
202303212	Duncan	medium	innocents	no
202303212	Kirsty	innocent	innocents	no
202303212	Rythian	swapper	none	no
202303212	Ravs	mad scientist	zombies	yes
202303213	Lewis	paladin	innocents	yes
202303213	Lolip	informant	traitors	no
202303213	Zoey	innocent	innocents	yes
202303213	Osie	veteran	innocents	yes
202303213	Duncan	clown	clown	yes
202303213	Kirsty	traitor	traitors	yes
202303213	Rythian	innocent	innocents	yes
202303213	Ravs	jester	jester	no
202303214	Lewis	veteran	innocents	yes
202303214	Lolip	innocent	innocents	yes
202303214	Zoey	traitor	traitors	yes
202303214	Osie	traitor	traitors	no
202303214	Duncan	tracker	innocents	yes
202303214	Kirsty	summoner	traitors	yes
202303214	Rythian	clown	clown	yes
202303214	Ravs	innocent	innocents	yes
202303211	Lewis	cupid	lovers	no
202302140	Kirsty	traitor	traitors	no
202303250	Lewis	traitor	traitors	yes
202303250	Lolip	innocent	innocents	yes
202303250	Zoey	innocent	innocents	yes
202303250	Osie	clown	clown	yes
202303250	Duncan	paladin	innocents	yes
202303250	Kirsty	cupid	lovers	no
202303250	Rythian	deputy	innocents	yes
202303250	Ravs	parasite	traitors	no
202303251	Lewis	beggar	none	no
202303251	Lolip	innocent	innocents	no
202303251	Zoey	innocent	innocents	yes
202303251	Osie	traitor	traitors	yes
202303251	Duncan	medium	innocents	yes
202303251	Kirsty	paramedic	innocents	no
202303251	Rythian	impersonator	traitors	yes
202303251	Ravs	loot goblin	none	yes
202303252	Lewis	paramedic	innocents	yes
202303252	Lolip	cupid	lovers	yes
202303252	Zoey	traitor	traitors	no
202303252	Osie	tracker	innocents	yes
202303252	Duncan	loot goblin	none	yes
202303252	Kirsty	innocent	innocents	yes
202303252	Rythian	summoner	traitors	no
202303252	Ravs	innocent	innocents	yes
202303253	Lewis	innocent	innocents	no
202303253	Lolip	impersonator	traitors	no
202303253	Zoey	glitch	innocents	no
202303253	Osie	tracker	innocents	yes
202303253	Duncan	swapper	none	no
202303253	Kirsty	jester	jester	yes
202303253	Rythian	traitor	traitors	no
202303253	Ravs	innocent	innocents	no
202303254	Lewis	cupid	lovers	no
202303254	Lolip	swapper	none	no
202303254	Zoey	innocent	innocents	yes
202303254	Osie	paladin	innocents	yes
202303254	Duncan	paramedic	innocents	yes
202303254	Kirsty	informant	traitors	no
202303254	Rythian	innocent	innocents	yes
202303254	Ravs	traitor	traitors	no
202303280	Lewis	medium	innocents	yes
202303280	Ben	innocent	innocents	yes
202303280	Duncan	summoner	traitors	no
202303280	Kirsty	innocent	innocents	yes
202303280	Rythian	clown	clown	yes
202303280	Ravs	traitor	traitors	no
202303280	Zylus	paramedic	innocents	yes
202303281	Lewis	loot goblin	none	yes
202303281	Ben	traitor	traitors	no
202303281	Duncan	tracker	innocents	yes
202303281	Kirsty	innocent	innocents	yes
202303281	Rythian	glitch	innocents	yes
202303281	Ravs	parasite	traitors	no
202303281	Zylus	innocent	innocents	yes
202303282	Lewis	cupid	lovers	no
202303282	Ben	marshal	innocents	yes
202303282	Duncan	traitor	traitors	yes
202303282	Kirsty	glitch	innocents	yes
202303282	Rythian	innocent	innocents	yes
202303282	Ravs	parasite	traitors	no
202303282	Zylus	innocent	innocents	yes
202303283	Lewis	innocent	innocents	yes
202303283	Ben	marshal	innocents	yes
202303283	Duncan	traitor	traitors	yes
202303283	Kirsty	summoner	traitors	no
202303283	Rythian	glitch	innocents	no
202303283	Ravs	innocent	innocents	yes
202303283	Zylus	jester	jester	yes
202304010	Lewis	jester	jester	no
202304010	Ben	summoner	traitors	yes
202304010	Duncan	traitor	traitors	yes
202304010	Kirsty	innocent	innocents	yes
202304010	Rythian	glitch	innocents	no
202304010	Ravs	tracker	innocents	yes
202304010	Zylus	innocent	innocents	yes
202304011	Lewis	marshal	innocents	yes
202304011	Ben	hypnotist	traitors	yes
202304011	Duncan	glitch	lovers	no
202304011	Kirsty	deputy	innocents	yes
202304011	Rythian	innocent	innocents	yes
202304011	Ravs	traitor	lovers	no
202304011	Zylus	cupid	lovers	no
202304012	Lewis	innocent	innocents	no
202304012	Ben	jester	jester	yes
202304012	Duncan	marshal	innocents	yes
202304012	Kirsty	hypnotist	traitors	no
202304012	Rythian	traitor	traitors	no
202304012	Ravs	veteran	innocents	no
202304012	Zylus	innocent	innocents	yes
202304013	Lewis	traitor	traitors	yes
202304013	Ben	innocent	innocents	no
202304013	Duncan	informant	traitors	yes
202304013	Kirsty	paladin	innocents	no
202304013	Rythian	innocent	innocents	no
202304013	Ravs	innocent	innocents	no
202304013	Zylus	veteran	innocents	yes
202304014	Lewis	paramedic	innocents	no
202304014	Ben	innocent	innocents	no
202304014	Duncan	informant	traitors	yes
202304014	Kirsty	swapper	none	no
202304014	Rythian	traitor	traitors	yes
202304014	Ravs	innocent	innocents	yes
202304014	Zylus	paladin	innocents	yes
202304015	Lewis	traitor	traitors	no
202304015	Ben	innocent	innocents	yes
202304015	Duncan	glitch	innocents	yes
202304015	Kirsty	deputy	innocents	yes
202304015	Rythian	clown	clown	yes
202304015	Ravs	marshal	innocents	yes
202304015	Zylus	summoner	traitors	yes
202304040	Lewis	traitor	traitors	yes
202304040	Ben	jester	jester	yes
202304040	Duncan	innocent	innocents	no
202304040	Kirsty	veteran	innocents	yes
202304040	Rythian	randoman	innocents	no
202304040	Ravs	impersonator	traitors	no
202304040	Zylus	innocent	innocents	yes
202304041	Lewis	clown	clown	yes
202304041	Ben	glitch	innocents	yes
202304041	Duncan	medium	innocents	no
202304041	Kirsty	traitor	traitors	yes
202304041	Rythian	innocent	innocents	yes
202304041	Ravs	innocent	innocents	yes
202304041	Zylus	informant	traitors	yes
202304042	Lewis	clown	clown	yes
202304042	Ben	veteran	innocents	yes
202304042	Duncan	innocent	innocents	no
202304042	Kirsty	innocent	innocents	no
202304042	Rythian	paladin	innocents	no
202304042	Ravs	summoner	traitors	yes
202304042	Zylus	traitor	traitors	yes
202304043	Lewis	innocent	innocents	yes
202304043	Ben	traitor	traitors	no
202304043	Duncan	innocent	innocents	yes
202304043	Kirsty	beggar	traitors	yes
202304043	Rythian	parasite	traitors	yes
202304043	Ravs	paladin	innocents	yes
202304043	Zylus	glitch	innocents	yes
202304044	Lewis	traitor	traitors	yes
202304044	Ben	innocent	innocents	no
202304044	Duncan	informant	traitors	yes
202304044	Kirsty	innocent	innocents	yes
202304044	Rythian	glitch	innocents	yes
202304044	Ravs	traitor	traitors	yes
202304044	Zylus	paladin	innocents	no
202304045	Lewis	summoner	traitors	no
202304045	Ben	traitor	traitors	no
202304045	Duncan	jester	jester	yes
202304045	Kirsty	medium	innocents	no
202304045	Rythian	innocent	innocents	no
202304045	Ravs	innocent	innocents	no
202304045	Zylus	glitch	innocents	no
202304080	Lewis	innocent	innocents	yes
202304080	Ben	innocent	innocents	yes
202304080	Duncan	jester	jester	no
202304080	Shadow	informant	traitors	yes
202304080	Rythian	paladin	innocents	yes
202304080	Ravs	beggar	traitors	no
202304080	Zylus	traitor	traitors	yes
202304080	Zoey	veteran	innocents	yes
202304081	Lewis	innocent	innocents	yes
202304081	Ben	innocent	innocents	yes
202304081	Duncan	innocent	innocents	yes
202304081	Shadow	innocent	innocents	yes
202304081	Rythian	innocent	innocents	yes
202304081	Ravs	innocent	innocents	yes
202304081	Zylus	innocent	innocents	no
202304081	Zoey	innocent	innocents	no
202304082	Lewis	loot goblin	none	yes
202304082	Ben	mad scientist	zombies	no
202304082	Duncan	zombie	zombies	no
202304082	Shadow	zombie	zombies	yes
202304082	Rythian	zombie	zombies	no
202304082	Ravs	innocent	innocents	yes
202304082	Zylus	zombie	zombies	yes
202304082	Zoey	traitor	traitors	yes
202304083	Lewis	innocent	innocents	yes
202304083	Ben	tracker	innocents	yes
202304083	Duncan	traitor	traitors	no
202304083	Shadow	informant	traitors	no
202304083	Rythian	glitch	innocents	no
202304083	Ravs	jester	jester	yes
202304083	Zylus	innocent	innocents	no
202304083	Zoey	mad scientist	zombies	no
202304084	Lewis	innocent	innocents	no
202304084	Ben	innocent	innocents	no
202304084	Duncan	innocent	innocents	no
202304084	Shadow	traitor	traitors	yes
202304084	Rythian	paladin	innocents	no
202304084	Ravs	innocent	innocents	no
202304084	Zylus	traitor	traitors	yes
202304084	Zoey	veteran	innocents	no
202304110	Lewis	traitor	traitors	yes
202304110	Ben	innocent	innocents	yes
202304110	Duncan	veteran	innocents	no
202304110	Shadow	swapper	none	no
202304110	Rythian	traitor	traitors	yes
202304110	Ravs	drunk	none	yes
202304110	Zylus	informant	traitors	yes
202304110	Zoey	innocent	innocents	yes
202304111	Lewis	loot goblin	none	yes
202304111	Ben	veteran	innocents	yes
202304111	Duncan	paladin	innocents	yes
202304111	Shadow	parasite	traitors	yes
202304111	Rythian	innocent	innocents	yes
202304111	Ravs	clown	clown	no
202304111	Zylus	traitor	traitors	yes
202304111	Zoey	innocent	innocents	yes
202304112	Lewis	randoman	innocents	no
202304112	Ben	glitch	innocents	yes
202304112	Duncan	jester	jester	yes
202304112	Shadow	mad scientist	zombies	yes
202304112	Rythian	informant	traitors	no
202304112	Ravs	innocent	innocents	yes
202304112	Zylus	innocent	innocents	yes
202304112	Zoey	traitor	traitors	yes
202304113	Lewis	zombie	zombies	yes
202304113	Ben	innocent	innocents	no
202304113	Duncan	innocent	innocents	no
202304113	Shadow	zombie	zombies	no
202304113	Rythian	zombie	zombies	no
202304113	Ravs	innocent	innocents	yes
202304113	Zylus	zombie	zombies	no
202304113	Zoey	zombie	zombies	yes
202304150	Lewis	innocent	innocents	no
202304150	Ben	loot goblin	none	no
202304150	Duncan	tracker	innocents	no
202304150	Shadow	innocent	innocents	no
202304150	Rythian	jester	jester	no
202304150	Ravs	traitor	traitors	yes
202304150	Zylus	impersonator	traitors	yes
202304150	Zoey	veteran	innocents	no
202304151	Lewis	deputy	innocents	yes
202304151	Ben	impersonator	traitors	yes
202304151	Duncan	tracker	innocents	yes
202304151	Shadow	deputy	innocents	yes
202304151	Rythian	loot goblin	none	yes
202304151	Ravs	deputy	innocents	no
202304151	Zylus	clown	clown	yes
202304151	Zoey	impersonator	traitors	yes
202304152	Lewis	tracker	innocents	yes
202304152	Ben	innocent	innocents	no
202304152	Duncan	drunk	none	yes
202304152	Shadow	traitor	traitors	yes
202304152	Rythian	glitch	innocents	yes
202304152	Ravs	loot goblin	none	yes
202304152	Zylus	traitor	traitors	yes
202304152	Zoey	hypnotist	traitors	yes
202304153	Lewis	drunk	none	yes
202304153	Ben	innocent	innocents	yes
202304153	Duncan	impersonator	traitors	yes
202304153	Shadow	traitor	traitors	yes
202304153	Rythian	innocent	innocents	yes
202304153	Ravs	paramedic	innocents	yes
202304153	Zylus	marshal	innocents	yes
202304153	Zoey	summoner	traitors	no
202304154	Lewis	paladin	innocents	yes
202304154	Ben	glitch	innocents	yes
202304154	Duncan	innocent	innocents	yes
202304154	Shadow	clown	clown	yes
202304154	Rythian	traitor	traitors	no
202304154	Ravs	parasite	traitors	yes
202304154	Zylus	beggar	innocents	yes
202304154	Zoey	innocent	innocents	yes
202304180	Lewis	clown	clown	yes
202304180	Ben	tracker	innocents	yes
202304180	Boba	innocent	innocents	yes
202304180	Pedguin	hypnotist	traitors	no
202304180	Rythian	veteran	innocents	yes
202304180	Kirsty	traitor	traitors	no
202304180	Zylus	innocent	innocents	yes
202304181	Lewis	innocent	innocents	yes
202304181	Ben	innocent	innocents	yes
202304181	Boba	traitor	traitors	yes
202304181	Pedguin	hypnotist	traitors	no
202304181	Rythian	paladin	innocents	yes
202304181	Kirsty	veteran	innocents	yes
202304181	Zylus	traitor	traitors	no
202304182	Lewis	shadow	none	yes
202304182	Ben	innocent	innocents	no
202304182	Boba	randoman	innocents	no
202304182	Pedguin	innocent	innocents	no
202304182	Rythian	parasite	traitors	yes
202304182	Kirsty	glitch	innocents	no
202304182	Zylus	traitor	traitors	yes
202304183	Lewis	innocent	innocents	no
202304183	Ben	paramedic	innocents	yes
202304183	Boba	impersonator	traitors	yes
202304183	Pedguin	traitor	traitors	yes
202304183	Rythian	innocent	innocents	no
202304183	Kirsty	summoner	traitors	yes
202304183	Zylus	marshal	innocents	yes
202304184	Lewis	beggar	traitors	yes
202304184	Ben	veteran	innocents	yes
202304184	Boba	traitor	traitors	yes
202304184	Pedguin	parasite	traitors	no
202304184	Rythian	marshal	innocents	yes
202304184	Kirsty	innocent	innocents	yes
202304184	Zylus	innocent	innocents	yes
202304185	Lewis	hypnotist	traitors	yes
202304185	Ben	glitch	innocents	yes
202304185	Boba	innocent	innocents	yes
202304185	Pedguin	traitor	traitors	no
202304185	Rythian	traitor	traitors	yes
202304185	Kirsty	innocent	innocents	yes
202304185	Zylus	innocent	innocents	yes
202304220	Lewis	impersonator	traitors	yes
202304220	Ben	innocent	innocents	yes
202304220	Boba	traitor	traitors	yes
202304220	Pedguin	medium	innocents	no
202304220	Rythian	glitch	innocents	no
202304220	Kirsty	innocent	innocents	yes
202304220	Zylus	traitor	traitors	yes
202304221	Lewis	innocent	innocents	yes
202304221	Ben	medium	innocents	yes
202304221	Boba	traitor	traitors	no
202304221	Pedguin	informant	traitors	yes
202304221	Rythian	innocent	innocents	yes
202304221	Kirsty	cupid	lovers	yes
202304221	Zylus	deputy	innocents	yes
202304222	Lewis	paladin	innocents	no
202304222	Ben	traitor	traitors	yes
202304222	Boba	innocent	innocents	no
202304222	Pedguin	cupid	lovers	yes
202304222	Rythian	veteran	innocents	yes
202304222	Kirsty	innocent	innocents	yes
202304222	Zylus	informant	traitors	yes
202304223	Lewis	zombie	zombies	no
202304223	Ben	traitor	traitors	yes
202304223	Boba	innocent	innocents	yes
202304223	Pedguin	zombie	zombies	no
202304223	Rythian	mad scientist	zombies	no
202304223	Kirsty	zombie	zombies	no
202304223	Zylus	zombie	zombies	no
202304224	Lewis	paladin	innocents	no
202304224	Ben	traitor	traitors	yes
202304224	Boba	innocent	innocents	no
202304224	Pedguin	parasite	traitors	yes
202304224	Rythian	jester	jester	no
202304224	Kirsty	paramedic	innocents	no
202304224	Zylus	innocent	innocents	yes
202304225	Lewis	innocent	innocents	yes
202304225	Ben	traitor	traitors	no
202304225	Boba	paladin	innocents	yes
202304225	Pedguin	glitch	innocents	yes
202304225	Rythian	innocent	innocents	yes
202304225	Kirsty	loot goblin	none	yes
202304225	Zylus	summoner	traitors	yes
202304226	Lewis	innocent	innocents	yes
202304226	Ben	innocent	innocents	yes
202304226	Boba	randoman	innocents	yes
202304226	Pedguin	elf	elves	yes
202304226	Rythian	glitch	innocents	yes
202304226	Kirsty	summoner	traitors	yes
202304226	Zylus	traitor	traitors	no
202304227	Lewis	summoner	traitors	yes
202304227	Ben	innocent	innocents	no
202304227	Boba	traitor	traitors	yes
202304227	Pedguin	glitch	innocents	yes
202304227	Rythian	innocent	innocents	no
202304227	Kirsty	mad scientist	zombies	yes
202304227	Zylus	medium	innocents	yes
202304250	Lewis	beggar	none	no
202304250	Ben	informant	traitors	yes
202304250	Pedguin	marshal	innocents	no
202304250	Rythian	traitor	traitors	yes
202304250	Zylus	innocent	innocents	no
202304250	Kirsty	innocent	innocents	no
202304250	Boba	glitch	innocents	no
202304251	Lewis	deputy	innocents	no
202304251	Ben	drunk	none	no
202304251	Pedguin	innocent	innocents	no
202304251	Rythian	innocent	innocents	no
202304251	Zylus	parasite	traitors	no
202304251	Kirsty	traitor	traitors	yes
202304251	Boba	medium	innocents	no
202304252	Lewis	traitor	traitors	yes
202304252	Ben	veteran	innocents	no
202304252	Pedguin	summoner	traitors	yes
202304252	Rythian	paladin	innocents	yes
202304252	Zylus	innocent	innocents	yes
202304252	Kirsty	traitor	traitors	yes
202304252	Boba	innocent	innocents	no
202304253	Lewis	paladin	innocents	no
202304253	Ben	impersonator	traitors	yes
202304253	Pedguin	innocent	innocents	no
202304253	Rythian	jester	jester	no
202304253	Zylus	traitor	traitors	yes
202304253	Kirsty	glitch	innocents	no
202304253	Boba	innocent	innocents	no
202304254	Lewis	traitor	traitors	yes
202304254	Ben	innocent	innocents	yes
202304254	Pedguin	paladin	innocents	no
202304254	Rythian	innocent	innocents	yes
202304254	Zylus	veteran	innocents	yes
202304254	Kirsty	clown	clown	yes
202304254	Boba	parasite	traitors	yes
202304255	Lewis	innocent	innocents	no
202304255	Ben	marshal	innocents	no
202304255	Pedguin	glitch	innocents	no
202304255	Rythian	innocent	innocents	no
202304255	Zylus	jester	jester	yes
202304255	Kirsty	parasite	traitors	no
202304255	Boba	traitor	traitors	no
202304256	Lewis	innocent	innocents	no
202304256	Ben	traitor	traitors	yes
202304256	Pedguin	cupid	lovers	yes
202304256	Rythian	informant	traitors	yes
202304256	Zylus	deputy	innocents	no
202304256	Kirsty	innocent	innocents	no
202304256	Boba	paladin	innocents	no
202304257	Lewis	loot goblin	none	no
202304257	Ben	veteran	innocents	yes
202304257	Pedguin	traitor	traitors	no
202304257	Rythian	impersonator	traitors	yes
202304257	Zylus	innocent	innocents	no
202304257	Kirsty	randoman	innocents	no
202304257	Boba	innocent	innocents	no
202304258	Lewis	glitch	innocents	yes
202304258	Ben	innocent	innocents	no
202304258	Pedguin	traitor	traitors	yes
202304258	Rythian	innocent	innocents	no
202304258	Zylus	jester	jester	yes
202304258	Kirsty	impersonator	traitors	no
202304258	Boba	paladin	innocents	no
202304290	Lewis	traitor	traitors	no
202304290	Ben	veteran	innocents	yes
202304290	Duncan	informant	traitors	no
202304290	Ravs	innocent	innocents	yes
202304290	Rythian	randoman	innocents	yes
202304290	Zylus	shadow	none	yes
202304290	Kirsty	clown	clown	yes
202304290	Zoey	innocent	innocents	yes
202304291	Lewis	veteran	innocents	yes
202304291	Ben	marshal	innocents	yes
202304291	Duncan	innocent	innocents	yes
202304291	Ravs	innocent	innocents	yes
202304291	Rythian	shadow	none	yes
202304291	Zylus	traitor	traitors	no
202304291	Kirsty	summoner	traitors	yes
202304291	Zoey	clowntective	clown	yes
202304292	Lewis	shadow	none	yes
202304292	Ben	informant	traitors	no
202304292	Duncan	innocent	innocents	yes
202304292	Ravs	traitor	traitors	no
202304292	Rythian	veteran	innocents	yes
202304292	Zylus	beggar	traitors	no
202304292	Kirsty	marshal	innocents	yes
202304292	Zoey	innocent	innocents	yes
202305020	Lewis	impersonator	traitors	yes
202305020	Ben	tracker	innocents	yes
202305020	Duncan	innocent	innocents	yes
202305020	Ravs	traitor	traitors	yes
202305020	Rythian	shadow	none	no
202305020	Zylus	veteran	innocents	yes
202305020	Kirsty	beggar	none	no
202305020	Zoey	innocent	innocents	no
202305021	Lewis	innocent	innocents	yes
202305021	Ben	paladin	innocents	yes
202305021	Duncan	parasite	traitors	yes
202305021	Ravs	traitor	traitors	no
202305021	Rythian	beggar	traitors	no
202305021	Zylus	drunk	none	yes
202305021	Kirsty	innocent	innocents	yes
202305021	Zoey	glitch	innocents	yes
202305022	Lewis	mad scientist	zombies	yes
202305022	Ben	zombie	zombies	no
202305022	Duncan	innocent	innocents	yes
202305022	Ravs	zombie	zombies	no
202305022	Rythian	innocent	innocents	yes
202305022	Zylus	zombie	zombies	no
202305022	Kirsty	zombie	zombies	no
202305022	Zoey	tracker	innocents	yes
202305023	Lewis	innocent	innocents	no
202305023	Ben	shadow	none	no
202305023	Duncan	glitch	innocents	no
202305023	Ravs	glitch	innocents	no
202305023	Rythian	shadow	none	no
202305023	Zylus	shadow	none	yes
202305023	Kirsty	paladin	innocents	no
202305023	Zoey	paladin	innocents	no
202305024	Lewis	innocent	innocents	yes
202305024	Ben	shadow	none	no
202305024	Duncan	swapper	none	no
202305024	Ravs	summoner	traitors	no
202305024	Rythian	paramedic	innocents	yes
202305024	Zylus	randoman	innocents	yes
202305024	Kirsty	traitor	traitors	yes
202305024	Zoey	innocent	innocents	yes
202305060	Lewis	jester	jester	no
202305060	Ben	innocent	innocents	yes
202305060	Duncan	summoner	traitors	yes
202305060	Ravs	tracker	innocents	no
202305060	Pedguin	traitor	traitors	yes
202305060	Zylus	beggar	innocents	no
202305060	Kirsty	traitor	traitors	yes
202305060	Boba	paramedic	innocents	yes
202305061	Lewis	parasite	traitors	yes
202305061	Ben	jester	jester	yes
202305061	Duncan	innocent	innocents	yes
202305061	Ravs	glitch	innocents	yes
202305061	Pedguin	innocent	innocents	yes
202305061	Zylus	tracker	innocents	no
202305061	Kirsty	shadow	none	no
202305061	Boba	traitor	traitors	no
202305062	Lewis	innocent	innocents	no
202305062	Ben	shadow	none	yes
202305062	Duncan	parasite	traitors	yes
202305062	Ravs	innocent	innocents	yes
202305062	Pedguin	traitor	traitors	yes
202305062	Zylus	paladin	innocents	yes
202305062	Kirsty	glitch	innocents	yes
202305062	Boba	swapper	none	no
202305063	Lewis	clown	clown	yes
202305063	Ben	traitor	traitors	yes
202305063	Duncan	paramedic	innocents	yes
202305063	Ravs	paladin	innocents	yes
202305063	Pedguin	innocent	innocents	yes
202305063	Zylus	innocent	innocents	yes
202305063	Kirsty	informant	traitors	no
202305063	Boba	jester	jester	no
202305064	Lewis	deputy	innocents	no
202305064	Ben	innocent	innocents	yes
202305064	Duncan	medium	innocents	no
202305064	Ravs	informant	traitors	yes
202305064	Pedguin	jester	jester	no
202305064	Zylus	innocent	innocents	no
202305064	Kirsty	traitor	traitors	yes
202305064	Boba	shadow	none	yes
202305065	Lewis	innocent	innocents	yes
202305065	Ben	traitor	traitors	yes
202305065	Duncan	tracker	innocents	no
202305065	Ravs	innocent	innocents	no
202305065	Pedguin	innocent	innocents	yes
202305065	Zylus	parasite	traitors	yes
202305065	Kirsty	veteran	innocents	yes
202305065	Boba	beggar	none	yes
202305090	Lewis	paramedic	innocents	no
202305090	Ben	jester	jester	yes
202305090	Duncan	impersonator	traitors	no
202305090	Ravs	beggar	none	no
202305090	Pedguin	traitor	traitors	yes
202305090	Zylus	innocent	innocents	no
202305090	Kirsty	innocent	innocents	yes
202305090	Boba	randoman	innocents	no
202305091	Lewis	innocent	innocents	no
202305091	Ben	impersonator	traitors	yes
202305091	Duncan	marshal	innocents	yes
202305091	Ravs	loot goblin	none	yes
202305091	Pedguin	veteran	innocents	no
202305091	Zylus	drunk	none	yes
202305091	Kirsty	traitor	traitors	yes
202305091	Boba	innocent	innocents	no
202305092	Lewis	shadow	none	yes
202305092	Ben	innocent	innocents	yes
202305092	Duncan	innocent	innocents	yes
202305092	Ravs	mad scientist	zombies	no
202305092	Pedguin	deputy	innocents	yes
202305092	Zylus	zombie	zombies	no
202305092	Kirsty	zombie	zombies	no
202305092	Boba	informant	traitors	yes
202305093	Lewis	marshal	innocents	no
202305093	Ben	informant	traitors	yes
202305093	Duncan	shadow	none	no
202305093	Ravs	innocent	innocents	no
202305093	Pedguin	jester	jester	yes
202305093	Zylus	deputy	innocents	no
202305093	Kirsty	traitor	traitors	yes
202305093	Boba	innocent	innocents	no
202305094	Lewis	innocent	innocents	yes
202305094	Ben	traitor	traitors	yes
202305094	Duncan	shadow	none	yes
202305094	Ravs	mad scientist	zombies	yes
202305094	Pedguin	innocent	innocents	yes
202305094	Zylus	parasite	traitors	no
202305094	Kirsty	glitch	innocents	yes
202305094	Boba	randoman	innocents	yes
202305095	Lewis	randoman	innocents	yes
202305095	Ben	shadow	none	yes
202305095	Duncan	informant	traitors	yes
202305095	Ravs	glitch	innocents	yes
202305095	Pedguin	innocent	innocents	yes
202305095	Zylus	innocent	innocents	yes
202305095	Kirsty	traitor	traitors	yes
202305095	Boba	clown	clown	no
202305130	Lewis	traitor	traitors	yes
202305130	Ben	mad scientist	zombies	yes
202305130	Duncan	medium	innocents	no
202305130	Ravs	innocent	innocents	no
202305130	Pedguin	traitor	traitors	yes
202305130	Zylus	traitor	traitors	yes
202305130	Kirsty	innocent	innocents	no
202305130	Boba	paramedic	innocents	yes
202305131	Lewis	traitor	traitors	yes
202305131	Ben	innocent	innocents	no
202305131	Duncan	innocent	innocents	yes
202305131	Ravs	glitch	innocents	no
202305131	Pedguin	medium	innocents	no
202305131	Zylus	parasite	traitors	yes
202305131	Kirsty	shadow	none	yes
202305131	Boba	beggar	none	no
202305132	Lewis	traitor	traitors	no
202305132	Ben	traitor	traitors	yes
202305132	Duncan	innocent	innocents	yes
202305132	Ravs	deputy	innocents	yes
202305132	Pedguin	traitor	traitors	yes
202305132	Zylus	clowntective	clown	yes
202305132	Kirsty	informant	traitors	no
202305132	Boba	glitch	innocents	yes
202305133	Lewis	glitch	innocents	no
202305133	Ben	innocent	innocents	no
202305133	Duncan	hypnotist	traitors	yes
202305133	Ravs	traitor	traitors	yes
202305133	Pedguin	swapper	none	no
202305133	Zylus	paladin	innocents	no
202305133	Kirsty	shadow	none	no
202305133	Boba	loot goblin	none	no
202305134	Lewis	innocent	innocents	yes
202305134	Ben	glitch	innocents	yes
202305134	Duncan	randoman	innocents	yes
202305134	Ravs	innocent	innocents	yes
202305134	Pedguin	innocent	innocents	no
202305134	Zylus	hypnotist	traitors	yes
202305134	Kirsty	traitor	traitors	yes
202305134	Boba	traitor	traitors	yes
202305160	Lewis	traitor	traitors	yes
202305160	Ben	parasite	traitors	yes
202305160	Duncan	innocent	innocents	yes
202305160	Rythian	tracker	innocents	no
202305160	Zylus	shadow	none	yes
202305160	Kirsty	paramedic	innocents	yes
202305160	Zoey	innocent	innocents	yes
202305160	Nilesy	innocent	innocents	yes
202305161	Lewis	swapper	none	no
202305161	Ben	innocent	innocents	yes
202305161	Duncan	deputy	innocents	yes
202305161	Rythian	informant	traitors	yes
202305161	Zylus	innocent	innocents	yes
202305161	Kirsty	tracker	innocents	no
202305161	Zoey	shadow	none	yes
202305161	Nilesy	traitor	traitors	yes
202305162	Lewis	jester	jester	yes
202305162	Ben	impersonator	traitors	yes
202305162	Duncan	shadow	none	yes
202305162	Rythian	traitor	traitors	yes
202305162	Zylus	medium	innocents	no
202305162	Kirsty	innocent	innocents	yes
202305162	Zoey	innocent	innocents	no
202305162	Nilesy	veteran	innocents	no
202305163	Lewis	innocent	innocents	yes
202305163	Ben	parasite	traitors	yes
202305163	Duncan	drunk	none	yes
202305163	Rythian	clown	clown	yes
202305163	Zylus	innocent	innocents	yes
202305163	Kirsty	traitor	traitors	yes
202305163	Zoey	tracker	innocents	yes
202305163	Nilesy	veteran	innocents	yes
202305200	Lewis	clown	clown	yes
202305200	Ben	traitor	traitors	yes
202305200	Duncan	medium	innocents	no
202305200	Rythian	innocent	innocents	yes
202305200	Zylus	traitor	innocents	yes
202305200	Kirsty	paramedic	innocents	yes
202305200	Zoey	shadow	none	yes
202305200	Nilesy	innocent	innocents	yes
202305201	Lewis	shadow	none	yes
202305201	Ben	traitor	traitors	yes
202305201	Duncan	hypnotist	traitors	yes
202305201	Rythian	mad scientist	zombies	yes
202305201	Zylus	randoman	innocents	no
202305201	Kirsty	innocent	innocents	yes
202305201	Zoey	veteran	innocents	no
202305201	Nilesy	innocent	innocents	yes
202305202	Lewis	impersonator	traitors	no
202305202	Ben	shadow	none	yes
202305202	Duncan	glitch	innocents	yes
202305202	Rythian	randoman	innocents	yes
202305202	Zylus	innocent	innocents	yes
202305202	Kirsty	traitor	traitors	no
202305202	Zoey	clown	clown	yes
202305202	Nilesy	innocent	innocents	yes
202305203	Lewis	innocent	innocents	yes
202305203	Ben	shadow	none	yes
202305203	Duncan	veteran	innocents	yes
202305203	Rythian	traitor	traitors	yes
202305203	Zylus	impersonator	traitors	yes
202305203	Kirsty	medium	innocents	yes
202305203	Zoey	traitor	traitors	no
202305203	Nilesy	innocent	innocents	yes
202305204	Lewis	loot goblin	none	no
202305204	Ben	veteran	innocents	yes
202305204	Duncan	medium	innocents	yes
202305204	Rythian	summoner	traitors	yes
202305204	Zylus	innocent	innocents	yes
202305204	Kirsty	traitor	traitors	no
202305204	Zoey	beggar	traitors	no
202305204	Nilesy	innocent	innocents	yes
202305205	Lewis	innocent	innocents	no
202305205	Ben	innocent	innocents	yes
202305205	Duncan	innocent	innocents	yes
202305205	Rythian	innocent	innocents	yes
202305205	Zylus	traitor	traitors	yes
202305205	Kirsty	tracker	innocents	yes
202305205	Zoey	glitch	innocents	yes
202305205	Nilesy	traitor	traitors	yes
202210180	Lewis	glitch	innocents	no
202210180	Ben	traitor	traitors	yes
202210180	Boba	swapper	none	no
202210180	Pedguin	summoner	traitors	yes
202210180	Ravs	innocent	innocents	no
202210180	Gee	tracker	innocents	yes
202210180	Kirsty	innocent	innocents	no
202210181	Lewis	informant	innocents	yes
202210181	Ben	informant	traitors	yes
202210181	Boba	innocent	innocents	yes
202210181	Pedguin	randoman	innocents	no
202210181	Ravs	glitch	innocents	no
202210181	Gee	traitor	traitors	yes
202210181	Kirsty	loot goblin	none	yes
202210182	Lewis	innocent	innocents	yes
202210182	Ben	traitor	traitors	yes
202210182	Boba	innocent	innocents	yes
202210182	Pedguin	traitor	traitors	no
202210182	Ravs	innocent	innocents	yes
202210182	Gee	innocent	innocents	yes
202210182	Kirsty	innocent	innocents	yes
202210183	Lewis	paladin	innocents	no
202210183	Ben	innocent	innocents	yes
202210183	Boba	swapper	none	no
202210183	Pedguin	parasite	traitors	yes
202210183	Ravs	traitor	traitors	yes
202210183	Gee	innocent	innocents	yes
202210183	Kirsty	deputy	innocents	yes
202210184	Lewis	innocent	innocents	yes
202210184	Ben	innocent	innocents	yes
202210184	Boba	tracker	innocents	yes
202210184	Pedguin	deputy	innocents	yes
202210184	Ravs	loot goblin	none	yes
202210184	Gee	queen bee	bees	no
202210184	Kirsty	bee	bees	yes
202210150	Ben	traitor	traitors	no
202210150	Duncan	jester	jester	yes
202210150	Ravs	innocent	innocents	no
202210150	Rythian	paladin	innocents	yes
202210150	Zylus	informant	traitors	yes
202210150	Zoey	glitch	innocents	no
202210150	Kirsty	innocent	innocents	no
202210151	Ben	paramedic	innocents	yes
202210151	Duncan	informant	traitors	no
202210151	Ravs	innocent	innocents	yes
202210151	Rythian	innocent	innocents	yes
202210151	Zylus	tracker	innocents	yes
202210151	Zoey	traitor	traitors	no
202210151	Kirsty	jester	jester	no
202210152	Ben	innocent	innocents	yes
202210152	Duncan	traitor	traitors	yes
202210152	Ravs	innocent	innocents	no
202210152	Rythian	swapper	none	yes
202210152	Zylus	summoner	traitors	yes
202210152	Zoey	paramedic	innocents	yes
202210152	Kirsty	medium	innocents	no
202210153	Ben	tracker	innocents	no
202210153	Duncan	innocent	innocents	no
202210153	Ravs	traitor	traitors	yes
202210153	Rythian	paramedic	innocents	yes
202210153	Zylus	beggar	none	yes
202210153	Zoey	innocent	innocents	yes
202210153	Kirsty	parasite	traitors	yes
202210154	Ben	informant	traitors	yes
202210154	Duncan	glitch	innocents	no
202210154	Ravs	traitor	traitors	yes
202210154	Rythian	swapper	none	no
202210154	Zylus	tracker	innocents	no
202210154	Zoey	innocent	innocents	no
202210154	Kirsty	innocent	innocents	yes
202210155	Ben	impersonator	traitors	no
202210155	Duncan	turncoat	innocents	no
202210155	Ravs	traitor	traitors	no
202210155	Rythian	paladin	innocents	no
202210155	Zylus	innocent	innocents	no
202210155	Zoey	innocent	innocents	yes
202210155	Kirsty	jester	jester	yes
202210156	Ben	informant	traitors	no
202210156	Duncan	traitor	traitors	no
202210156	Ravs	innocent	innocents	yes
202210156	Rythian	innocent	innocents	yes
202210156	Zylus	loot goblin	none	yes
202210156	Zoey	randoman	innocents	yes
202210156	Kirsty	turncoat	innocents	yes
202305230	Lewis	impersonator	traitors	no
202305230	Ben	innocent	innocents	yes
202305230	Duncan	paramedic	innocents	no
202305230	Pedguin	paladin	innocents	no
202305230	Rythian	traitor	traitors	no
202305230	Boba	jester	jester	yes
202305230	Nilesy	innocent	innocents	no
202305231	Lewis	traitor	traitors	yes
202305231	Ben	clown	clown	yes
202305231	Duncan	paladin	innocents	yes
202305231	Pedguin	innocent	innocents	no
202305231	Rythian	innocent	innocents	no
202305231	Boba	summoner	traitors	yes
202305231	Nilesy	paramedic	innocents	yes
202305232	Lewis	innocent	innocents	no
202305232	Ben	glitch	innocents	yes
202305232	Duncan	traitor	traitors	yes
202305232	Pedguin	parasite	traitors	yes
202305232	Rythian	innocent	innocents	yes
202305232	Boba	drunk	none	yes
202305232	Nilesy	paladin	innocents	yes
202305233	Lewis	randoman	innocents	yes
202305233	Ben	deputy	innocents	yes
202305233	Duncan	hypnotist	traitors	no
202305233	Pedguin	shadow	none	yes
202305233	Rythian	innocent	innocents	yes
202305233	Boba	traitor	traitors	yes
202305233	Nilesy	innocent	innocents	yes
202305234	Lewis	traitor	traitors	yes
202305234	Ben	parasite	traitors	yes
202305234	Duncan	innocent	innocents	no
202305234	Pedguin	beggar	none	no
202305234	Rythian	innocent	innocents	yes
202305234	Boba	randoman	innocents	yes
202305234	Nilesy	veteran	innocents	no
202305235	Lewis	traitor	traitors	yes
202305235	Ben	traitor	traitors	yes
202305235	Duncan	innocent	innocents	yes
202305235	Pedguin	paladin	innocents	no
202305235	Rythian	innocent	innocents	no
202305235	Boba	glitch	innocents	no
202305235	Nilesy	traitor	traitors	yes
202305270	Lewis	shadow	none	yes
202305270	Ben	traitor	traitors	yes
202305270	Duncan	innocent	innocents	no
202305270	Pedguin	deputy	innocents	yes
202305270	Rythian	hypnotist	traitors	yes
202305270	Boba	medium	innocents	yes
202305270	Nilesy	innocent	innocents	yes
202305271	Lewis	medium	innocents	yes
202305271	Ben	glitch	innocents	yes
202305271	Duncan	beggar	traitors	no
202305271	Pedguin	innocent	innocents	yes
202305271	Rythian	innocent	innocents	yes
202305271	Boba	traitor	traitors	no
202305271	Nilesy	summoner	traitors	yes
202305272	Lewis	marshal	innocents	yes
202305272	Ben	shadow	none	yes
202305272	Duncan	traitor	traitors	yes
202305272	Pedguin	glitch	innocents	yes
202305272	Rythian	impersonator	traitors	no
202305272	Boba	innocent	innocents	yes
202305272	Nilesy	innocent	innocents	yes
202305273	Lewis	traitor	traitors	no
202305273	Ben	innocent	innocents	yes
202305273	Duncan	parasite	traitors	yes
202305273	Pedguin	innocent	innocents	yes
202305273	Rythian	mad scientist	zombies	yes
202305273	Boba	glitch	innocents	yes
202305273	Nilesy	randoman	innocents	yes
202305274	Lewis	shadow	none	yes
202305274	Ben	traitor	traitors	yes
202305274	Duncan	summoner	traitors	no
202305274	Pedguin	medium	innocents	yes
202305274	Rythian	innocent	innocents	yes
202305274	Boba	innocent	innocents	yes
202305274	Nilesy	veteran	innocents	yes
202305275	Lewis	innocent	innocents	yes
202305275	Ben	shadow	none	yes
202305275	Duncan	informant	traitors	yes
202305275	Pedguin	innocent	innocents	no
202305275	Rythian	veteran	innocents	no
202305275	Boba	traitor	traitors	yes
202305275	Nilesy	marshal	innocents	yes
202305276	Lewis	shadow	none	no
202305276	Ben	medium	innocents	no
202305276	Duncan	glitch	innocents	yes
202305276	Pedguin	summoner	traitors	yes
202305276	Rythian	traitor	traitors	yes
202305276	Boba	innocent	innocents	yes
202305276	Nilesy	innocent	innocents	no
202305300	Lewis	informant	traitors	no
202305300	Duncan	loot goblin	none	no
202305300	Ravs	paramedic	innocents	yes
202305300	Rythian	shadow	none	no
202305300	Zylus	innocent	innocents	yes
202305300	Kirsty	innocent	innocents	yes
202305300	Zoey	marshal	innocents	yes
202305300	Nilesy	traitor	traitors	yes
202305301	Lewis	impersonator	traitors	yes
202305301	Duncan	medium	innocents	yes
202305301	Ravs	traitor	traitors	yes
202305301	Rythian	shadow	none	yes
202305301	Zylus	innocent	innocents	yes
202305301	Kirsty	innocent	innocents	yes
202305301	Zoey	veteran	innocents	no
202305301	Nilesy	clown	clown	yes
202305302	Lewis	loot goblin	none	yes
202305302	Duncan	innocent	innocents	yes
202305302	Ravs	traitor	traitors	no
202305302	Rythian	glitch	innocents	yes
202305302	Zylus	informant	traitors	yes
202305302	Kirsty	innocent	innocents	yes
202305302	Zoey	innocent	innocents	yes
202305302	Nilesy	paladin	innocents	yes
202305303	Lewis	innocent	innocents	yes
202305303	Duncan	shadow	none	yes
202305303	Ravs	innocent	innocents	yes
202305303	Rythian	hypnotist	traitors	yes
202305303	Zylus	clown	clown	yes
202305303	Kirsty	glitch	innocents	no
202305303	Zoey	tracker	innocents	yes
202305303	Nilesy	traitor	traitors	yes
202305304	Lewis	traitor	traitors	no
202305304	Duncan	beggar	traitors	no
202305304	Ravs	glitch	innocents	yes
202305304	Rythian	impersonator	traitors	no
202305304	Zylus	innocent	innocents	yes
202305304	Kirsty	randoman	innocents	yes
202305304	Zoey	innocent	innocents	yes
202305304	Nilesy	shadow	innocents	yes
202210110	Ben	beggar	none	no
202210110	Duncan	innocent	innocents	yes
202210110	Ravs	hypnotist	traitors	yes
202210110	Rythian	turncoat	innocents	yes
202210110	Zylus	innocent	innocents	yes
202210110	Zoey	traitor	traitors	no
202210110	Kirsty	tracker	innocents	yes
202210111	Ben	innocent	innocents	no
202210111	Duncan	hypnotist	traitors	yes
202210111	Ravs	randoman	innocents	yes
202210111	Rythian	innocent	innocents	no
202210111	Zylus	traitor	traitors	yes
202210111	Zoey	clown	clown	yes
202210111	Kirsty	veteran	innocents	yes
202210112	Ben	jester	jester	yes
202210112	Duncan	innocent	innocents	yes
202210112	Ravs	tracker	innocents	yes
202210112	Rythian	informant	innocents	yes
202210112	Zylus	glitch	innocents	yes
202210112	Zoey	traitor	traitors	no
202210112	Kirsty	hypnotist	traitors	no
202210113	Ben	tracker	innocents	yes
202210113	Duncan	innocent	innocents	yes
202210113	Ravs	innocent	innocents	no
202210113	Rythian	traitor	traitors	yes
202210113	Zylus	summoner	traitors	yes
202210113	Zoey	veteran	innocents	yes
202210113	Kirsty	beggar	traitors	yes
202306030	Lewis	summoner	traitors	yes
202306030	Duncan	paramedic	innocents	yes
202306030	Nilesy	innocent	innocents	yes
202306030	Ravs	innocent	innocents	no
202306030	Rythian	traitor	traitors	no
202306030	Kirsty	shadow	none	yes
202306030	Zylus	jester	jester	yes
202306030	Zoey	innocent	innocents	yes
202306031	Lewis	zombie	zombies	no
202306031	Duncan	informant	traitors	yes
202306031	Nilesy	clowntective	clown	yes
202306031	Ravs	traitor	traitors	yes
202306031	Rythian	zombie	zombies	no
202306031	Kirsty	veteran	innocents	yes
202306031	Zylus	marshal	innocents	no
202306031	Zoey	mad scientist	zombies	no
202306032	Lewis	traitor	traitors	yes
202306032	Duncan	innocent	innocents	no
202306032	Nilesy	parasite	traitors	yes
202306032	Ravs	paladin	innocents	yes
202306032	Rythian	glitch	innocents	yes
202306032	Kirsty	swapper	none	no
202306032	Zylus	shadow	none	yes
202306032	Zoey	innocent	innocents	yes
202306033	Lewis	loot goblin	none	no
202306033	Duncan	innocent	innocents	no
202306033	Nilesy	traitor	traitors	yes
202306033	Ravs	glitch	innocents	yes
202306033	Rythian	clown	clown	yes
202306033	Kirsty	summoner	traitors	yes
202306033	Zylus	tracker	innocents	yes
202306033	Zoey	innocent	innocents	yes
202210080	Ben	innocent	innocents	no
202210080	Duncan	randoman	innocents	yes
202210080	Ravs	traitor	traitors	yes
202210080	Pedguin	innocent	innocents	yes
202210080	Kirsty	informant	traitors	yes
202210080	Osie	innocent	innocents	yes
202210080	Boba	turncoat	innocents	yes
202210081	Ben	veteran	innocents	no
202210081	Duncan	innocent	innocents	yes
202210081	Ravs	tracker	innocents	no
202210081	Pedguin	innocent	innocents	no
202210081	Kirsty	traitor	traitors	yes
202210081	Osie	jester	jester	no
202210081	Boba	parasite	traitors	yes
202210082	Ben	medium	innocents	no
202210082	Duncan	innocent	innocents	no
202210082	Ravs	innocent	innocents	no
202210082	Pedguin	glitch	innocents	no
202210082	Kirsty	summoner	traitors	yes
202210082	Boba	traitor	traitors	yes
202210082	Osie	drunk	none	yes
202210083	Ben	zombie	zombies	yes
202210083	Duncan	mad scientist	zombies	yes
202210083	Ravs	zombie	zombies	yes
202210083	Pedguin	parasite	traitors	no
202210083	Kirsty	innocent	innocents	yes
202210083	Osie	innocent	innocents	yes
202210083	Boba	zombie	zombies	yes
202210084	Ben	traitor	traitors	yes
202210084	Duncan	hypnotist	traitors	no
202210084	Ravs	innocent	innocents	yes
202210084	Kirsty	innocent	innocents	yes
202210084	Osie	tracker	innocents	yes
202210084	Boba	glitch	innocents	yes
202210084	Pedguin	loot goblin	none	no
202210040	Ben	traitor	traitors	no
202210040	Duncan	informant	traitors	yes
202210040	Ravs	innocent	innocents	yes
202210040	Pedguin	innocent	innocents	yes
202210040	Kirsty	innocent	innocents	yes
202210040	Osie	glitch	innocents	yes
202210040	Boba	randoman	innocents	yes
202210041	Ben	glitch	innocents	yes
202210041	Duncan	tracker	innocents	no
202210041	Ravs	innocent	innocents	yes
202210041	Pedguin	traitor	traitors	yes
202210041	Kirsty	informant	traitors	yes
202210041	Osie	innocent	innocents	yes
202210041	Boba	innocent	innocents	yes
202210042	Ben	traitor	traitors	yes
202210042	Duncan	traitor	traitors	yes
202210042	Ravs	innocent	innocents	yes
202210042	Pedguin	randoman	innocents	no
202210042	Kirsty	hypnotist	traitors	yes
202210042	Osie	innocent	innocents	yes
202210042	Boba	deputy	innocents	yes
202210043	Ben	zombie	zombies	yes
202210043	Duncan	innocent	innocents	yes
202210043	Ravs	innocent	innocents	yes
202210043	Pedguin	mad scientist	zombies	yes
202210043	Kirsty	traitor	traitors	yes
202210043	Osie	paladin	innocents	no
202210043	Boba	hypnotist	traitors	yes
202210010	Lewis	innocent	innocents	yes
202210010	Ben	beggar	none	yes
202210010	Osie	traitor	traitors	yes
202210010	Kirsty	informant	traitors	no
202210010	Zoey	paladin	innocents	yes
202210010	Rythian	turncoat	innocents	yes
202210010	Zylus	innocent	innocents	yes
202210011	Lewis	parasite	traitors	yes
202210011	Ben	randoman	innocents	no
202210011	Osie	traitor	traitors	yes
202210011	Kirsty	loot goblin	none	yes
202210011	Zoey	glitch	innocents	no
202210011	Rythian	innocent	innocents	yes
202210011	Zylus	innocent	innocents	yes
202210012	Lewis	innocent	innocents	yes
202210012	Ben	deputy	innocents	yes
202210012	Osie	traitor	traitors	no
202210012	Kirsty	innocent	innocents	yes
202210012	Zoey	hypnotist	traitors	no
202210012	Rythian	tracker	innocents	yes
202210012	Zylus	traitor	traitors	no
202210013	Lewis	traitor	traitors	yes
202210013	Ben	informant	traitors	no
202210013	Osie	tracker	innocents	yes
202210013	Kirsty	innocent	innocents	yes
202210013	Zoey	innocent	innocents	yes
202210013	Rythian	jester	jester	no
202210013	Zylus	veteran	innocents	yes
202210014	Lewis	loot goblin	none	no
202210014	Ben	parasite	traitors	no
202210014	Osie	innocent	innocents	yes
202210014	Kirsty	randoman	innocents	yes
202210014	Zoey	innocent	innocents	yes
202210014	Rythian	traitor	traitors	no
202210014	Zylus	deputy	innocents	no
202306060	Lewis	innocent	innocents	yes
202209270	Lewis	jester	jester	yes
202209270	Ben	innocent	innocents	yes
202209270	Osie	summoner	traitors	yes
202209270	Kirsty	innocent	innocents	yes
202209270	Zoey	veteran	innocents	yes
202306060	Duncan	shadow	none	yes
202306060	Ravs	glitch	innocents	yes
202306060	Rythian	traitor	traitors	no
202306060	Zylus	beggar	innocents	yes
202306060	Kirsty	informant	traitors	yes
202306060	Zoey	paladin	innocents	yes
202306060	Nilesy	innocent	innocents	yes
202306061	Lewis	shadow	none	yes
202306061	Duncan	tracker	innocents	no
202306061	Ravs	traitor	traitors	yes
202306061	Rythian	innocent	innocents	yes
202306061	Zylus	glitch	innocents	no
202306061	Kirsty	impersonator	traitors	yes
202306061	Zoey	traitor	traitors	yes
202306061	Nilesy	beggar	innocents	no
202306062	Lewis	paladin	innocents	no
202306062	Duncan	traitor	traitors	yes
202306062	Ravs	innocent	innocents	yes
202306062	Rythian	shadow	innocents	yes
202306062	Zylus	innocent	innocents	no
202306062	Kirsty	innocent	innocents	no
202306062	Zoey	glitch	innocents	yes
202306062	Nilesy	impersonator	traitors	yes
202306100	Lewis	shadow	none	yes
202306100	Ben	medium	innocents	yes
202306100	Duncan	innocent	innocents	yes
202306100	Rythian	innocent	innocents	yes
202306100	Zylus	traitor	traitors	no
202306100	Zoey	traitor	traitors	no
202306100	Nilesy	informant	traitors	yes
202306100	Daltos	veteran	innocents	yes
202306101	Lewis	veteran	innocents	yes
202306101	Ben	summoner	traitors	yes
202306101	Duncan	randoman	innocents	no
202306101	Rythian	innocent	innocents	yes
202306101	Zylus	traitor	traitors	yes
202306101	Zoey	clown	clown	yes
202306101	Nilesy	shadow	none	yes
202306101	Daltos	innocent	innocents	yes
202306102	Lewis	paladin	innocents	no
202306102	Ben	informant	traitors	yes
202306102	Duncan	veteran	innocents	no
202306102	Rythian	beggar	none	no
202306102	Zylus	innocent	innocents	yes
202306102	Zoey	innocent	innocents	no
202306102	Nilesy	shadow	none	yes
202306102	Daltos	traitor	traitors	yes
202306103	Lewis	randoman	innocents	yes
202306103	Ben	mad scientist	zombies	yes
202306103	Duncan	zombie	zombies	yes
202306103	Rythian	zombie	zombies	no
202306103	Zylus	zombie	zombies	yes
202306103	Zoey	innocent	innocents	yes
202306103	Nilesy	parasite	traitors	yes
202306103	Daltos	zombie	zombies	no
202306104	Lewis	informant	traitors	no
202306104	Ben	medium	innocents	yes
202306104	Duncan	innocent	innocents	yes
202306104	Rythian	traitor	traitors	yes
202306104	Zylus	shadow	none	yes
202306104	Zoey	glitch	innocents	yes
202306104	Nilesy	innocent	innocents	yes
202306104	Daltos	innocent	innocents	yes
202306132	Lewis	shadow	none	yes
202306132	Ben	innocent	innocents	yes
202306132	Duncan	innocent	innocents	yes
202306132	Rythian	traitor	traitors	no
202306132	Zylus	glitch	innocents	yes
202306132	Zoey	clown	clown	yes
202306132	Nilesy	medium	innocents	yes
202306132	Daltos	informant	traitors	yes
202306133	Lewis	medium	innocents	yes
202306133	Ben	traitor	traitors	yes
202306133	Duncan	summoner	traitors	yes
202306133	Rythian	innocent	innocents	no
202306133	Zylus	drunk	none	yes
202306133	Zoey	shadow	none	yes
202306133	Nilesy	glitch	innocents	yes
202306133	Daltos	innocent	innocents	yes
202209270	Rythian	traitor	traitors	no
202209270	Zylus	randoman	innocents	no
202209271	Lewis	traitor	traitors	yes
202209271	Ben	summoner	traitors	yes
202209271	Osie	tracker	innocents	yes
202209271	Kirsty	glitch	innocents	yes
202209271	Zoey	innocent	innocents	no
202209271	Rythian	innocent	innocents	yes
202209271	Zylus	clown	clown	yes
202209272	Lewis	mad scientist	zombies	yes
202209272	Ben	innocent	innocents	yes
202209272	Osie	traitor	traitors	yes
202209272	Kirsty	deputy	innocents	no
202209272	Zoey	innocent	innocents	yes
202209272	Rythian	zombie	zombies	yes
202209272	Zylus	zombie	zombies	yes
202209273	Lewis	deputy	innocents	yes
202209273	Ben	paladin	innocents	yes
202209273	Osie	clown	clown	yes
202209273	Kirsty	innocent	innocents	yes
202209273	Zoey	innocent	innocents	yes
202209273	Rythian	informant	traitors	yes
202209273	Zylus	traitor	traitors	no
202209274	Lewis	loot goblin	none	yes
202209274	Ben	summoner	traitors	no
202209274	Osie	paladin	innocents	yes
202209274	Kirsty	innocent	innocents	yes
202209274	Zoey	traitor	traitors	yes
202209274	Rythian	innocent	innocents	yes
202209274	Zylus	turncoat	traitors	yes
202209275	Lewis	traitor	traitors	no
202209275	Ben	innocent	innocents	yes
202209275	Osie	informant	traitors	no
202209275	Kirsty	turncoat	innocents	yes
202209275	Zoey	medium	innocents	yes
202209275	Rythian	innocent	innocents	yes
202209275	Zylus	loot goblin	none	yes
202209240	Lewis	parasite	traitors	yes
202209240	Ben	traitor	traitors	no
202209240	Osie	swapper	none	no
202209240	Kirsty	paramedic	innocents	yes
202209240	Zoey	innocent	innocents	yes
202209240	Rythian	innocent	innocents	yes
202209240	Zylus	paladin	innocents	yes
202209241	Lewis	innocent	innocents	yes
202209241	Ben	traitor	traitors	yes
202209241	Osie	tracker	innocents	no
202209241	Kirsty	innocent	innocents	yes
202209241	Zoey	impersonator	traitors	yes
202209241	Rythian	turncoat	innocents	no
202209241	Zylus	mad scientist	zombies	yes
202209242	Lewis	mad scientist	zombies	yes
202209242	Ben	summoner	traitors	no
202209242	Osie	innocent	innocents	yes
202209242	Kirsty	innocent	innocents	yes
202209242	Zoey	traitor	traitors	no
202209242	Rythian	randoman	innocents	yes
202209242	Zylus	glitch	innocents	yes
202209243	Lewis	summoner	traitors	no
202209243	Ben	innocent	innocents	yes
202209243	Osie	loot goblin	none	no
202209243	Kirsty	randoman	innocents	yes
202209243	Zoey	veteran	innocents	yes
202209243	Rythian	innocent	innocents	yes
202209243	Zylus	traitor	traitors	no
202209244	Lewis	traitor	traitors	yes
202209244	Ben	summoner	traitors	yes
202209244	Osie	randoman	innocents	yes
202209244	Kirsty	deputy	innocents	yes
202209244	Zoey	innocent	innocents	no
202209244	Rythian	innocent	innocents	no
202209244	Zylus	swapper	none	no
202306130	Lewis	veteran	innocents	no
202306130	Ben	innocent	innocents	yes
202306130	Duncan	tracker	innocents	yes
202306130	Rythian	clown	clown	yes
202306130	Zylus	informant	traitors	yes
202306130	Zoey	innocent	innocents	yes
202306130	Nilesy	shadow	none	yes
202306130	Daltos	traitor	traitors	yes
202306131	Lewis	glitch	innocents	yes
202306131	Ben	drunk	none	yes
202306131	Duncan	summoner	traitors	yes
202306131	Rythian	mad scientist	zombies	yes
202306131	Zylus	paladin	innocents	yes
202306131	Zoey	innocent	innocents	yes
202306131	Nilesy	innocent	innocents	yes
202306131	Daltos	traitor	traitors	no
202306170	Lewis	innocent	innocents	yes
202306170	Ben	summoner	traitors	yes
202306170	Duncan	medium	innocents	no
202306170	Rythian	loot goblin	none	yes
202306170	Zylus	traitor	traitors	yes
202306170	Zoey	veteran	innocents	yes
202306170	Nilesy	innocent	innocents	yes
202306170	Daltos	traitor	traitors	yes
202306171	Lewis	veteran	innocents	no
202306171	Ben	summoner	traitors	yes
202306171	Duncan	mad scientist	zombies	yes
202306171	Rythian	shadow	none	yes
202306171	Zylus	innocent	innocents	yes
202306171	Zoey	innocent	innocents	yes
202306171	Nilesy	paladin	innocents	no
202306171	Daltos	traitor	traitors	yes
202306172	Lewis	beggar	traitors	yes
202306172	Ben	summoner	traitors	no
202306172	Duncan	traitor	traitors	no
202306172	Rythian	veteran	innocents	yes
202306172	Zylus	swapper	none	no
202306172	Zoey	innocent	innocents	yes
202306172	Nilesy	tracker	innocents	yes
202306172	Daltos	innocent	innocents	yes
202306173	Lewis	mad scientist	zombies	yes
202306173	Ben	marshal	innocents	yes
202306173	Duncan	zombie	zombies	no
202306173	Rythian	zombie	zombies	no
202306173	Zylus	zombie	zombies	no
202306173	Zoey	zombie	zombies	no
202306173	Nilesy	innocent	innocents	yes
202306173	Daltos	zombie	zombies	yes
202306174	Lewis	traitor	traitors	yes
202306174	Ben	innocent	innocents	yes
202306174	Duncan	innocent	innocents	yes
202306174	Rythian	beggar	traitors	no
202306174	Zylus	deputy	innocents	yes
202306174	Zoey	innocent	innocents	yes
202306174	Nilesy	randoman	innocents	yes
202306174	Daltos	informant	traitors	no
202306175	Lewis	medium	innocents	no
202306175	Ben	innocent	innocents	no
202306175	Duncan	beggar	innocents	no
202306175	Rythian	traitor	traitors	yes
202306175	Zylus	hypnotist	traitors	yes
202306175	Zoey	innocent	innocents	no
202306175	Nilesy	veteran	innocents	no
202306175	Daltos	jester	jester	no
202306176	Lewis	mad scientist	zombies	yes
202306176	Ben	deputy	innocents	yes
202306176	Duncan	innocent	innocents	yes
202306176	Rythian	informant	traitors	no
202306176	Zylus	traitor	traitors	no
202306176	Zoey	shadow	none	no
202306176	Nilesy	innocent	innocents	yes
202306176	Daltos	randoman	innocents	yes
202306200	Lewis	innocent	innocents	yes
202306200	Ben	innocent	innocents	yes
202306200	Duncan	mad scientist	zombies	yes
202306200	Rythian	parasite	traitors	no
202306200	Zylus	traitor	traitors	no
202306200	Zoey	clowntective	clown	yes
202306200	Nilesy	glitch	innocents	yes
202306200	Daltos	marshal	innocents	yes
202306201	Lewis	parasite	traitors	no
202306201	Ben	innocent	innocents	yes
202306201	Duncan	traitor	traitors	no
202306201	Rythian	innocent	innocents	yes
202306201	Zylus	drunk	none	yes
202306201	Zoey	mad scientist	zombies	yes
202306201	Nilesy	paladin	innocents	yes
202306201	Daltos	veteran	innocents	yes
202306202	Lewis	traitor	traitors	yes
202306202	Ben	shadow	none	yes
202306202	Duncan	tracker	innocents	no
202306202	Rythian	veteran	innocents	no
202306202	Zylus	innocent	innocents	yes
202306202	Zoey	informant	traitors	yes
202306202	Nilesy	jester	jester	no
202306202	Daltos	innocent	innocents	yes
202306203	Lewis	traitor	traitors	yes
202306203	Ben	informant	traitors	yes
202306203	Duncan	glitch	innocents	no
202306203	Rythian	innocent	innocents	no
202306203	Zylus	mad scientist	zombies	yes
202306203	Zoey	innocent	innocents	no
202306203	Nilesy	shadow	none	no
202306203	Daltos	paladin	innocents	no
202306204	Lewis	veteran	innocents	yes
202306204	Ben	traitor	traitors	no
202306204	Duncan	marshal	innocents	yes
202306204	Rythian	traitor	traitors	yes
202306204	Zylus	innocent	innocents	yes
202306204	Zoey	innocent	innocents	yes
202306204	Nilesy	loot goblin	none	yes
202306204	Daltos	summoner	traitors	no
202306205	Lewis	innocent	innocents	no
202306205	Ben	glitch	innocents	yes
202306205	Duncan	shadow	none	yes
202306205	Rythian	paladin	innocents	yes
202306205	Zylus	summoner	traitors	yes
202306205	Zoey	traitor	traitors	yes
202306205	Nilesy	innocent	innocents	yes
202306205	Daltos	clown	clown	yes
202306220	Lewis	innocent	innocents	yes
202306220	Ben	veteran	innocents	yes
202306220	Duncan	impersonator	traitors	yes
202306220	Ravs	shadow	none	yes
202306220	Zylus	innocent	innocents	no
202306220	Osie	innocent	innocents	no
202306220	Kirsty	tracker	innocents	no
202306220	Nilesy	traitor	traitors	yes
202306221	Lewis	traitor	traitors	no
202306221	Ben	paladin	innocents	yes
202306221	Duncan	innocent	innocents	yes
202306221	Ravs	veteran	innocents	yes
202306221	Zylus	informant	traitors	yes
202306221	Osie	loot goblin	none	yes
202306221	Kirsty	innocent	innocents	yes
202306221	Nilesy	shadow	none	yes
202306222	Lewis	innocent	innocents	no
202306222	Ben	innocent	innocents	yes
202306222	Duncan	informant	traitors	yes
202306222	Ravs	mad scientist	zombies	yes
202306222	Zylus	zombie	zombies	yes
202306222	Osie	deputy	innocents	yes
202306222	Kirsty	traitor	traitors	yes
202306222	Nilesy	marshal	innocents	yes
202306223	Lewis	jester	jester	no
202306223	Ben	jester	jester	no
202306223	Duncan	jester	jester	no
202306223	Ravs	jester	jester	no
202306223	Zylus	jester	jester	no
202306223	Osie	traitor	traitors	no
202306223	Kirsty	jester	jester	no
202306223	Nilesy	jester	jester	no
202306240	Ben	veteran	innocents	yes
202306240	Duncan	loot goblin	none	yes
202306240	Rythian	marshal	innocents	yes
202306240	Zylus	hypnotist	traitors	no
202306240	Pedguin	traitor	traitors	no
202306240	Kirsty	traitor	traitors	no
202306240	Nilesy	innocent	innocents	yes
202306241	Ben	innocent	innocents	yes
202306241	Duncan	innocent	innocents	yes
202306241	Rythian	traitor	traitors	no
202306241	Zylus	parasite	traitors	yes
202306241	Pedguin	paramedic	innocents	yes
202306241	Kirsty	randoman	innocents	yes
202306241	Nilesy	loot goblin	none	yes
202306242	Ben	traitor	traitors	no
202306242	Duncan	shadow	none	yes
202306242	Rythian	paramedic	innocents	yes
202306242	Zylus	innocent	innocents	yes
202306242	Pedguin	parasite	traitors	no
202306242	Kirsty	tracker	innocents	yes
202306242	Nilesy	innocent	innocents	yes
202306243	Ben	innocent	innocents	yes
202306243	Duncan	loot goblin	none	yes
202306243	Rythian	randoman	innocents	yes
202306243	Zylus	informant	traitors	no
202306243	Pedguin	traitor	traitors	no
202306243	Kirsty	innocent	innocents	no
202306243	Nilesy	paramedic	innocents	no
202209200	Lewis	traitor	traitors	no
202209200	Ben	turncoat	traitors	no
202209200	Duncan	tracker	innocents	yes
202209200	Ravs	loot goblin	none	no
202209200	Rythian	innocent	innocents	yes
202209200	Zylus	innocent	innocents	yes
202209200	Lolip	parasite	traitors	no
202209201	Lewis	paladin	innocents	no
202209201	Ben	glitch	innocents	yes
202209201	Duncan	innocent	innocents	no
202209201	Ravs	innocent	innocents	yes
202209201	Rythian	mad scientist	zombies	yes
202209201	Zylus	parasite	traitors	yes
202209201	Lolip	traitor	traitors	yes
202209202	Lewis	impersonator	traitors	yes
202209202	Ben	impersonator	traitors	yes
202209202	Duncan	deputy	innocents	no
202209202	Ravs	deputy	innocents	yes
202209202	Rythian	tracker	innocents	no
202209202	Zylus	deputy	innocents	yes
202209202	Lolip	beggar	traitors	yes
202209203	Lewis	glitch	innocents	yes
202209203	Ben	innocent	innocents	yes
202209203	Duncan	medium	innocents	yes
202209203	Ravs	informant	traitors	yes
202209203	Rythian	innocent	innocents	yes
202209203	Zylus	clown	clown	yes
202209203	Lolip	traitor	traitors	no
202306280	Ben	innocent	innocents	yes
202306280	Duncan	shadow	none	yes
202306280	Rythian	innocent	innocents	yes
202306280	Zylus	randoman	innocents	yes
202306280	Pedguin	informant	traitors	yes
202306280	Kirsty	paramedic	innocents	yes
202306280	Nilesy	traitor	traitors	no
202306281	Ben	traitor	traitors	yes
202306281	Duncan	tracker	innocents	no
202306281	Rythian	innocent	innocents	no
202306281	Zylus	paramedic	innocents	yes
202306281	Pedguin	loot goblin	none	no
202306281	Kirsty	innocent	innocents	no
202306281	Nilesy	summoner	traitors	yes
202306282	Ben	deputy	innocents	yes
202306282	Duncan	traitor	traitors	no
202306282	Rythian	beggar	none	no
202306282	Zylus	randoman	innocents	yes
202306282	Pedguin	innocent	innocents	yes
202306282	Kirsty	informant	traitors	yes
202306282	Nilesy	innocent	innocents	yes
202306283	Ben	innocent	innocents	yes
202306283	Duncan	innocent	innocents	yes
202306283	Rythian	tracker	innocents	yes
202306283	Zylus	swapper	none	no
202306283	Pedguin	veteran	innocents	no
202306283	Kirsty	traitor	traitors	yes
202306283	Nilesy	informant	traitors	yes
202306284	Ben	summoner	traitors	yes
202306284	Duncan	glitch	innocents	yes
202306284	Rythian	paladin	innocents	yes
202306284	Zylus	innocent	innocents	no
202306284	Pedguin	traitor	traitors	no
202306284	Kirsty	innocent	innocents	yes
202306284	Nilesy	innocent	innocents	yes
202306290	Lewis	innocent	innocents	yes
202306290	Ben	traitor	traitors	no
202306290	Duncan	traitor	traitors	yes
202306290	Kirsty	innocent	innocents	yes
202306290	Zoey	innocent	innocents	yes
202306290	Nilesy	innocent	innocents	yes
202306290	Lolip	paladin	innocents	yes
202306290	Daltos	innocent	innocents	yes
202306291	Lewis	paladin	innocents	no
202306291	Ben	jester	jester	no
202306291	Duncan	jester	jester	no
202306291	Kirsty	jester	jester	no
202306291	Zoey	jester	jester	no
202306291	Nilesy	jester	jester	yes
202306291	Lolip	traitor	traitors	no
202306291	Daltos	jester	jester	no
202306292	Lewis	glitch	innocents	yes
202306292	Ben	beggar	none	yes
202306292	Duncan	parasite	traitors	no
202306292	Kirsty	loot goblin	none	yes
202306292	Zoey	paladin	innocents	yes
202306292	Nilesy	innocent	innocents	yes
202306292	Lolip	traitor	traitors	no
202306292	Daltos	innocent	innocents	yes
202306293	Lewis	paladin	innocents	yes
202306293	Ben	glitch	innocents	yes
202306293	Duncan	beggar	innocents	no
202306293	Kirsty	innocent	innocents	yes
202306293	Zoey	innocent	innocents	no
202306293	Nilesy	innocent	innocents	yes
202306293	Lolip	traitor	traitors	yes
202306293	Daltos	impersonator	traitors	yes
202306294	Lewis	beggar	traitors	yes
202306294	Ben	innocent	innocents	yes
202306294	Duncan	innocent	innocents	yes
202306294	Kirsty	traitor	traitors	yes
202306294	Zoey	randoman	innocents	yes
202306294	Nilesy	summoner	traitors	no
202306294	Lolip	jester	jester	yes
202306294	Daltos	veteran	innocents	no
202306295	Lewis	traitor	traitors	no
202306295	Ben	randoman	innocents	yes
202306295	Duncan	randoman	innocents	yes
202306295	Kirsty	traitor	traitors	yes
202306295	Zoey	traitor	traitors	no
202306295	Nilesy	traitor	traitors	no
202306295	Lolip	randoman	innocents	yes
202306295	Daltos	traitor	traitors	no
202307010	Lewis	innocent	innocents	yes
202307010	Ben	traitor	traitors	no
202307010	Duncan	parasite	traitors	no
202307010	Kirsty	deputy	innocents	yes
202307010	Zoey	marshal	innocents	yes
202307010	Nilesy	innocent	innocents	yes
202307010	Daltos	loot goblin	none	no
202307010	Lolip	jester	jester	no
202307011	Lewis	traitor	traitors	no
202307011	Ben	shadow	none	yes
202307011	Duncan	summoner	traitors	yes
202307011	Kirsty	glitch	innocents	yes
202307011	Zoey	innocent	innocents	yes
202307011	Nilesy	innocent	innocents	yes
202307011	Daltos	medium	innocents	yes
202307011	Lolip	traitor	traitors	yes
202307012	Lewis	randoman	innocents	yes
202307012	Ben	loot goblin	none	yes
202307012	Duncan	innocent	innocents	yes
202307012	Kirsty	traitor	traitors	no
202307012	Zoey	innocent	innocents	yes
202307012	Nilesy	veteran	innocents	yes
202307012	Daltos	informant	traitors	no
202307012	Lolip	swapper	none	yes
202307013	Lewis	traitor	traitors	yes
202307013	Ben	glitch	innocents	no
202307013	Duncan	parasite	traitors	yes
202307013	Kirsty	beggar	none	no
202307013	Zoey	innocent	innocents	no
202307013	Nilesy	innocent	innocents	yes
202307013	Daltos	mad scientist	zombies	yes
202307013	Lolip	randoman	innocents	no
202307042	Lewis	beggar	traitors	no
202307042	Ben	innocent	innocents	yes
202307042	Duncan	summoner	traitors	no
202307042	Kirsty	traitor	traitors	no
202307042	Zoey	jester	jester	no
202307042	Nilesy	paramedic	innocents	yes
202307042	Lolip	tracker	innocents	yes
202307042	Daltos	innocent	innocents	yes
202307043	Lewis	innocent	innocents	yes
202307043	Ben	impersonator	traitors	no
202307043	Duncan	innocent	innocents	yes
202307043	Kirsty	beggar	none	no
202307043	Zoey	veteran	innocents	yes
202307043	Nilesy	innocent	innocents	yes
202307043	Lolip	traitor	traitors	no
202307043	Daltos	tracker	innocents	yes
202307061	Ben	zombie	zombies	no
202307061	Duncan	mad scientist	zombies	no
202307061	Rythian	zombie	zombies	yes
202307061	Zylus	marshal	innocents	yes
202307061	Zoey	innocent	innocents	yes
202307061	Kirsty	glitch	innocents	yes
202307061	Nilesy	innocent	innocents	yes
202307061	Breeh	informant	traitors	yes
202307064	Ben	informant	traitors	yes
202307064	Duncan	innocent	innocents	yes
202307064	Rythian	paramedic	innocents	yes
202307064	Zylus	medium	innocents	yes
202307064	Zoey	traitor	traitors	no
202307064	Kirsty	innocent	innocents	yes
202307064	Nilesy	loot goblin	none	no
202307064	Breeh	traitor	traitors	yes
202307065	Ben	marshal	innocents	yes
202307065	Duncan	informant	traitors	yes
202307065	Rythian	veteran	innocents	yes
202307065	Zylus	innocent	innocents	yes
202307065	Zoey	traitor	traitors	no
202307065	Kirsty	innocent	innocents	yes
202307065	Nilesy	impersonator	traitors	yes
202307065	Breeh	clown	clown	yes
202307014	Lewis	veteran	innocents	no
202307014	Ben	parasite	traitors	yes
202307014	Duncan	randoman	innocents	yes
202307014	Kirsty	loot goblin	none	yes
202307014	Zoey	innocent	innocents	yes
202307014	Nilesy	beggar	none	no
202307014	Daltos	innocent	innocents	yes
202307014	Lolip	traitor	traitors	yes
202307015	Lewis	jester	jester	no
202307015	Ben	jester	jester	no
202307015	Duncan	jester	jester	no
202307015	Kirsty	jester	jester	no
202307015	Zoey	parasite	traitors	no
202307015	Nilesy	jester	jester	no
202307015	Daltos	jester	jester	no
202307015	Lolip	jester	jester	no
202307040	Lewis	innocent	innocents	no
202307040	Ben	glitch	innocents	yes
202307040	Duncan	shadow	none	yes
202307040	Kirsty	traitor	traitors	yes
202307040	Zoey	innocent	innocents	no
202307040	Nilesy	randoman	innocents	yes
202307040	Lolip	informant	traitors	yes
202307040	Daltos	beggar	traitors	yes
202307041	Lewis	innocent	innocents	yes
202307041	Ben	shadow	none	no
202307041	Duncan	innocent	innocents	yes
202307041	Kirsty	paladin	innocents	no
202307041	Zoey	glitch	innocents	no
202307041	Nilesy	traitor	traitors	yes
202307041	Lolip	parasite	traitors	yes
202307041	Daltos	jester	jester	no
202307044	Lewis	innocent	innocents	yes
202307044	Ben	traitor	traitors	no
202307044	Duncan	veteran	innocents	yes
202307044	Kirsty	traitor	traitors	yes
202307044	Zoey	jester	jester	no
202307044	Nilesy	hypnotist	traitors	yes
202307044	Lolip	innocent	innocents	yes
202307044	Daltos	paladin	innocents	yes
202307045	Lewis	tracker	innocents	yes
202307045	Ben	innocent	innocents	yes
202307045	Duncan	traitor	traitors	no
202307045	Kirsty	drunk	none	yes
202307045	Zoey	clown	clown	yes
202307045	Nilesy	innocent	innocents	yes
202307045	Lolip	paramedic	innocents	yes
202307045	Daltos	parasite	traitors	yes
202307060	Ben	innocent	innocents	yes
202307060	Duncan	beggar	none	yes
202307060	Rythian	traitor	traitors	no
202307060	Zylus	veteran	innocents	yes
202307060	Zoey	summoner	traitors	no
202307060	Kirsty	innocent	innocents	yes
202307060	Nilesy	tracker	innocents	yes
202307060	Breeh	swapper	none	yes
202307062	Ben	randoman	innocents	yes
202307062	Duncan	beggar	none	no
202307062	Rythian	zombie	zombies	no
202307062	Zylus	zombie	zombies	yes
202307062	Zoey	mad scientist	zombies	no
202307062	Kirsty	traitor	traitors	yes
202307062	Nilesy	zombie	zombies	no
202307062	Breeh	innocent	innocents	yes
202307063	Ben	innocent	innocents	yes
202307063	Duncan	traitor	traitors	yes
202307063	Rythian	tracker	innocents	yes
202307063	Zylus	traitor	traitors	yes
202307063	Zoey	beggar	none	no
202307063	Kirsty	hypnotist	traitors	yes
202307063	Nilesy	innocent	innocents	yes
202307063	Breeh	glitch	innocents	no
202307080	Ben	zombie	zombies	yes
202307080	Duncan	zombie	zombies	yes
202307080	Rythian	zombie	zombies	yes
202307080	Zoey	parasite	traitors	yes
202307080	Kirsty	zombie	zombies	yes
202307080	Nilesy	innocent	innocents	yes
202307080	Breeh	mad scientist	zombies	no
202307080	Zylus	zombie	zombies	yes
202307081	Ben	jester	jester	no
202307081	Duncan	innocent	innocents	yes
202307081	Rythian	parasite	traitors	no
202307081	Zoey	traitor	traitors	yes
202307081	Kirsty	glitch	innocents	yes
202307081	Nilesy	innocent	innocents	yes
202307081	Breeh	tracker	innocents	yes
202307081	Zylus	clown	communists	yes
202307082	Ben	innocent	innocents	no
202307082	Duncan	mad scientist	zombies	yes
202307082	Rythian	medium	innocents	no
202307082	Zoey	traitor	traitors	yes
202307082	Kirsty	innocent	innocents	yes
202307082	Nilesy	hypnotist	traitors	yes
202307082	Breeh	traitor	traitors	yes
202307082	Zylus	veteran	innocents	yes
202307083	Ben	glitch	innocents	yes
202307083	Duncan	innocent	innocents	yes
202307083	Rythian	innocent	innocents	yes
202307083	Zoey	innocent	innocents	yes
202307083	Kirsty	traitor	traitors	no
202307083	Nilesy	marshal	innocents	yes
202307083	Breeh	traitor	traitors	no
202307083	Zylus	traitor	traitors	no
202307110	Ben	innocent	innocents	no
202307110	Duncan	beggar	innocents	yes
202307110	Rythian	mad scientist	zombies	yes
202307110	Zylus	glitch	innocents	no
202307110	Zoey	innocent	innocents	no
202307110	Kirsty	impersonator	traitors	yes
202307110	Nilesy	traitor	traitors	yes
202307110	Breeh	tracker	innocents	no
202307111	Ben	zombie	zombies	yes
202307111	Duncan	innocent	innocents	no
202307111	Rythian	glitch	innocents	yes
202307111	Zylus	summoner	traitors	yes
202307111	Zoey	randoman	innocents	no
202307111	Kirsty	mad scientist	zombies	yes
202307111	Nilesy	jester	jester	no
202307111	Breeh	traitor	traitors	yes
202307112	Ben	innocent	innocents	yes
202307112	Duncan	parasite	traitors	no
202307112	Rythian	traitor	traitors	no
202307112	Zylus	tracker	innocents	yes
202307112	Zoey	mad scientist	zombies	yes
202307112	Kirsty	innocent	innocents	yes
202307112	Nilesy	veteran	innocents	yes
202307112	Breeh	jester	jester	no
202307113	Ben	elf	elves	no
202307113	Duncan	innocent	innocents	yes
202307132	Ben	jester	jester	yes
202307113	Rythian	parasite	traitors	yes
202307113	Zylus	elf	elves	no
202307113	Zoey	elf	elves	no
202307113	Kirsty	elf	elves	yes
202307113	Nilesy	traitor	traitors	yes
202307113	Breeh	paramedic	innocents	yes
202307130	Ben	queen bee	bees	yes
202307130	Duncan	marshal	innocents	yes
202307130	Rythian	innocent	innocents	yes
202307130	Zylus	glitch	innocents	yes
202307130	Zoey	innocent	innocents	no
202307130	Kirsty	bee	bees	yes
202307130	Nilesy	mad scientist	zombies	yes
202307130	Breeh	innocent	innocents	no
202307131	Ben	paramedic	innocents	yes
202307131	Duncan	innocent	innocents	yes
202307131	Rythian	innocent	innocents	yes
202307131	Zylus	mad scientist	zombies	no
202307131	Zoey	innocent	innocents	yes
202307131	Kirsty	impersonator	traitors	yes
202307131	Nilesy	traitor	traitors	yes
202307131	Breeh	drunk	none	yes
202307150	Ben	innocent	innocents	no
202307150	Duncan	tracker	innocents	yes
202307150	Rythian	jester	jester	yes
202307150	Zylus	veteran	innocents	no
202307150	Zoey	innocent	innocents	yes
202307150	Kirsty	parasite	traitors	no
202307150	Nilesy	innocent	innocents	yes
202307150	Shadow	traitor	traitors	yes
202307151	Ben	innocent	innocents	yes
202307151	Duncan	innocent	innocents	yes
202307151	Rythian	deputy	innocents	yes
202307151	Zylus	medium	innocents	no
202307151	Zoey	traitor	traitors	yes
202307151	Kirsty	summoner	traitors	yes
202307151	Nilesy	beggar	traitors	yes
202307151	Shadow	mad scientist	zombies	yes
202307152	Ben	innocent	innocents	yes
202307152	Duncan	marshal	innocents	yes
202307152	Rythian	traitor	traitors	no
202307152	Zylus	zombie	zombies	yes
202307152	Zoey	mad scientist	zombies	yes
202307152	Kirsty	paramedic	innocents	yes
202307152	Nilesy	impersonator	traitors	no
202307152	Shadow	beggar	none	no
202307153	Ben	mad scientist	zombies	yes
202307153	Duncan	impersonator	traitors	yes
202307153	Rythian	paramedic	innocents	no
202307153	Zylus	innocent	innocents	no
202307153	Zoey	innocent	innocents	yes
202307153	Kirsty	traitor	traitors	yes
202307153	Nilesy	randoman	innocents	no
202307153	Shadow	beggar	none	no
202307181	Ben	medium	innocents	yes
202307181	Duncan	traitor	traitors	yes
202307181	Rythian	innocent	innocents	no
202307181	Zylus	innocent	innocents	yes
202307181	Zoey	deputy	innocents	yes
202307181	Kirsty	zombie	zombies	yes
202307181	Nilesy	mad scientist	zombies	yes
202307181	Shadow	parasite	traitors	yes
202307184	Ben	innocent	innocents	yes
202307184	Duncan	innocent	innocents	yes
202307184	Rythian	traitor	traitors	yes
202307184	Zylus	drunk	none	yes
202307184	Zoey	paladin	innocents	yes
202307184	Kirsty	loot goblin	none	yes
202307184	Nilesy	traitor	traitors	no
202307184	Shadow	veteran	innocents	yes
202307220	Lewis	innocent	innocents	yes
202307220	Duncan	traitor	traitors	no
202307220	Ravs	innocent	innocents	yes
202307220	Rythian	traitor	traitors	yes
202307220	Zylus	tracker	innocents	yes
202307220	Zoey	glitch	innocents	yes
202307220	Kirsty	innocent	innocents	yes
202307220	Nilesy	innocent	innocents	yes
202307221	Lewis	glitch	innocents	no
202307221	Duncan	hypnotist	traitors	yes
202307221	Ravs	tracker	innocents	no
202307221	Rythian	drunk	none	yes
202307221	Zylus	innocent	innocents	yes
202307221	Zoey	innocent	innocents	yes
202307221	Kirsty	traitor	traitors	yes
202307221	Nilesy	beggar	none	no
202307223	Lewis	innocent	innocents	no
202307223	Duncan	informant	traitors	yes
202307223	Ravs	mad scientist	zombies	yes
202307223	Rythian	zombie	zombies	yes
202307223	Zylus	veteran	innocents	yes
202307223	Zoey	innocent	innocents	no
202307223	Kirsty	drunk	none	yes
202307223	Nilesy	zombie	zombies	yes
202307224	Lewis	informant	traitors	yes
202307224	Duncan	innocent	innocents	yes
202307224	Ravs	beggar	none	yes
202307224	Rythian	veteran	innocents	no
202307224	Zylus	medium	innocents	no
202307224	Zoey	traitor	traitors	yes
202307224	Kirsty	innocent	innocents	yes
202307224	Nilesy	clown	clown	yes
202307226	Lewis	innocent	innocents	no
202307226	Duncan	innocent	innocents	yes
202307226	Ravs	innocent	innocents	yes
202307226	Rythian	innocent	innocents	yes
202307226	Zylus	traitor	traitors	no
202307226	Zoey	traitor	traitors	yes
202307226	Kirsty	detective	innocents	yes
202307226	Nilesy	innocent	innocents	no
202307132	Duncan	summoner	traitors	no
202307132	Rythian	paramedic	innocents	yes
202307132	Zylus	traitor	traitors	no
202307132	Zoey	innocent	innocents	yes
202307132	Kirsty	innocent	innocents	yes
202307132	Nilesy	tracker	innocents	yes
202307132	Breeh	drunk	none	yes
202307133	Ben	loot goblin	none	yes
202307133	Duncan	zombie	zombies	no
202307133	Rythian	zombie	zombies	no
202307133	Zylus	glitch	innocents	yes
202307133	Zoey	mad scientist	zombies	yes
202307133	Kirsty	innocent	innocents	yes
202307133	Nilesy	innocent	innocents	yes
202307133	Breeh	zombie	zombies	yes
202307134	Ben	mad scientist	zombies	yes
202307134	Duncan	deputy	innocents	yes
202307134	Rythian	zombie	zombies	yes
202307134	Zylus	drunk	none	yes
202307134	Zoey	deputy	innocents	no
202307134	Kirsty	impersonator	traitors	yes
202307134	Nilesy	deputy	innocents	yes
202307134	Breeh	impersonator	traitors	yes
202307135	Ben	mad scientist	zombies	yes
202307135	Duncan	swapper	none	yes
202307135	Rythian	zombie	zombies	no
202307135	Zylus	zombie	zombies	yes
202307135	Zoey	zombie	zombies	no
202307135	Kirsty	zombie	zombies	yes
202307135	Nilesy	zombie	zombies	yes
202307135	Breeh	summoner	traitors	yes
202307154	Ben	hypnotist	traitors	yes
202307154	Duncan	innocent	innocents	yes
202307154	Rythian	swapper	none	no
202307154	Zylus	traitor	traitors	yes
202307154	Zoey	medium	innocents	yes
202307154	Kirsty	traitor	traitors	no
202307154	Nilesy	clown	clown	yes
202307154	Shadow	deputy	innocents	yes
202307180	Ben	drunk	none	yes
202307180	Duncan	swapper	none	no
202307180	Rythian	impersonator	traitors	no
202307180	Zylus	innocent	innocents	no
202307180	Zoey	innocent	innocents	yes
202307180	Kirsty	glitch	innocents	no
202307180	Nilesy	medium	innocents	no
202307180	Shadow	traitor	traitors	no
202307182	Ben	mad scientist	zombies	yes
202307182	Duncan	paramedic	innocents	no
202307182	Rythian	jester	jester	no
202307182	Zylus	medium	innocents	no
202307182	Zoey	innocent	innocents	no
202307182	Kirsty	traitor	traitors	yes
202307182	Nilesy	impersonator	traitors	yes
202307182	Shadow	innocent	innocents	yes
202307183	Ben	innocent	innocents	yes
202307183	Duncan	traitor	traitors	no
202307183	Rythian	jester	jester	no
202307183	Zylus	drunk	none	yes
202307183	Zoey	randoman	innocents	yes
202307183	Kirsty	innocent	innocents	yes
202307183	Nilesy	parasite	traitors	no
202307183	Shadow	paramedic	innocents	yes
202307185	Ben	innocent	innocents	yes
202307185	Duncan	informant	traitors	yes
202307185	Rythian	swapper	none	no
202307185	Zylus	veteran	innocents	yes
202307185	Zoey	tracker	innocents	no
202307185	Kirsty	innocent	innocents	yes
202307185	Nilesy	traitor	traitors	yes
202307185	Shadow	loot goblin	none	no
202307200	Lewis	traitor	traitors	yes
202307200	Duncan	glitch	innocents	yes
202307200	Ravs	hypnotist	traitors	no
202307200	Rythian	clown	clown	yes
202307200	Zylus	traitor	traitors	no
202307200	Zoey	medium	innocents	yes
202307200	Kirsty	innocent	innocents	yes
202307200	Nilesy	innocent	innocents	yes
202307201	Lewis	traitor	traitors	yes
202307201	Duncan	impersonator	traitors	yes
202307201	Ravs	beggar	none	no
202307201	Rythian	medium	innocents	yes
202307201	Zylus	jester	jester	no
202307201	Zoey	innocent	innocents	yes
202307201	Kirsty	veteran	innocents	no
202307201	Nilesy	innocent	innocents	no
202307202	Lewis	innocent	innocents	yes
202307202	Duncan	informant	traitors	yes
202307202	Ravs	innocent	innocents	no
202307202	Rythian	swapper	none	no
202307202	Zylus	veteran	innocents	yes
202307202	Zoey	mad scientist	zombies	yes
202307202	Kirsty	paladin	innocents	yes
202307202	Nilesy	traitor	traitors	yes
202307203	Lewis	glitch	innocents	yes
202307203	Duncan	glitch	innocents	yes
202307203	Ravs	traitor	traitors	yes
202307203	Rythian	glitch	innocents	yes
202307203	Zylus	glitch	innocents	no
202307203	Zoey	glitch	innocents	yes
202307203	Kirsty	glitch	innocents	yes
202307203	Nilesy	traitor	traitors	yes
202307204	Lewis	traitor	traitors	no
202307204	Duncan	innocent	innocents	yes
202307204	Ravs	paramedic	innocents	yes
202307204	Rythian	marshal	innocents	yes
202307204	Zylus	clown	clown	yes
202307204	Zoey	parasite	traitors	yes
202307204	Kirsty	innocent	innocents	yes
202307204	Nilesy	loot goblin	none	no
202307205	Lewis	traitor	traitors	no
202307205	Duncan	innocent	innocents	yes
202307205	Ravs	beggar	innocents	yes
202307205	Rythian	veteran	innocents	yes
202307205	Zylus	loot goblin	none	yes
202307205	Zoey	innocent	innocents	yes
202307205	Kirsty	tracker	innocents	yes
202307205	Nilesy	informant	traitors	no
202307206	Lewis	veteran	innocents	no
202307206	Duncan	summoner	traitors	yes
202307206	Ravs	innocent	innocents	yes
202307206	Rythian	randoman	innocents	yes
202307206	Zylus	innocent	innocents	yes
202307206	Zoey	traitor	traitors	yes
202307206	Kirsty	drunk	none	yes
202307206	Nilesy	mad scientist	zombies	yes
202307222	Lewis	innocent	innocents	yes
202307222	Duncan	traitor	traitors	yes
202307222	Ravs	parasite	traitors	yes
202307222	Rythian	drunk	none	yes
202307222	Zylus	innocent	innocents	yes
202307222	Zoey	veteran	innocents	yes
202307222	Kirsty	tracker	innocents	yes
202307222	Nilesy	clown	clown	no
202307225	Lewis	innocent	innocents	no
202307225	Duncan	marshal	innocents	yes
202307225	Ravs	glitch	innocents	yes
202307225	Rythian	traitor	traitors	yes
202307225	Zylus	swapper	none	no
202307225	Zoey	parasite	traitors	yes
202307225	Kirsty	innocent	innocents	yes
202307225	Nilesy	clown	clown	yes
202307250	Lewis	glitch	innocents	yes
202307250	Ben	impersonator	traitors	yes
202307250	Ravs	innocent	innocents	yes
202307250	Zylus	innocent	innocents	yes
202307250	Zoey	beggar	none	yes
202307250	Kirsty	traitor	traitors	no
202307250	Nilesy	swapper	none	no
202307250	Daltos	tracker	innocents	yes
202307251	Lewis	loot goblin	none	yes
202307251	Ben	parasite	traitors	yes
202307251	Ravs	traitor	traitors	yes
202307251	Zylus	glitch	innocents	yes
202307251	Zoey	beggar	traitors	yes
202307251	Kirsty	marshal	innocents	no
202307251	Nilesy	innocent	innocents	yes
202307251	Daltos	innocent	innocents	yes
202307252	Lewis	marshal	innocents	yes
202307252	Ben	traitor	traitors	yes
202307252	Ravs	clown	clown	no
202307252	Zylus	innocent	innocents	yes
202307252	Zoey	innocent	innocents	yes
202307252	Kirsty	summoner	traitors	yes
202307252	Nilesy	glitch	innocents	yes
202307252	Daltos	traitor	traitors	yes
202307253	Lewis	innocent	innocents	no
202307253	Ben	tracker	innocents	yes
202307253	Ravs	paramedic	innocents	yes
202307253	Zylus	traitor	traitors	yes
202307253	Zoey	innocent	innocents	yes
202307253	Kirsty	jester	jester	no
202307253	Nilesy	drunk	none	yes
202307253	Daltos	summoner	traitors	yes
202307254	Lewis	beggar	traitors	no
202307254	Ben	informant	traitors	no
202307254	Ravs	randoman	innocents	yes
202307254	Zylus	traitor	traitors	no
202307254	Zoey	innocent	innocents	yes
202307254	Kirsty	veteran	innocents	yes
202307254	Nilesy	innocent	innocents	yes
202307254	Daltos	mad scientist	zombies	yes
202307270	Lewis	traitor	traitors	yes
202307270	Ben	beggar	traitors	yes
202307270	Ravs	innocent	innocents	yes
202307270	Zylus	clown	clown	no
202307270	Zoey	parasite	traitors	yes
202307270	Kirsty	deputy	innocents	yes
202307270	Nilesy	paladin	innocents	yes
202307270	Daltos	innocent	innocents	yes
202307271	Lewis	beggar	traitors	yes
202307271	Ben	mad scientist	zombies	yes
202307271	Ravs	zombie	zombies	yes
202307271	Zylus	paladin	innocents	yes
202307271	Zoey	zombie	zombies	yes
202307271	Kirsty	innocent	innocents	yes
202307271	Nilesy	glitch	innocents	no
202307271	Daltos	traitor	traitors	yes
202307272	Ben	zombie	zombies	yes
202307272	Ravs	zombie	zombies	yes
202307272	Zylus	impersonator	traitors	no
202307272	Zoey	randoman	innocents	yes
202307272	Kirsty	zombie	zombies	yes
202307272	Nilesy	mad scientist	zombies	yes
202307272	Daltos	zombie	zombies	yes
202307272	Lewis	mud scientist	none	no
202307273	Lewis	innocent	innocents	no
202307273	Ben	deputy	innocents	yes
202307273	Ravs	medium	innocents	no
202307273	Zylus	jester	jester	yes
202307273	Zoey	parasite	traitors	yes
202307273	Kirsty	loot goblin	none	no
202307273	Nilesy	traitor	traitors	no
202307273	Daltos	innocent	innocents	no
202307274	Lewis	zombie	zombies	no
202307274	Ben	zombie	zombies	no
202307274	Ravs	zombie	zombies	no
202307274	Zylus	innocent	innocents	yes
202307274	Zoey	zombie	zombies	no
202307274	Kirsty	mad scientist	zombies	no
202307274	Nilesy	zombie	zombies	no
202307274	Daltos	zombie	zombies	no
202307275	Lewis	innocent	innocents	yes
202307275	Ben	randoman	innocents	no
202307275	Ravs	innocent	innocents	yes
202307275	Zylus	loot goblin	none	no
202307275	Zoey	informant	traitors	no
202307275	Kirsty	traitor	traitors	yes
202307275	Nilesy	beggar	none	yes
202307275	Daltos	veteran	innocents	yes
202307290	Lewis	innocent	innocents	no
202307290	Ben	informant	traitors	yes
202307290	Duncan	beggar	none	yes
202307290	Zylus	traitor	traitors	yes
202307290	Rythian	glitch	innocents	yes
202307290	Zoey	traitor	traitors	yes
202307290	Kirsty	randoman	innocents	yes
202307290	Briony	innocent	innocents	yes
202307291	Lewis	innocent	innocents	no
202307291	Ben	innocent	innocents	yes
202307291	Duncan	tracker	innocents	yes
202307291	Zylus	deputy	innocents	yes
202307291	Rythian	summoner	traitors	yes
202307291	Zoey	traitor	traitors	yes
202307291	Kirsty	innocent	innocents	no
202307291	Briony	swapper	none	no
202307292	Lewis	traitor	traitors	yes
202307292	Ben	swapper	none	no
202307292	Duncan	randoman	innocents	no
202307292	Zylus	innocent	innocents	yes
202307292	Rythian	innocent	innocents	yes
202307292	Zoey	traitor	traitors	yes
202307292	Kirsty	veteran	innocents	yes
202307292	Briony	impersonator	traitors	yes
202307293	Lewis	veteran	innocents	yes
202307293	Ben	traitor	traitors	yes
202307293	Duncan	innocent	innocents	yes
202307293	Zylus	mad scientist	zombies	yes
202307293	Rythian	medium	innocents	yes
202307293	Zoey	traitor	traitors	yes
202307293	Kirsty	innocent	innocents	no
202307293	Briony	informant	traitors	yes
202307294	Lewis	beggar	traitors	no
202307294	Ben	veteran	innocents	yes
202307294	Duncan	hypnotist	traitors	no
202307294	Zylus	innocent	innocents	yes
202307294	Rythian	clown	clown	yes
202307294	Zoey	traitor	traitors	yes
202307294	Kirsty	traitor	traitors	yes
202307294	Briony	innocent	innocents	yes
202307295	Lewis	deputy	innocents	no
202307295	Ben	informant	traitors	yes
202307295	Duncan	traitor	traitors	yes
202307295	Zylus	paladin	innocents	no
202307295	Rythian	innocent	innocents	no
202307295	Zoey	beggar	traitors	yes
202307295	Kirsty	jester	jester	no
202307295	Briony	innocent	innocents	no
202308010	Lewis	randoman	innocents	yes
202308010	Ben	impersonator	traitors	yes
202308010	Duncan	traitor	traitors	yes
202308010	Rythian	loot goblin	none	no
202308010	Zylus	innocent	innocents	no
202308010	Zoey	paramedic	innocents	yes
202308010	Kirsty	mad scientist	zombies	yes
202308010	Briony	innocent	innocents	yes
202308011	Lewis	informant	traitors	no
202308011	Ben	clown	clown	yes
202308011	Duncan	innocent	innocents	yes
202308011	Rythian	traitor	traitors	yes
202308011	Zylus	innocent	innocents	yes
202308011	Zoey	paramedic	innocents	yes
202308011	Kirsty	jester	jester	yes
202308011	Briony	medium	innocents	yes
202308012	Lewis	traitor	traitors	no
202308012	Ben	informant	traitors	yes
202308012	Duncan	traitor	traitors	yes
202308012	Rythian	paladin	innocents	yes
202308012	Zylus	innocent	innocents	yes
202308012	Zoey	veteran	innocents	yes
202308012	Kirsty	innocent	innocents	yes
202308012	Briony	loot goblin	none	no
202308013	Lewis	zombie	zombies	no
202308013	Ben	zombie	zombies	no
202308013	Duncan	zombie	zombies	no
202308013	Rythian	impersonator	innocents	yes
202308013	Zylus	paramedic	innocents	yes
202308013	Zoey	marshal	innocents	yes
202308013	Kirsty	mad scientist	zombies	no
202308013	Briony	zombie	zombies	no
202308014	Lewis	deputy	innocents	yes
202308014	Ben	traitor	traitors	yes
202308014	Duncan	innocent	innocents	no
202308014	Rythian	randoman	innocents	yes
202308014	Zylus	loot goblin	none	yes
202308014	Zoey	innocent	innocents	yes
202308014	Kirsty	parasite	traitors	yes
202308014	Briony	innocent	innocents	yes
202308030	Lewis	summoner	traitors	no
202308030	Ben	innocent	innocents	yes
202308030	Duncan	innocent	innocents	yes
202308030	Zoey	traitor	traitors	yes
202308030	Kirsty	veteran	innocents	yes
202308030	Nilesy	innocent	innocents	yes
202308030	Briony	medium	innocents	yes
202308030	Rythian	swapper	none	no
202308031	Lewis	paramedic	innocents	no
202308031	Ben	summoner	traitors	yes
202308031	Duncan	tracker	innocents	yes
202308031	Rythian	innocent	innocents	no
202308031	Zoey	traitor	traitors	yes
202308031	Kirsty	innocent	innocents	yes
202308031	Nilesy	swapper	none	no
202308031	Briony	loot goblin	none	no
202308032	Lewis	innocent	innocents	yes
202308032	Ben	mad scientist	zombies	yes
202308032	Duncan	hypnotist	traitors	yes
202308032	Rythian	veteran	innocents	yes
202308032	Zoey	traitor	traitors	yes
202308032	Kirsty	marshal	innocents	yes
202308032	Nilesy	innocent	innocents	no
202308032	Briony	deputy	innocents	yes
202308033	Lewis	loot goblin	none	yes
202308033	Ben	drunk	none	yes
202308033	Duncan	glitch	innocents	yes
202308033	Rythian	traitor	traitors	no
202308033	Zoey	summoner	traitors	yes
202308033	Kirsty	innocent	innocents	yes
202308033	Nilesy	innocent	innocents	yes
202308033	Briony	marshal	innocents	yes
202308034	Lewis	traitor	traitors	yes
202308034	Ben	paladin	innocents	yes
202308034	Duncan	informant	traitors	yes
202308034	Rythian	innocent	innocents	yes
202308034	Zoey	beggar	traitors	yes
202308034	Kirsty	veteran	innocents	no
202308034	Nilesy	innocent	innocents	no
202308034	Briony	mad scientist	zombies	yes
202308035	Lewis	mad scientist	zombies	yes
202308035	Ben	jester	jester	no
202308035	Duncan	innocent	innocents	no
202308035	Rythian	innocent	innocents	yes
202308035	Zoey	veteran	innocents	yes
202308035	Kirsty	traitor	traitors	yes
202308035	Nilesy	impersonator	traitors	yes
202308035	Briony	paladin	innocents	yes
202308050	Lewis	traitor	traitors	no
202308050	Ben	drunk	none	yes
202308050	Duncan	innocent	innocents	yes
202308050	Rythian	innocent	innocents	yes
202308050	Zoey	medium	innocents	yes
202308050	Kirsty	beggar	none	no
202308050	Nilesy	informant	traitors	no
202308050	Briony	veteran	innocents	yes
202308051	Lewis	mad scientist	zombies	yes
202308051	Ben	paramedic	innocents	yes
202308051	Duncan	hypnotist	traitors	no
202308051	Rythian	paramedic	innocents	yes
202308051	Zoey	hypnotist	traitors	no
202308051	Kirsty	traitor	traitors	yes
202308051	Nilesy	paramedic	innocents	yes
202308051	Briony	paramedic	innocents	yes
202308052	Lewis	innocent	innocents	yes
202308052	Ben	medium	innocents	no
202308052	Duncan	veteran	innocents	yes
202308080	Lewis	loot goblin	none	no
202308052	Rythian	loot goblin	none	yes
202308052	Zoey	traitor	traitors	yes
202308052	Kirsty	traitor	traitors	yes
202308052	Nilesy	traitor	traitors	yes
202308052	Briony	innocent	innocents	no
202308053	Lewis	innocent	innocents	yes
202308053	Ben	parasite	traitors	no
202308053	Duncan	innocent	innocents	yes
202308053	Rythian	veteran	innocents	yes
202308053	Zoey	traitor	traitors	yes
202308053	Kirsty	tracker	innocents	no
202308053	Nilesy	jester	jester	yes
202308053	Briony	mad scientist	zombies	yes
202308120	Lewis	innocent	innocents	no
202308120	Duncan	beggar	none	yes
202308120	Rythian	innocent	innocents	yes
202308120	Zylus	informant	traitors	yes
202308120	Pedguin	traitor	traitors	yes
202308120	Nilesy	marshal	innocents	yes
202308120	Osie	veteran	innocents	yes
202308125	Lewis	randoman	innocents	yes
202308125	Duncan	innocent	innocents	yes
202308125	Rythian	veteran	innocents	no
202308125	Zylus	swapper	none	no
202308125	Pedguin	traitor	traitors	yes
202308125	Nilesy	parasite	traitors	yes
202308125	Osie	innocent	innocents	yes
202308080	Ben	deputy	innocents	yes
202308080	Duncan	innocent	innocents	yes
202308080	Rythian	informant	traitors	no
202308080	Zoey	paladin	innocents	yes
202308080	Kirsty	innocent	innocents	yes
202308080	Nilesy	clown	clown	yes
202308080	Briony	traitor	traitors	no
202308081	Lewis	jester	jester	yes
202308081	Ben	traitor	traitors	yes
202308081	Duncan	glitch	innocents	yes
202308081	Rythian	clown	clown	yes
202308081	Zoey	innocent	innocents	no
202308081	Kirsty	marshal	innocents	yes
202308081	Nilesy	innocent	innocents	yes
202308081	Briony	summoner	traitors	yes
202308082	Lewis	swapper	none	no
202308082	Ben	innocent	innocents	yes
202308082	Duncan	traitor	traitors	no
202308082	Rythian	parasite	traitors	no
202308082	Zoey	drunk	none	yes
202308082	Kirsty	glitch	innocents	yes
202308082	Nilesy	innocent	innocents	yes
202308082	Briony	tracker	innocents	yes
202308083	Lewis	innocent	innocents	yes
202308083	Ben	jester	jester	yes
202308083	Duncan	beggar	traitors	yes
202308083	Rythian	glitch	innocents	no
202308083	Zoey	summoner	traitors	no
202308083	Kirsty	innocent	innocents	no
202308083	Nilesy	randoman	innocents	no
202308083	Briony	traitor	traitors	no
202308084	Lewis	glitch	innocents	yes
202308084	Ben	swapper	none	yes
202308084	Duncan	innocent	innocents	yes
202308084	Rythian	traitor	traitors	yes
202308084	Zoey	clown	clown	yes
202308084	Kirsty	paladin	innocents	yes
202308084	Nilesy	innocent	innocents	yes
202308084	Briony	parasite	traitors	yes
202308121	Lewis	glitch	innocents	yes
202308121	Duncan	innocent	innocents	yes
202308121	Rythian	innocent	innocents	yes
202308121	Zylus	clown	clown	yes
202308121	Pedguin	medium	innocents	no
202308121	Nilesy	parasite	traitors	yes
202308121	Osie	traitor	traitors	yes
202308122	Lewis	innocent	innocents	no
202308122	Duncan	randoman	innocents	no
202308122	Rythian	innocent	innocents	yes
202308122	Zylus	glitch	innocents	no
202308122	Pedguin	loot goblin	none	no
202308122	Nilesy	hypnotist	traitors	yes
202308122	Osie	traitor	traitors	yes
202308123	Lewis	swapper	none	no
202308123	Duncan	innocent	innocents	yes
202308123	Rythian	traitor	traitors	yes
202308123	Zylus	traitor	traitors	yes
202308123	Pedguin	hypnotist	traitors	no
202308123	Nilesy	marshal	innocents	yes
202308123	Osie	veteran	innocents	yes
202308124	Lewis	veteran	innocents	yes
202308124	Duncan	innocent	innocents	yes
202308124	Rythian	loot goblin	none	yes
202308124	Zylus	innocent	innocents	yes
202308124	Pedguin	traitor	traitors	no
202308124	Nilesy	marshal	innocents	yes
202308124	Osie	impersonator	traitors	no
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (team, colour) FROM stdin;
innocents	green
traitors	red
zombies	black
bees	yellow
jester	purple
clown	pink
elves	brown
communists	#8b0000
lovers	#FF69B4
none	
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.video (title, vid, intro_death, date) FROM stdin;
Who's the FASTEST GUN in the Yogscast!? | Gmod TTT	Q5ErlVIH31Q	not_tracked	2022-11-01
How to Win Rock, Paper, Scissors (and kill your soulmate) | Gmod TTT	eIkEFaar-Qc	not_tracked	2022-11-05
This map is Mr Blobby nightmare!! | Gmod TTT	1hvkhCMtuIw	false	2023-05-30
The Magical Flying Shed | Gmod TTT (w/ RTGame)	geRFB7ihD3M	not_tracked	2022-10-25
NEW Spooky Scary Skeleton Gun in Gmod TTT | Halloween Special!	fTM_5NZFhRY	not_tracked	2022-10-29
You Will Die In 5 Seconds | Gmod TTT (w/ RTGame)	H2dmsjSF0Wo	not_tracked	2022-11-08
Rythian's Favourite Round of All Time | Gmod TTT (w/ RTGame)	tXmLUmbUJag	not_tracked	2022-11-12
The WORST trade deal in Gmod TTT!	u8MzP3B0bMw	not_tracked	2022-11-15
There's more traitors than innocents inGmod TTT!?	JSq1OPfhJ-Y	not_tracked	2022-11-19
Come into my Goblin Hole!! | Gmod TTT	Gkak7LLJOqc	not_tracked	2022-11-22
The scream that destroyed YogTowers! | Gmod TTT	otqA9aYtejA	not_tracked	2022-11-25
7 DISGUSTING mutants learn how to kill | Gmod TTT	PstAilWgMu4	not_tracked	2022-12-01
We're FINALLY breaking the meta in Gmod TTT!	WFD4kmH_zpI	not_tracked	2022-12-03
TTT XL! The most INCREDIBLE map we've ever played!	463eWBId7jw	not_tracked	2022-12-06
We increased prop damage again... | Gmod TTT	HBfgvCLx808	not_tracked	2022-12-10
The most dangerous hiding place in GmodTTT!	glwQJJICxw	not_tracked	2022-12-13
NEW ROLE: The ELVES are rising up!! | Christmas TTT Special	HDfGua9hZzI	not_tracked	2022-12-17
Why won't Santa wake up!? | Christmas TTT Special	0w1LHuToCXI	not_tracked	2022-12-20
No one wants a DEFUSER for CHRISTMAS!! | Christmas TTT Special!	JqqN9U4D9CI	not_tracked	2022-12-24
The rise of Benthazar Hellstrand II | Gmod TTT	m40z1K1TIK4	not_tracked	2022-12-27
Don't fall in the Plot Twist Pit!! | Gmod TTT	lQ4RQPuvHr0	not_tracked	2022-12-31
Lewis and Boba's Big Adventure! | Gmod TTT	l1I-S3xaiIY	not_tracked	2023-01-03
Curse of the FOREVER SWAPPER! | Gmod TTT	GBrckzwMvTQ	not_tracked	2023-01-07
Pikachu is the TRUE Mad Scientist!! | Gmod TTT	YAf7W6AcqNs	not_tracked	2023-01-10
Return to Doncon Temple!! | Gmod TTT	62m9fsf4iDM	not_tracked	2023-01-14
Zomies are taking over the MOON! | Gmod TTT	qJQsEevyU6U	not_tracked	2023-01-17
There's a little Doncon inside us all! | Gmod TTT	v1pj4S1cxKw	not_tracked	2023-01-21
Would YOU excecute Ravs? | Gmod TTT	329BUNbvbVo	not_tracked	2023-01-24
No dingus? | Gmod TTT	_Bgupg2ga7Y	not_tracked	2023-01-28
Is there anything the Dingus Hunters won't do!? | Gmod TTT	akn7Xny5wwk	no	2023-01-31
This PARASITE can raise the DEAD!! | Gmod TTT	YMTPqW1koFs	no	2023-02-04
Osie's Insane Life Stories | Gmod TTT XL	vtpNzMa8dgo	no	2023-02-07
Achieving the Traitor Trap Multi-Kill in Gmod TTT!	7luvwuhZs68	no	2023-02-11
Don't use this BROKEN NEW Roles in Gmod TTT!	yvpvrg8UUEo	no	2023-02-14
The hardest achievement ever: Don't Vote Zylus! | Gmod TTT	NHVu3w_xEds	no	2023-02-18
How many CUSTOM ACHIEVEMENTS can we get in Gmod TTT!?	qqLaBaXt250	no	2023-02-21
Can we survive the ENDLESS Zombie Horde in Gmod TTT!?	JTF74TBWpfE	no	2023-02-25
Don't go in the BODY PIT!! | Gmod TTT	d-Y4w6OtDUY	no	2023-02-28
We're going on a romantic Wild West boat ride! | Gmod TTT	UYdRM3O-iHk	no	2023-03-04
Rythian LOVES Barrel Justice now?! | Gmod TTT	psGnF7Co8u4	no	2023-03-07
L + Ratio + Beggar + Play Better | Gmod TTT	nGTbrrYQN5o	no	2023-03-11
NEVER betray your Zombie friends!! | Gmod TTT	zYTLFs8JWK4	no	2023-03-14
Duncan revolutionises the Fashion Industry! | Gmod TTT	5BQPEwqqT18	no	2023-03-18
Osie becomes GOD, wastes power on pizza | Gmod TTT	GGaPX6mv_xg	no	2023-03-21
This video DIDN'T get demonetised?! | Gmod TTT	DsZz5oqFBq0	no	2023-03-25
Beware the Jester Beam of DOOM! | Gmod TTT	-Oj4i3EswxA	no	2023-03-28
The most dangerous hiding place in GmodTTT!	gIwbQJJlCxw	not_tracked	2022-12-13
This randomat is driving us CRAZY! | Gmod TTT	FH_Pt-txUBA	no	2023-04-01
DUNCAN is BACK in Gmod TTT!!!	T2L_7-fot2A	no	2023-04-04
Lewis vs Zylus: A Feud Reignited!! | Gmod TTT	iwjgWykqfcI	yes	2023-04-08
Admin Abuser gets outted by an achievement | Gmod TTT	ZlD__4SY3tc	no	2023-04-11
Zoey spices things up, ruins an entire round | Gmod TTT	5pDiQ3UMRXY	no	2023-04-15
Tiny Kirsty's stupid player model almost breaks Rythian | Gmod TTT	vpO0wpjS2yI	no	2023-04-18
Everyone SUCKS but Rythian (including YOU!) | Gmod TTT	n2o6HSz9YrE	no	2023-04-22
The Button Map... but SIXTEEN TIMES WORSE | Gmod TTT	u5w4OBSySvQ	false	2023-04-25
Detectoclown Zoey border controls Area 3! | Gmod TTT	9d86zysMK6k	false	2023-04-29
When one person shoots... EVERYONE SHOOTS?! | Gmod TTT	ebVSH3L5hjM	false	2023-05-02
Riddle Master Ben gives away his traitor buddy | Gmod TTT	1RRbgC7wRtU	false	2023-05-06
We're being hunted by the immortal SUPER COP!! | Gmod TTT	Xb1avFSyJa0	false	2023-05-09
Lewis finally cracks, thinks EVERYONE is a prop | Gmod TTT	hwMR1y4gbK4	false	2023-05-13
NEW PLAYER Nilesy paid £1,000 for this skin in Gmod TTT!!	2i_-L6Dny3o	false	2023-05-16
These cats have NINE LIVES?! | Gmod TTT	xQP3hdxOmCM	false	2023-05-20
Only admin abuse can end this AWFUL round of Gmod TTT!	VRLFaq9XcMc	not_tracked	2022-10-22
It's MORE-BEEn Time! | Gmod TTT	X_jNsbBS278	false	2022-10-18
Revenge of the flying Pikachu! | Gmod TTT	kKM7SJQZo0Y	false	2022-10-15
We're replacing Ben with a sound board | Gmod TTT	6-QLX5wHwt0	false	2023-05-23
We're replacing Ben with a sound board | Gmod TTT	Jp-BuV0I1Uc	false	2023-05-23
Duncan turns Pro, uses items correctly | Gmod TTT	zehDuZ-h1m8	false	2023-05-27
Groverhaus is tearing us APART!! | Gmod TTT	hEnLP19VM64	false	2022-10-11
Don't save the Cat Pants Pinata!! | Gmod TTT	VCHT4u5kMvc	false	2023-06-03
What happens to Dugtrio if one of the Digletts DIES?! | Gmod TTT	EvESsiqrxs4	false	2022-10-08
THIS is how EVERY round should end! | Gmod TTT	BCfa3ckSRws	false	2022-10-04
The Best Map for the Bat | Gmod TTT	JaqxhsfR4T4	false	2022-10-01
The Rise and Fall of Queen Zoey | Gmod TTT	3kvyGLpdltw	false	2023-06-06
The Zombies have turned on their creator! | Gmod TTT	9LYHs_9-P0M	false	2022-09-27
Zoey uses a TRAIN as a weapon | Gmod TTT	WZKkd4gHMEM	false	2022-09-24
Rythian and Ben's corpse fishing adventure in Gmod TTT!	gHoqpGgYNMA	false	2023-06-10
You can't dodge the CAR GUN! | Gmod TTT	4vDh9LHM73k	false	2023-06-13
Who poisoned Ben... TWICE?! | Gmod TTT	4fkqC1pyQ2w	false	2023-06-17
This legendary round never happened | Gmod TTT	jAeGy-VoDmc	true	2023-06-20
Lewis' billion dollar trading card idea | Gmod TTT	jhfFsnAOpb0	false	2023-06-22
We escape Melon hell to kill some bots | Gmod TTT	qDS3c1Rjc7o	false	2023-06-24
This Randomat combo is ALMOST unplayable! | Gmod TTT	eK8Nwp_C-_c	false	2022-09-20
The fastest No Scoper in the West | Gmod TTT	zFbMsWMwW6U	false	2023-06-28
It's time to get SERIOUS | Gmod TTT	q4pAikC1Fa8	true	2023-06-29
This traitor trap is WAY TOO DANGEROUS | Gmod TTT	n8flDSFaBUk	false	2023-07-01
What are you doing, Step Marine? | Gmod TTT	0ePAy9ON6aM	false	2023-07-04
We're giving away Zoey's Secret Strats in Gmod TTT!	boSGesFpomU	false	2023-07-06
Ben's been cursed with Lewis Vision in Gmod TTT!	iLZ69BAe0HE	false	2023-07-08
Zoey goes full Cryptid, spreads cursed joy in Gmod TTT!	NN9A8L8expU	false	2023-07-11
Rythian breaks character, finally embraces the Zombies in Gmod TTT!	ELKjkoyU21A	false	2023-07-13
We combined two deadly weapons in Gmod TTT!	OVe8ddpGgZQ	false	2023-07-15
We brought back something nobody asked for in Gmod TTT!	XqzsityJF7I	true	2023-07-18
How to ruin a GUARANTEED WIN in Gmod TTT!	6Oa-lMt4HXM	false	2023-07-20
Grab a detonator to win in the GREAT CORPSE RACE! | Gmod TTT	M_VWQt-qtLw	true	2023-07-22
We love (and hate) the GIANT BF BEE!! | Gmod TTT	c5AwkqJimFY	false	2023-07-25
Let's do the Zombie Conga! | Gmod TTT	q3A3FqDJTr4	false	2023-07-27
Exactly zero traitors remembered this randomat | Gmod TTT	tG7nh3No6e0	false	2023-07-29
We need a good lie down after this map... | Gmod TTT	CSp850uMz98	true	2023-08-01
Great Big Yogs Holiday 2023 | Gmod TTT	HjBz5xKAfv8	false	2023-08-03
Every fail compilation has THIS round of Gmod TTT!	hPk2VzNw_20	false	2023-08-05
We're HYPNOTISED by this Lava Pit in Gmod TTT!	Ge4gwl-E7vg	false	2023-08-08
Traitors DON'T always win this Randomat!! | Gmod TTT	RqABuPTymQ8	false	2023-08-12
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

