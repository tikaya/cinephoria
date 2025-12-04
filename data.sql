--
-- PostgreSQL database dump
--

\restrict 6wP8XGG8HL4HWKv9nmoEfePFTiYRS6sKFyrXK1FkiKfVgPegw2dap6gIEVgRkIa

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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

--
-- Data for Name: cinema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema (id_cinema, nom_cinema, ville, adresse, telephone) FROM stdin;
1	Cinéphoria Nantes	Nantes	3910 Welch Club	1-492-647-6961 x765
2	Cinéphoria Bordeaux	Bordeaux	45322 Schimmel Rue	(927) 350-3855 x41609
3	Cinéphoria Paris	Paris	51361 Wood Lane	956-233-8932 x218
4	Cinéphoria Toulouse	Toulouse	101 Church Path	558-764-8073 x897
5	Cinéphoria Lille	Lille	8405 Cummings Lodge	(844) 466-3784 x548
6	Cinéphoria Charleroi	Charleroi	556 Center Road	1-729-720-8990 x548
7	Cinéphoria Liège	Liège	423 W 5th Street	1-655-691-3270 x61502
\.


--
-- Data for Name: employe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employe (id_employe, email_employe, password_hash, role_employe, is_active, created_at, updated_at, created_by, password_temp) FROM stdin;
1	lenoir@cinephoria.fr	$2b$12$6MSKHA3dHiFtnFLbtz.N.e/t4EVHEDNl7Bt1egBEuccXVFb9uul7.	EMPLOYEE	t	2025-08-28 14:55:19.550155+02	2025-08-28 14:55:19.550155+02	\N	f
2	tikaya@cinephoria.fr	$2b$12$k8r0b0jBOb2TyfQIWHDaWeRLKhm17IxdSKvo1NFVgpXVx07.HtQHe	EMPLOYEE	t	2025-08-28 15:15:25.328019+02	2025-08-28 15:15:25.328019+02	\N	f
3	vecho@cinephoria.fr	$2b$12$xPXDtSp7MJh1XEFNd3vQiuOdPaiGA9UADEDXlz4Mz1YUKVmtF0iCa	EMPLOYEE	t	2025-08-31 20:02:51.414964+02	2025-08-31 20:02:51.414964+02	\N	f
4	kaiser@cinephoria.fr	$2b$12$I7cLr4WJJj74qqQZ8H0Y6usdaHCmfAURndoEvmvFJdlQdteupjyU2	EMPLOYEE	t	2025-09-04 12:34:31.845085+02	2025-09-04 12:34:31.845085+02	\N	f
6	tikaya1999+1@gmail.com	$2b$12$4SQ4Z.RC.HSO1EEWGJJ6BORG7evQ71khSiKLXH7ummCbKuHhR7qgK	EMPLOYEE	t	2025-10-05 22:33:35.8957+02	2025-10-05 22:33:35.8957+02	\N	f
7	tikaya1999+x@gmail.com	$2b$12$49GLzlowGjxr6Iw/.STSne0/hSRSG46SguyhVo8ePt6CC/iTOW9Ym	EMPLOYEE	t	2025-10-05 22:37:11.291696+02	2025-10-05 22:37:11.291696+02	\N	f
8	cine@gmail.com	$2b$12$XzoZMZUfJ.NC.WjUPRJ6wu3K132lrwoZ9/42aYonMYTWhiGtgqNE6	EMPLOYEE	t	2025-10-05 22:48:20.987475+02	2025-10-05 23:04:12.63668+02	\N	f
9	ces@gmail.com	$2b$12$iGBLHKB6tJ6rcNb35xA65ODgy9374htRhzZezXEbFbKkpntEpwR/C	EMPLOYEE	t	2025-10-05 23:04:58.845039+02	2025-10-05 23:04:58.845039+02	\N	f
5	tikaya1999@gmail.com	$2b$12$IO2VmP9pXIaDhaUS7e731.OjFDYqy.23xTkoNVRdqSZRjw.rSxzq.	EMPLOYEE	t	2025-10-02 09:55:10.950739+02	2025-10-06 16:28:46.932192+02	\N	f
10	moniquenguessan74@gmail.com	$2b$12$SROQoZbuVjHAaMLhwN7kvugSfQLVl3d0bqk4SeJ5R0aw05WY9S7dq	EMPLOYEE	t	2025-10-06 16:44:01.608022+02	2025-10-06 16:44:01.608022+02	\N	f
11	tikayamarc@gmail.com	$2b$12$Zm9H2uRS2U2E5uNnBRfWgOpEXBz9XO43Ld6flxtl5WudKo4.p/dYC	EMPLOYEE	t	2025-10-12 10:21:21.940663+02	2025-10-12 10:21:21.940663+02	\N	f
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film (id_film, titre, description, age_minimum, label_coup_de_coeur, genre, affiche_url, date_ajout) FROM stdin;
2	Frozen Granite Ball	Suus caveo consequuntur eius debilito. Valens claudeo capillus brevis comptus defetiscor nam. Apostolus vox damnatio.	7	t	IDM	https://loremflickr.com/1466/1008/cinema?lock=1499768911070774	2025-07-14 11:45:41.841
4	Oriental Wooden Fish	Cenaculum theca subnecto virtus turbo tandem cedo. Debilito demonstro texo argumentum. Surgo aestivus bestia vigor vociferor vulpes arcesso.	2	t	Conjunto	https://loremflickr.com/3352/3893/cinema?lock=5139925244639107	2025-06-29 12:28:08.323
5	Fantastic Steel Soap	Quidem amo aperte desparatus fuga caecus avarus. Attonbitus tripudio tempore cena arma aestivus sui. Deinde vomito uter similique illo caveo cras volva.	7	f	Southern Rock	https://loremflickr.com/3386/763/cinema?lock=4606816028824265	2025-07-11 02:32:24.43
6	Fresh Aluminum Towels	Theologus quo defleo. Decerno cetera approbo. Aduro quasi attollo advoco attero ab rem ad tollo atrocitas.	5	f	Metalcore	https://loremflickr.com/2956/2412/cinema?lock=7415614689355129	2025-07-21 22:22:19.771
8	Ergonomic Wooden Tuna	Civitas numquam solium. Tamdiu dignissimos tutis quasi denuncio. Calcar validus abutor.	17	f	Hardcore	https://loremflickr.com/3385/3602/cinema?lock=530352635438269	2025-07-06 04:48:59.003
9	Incredible Cotton Hat	Cicuta substantia sumptus theca amplus deleo perspiciatis inflammatio cognomen delibero. Ambulo spes vulnero audacia correptius aduro. Repellat ab approbo corrupti ager cubicularis amaritudo adduco.	3	t	Outlaw Country	https://loremflickr.com/538/858/cinema?lock=3304982873946135	2025-07-19 12:04:07.598
10	Intelligent Bamboo Towels	Basium soluta nisi cattus denego certe. Comprehendo corporis amitto aut adulescens vesco expedita tot eius admoveo. Tabgo talis apto curis denego vomito pecus carmen comprehendo porro.	1	f	Swamp Pop	https://loremflickr.com/1087/944/cinema?lock=4000834797459624	2025-06-26 01:41:23.266
11	Gorgeous Wooden Soap	Unde aduro solitudo ater facere umquam commemoro. Arbitro summa abundans canonicus tepidus. Velum vulariter considero culpo tempora cunae repellendus cohaero.	11	t	Hardcore Punk	https://loremflickr.com/3665/2153/cinema?lock=3120435888412612	2025-07-24 23:15:49.593
12	Awesome Aluminum Shoes	Vae spoliatio conventus tertius eos copiose turba quidem bellicus. Caelum minus balbus ea aequus collum. Sortitus vir thorax acceptus exercitationem.	16	f	Boogaloo	https://loremflickr.com/1026/2144/cinema?lock=3674645491660045	2025-07-15 16:00:20.401
14	Luxurious Granite Chicken	Voluptatibus degero voluptates tibi ad sollicito suffoco ars termes pauper. Socius tam ambulo derideo. Circumvenio vinitor ager atrox curriculum unde usitas pauper cohaero corrumpo.	4	t	Conjunto	https://loremflickr.com/1512/2830/cinema?lock=2647625782426557	2025-07-19 00:56:41.347
15	Fantastic Marble Keyboard	Caries conspergo curis odit arbustum eum confero adulescens. Suppellex aegre ustilo advenio unde. Verbum abeo carmen ventus deripio conscendo.	9	t	Bebop	https://loremflickr.com/3828/2411/cinema?lock=1337392314720151	2025-07-20 20:21:29.488
17	Can't Hurt Me	David goggins	7	t	Action	\N	2025-08-13 13:51:02.239936
21	Mapouka sérré	mapouka doux je te dit	6	f	Dance	https://i.ytimg.com/vi/NuoqMmFkPdw/maxresdefault.jpg	2025-08-14 17:08:46.998168
1	Gorgeous KOUAKOU	Ulciscor vilis libero ventus. Clibanus tener trucido terror creptio. Adopto aeger quod conservo conventus cunae centum vox defessus.	14	t	Conjunto	https://loremflickr.com/3607/2460/cinema?lock=2057344697265119	2025-07-07 16:07:50.21
19	Can't Hurt Me of david	David goggins is a bad MFK of the planet hurt	10	t	Action	\N	2025-08-13 13:51:25.969557
13	Practical Bamboo Chips	Auxilium vigor decumbo summisse cubitum cuppedia thymbra bestia aro tumultus. Censura fugiat creber necessitatibus cuius corrupti thesis urbanus nulla. Laborum solum amitto summisse.	14	f	Blue Note	https://loremflickr.com/246/1318/cinema?lock=1797427923553957	2025-07-21 03:31:20.796
3	Electronic Bamboo Cheese	Bibo capio cometes comptus cattus tandem ventus doloribus aspicio. Degusto comes verbera eius traho cado triumphus. Tubineus subseco amissio torqueo.	17	t	Relaxation	https://loremflickr.com/1471/3332/cinema?lock=5273481762258658	2025-07-23 11:50:21.485
24	Mercredi	Mercredi Addams est envoyée à Nevermore Academy, un pensionnat pour adolescents dotés de pouvoirs surnaturels : les vampires appelés les crocs, les loups-garous appelés les fourrures, les sirènes appelés les écailles et les gorgones appelés les rocs.\r\n\r\nDans un climat de mystères et de meurtres, elle se retrouve mêlée à une série d’enquêtes troublantes.\r\nLa saison 1 s’achève sur un message inquiétant reçu par Mercredi : « Je te surveille », annonçant les tensions à venir…	15	f	Dance	https://www.justfocus.fr/wp-content/uploads/2025/05/Mercredi-saison-2-premier-trailer.jpg	2025-10-17 09:38:53.197824
22	Hunter x Hunter: Phantom Rouge	Un jour, Kurapika aperçoit un enfant qui ressemble beaucoup à son ami d'enfance, Pyro. Cependant, lorsqu'il le rattrape, le garçon lui vole ses yeux à l'aide d'un pouvoir magique. Gon, Leorio et Killua promettent de l'aider à retrouver celui qui lui a pris ses yeux et à les récupérer, mais Killua est confronté à ses propres problèmes lorsqu'il est obligé de faire face à son passé et de se demander s'il est vraiment digne d'avoir Gon comme ami.	7	f	Action	https://image.tmdb.org/t/p/w342//tBbr1LJn5rrP08Y16jJAKwLEECf.jpg"	2025-08-24 19:48:47.057134
7	Electronic Granite Cheese	Temptatio valeo amplitudo amplexus vita verto sponte patruus aut. Deserunt curriculum cursus perspiciatis dedecor contego sub cura clibanus. Solitudo thorax turba turpis omnis desipio dolore.	6	f	New Acoustics	https://loremflickr.com/3198/3211/cinema?lock=7025936985347361	2025-07-05 17:17:49.434
27	UFC	Francis Ngannou, né le 5 septembre 1986 à Batié au Cameroun, est un pratiquant camerounais d'arts martiaux mixtes (MMA) et de boxe professionnelle.\r\n\r\nArrivé en décembre 2015 à l'Ultimate Fighting Championship (UFC), la plus grande organisation mondiale d'arts martiaux mixtes, il s'impose à six reprises avant la limite de temps sans jamais être défait. Cela lui vaut sa première chance de titre face à l'Américain Stipe Miocic en janvier 2018 et son premier revers à l'UFC. Le combattant camerounais reprend alors sa course au titre avant d'enfin remporter cette ceinture en mars 2021 face au même adversaire. Après avoir défendu son titre face à son ancien partenaire d'entrainement, le Français Ciryl Gane, il quitte l'organisation en janvier 2023 pour un différend contractuel et abandonne par la même occasion son titre de champion de la catégorie des poids lourds	18	f	Action	https://i.pinimg.com/1200x/83/55/33/835533c1adda5156999ca96eecb517c3.jpg	2025-11-26 10:54:14.208566
\.


--
-- Data for Name: salle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salle (id_salle, nom_salle, capacite, qualite_projection, id_cinema) FROM stdin;
3	Salle 3	60	HD	1
4	Salle 1	70	4K	2
6	Salle 3	127	HD	2
7	Salle 1	82	IMAX	3
10	Salle 1	92	IMAX	4
11	Salle 2	115	IMAX	4
12	Salle 3	112	IMAX	4
13	Salle 1	165	IMAX	5
14	Salle 2	163	HD	5
15	Salle 1	194	IMAX	6
16	Salle 2	53	4K	6
17	Salle 1	87	IMAX	7
18	Salle 2	120	4K	7
19	Salle 3	88	IMAX	7
20	Teodoro Obiang	30	IMAX	3
22	Paris salle 1	30	3D	3
21	TIKAYA	30	IMAX	4
9	EquatorialGuinea	112	4K	3
23	Thomas Sankara	98	4K (UHD)	3
24	Salle Exopholia	50	4K	3
26	Salle Dévothé	50	4K	1
25	Salle Lothitheriqua	70	4K	7
27	Salle Don Exeleticima	50	4DX	1
2	Poatan	184	IMAX	1
1	Salle 1	107	IMAX	1
28	Salle Don Theodoro Obiang	60	4DX	4
8	Salle 2	91	3D	3
5	Salle 2	126	4K	2
\.


--
-- Data for Name: seance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seance (id_seance, heure_debut, heure_fin, prix, id_salle, id_film, date_seance, qualite_projection) FROM stdin;
3	16:15:27	18:15:27	8.39	9	1	2025-09-01	4K
4	20:19:02	22:19:02	8.40	10	2	2025-12-06	4K
5	20:08:29	22:08:29	19.95	10	2	2025-08-19	IMAX
6	18:30:18	20:30:18	6.70	8	2	2025-09-10	HD
7	10:09:17	12:09:17	10.59	11	3	2025-09-10	IMAX
8	14:32:58	16:32:58	12.39	7	3	2025-10-17	HD
10	19:55:53	21:55:53	19.35	12	3	2025-08-03	IMAX
11	10:03:49	12:03:49	6.25	13	4	2025-10-16	HD
12	13:10:31	15:10:31	12.45	2	4	2025-09-26	4K
13	12:19:08	14:19:08	14.95	5	4	2025-09-16	IMAX
14	19:16:59	21:16:59	10.65	10	4	2025-08-04	4K
15	15:02:07	17:02:07	16.09	16	5	2025-09-09	HD
16	10:07:52	12:07:52	8.69	18	5	2025-10-13	HD
17	15:13:51	17:13:51	9.39	11	5	2025-08-08	IMAX
18	20:49:54	22:49:54	11.79	15	5	2025-10-08	HD
19	14:38:34	16:38:34	19.75	11	5	2025-11-27	HD
20	10:37:09	12:37:09	18.20	9	6	2025-11-01	HD
21	20:12:41	22:12:41	19.95	6	6	2025-07-17	HD
22	11:30:08	13:30:08	18.89	14	7	2025-11-19	HD
23	19:17:31	21:17:31	10.12	15	7	2025-10-24	HD
24	17:47:44	19:47:44	13.75	10	7	2025-07-29	4K
25	12:17:34	14:17:34	12.29	6	7	2025-08-28	IMAX
26	14:00:43	16:00:43	10.95	17	7	2025-10-20	4K
27	12:07:18	14:07:18	12.19	11	8	2025-11-10	HD
28	19:28:30	21:28:30	16.79	9	8	2025-08-05	HD
30	10:52:29	12:52:29	15.69	5	8	2025-11-12	4K
31	16:52:12	18:52:12	7.49	3	9	2025-08-23	HD
32	11:51:08	13:51:08	9.65	4	9	2025-09-17	HD
33	18:43:10	20:43:10	19.95	18	9	2025-12-14	IMAX
34	12:41:26	14:41:26	8.11	4	9	2025-11-22	4K
35	13:56:41	15:56:41	6.87	11	9	2025-11-29	HD
38	18:16:49	20:16:49	7.99	18	10	2025-07-26	4K
39	11:56:14	13:56:14	12.99	8	10	2025-09-12	HD
40	18:51:05	20:51:05	5.09	10	11	2025-08-29	4K
41	18:23:26	20:23:26	8.95	11	11	2025-07-27	IMAX
42	15:19:26	17:19:26	16.95	2	11	2025-08-04	IMAX
43	10:15:36	12:15:36	17.89	19	11	2025-09-26	HD
45	11:49:14	13:49:14	9.19	1	12	2025-07-19	IMAX
46	20:04:05	22:04:05	12.19	18	12	2025-08-20	IMAX
47	15:08:44	17:08:44	6.45	3	12	2025-12-04	HD
48	11:24:06	13:24:06	6.55	16	13	2025-11-27	HD
49	12:57:57	14:57:57	7.09	15	13	2025-09-14	IMAX
51	17:57:06	19:57:06	14.19	9	13	2025-11-28	4K
53	11:23:51	13:23:51	19.19	10	14	2025-08-15	IMAX
54	15:19:59	17:19:59	15.59	7	14	2025-08-15	4K
55	13:17:16	15:17:16	7.80	9	14	2025-08-14	IMAX
56	20:40:41	22:40:41	9.95	6	15	2025-11-04	IMAX
57	15:30:03	17:30:03	17.65	13	15	2025-09-25	HD
58	14:32:22	16:32:22	17.29	19	15	2025-11-22	HD
59	16:34:39	18:34:39	19.40	2	15	2025-11-06	IMAX
60	14:37:00	16:37:00	15.00	1	17	2025-08-24	IMAX
44	17:06:00	19:06:00	13.40	1	11	2025-12-05	4K
52	15:05:00	17:05:00	6.89	14	14	2025-12-15	4K
37	10:17:00	12:17:00	1500.00	9	10	2025-08-16	IMAX
50	17:16:00	19:16:00	11.27	20	13	2025-08-16	IMAX
61	18:12:00	20:12:00	20.00	20	21	2025-08-30	IMAX
62	20:32:00	21:37:00	40.00	22	21	2025-08-17	IMAX
29	16:08:00	18:08:00	11.05	21	8	2025-08-14	HD
2	15:52:00	17:52:00	13.09	23	1	2025-08-27	4K (UHD)
1	13:11:00	15:11:00	12.99	19	1	2025-12-14	4K
63	19:26:00	21:44:00	25.00	23	22	2025-08-28	4K (UHD)
66	09:32:00	15:27:00	16.00	9	19	2025-11-02	IMAX
9	17:43:00	19:43:00	9.59	12	3	2025-11-23	2D
36	18:42:00	20:42:00	7.69	16	10	2025-11-06	IMAX
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id_user, nom_user, prenom_user, date_creation_compte, username, email, password, role, password_temp) FROM stdin;
1	Roberts	Willis	2025-07-25	Douglas57	Denis_Block@yahoo.com	hashed_password	USER	f
2	Cremin	Omari	2025-07-25	Frederik.Gorczany33	Gianni16@yahoo.com	hashed_password	USER	f
3	Skiles	Sandy	2025-07-25	Leanna64	Judge_Schmitt6@gmail.com	hashed_password	USER	f
4	Kirlin	Laverna	2025-07-25	Clemmie89	Neha_Wiza@gmail.com	hashed_password	USER	f
5	Leuschke	Kody	2025-07-25	Merle.McLaughlin	Manuela_Doyle78@gmail.com	hashed_password	USER	f
6	Larkin	Dereck	2025-07-25	Darrin14	Gussie21@hotmail.com	hashed_password	USER	f
7	Jast	Rylee	2025-07-25	Bailee_Reilly57	Isaias.Hudson-Legros91@gmail.com	hashed_password	USER	f
8	Schuppe	Mittie	2025-07-25	Humberto_Romaguera53	Amanda12@hotmail.com	hashed_password	USER	f
9	Bradtke	Casper	2025-07-25	Aniya.Torphy28	Felix.Boehm70@hotmail.com	hashed_password	USER	f
10	Walker	Irma	2025-07-25	Lionel_Powlowski58	Chasity.Lang65@gmail.com	hashed_password	USER	f
11	KOUAKOU	Johann Wiha tikaya	2025-07-25	Johqs	tikaya1999+qsqsqs@gmail.com	$2b$10$BELXjx.Hlhg6r.hNqWx7eO9vXqHGPID1irmb4gkQ3YnKDWZpodmVK	USER	f
12	KOUAKOU	Johann Wiha tikaya	2025-07-25	Johanzeaz	tikaya1999+131321@gmail.com	$2b$10$gNYgXj0l5FqkbwKLy4DvNOTLF/Uq1hAOlgMzeNP6eYNbB74ozXjgG	USER	f
13	KOUAKOU	Johann Wiha tikaya	2025-07-25	Johdssd	tikaya1999+sdlkjsfdld@gmail.com	$2b$10$xMmufEOOFQiMuZXn362X.OAvTO9dhV1sKqNknQD.xosEF.efSr5Oq	USER	f
14	KOUAKOU	Teodoro	2025-07-31	tikaya19875	tikaya1999+12lo@gmail.com	$2b$10$WjJkhf4G6iX7/brgnYiePe.kZyrpvHDHNho2Qhekd2D5p2n.FpJaS	USER	f
16	Admin	Root	2025-08-09	admin	admin@cinephoria.local	$2b$12$1DVj8GqYA6lGs2rdgo6wheLaibHnGXQVQ/.vaV1Z9VuF.YPKQDCPu	ADMIN	f
17	Takumi	Fujihara	2025-10-06	InitialD	tikaya1999+86@gmail.com	$2b$10$pV1i2xkwIbYoMUs37ce6det5xPgQ1tIvjIl4QN6.Klkr6XOS2gdfm	USER	f
18	KOUAKOU	Tikaya	2025-10-12	TIKAYAmARC	tikayamarc@gmail.com	$2b$10$lZLlYYYz.H9D5tSTPMN5d.AGtOx5txukOsOTgdoZBft/FpISdgNOC	USER	f
19	KOUAKOU	Johann Wiha tikaya	2025-11-22	Tikou	tikaya1999+testAB@gmail.com	$2b$10$vBOO9io9AbA1cUSLMV7ePeTJ1rSjKXHUkUwDruQNsNcdgmHBHmVfO	USER	f
15	KOUAKOU	Johann 	2025-07-31	tikaya1999	tikaya1999@gmail.com	$2b$10$0YLYHLv4zVDj/3TtpXE1Sero3HnQ42k9yoe12zSyjkuKGDFYVAV4y	USER	f
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.note (id_note, note, commentaire, valide_par_employe, id_user, id_film, id_seance) FROM stdin;
154	6	Cras usitas acquiro approbo trado currus.	\N	5	8	30
1	9	Suppellex abduco spargo decipio soluta adinventitias quidem veritas absum.	\N	7	1	1
2	0	Beatae timor cognomen armarium adaugeo curso aegrotatio audax tabesco iusto.	\N	5	1	1
3	2	Debilito vallum inventore aetas ulterius vitium traho depereo.	\N	6	1	1
4	3	Clam utpote carcer alter stips solitudo.	\N	7	1	1
5	10	Bellicus subseco tandem corrupti vulnus tego caries vae.	\N	9	1	1
6	0	Exercitationem corporis balbus.	\N	8	1	1
7	8	Ambitus aufero ullam officiis.	\N	4	1	2
8	3	Absens vero vinitor doloremque.	\N	10	1	2
9	3	Ventito virga usque adicio attero vobis.	\N	4	1	2
10	4	Tumultus vere illo.	\N	1	1	2
11	4	Cubitum blanditiis vesco delinquo atrox dolore crebro defero unus taceo.	\N	1	1	2
12	10	Solium suscipio argentum censura argumentum aggredior quae inflammatio angulus.	\N	10	1	2
13	9	Concido aperiam antiquus verto villa creator.	\N	1	1	2
14	0	Caelum casus ab.	\N	4	1	3
15	1	Abutor deficio vestrum culpa.	\N	5	1	3
16	2	Laboriosam crudelis alveus absconditus temptatio trepide suus appello comptus adamo.	\N	9	1	3
17	2	Textus aestivus caries vigor quam talus dignissimos concedo desipio cohibeo.	\N	1	1	3
18	1	Corporis annus debilito cena eaque peior cubitum nesciunt.	\N	6	1	3
19	3	Copia atque acerbitas.	\N	10	1	3
20	7	Vitium cultura quo somnus auxilium asper correptius absum crustulum.	\N	1	2	4
21	2	Sint cunae tibi sodalitas truculenter adfectus vulpes conturbo quidem cognatus.	\N	7	2	4
22	7	Ventus turba theatrum avaritia torqueo subseco certus delego delibero vilitas.	\N	7	2	4
23	0	Carpo arx abbas utpote delectatio tergeo cito advenio.	\N	9	2	4
24	0	Vestigium sortitus theca audax cras vir amita absque claudeo denuo.	\N	3	2	4
25	4	Charisma hic venio summopere expedita alii adnuo consequuntur.	\N	7	2	4
26	4	Et patrocinor synagoga capillus atrocitas delicate ceno correptius.	\N	6	2	4
27	5	Asporto caveo volubilis compello sordeo sperno curia.	\N	4	2	5
28	5	Adduco cohibeo contigo vacuus vestrum.	\N	6	2	5
29	6	Appello conculco taceo tres.	\N	10	2	5
30	4	Tertius cupiditas vinco catena delego accusamus tremo necessitatibus.	\N	3	2	5
31	2	Antea defleo vesper cubo amiculum vigor abeo.	\N	8	2	5
32	0	Auditor tantillus tres dolores tergum thymbra combibo venia.	\N	9	2	5
33	0	Temperantia adstringo addo varietas agnitio.	\N	7	2	6
34	10	Copia circumvenio assumenda patior crudelis cornu.	\N	9	2	6
35	4	Vesper complectus acquiro cohors video ciminatio acidus astrum traho.	\N	2	2	6
36	0	Circumvenio vigor ea thalassinus.	\N	8	2	6
37	4	Attonbitus concedo volup abutor virgo ademptio maiores adipisci cubo uter.	\N	3	3	7
38	6	Despecto totam cupiditas expedita error theologus vociferor molestias amplus delibero.	\N	4	3	7
39	6	Cunctatio cunabula concedo delinquo subnecto ustilo aeternus nam versus accedo.	\N	8	3	7
40	0	Vallum anser tredecim video ut adficio omnis.	\N	7	3	7
41	9	Tero pariatur uberrime.	\N	6	3	7
42	9	Aeger thymbra curso defluo spectaculum praesentium argentum demoror cubicularis toties.	\N	9	3	7
43	3	Casus defero rerum barba defluo adflicto textus deserunt bardus.	\N	7	3	7
44	6	Crebro vulgus alias curo totam tamdiu cui sophismata.	\N	10	3	8
45	1	Torrens deprecator appositus temperantia textus.	\N	3	3	8
46	7	Cupiditate claudeo tristis adsidue vae bardus timor.	\N	5	3	8
47	8	Compello terga curis sophismata textilis deleo.	\N	9	3	8
48	2	Terebro decumbo iusto dens assentator acidus comis civis solio.	\N	9	3	8
49	0	Cattus sublime textilis curvo.	\N	6	3	8
50	8	Ratione ipsum desolo audentia theca quo cado cunctatio.	\N	2	3	8
51	0	Aliquid sophismata artificiose illo.	\N	7	3	9
52	5	Articulus tamdiu temporibus.	\N	6	3	9
53	8	Custodia impedit numquam.	\N	3	3	9
54	4	Terreo tactus decens crux hic.	\N	2	3	10
55	8	Voveo theatrum unde.	\N	2	3	10
56	5	Desino cerno denuncio tempora nemo tabernus depono.	\N	6	3	10
57	1	Repellendus aer constans sollers validus enim dolore.	\N	10	3	10
58	1	Sonitus quam tamisium solvo approbo amet depereo admitto urbs crebro.	\N	9	3	10
59	2	Suus comedo color degenero statua sodalitas corrupti cetera pauper.	\N	8	3	10
60	9	Administratio ara cum celer utrum tunc adstringo suggero vigor vulticulus.	\N	9	3	10
61	4	Decumbo cunctatio delicate cohaero decumbo tyrannus conicio.	\N	4	4	11
62	0	Ullus a fugiat surculus tutis tepidus pectus.	\N	5	4	11
63	4	Sto bibo amita aperio.	\N	5	4	11
64	1	Vesper ut defero curis celo caute amicitia cohaero conitor.	\N	6	4	11
65	0	Candidus certus urbs uxor unus thymum tibi conscendo laborum.	\N	5	4	12
66	8	Altus carbo tener agnosco asper defetiscor cursim tum conduco.	\N	7	4	12
67	1	Temeritas tibi avaritia bis.	\N	8	4	12
68	8	Certe defetiscor tepesco tondeo exercitationem tabella vomito calculus vorago.	\N	3	4	12
69	6	Possimus territo ambulo avaritia villa toties acer astrum.	\N	5	4	12
70	9	Vae velum aedificium solvo decerno certus.	\N	3	4	13
71	8	Aureus degero tempora abduco celo tabella minima aut tubineus.	\N	8	4	13
72	5	Nemo conventus angelus.	\N	3	4	13
73	0	Facere adhaero celo demergo maxime tenetur arcus.	\N	5	4	13
74	2	Apostolus reprehenderit suspendo complectus acies patruus animadverto.	\N	9	4	13
75	6	Absorbeo aggredior tabesco copiose tyrannus tempore audio conculco adfero.	\N	7	4	14
76	0	Paens comprehendo aestivus demulceo.	\N	6	4	14
77	9	Laborum viridis votum voluptas truculenter demo bellicus cibo.	\N	9	4	14
78	0	Sulum territo conventus.	\N	9	5	15
79	2	Vigilo solus praesentium considero altus currus ab canto vito.	\N	6	5	15
80	8	Repudiandae verus thalassinus turpis expedita tui fugit aperio viridis valens.	\N	9	5	15
81	5	Cervus peior cruentus deficio sponte speculum.	\N	4	5	15
82	10	Caelum arbustum ter atque.	\N	9	5	15
83	4	Sublime demum argentum tero bestia deputo timor thymum trans alo.	\N	10	5	15
84	9	Acerbitas voro possimus aufero tergeo.	\N	7	5	16
85	10	Conicio tendo casus considero ut annus voluptate curo.	\N	9	5	16
86	7	Voluptatem victoria ipsa bos sustineo accusator cauda.	\N	8	5	16
87	4	Alias decens amoveo adnuo.	\N	4	5	17
88	4	Perspiciatis ago illo degusto demergo volo.	\N	9	5	17
89	8	Votum volutabrum vivo pecus.	\N	5	5	17
90	7	Arca uxor corporis audacia vulariter.	\N	9	5	17
91	3	Tego caries trado.	\N	7	5	17
92	7	Comburo stips illo taceo audentia ipsam cenaculum.	\N	2	5	17
93	2	Adversus acceptus comedo.	\N	5	5	17
94	10	Civitas acidus civis harum amoveo terreo suscipit saepe.	\N	10	5	18
95	4	Debilito ascisco villa aeger denuo.	\N	8	5	18
96	5	Antepono utrimque apto agnosco.	\N	3	5	18
97	7	Derideo eligendi vinum vomica.	\N	7	5	18
98	5	Adflicto tardus cubitum quibusdam.	\N	4	5	18
99	7	Thermae copia ultra defluo coniecto apto arcesso cruciamentum corona.	\N	8	5	18
100	4	Thesis statim bestia reiciendis.	\N	2	5	19
101	6	Verbum id consectetur atrocitas.	\N	9	5	19
102	6	Assentator capto callide culpa sodalitas vomer aetas.	\N	4	5	19
103	7	Degero decerno iste.	\N	9	5	19
104	5	Culpa aegrotatio defluo.	\N	4	5	19
105	9	Vaco comparo somniculosus.	\N	7	5	19
106	0	Verecundia adsidue corporis sopor absque communis sursum corona.	\N	2	5	19
107	1	Suasoria veritas alioqui vestrum desolo praesentium.	\N	10	6	20
108	7	Deleniti arbitro sursum amiculum rem bis repudiandae.	\N	2	6	20
109	6	Deleniti tempore velit copiose alter tandem sponte.	\N	3	6	20
110	8	Accendo vilicus umquam sponte ipsa cras defleo.	\N	1	6	21
111	8	Ambulo aggredior confido soleo sed alioqui tabula cerno.	\N	10	6	21
112	0	Cicuta color tepesco textus dignissimos cicuta pel cursim.	\N	9	6	21
113	7	Clamo vinculum statim cena veniam verbum.	\N	9	6	21
114	6	Summisse alias sed viriliter.	\N	6	6	21
115	0	Tergo assentator cogo pariatur consequuntur capitulus cursus vinitor apparatus cuppedia.	\N	7	6	21
116	4	Iure coerceo agnosco aeger angustus cauda texo expedita.	\N	10	7	22
117	5	Terror deripio tutamen arto vobis usitas vulgo debitis caste.	\N	5	7	22
118	1	Assumenda sulum saepe combibo asper viduo.	\N	3	7	22
119	1	Desparatus dolore terminatio addo absorbeo nostrum.	\N	7	7	22
120	4	Tribuo arbitro usus turba facilis cohaero.	\N	7	7	22
121	4	Amplitudo tam tener aer talis calculus.	\N	3	7	22
122	1	Tandem curto tempus laudantium modi calculus.	\N	9	7	22
123	6	Decor nam deinde tredecim aveho patruus dignissimos.	\N	2	7	23
124	10	Suadeo viduo vester terga odit subiungo voluptatem quam carmen.	\N	7	7	23
125	8	Tripudio consectetur assentator tollo basium tumultus explicabo hic.	\N	8	7	23
126	10	Animus thesaurus nihil demitto tamdiu suasoria dolor torqueo degero curto.	\N	9	7	24
127	2	Suasoria delibero amaritudo artificiose adsidue dapifer tredecim solutio.	\N	8	7	24
128	4	Decipio tero cattus amissio carmen certe calco asporto.	\N	8	7	24
129	2	Sto verto cursus canto tredecim approbo.	\N	6	7	25
130	7	Tenus vigilo paens cunae ademptio contigo.	\N	2	7	25
131	6	Arma admoneo verto vito armarium viridis cilicium.	\N	9	7	25
132	1	Valetudo admitto triumphus termes aeternus curso vestrum.	\N	4	7	25
133	9	Necessitatibus taedium adinventitias accusamus tondeo crustulum.	\N	5	7	25
134	9	Acidus tamquam vulgus utrum aggredior volubilis neque absens.	\N	5	7	25
135	8	Curiositas caritas tumultus cursim currus quaerat textus volaticus magni.	\N	4	7	26
136	10	Ullus necessitatibus cumque textor temptatio patrocinor asporto video sortitus apto.	\N	6	7	26
137	5	Corona nobis cohaero cariosus denego.	\N	5	7	26
138	9	Urbanus color casus cultellus.	\N	8	7	26
139	10	Creptio compono cuppedia agnitio comprehendo aequitas accusator aureus.	\N	9	8	27
140	3	Velut torqueo cogo verecundia aiunt.	\N	5	8	27
141	5	Attero aptus bis acquiro.	\N	5	8	27
142	2	Debitis debitis coniecto.	\N	8	8	27
143	3	Utilis voveo teneo tricesimus sollicito pecco decretum.	\N	5	8	27
144	8	Excepturi veritas theologus dolores quos.	\N	1	8	28
145	6	Xiphias pauci possimus pauci carbo nemo dolore.	\N	7	8	28
146	0	Voluptates approbo clam debilito aestivus cunabula tabula ea.	\N	8	8	28
147	8	Audentia velit verecundia cicuta.	\N	6	8	28
148	0	Valeo vestrum velum teres vado adulescens molestias chirographum.	\N	2	8	28
149	8	Turba facilis porro.	\N	9	8	29
150	3	Aduro condico officiis cohibeo accusamus defendo asperiores creta considero crepusculum.	\N	10	8	29
151	7	Vomica derelinquo strues color blandior.	\N	7	8	29
152	3	Commodi utroque atrocitas ventus sapiente uberrime creta triumphus damnatio.	\N	10	8	29
153	9	Totam baiulus sequi aequus.	\N	4	8	30
155	10	Valetudo admoveo terror verbera suscipio aer delego aequitas.	\N	3	8	30
156	6	Valeo ambitus valde atque enim quo considero vita.	\N	8	8	30
157	1	Abduco confugo timor deprimo approbo ut acsi beatus brevis.	\N	9	9	31
158	6	Aperte carus cervus suggero perferendis argumentum vita deinde thymbra canis.	\N	9	9	31
159	2	Socius catena asporto amplus advenio.	\N	10	9	31
160	9	Villa alias adsum reprehenderit trepide vociferor.	\N	8	9	31
161	2	Creta deleo combibo viscus vigor cilicium virtus denego.	\N	1	9	32
162	10	Agnitio atrox delectatio coadunatio pauci tolero volubilis admitto adfectus aro.	\N	4	9	32
163	7	Astrum blanditiis dicta adfectus collum compono subvenio deludo advenio.	\N	10	9	32
164	3	Adficio cena pectus sumo vito comedo.	\N	3	9	32
165	5	Desolo brevis tripudio desipio argumentum totam iure fuga tubineus desidero.	\N	1	9	33
166	6	Vetus templum tabernus.	\N	1	9	33
167	1	Summa vox desino itaque antepono magni deinde eum vehemens.	\N	10	9	33
168	2	Sui pauper conventus cunae aptus.	\N	3	9	33
169	7	Claudeo quas umerus.	\N	1	9	33
170	6	Voluptates inflammatio peior depopulo vociferor viscus testimonium.	\N	5	9	33
171	6	Stabilis occaecati audentia tamisium tracto comburo traho aestas.	\N	1	9	33
172	9	Defetiscor spes aeternus theologus beatus suffragium apto confero alienus vilitas.	\N	6	9	34
173	8	Avarus odio capio canonicus.	\N	8	9	34
174	9	Conduco delectus spoliatio armarium cubicularis statim acidus odio corona.	\N	5	9	34
175	3	Acceptus adicio cervus statua deprimo pariatur facilis.	\N	2	9	35
176	9	Capillus molestiae uredo depraedor volaticus.	\N	7	9	35
177	4	Compello temporibus voluptates terga expedita pauci teneo.	\N	8	9	35
178	0	Ver vulnero strenuus convoco cibo.	\N	5	9	35
179	2	Teneo ago caritas cado cornu cui.	\N	10	9	35
180	5	Demonstro vomer calculus attonbitus creo volutabrum bestia alii accedo.	\N	9	9	35
181	9	Cogito succurro carcer crebro ipsam curvo defluo.	\N	7	9	35
182	3	Vinculum stillicidium ipsa tredecim vulgo asperiores dignissimos articulus.	\N	10	10	36
183	4	Facilis curis speciosus audentia stultus.	\N	5	10	36
184	6	Soleo agnitio error.	\N	10	10	36
185	6	Arto vorax deserunt aestivus conor aspicio adulatio tenus triumphus.	\N	9	10	36
186	9	Patria accusamus viscus talis suspendo acsi tabula thema.	\N	10	10	36
187	3	Artificiose canis tunc vitium reprehenderit.	\N	2	10	36
188	8	Sonitus varius cauda ex temporibus conspergo ad ustilo.	\N	9	10	37
189	0	Officia admitto officia.	\N	7	10	37
190	4	Deserunt valens arto audax solium velociter adulescens maxime terreo.	\N	2	10	37
191	1	Cresco tondeo corrigo depulso vicinus soleo.	\N	7	10	37
192	0	Nulla adulatio deleniti subito.	\N	10	10	37
193	7	Synagoga adaugeo aro tener.	\N	3	10	37
194	4	Delinquo consuasor vacuus dolor iusto vester teneo vehemens.	\N	9	10	38
195	6	Aperte cibus conscendo desipio suffragium.	\N	9	10	38
196	5	Alo deripio despecto quod patrocinor substantia accendo clarus vulgus.	\N	7	10	38
197	10	Audio adsuesco vergo crux vacuus pax eum.	\N	7	10	38
198	7	Repudiandae debilito tero curso amet sui venio nisi.	\N	6	10	38
199	9	Villa adulatio explicabo enim aggero videlicet.	\N	8	10	38
200	8	Armarium argumentum venia coruscus alter coma sol.	\N	1	10	39
201	4	Valens conforto tempore toties solum acervus creber admoneo.	\N	10	10	39
202	10	Collum vix solium.	\N	10	10	39
203	1	Urbs spoliatio textor sursum cohibeo concedo absens.	\N	2	11	40
204	6	Auctor aureus deprecator sint ara texo summisse denego denuncio adduco.	\N	2	11	40
205	8	Carpo apparatus caste ceno cognomen absens.	\N	10	11	40
206	3	Delicate considero uxor.	\N	8	11	40
207	8	Accusamus tenus contabesco.	\N	4	11	40
208	6	Deorsum repellendus coaegresco admiratio.	\N	5	11	40
209	8	Illum aestivus usus contra claudeo consuasor amaritudo aurum.	\N	9	11	40
210	4	Taedium sortitus tot ara cubicularis est tabernus qui capio admitto.	\N	7	11	41
211	2	Certe audio cui verus deprecator calamitas sophismata.	\N	10	11	41
212	10	Voluptate ullus harum aequitas abbas spero coniecto bardus.	\N	3	11	41
213	0	Doloribus arcesso sopor stabilis.	\N	8	11	41
214	7	Audacia tolero utroque usque.	\N	7	11	42
215	0	Summa vix porro solvo attonbitus voluptates clarus.	\N	9	11	42
216	5	Reprehenderit tertius a fugit earum vulnus appono vinculum.	\N	7	11	42
217	4	Molestiae eos venustas talus adsum.	\N	5	11	42
218	9	Somniculosus ea stella crepusculum theca pectus crapula cunae paulatim audeo.	\N	8	11	42
219	3	Claro tantum angustus toties cupiditas quibusdam vitiosus conicio defero enim.	\N	6	11	42
220	0	Conqueror cometes arceo.	\N	9	11	43
221	10	Volva carpo cura tersus tyrannus corona talis.	\N	10	11	43
222	6	Acceptus thymum thorax altus ancilla socius peior animus color.	\N	7	11	43
223	10	Adflicto substantia iure carus.	\N	7	11	43
224	7	Suffragium ars utilis aut censura amplitudo.	\N	4	11	43
225	6	Crustulum ad arceo speciosus spargo sordeo ipsa tredecim.	\N	10	11	44
226	1	Approbo trucido contra attonbitus.	\N	5	11	44
227	0	Cur campana umquam.	\N	1	11	44
228	2	Desino tardus cruciamentum thesaurus carus verus vulgivagus vobis terebro.	\N	2	11	44
229	10	Eligendi triduana vallum.	\N	5	11	44
230	9	Peccatus adeo defero suus deleniti depono cunae.	\N	7	12	45
231	1	Ademptio fuga conforto defluo considero claro demo sono.	\N	10	12	45
232	6	Ipsa quis thalassinus catena decens.	\N	10	12	45
233	10	Aegre infit verbum torqueo aspernatur cuius.	\N	6	12	46
234	0	Torqueo provident vivo adaugeo vesica surculus.	\N	5	12	46
235	10	Quidem tandem vulariter vos itaque versus volva sustineo.	\N	6	12	46
236	0	Absens facilis adfectus turbo aedificium thorax ara.	\N	2	12	46
237	3	Cruciamentum adeptio statua virgo vulticulus vitae.	\N	3	12	46
238	7	Quidem est eos torrens cuius taceo toties.	\N	9	12	47
239	4	Thesaurus vesper creator sopor tardus eaque claudeo.	\N	9	12	47
240	10	Sum inflammatio defleo.	\N	5	12	47
241	0	Tantillus nostrum animadverto concedo suscipio somniculosus.	\N	2	12	47
242	6	Tendo candidus deinde culpo cattus cuppedia somniculosus ago.	\N	2	13	48
244	8	Vulgo sapiente tracto esse caveo.	\N	8	13	48
245	7	Textus cetera apto vergo.	\N	1	13	48
246	5	Magni appono sopor articulus censura dicta angelus correptius error.	\N	10	13	48
247	3	Iure caelum sub cornu adflicto velum tepidus solio administratio cernuus.	\N	7	13	48
248	7	Usque desolo complectus venustas adversus videlicet adversus deserunt cometes.	\N	7	13	49
249	6	Vis summa terra tardus cupio coniuratio trepide arbitro decimus tutis.	\N	1	13	49
250	10	In tricesimus avaritia recusandae complectus patrocinor.	\N	7	13	49
251	4	Ulciscor cursus deludo ver labore.	\N	7	13	49
252	5	Non adsum defessus credo.	\N	3	13	49
253	0	Maiores tristis cado.	\N	6	13	50
254	7	Comis ventito paens coniuratio depereo tempus.	\N	9	13	50
255	0	Tolero quisquam pariatur non depono triduana cupio.	\N	10	13	50
256	5	Caries aspicio cornu crepusculum sonitus tripudio contego cumque odit.	\N	7	13	50
257	4	Enim absconditus cruentus alioqui una xiphias sui incidunt.	\N	1	13	51
258	6	Reprehenderit terga ait aiunt suspendo cum.	\N	8	13	51
259	3	Comparo circumvenio contigo.	\N	10	13	51
260	7	Copiose ea depraedor.	\N	3	14	52
261	9	Comis degero stips voluntarius corrupti suscipit.	\N	1	14	52
262	1	Fugit totus textor sit autus avaritia nobis tepesco.	\N	10	14	52
263	1	Utrimque suasoria nihil nemo utor.	\N	5	14	52
264	5	At succurro explicabo.	\N	5	14	52
265	9	Adeo at sulum amor videlicet eveniet verecundia unus cunae tamen.	\N	9	14	52
266	3	Viriliter certus validus sperno beneficium eum auctor.	\N	6	14	52
267	0	Angustus cavus vallum.	\N	10	14	53
269	6	Cibo tristis talus carbo cavus utpote patria.	\N	1	14	53
270	3	Balbus confido admoveo denuncio tracto deprecator itaque venia atque usus.	\N	6	14	53
271	9	Vilicus adipiscor deserunt amiculum curriculum.	\N	5	14	53
272	3	Vae stips arguo argumentum.	\N	2	14	54
273	9	Vapulus tutamen spero vorax succedo praesentium alter.	\N	4	14	54
274	5	Defleo curo tandem ademptio demulceo.	\N	10	14	54
275	1	Circumvenio desipio cur veniam tergeo.	\N	5	14	54
276	5	Confero defendo advenio super carmen.	\N	3	14	54
277	4	Mollitia volutabrum creta benigne sulum commodi vulnero aufero statua qui.	\N	2	14	54
278	10	Stips ubi adinventitias tyrannus succedo sumptus tego tantum succedo audax.	\N	4	14	55
279	6	Demum acidus comburo tutis terga velit sollers.	\N	2	14	55
280	2	Degusto depono civis ex quos auctor non textilis.	\N	3	14	55
281	9	Pecus vaco teneo comitatus subvenio contigo degenero subnecto umquam.	\N	10	14	55
282	4	Ea tergeo aestivus vespillo summisse amet eaque statim.	\N	6	14	55
283	10	Combibo vir vero.	\N	9	14	55
284	10	Tunc verbum spiritus vapulus curriculum.	\N	9	15	56
285	9	Veniam quibusdam thema subito charisma capto varius desidero strues.	\N	2	15	56
286	5	Ex stipes demo coniuratio vicinus vivo cumque concido laborum.	\N	1	15	56
305	10	Magnifique film	10	19	4	13
268	7	Vulgaris demum sponte tracto demens alii tempus viridis aqua.	10	6	14	53
303	10	Decumbo sequi custodia censura vergo.	10	4	15	59
304	4	Appono tumultus suppono audio.	10	4	15	59
243	0	Video harum abutor vulgaris alveus curvo utilis.	10	2	13	48
302	5	Approbo conicio vicissitudo spero tres reiciendis patrocinor derelinquo amaritudo.	10	8	15	59
299	4	Adhuc accusamus nisi amiculum ullus campana libero vindico.	10	6	15	58
298	10	Sol tertius comparo toties tersus spectaculum carbo tui inflammatio.	10	4	15	58
297	3	Nostrum campana casso virtus viduo.	10	8	15	58
296	7	Arcesso aestus deprecator sponte cinis ubi aveho basium velut demo.	10	4	15	58
295	8	Rem blandior temeritas unus somniculosus desparatus.	10	9	15	58
294	5	Creo succedo cruciamentum sumptus solium.	10	6	15	57
293	4	Curto ago vulgus crinis averto.	10	6	15	57
292	3	Communis dapifer sponte comptus vaco sumptus trado vehemens.	10	4	15	57
291	10	Tametsi summa necessitatibus adeo denique conduco sopor.	10	5	15	57
290	9	Aeternus terebro teres agnosco catena audax coruscus cubitum.	10	5	15	57
289	7	Sol verumtamen toties depromo auditor.	10	10	15	57
288	0	Necessitatibus benevolentia temeritas tutamen concido adduco tribuo perferendis comes vesco.	10	2	15	56
287	8	Rem tondeo armarium coniecto.	10	1	15	56
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (id_reservation, nombre_places, prix_total, etat, id_user, id_seance, created_at, updated_at) FROM stdin;
2	6	77.94	annulée	6	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
3	4	51.96	annulée	9	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
4	2	25.98	en attente	7	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
5	3	38.97	en attente	5	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
6	1	12.99	en attente	5	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
7	3	38.97	payée	9	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
8	2	25.98	payée	7	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
9	5	64.95	payée	8	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
10	4	51.96	en attente	6	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
11	1	12.99	payée	9	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
12	2	25.98	payée	4	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
13	1	12.99	annulée	6	1	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
14	4	52.36	payée	6	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
15	4	52.36	payée	5	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
16	4	52.36	annulée	10	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
17	3	39.27	annulée	7	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
18	2	26.18	annulée	10	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
19	1	13.09	annulée	8	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
20	3	39.27	annulée	6	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
21	4	52.36	payée	5	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
22	4	52.36	en attente	6	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
23	1	13.09	en attente	4	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
24	6	78.54	payée	5	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
25	5	65.45	annulée	9	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
26	2	26.18	annulée	8	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
27	1	13.09	annulée	4	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
28	1	8.39	payée	6	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
29	2	16.78	annulée	9	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
30	2	16.78	annulée	7	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
31	3	25.17	annulée	10	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
32	2	16.78	payée	9	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
33	5	41.95	en attente	4	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
34	1	8.39	en attente	7	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
35	2	16.78	annulée	1	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
36	3	25.17	en attente	8	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
37	1	8.39	annulée	7	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
38	6	50.34	annulée	4	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
39	1	8.39	annulée	8	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
40	4	33.56	en attente	7	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
41	5	41.95	en attente	6	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
42	3	25.17	en attente	3	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
43	3	25.17	payée	4	3	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
44	2	16.80	payée	10	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
45	5	42.00	annulée	6	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
46	5	42.00	en attente	3	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
47	1	8.40	payée	6	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
48	4	33.60	annulée	6	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
49	1	8.40	payée	4	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
50	2	16.80	payée	3	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
51	5	42.00	en attente	5	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
52	6	50.40	annulée	9	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
53	3	25.20	en attente	4	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
54	2	16.80	en attente	8	4	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
55	4	79.80	payée	1	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
56	6	119.70	payée	5	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
57	1	19.95	annulée	9	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
58	1	19.95	annulée	7	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
59	5	99.75	annulée	5	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
60	3	59.85	payée	9	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
61	1	19.95	en attente	3	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
62	4	79.80	annulée	6	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
63	2	39.90	payée	8	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
64	1	19.95	payée	10	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
65	6	119.70	payée	5	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
66	2	39.90	annulée	4	5	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
67	1	6.70	payée	6	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
68	5	33.50	payée	3	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
69	2	13.40	payée	10	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
70	5	33.50	en attente	10	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
71	1	6.70	en attente	4	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
72	6	40.20	payée	1	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
73	5	33.50	en attente	1	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
74	2	13.40	payée	6	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
75	5	33.50	annulée	8	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
76	3	20.10	annulée	3	6	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
77	6	63.54	payée	9	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
78	6	63.54	payée	4	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
79	1	10.59	annulée	6	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
80	1	10.59	annulée	6	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
81	2	21.18	annulée	5	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
82	3	31.77	en attente	2	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
83	4	42.36	annulée	7	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
84	4	42.36	en attente	4	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
85	3	31.77	en attente	4	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
86	5	52.95	payée	6	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
87	1	10.59	payée	3	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
88	2	21.18	en attente	3	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
89	2	21.18	annulée	3	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
90	6	63.54	annulée	9	7	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
91	2	24.78	annulée	5	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
92	6	74.34	en attente	3	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
93	6	74.34	en attente	2	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
94	4	49.56	annulée	3	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
95	6	74.34	en attente	7	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
96	1	12.39	payée	4	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
97	2	24.78	payée	2	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
98	2	24.78	en attente	2	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
99	1	12.39	payée	8	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
100	2	24.78	payée	6	8	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
101	4	38.36	annulée	2	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
102	5	47.95	annulée	4	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
103	2	19.18	en attente	5	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
104	4	38.36	payée	6	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
105	6	57.54	payée	6	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
106	1	9.59	en attente	8	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
107	1	9.59	annulée	2	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
108	3	28.77	en attente	9	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
109	5	47.95	annulée	3	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
110	3	28.77	en attente	4	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
111	3	28.77	annulée	10	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
112	4	38.36	en attente	1	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
113	2	19.18	en attente	5	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
114	1	9.59	en attente	4	9	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
115	6	116.10	payée	1	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
116	3	58.05	annulée	3	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
117	4	77.40	payée	1	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
118	2	38.70	annulée	4	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
119	3	58.05	en attente	6	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
120	5	96.75	payée	10	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
121	1	19.35	payée	10	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
122	1	19.35	en attente	4	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
123	1	19.35	en attente	3	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
124	5	96.75	payée	5	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
125	2	38.70	payée	9	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
126	6	116.10	en attente	9	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
127	5	96.75	payée	2	10	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
128	6	37.50	payée	3	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
129	5	31.25	annulée	1	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
130	4	25.00	annulée	8	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
131	1	6.25	annulée	8	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
132	6	37.50	en attente	8	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
133	1	6.25	payée	10	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
134	6	37.50	payée	7	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
135	1	6.25	annulée	9	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
136	2	12.50	en attente	4	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
137	5	31.25	en attente	3	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
138	4	25.00	annulée	5	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
139	4	25.00	annulée	6	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
140	1	6.25	payée	8	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
141	5	31.25	en attente	8	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
142	6	37.50	payée	1	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
143	4	25.00	payée	9	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
144	3	18.75	annulée	7	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
145	2	12.50	payée	5	11	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
146	4	49.80	annulée	1	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
147	1	12.45	annulée	5	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
148	2	24.90	payée	2	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
149	6	74.70	payée	1	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
150	3	37.35	annulée	7	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
151	3	37.35	payée	4	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
152	5	62.25	payée	8	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
153	2	24.90	payée	9	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
154	6	74.70	annulée	6	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
155	3	37.35	payée	4	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
156	5	62.25	annulée	1	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
157	1	12.45	annulée	8	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
158	1	12.45	en attente	4	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
159	1	12.45	payée	3	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
160	2	24.90	payée	3	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
161	1	12.45	payée	2	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
162	5	62.25	payée	1	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
163	5	62.25	en attente	1	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
164	1	12.45	en attente	3	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
165	5	62.25	annulée	5	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
166	1	12.45	payée	1	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
167	3	37.35	payée	7	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
168	2	24.90	en attente	4	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
169	5	62.25	en attente	5	12	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
170	1	14.95	payée	9	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
171	5	74.75	annulée	9	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
172	3	44.85	payée	2	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
173	4	59.80	annulée	8	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
174	6	89.70	annulée	10	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
175	5	74.75	payée	2	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
176	2	29.90	en attente	3	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
177	2	29.90	annulée	3	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
178	3	44.85	annulée	3	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
179	5	74.75	annulée	7	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
180	5	74.75	payée	8	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
181	6	89.70	en attente	9	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
182	3	44.85	annulée	7	13	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
183	4	42.60	annulée	10	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
184	2	21.30	payée	8	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
185	4	42.60	en attente	7	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
186	1	10.65	annulée	1	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
187	2	21.30	payée	6	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
188	2	21.30	payée	6	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
189	2	21.30	en attente	10	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
190	6	63.90	annulée	2	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
191	5	53.25	en attente	4	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
192	6	63.90	payée	2	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
193	1	10.65	annulée	5	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
194	1	10.65	en attente	2	14	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
195	1	16.09	annulée	10	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
196	3	48.27	payée	9	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
197	5	80.45	annulée	3	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
198	3	48.27	en attente	6	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
199	3	48.27	payée	3	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
200	2	32.18	en attente	6	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
201	2	32.18	annulée	9	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
202	1	16.09	annulée	10	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
203	1	16.09	en attente	4	15	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
204	6	52.14	en attente	7	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
205	3	26.07	annulée	9	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
206	5	43.45	annulée	6	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
207	3	26.07	annulée	8	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
208	1	8.69	annulée	10	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
209	6	52.14	payée	2	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
210	2	17.38	en attente	5	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
211	2	17.38	payée	10	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
212	4	34.76	payée	2	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
213	2	17.38	payée	10	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
214	6	52.14	en attente	2	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
215	2	17.38	annulée	7	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
216	1	8.69	payée	4	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
217	3	26.07	annulée	8	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
218	2	17.38	annulée	1	16	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
219	2	18.78	payée	3	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
220	4	37.56	en attente	6	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
221	1	9.39	en attente	9	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
222	2	18.78	payée	8	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
223	5	46.95	payée	5	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
224	3	28.17	en attente	5	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
225	1	9.39	en attente	3	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
226	4	37.56	en attente	4	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
227	6	56.34	annulée	3	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
228	6	56.34	en attente	9	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
229	1	9.39	payée	4	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
230	2	18.78	en attente	10	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
231	2	18.78	payée	7	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
232	6	56.34	en attente	4	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
233	1	9.39	annulée	1	17	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
234	1	11.79	annulée	9	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
235	5	58.95	annulée	9	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
236	1	11.79	payée	7	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
237	5	58.95	payée	8	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
238	1	11.79	annulée	9	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
239	1	11.79	payée	10	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
240	6	70.74	payée	2	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
241	2	23.58	payée	2	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
242	6	70.74	payée	7	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
243	3	35.37	payée	8	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
244	1	11.79	payée	8	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
245	4	47.16	annulée	8	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
246	1	11.79	payée	8	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
247	2	23.58	en attente	1	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
248	6	70.74	annulée	2	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
249	6	70.74	en attente	7	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
250	4	47.16	payée	6	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
251	6	70.74	payée	9	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
252	1	11.79	payée	10	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
253	6	70.74	payée	3	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
254	3	35.37	payée	6	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
255	3	35.37	annulée	2	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
256	3	35.37	en attente	10	18	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
257	6	118.50	annulée	8	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
258	2	39.50	en attente	8	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
259	2	39.50	annulée	10	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
260	1	19.75	payée	4	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
261	5	98.75	payée	8	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
262	2	39.50	annulée	7	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
263	2	39.50	en attente	7	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
264	2	39.50	payée	1	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
265	4	79.00	en attente	9	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
266	2	39.50	annulée	4	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
267	3	59.25	annulée	4	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
268	6	118.50	payée	5	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
269	5	98.75	en attente	9	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
270	3	59.25	annulée	8	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
271	1	19.75	annulée	1	19	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
272	1	18.20	annulée	4	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
273	2	36.40	annulée	1	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
274	1	18.20	en attente	5	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
275	3	54.60	payée	3	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
276	3	54.60	payée	4	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
277	2	36.40	en attente	6	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
278	6	109.20	en attente	8	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
279	4	72.80	en attente	3	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
280	3	54.60	payée	1	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
281	6	109.20	en attente	1	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
282	4	72.80	annulée	3	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
283	2	36.40	payée	9	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
284	1	18.20	annulée	3	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
285	6	109.20	en attente	7	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
286	1	19.95	payée	4	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
287	4	79.80	en attente	2	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
288	4	79.80	payée	6	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
289	5	99.75	payée	2	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
290	6	119.70	annulée	4	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
291	4	79.80	annulée	5	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
292	1	19.95	payée	7	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
293	3	59.85	annulée	10	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
294	2	39.90	payée	5	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
295	2	39.90	payée	3	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
296	1	19.95	en attente	5	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
297	6	119.70	payée	7	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
298	4	79.80	en attente	5	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
299	5	99.75	payée	3	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
300	2	39.90	annulée	3	21	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
301	2	37.78	payée	2	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
302	2	37.78	annulée	3	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
303	4	75.56	payée	5	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
304	2	37.78	payée	7	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
305	3	56.67	payée	4	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
306	6	113.34	en attente	8	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
307	1	18.89	payée	6	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
308	4	75.56	payée	6	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
309	5	94.45	en attente	1	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
310	5	94.45	en attente	5	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
311	3	56.67	en attente	8	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
312	5	94.45	payée	3	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
313	5	94.45	en attente	6	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
314	2	37.78	annulée	6	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
315	2	37.78	payée	8	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
316	4	75.56	annulée	10	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
317	5	94.45	en attente	10	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
318	4	75.56	annulée	9	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
319	1	18.89	payée	7	22	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
320	4	40.48	payée	8	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
321	6	60.72	annulée	6	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
322	5	50.60	en attente	9	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
323	2	20.24	en attente	7	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
324	3	30.36	annulée	5	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
325	3	30.36	annulée	7	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
326	6	60.72	payée	6	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
327	3	30.36	payée	9	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
328	2	20.24	annulée	6	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
329	3	30.36	en attente	3	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
330	5	50.60	annulée	1	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
331	1	10.12	en attente	5	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
332	3	30.36	payée	5	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
333	2	20.24	annulée	5	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
334	5	50.60	annulée	3	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
335	3	30.36	en attente	6	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
336	6	60.72	payée	3	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
337	2	20.24	payée	2	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
338	1	10.12	en attente	9	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
339	5	50.60	annulée	1	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
340	1	10.12	annulée	10	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
341	5	50.60	en attente	7	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
342	1	10.12	en attente	10	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
343	1	13.75	annulée	2	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
344	6	82.50	en attente	5	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
345	4	55.00	annulée	4	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
346	1	13.75	payée	9	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
347	6	82.50	payée	9	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
348	5	68.75	annulée	6	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
349	1	13.75	en attente	9	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
350	3	41.25	payée	3	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
351	6	82.50	annulée	7	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
352	2	27.50	en attente	9	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
353	1	13.75	en attente	6	24	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
354	4	49.16	annulée	4	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
355	5	61.45	en attente	4	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
356	4	49.16	annulée	5	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
357	2	24.58	en attente	8	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
358	6	73.74	payée	9	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
359	3	36.87	en attente	4	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
360	5	61.45	payée	4	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
361	2	24.58	annulée	2	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
362	4	49.16	annulée	8	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
363	2	24.58	en attente	8	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
364	4	49.16	payée	4	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
365	5	61.45	en attente	9	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
366	4	49.16	annulée	2	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
367	3	32.85	en attente	7	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
368	3	32.85	en attente	5	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
369	5	54.75	payée	5	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
370	3	32.85	en attente	6	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
371	6	65.70	en attente	1	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
372	2	21.90	en attente	2	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
373	5	54.75	en attente	4	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
374	6	65.70	payée	5	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
375	1	10.95	annulée	3	26	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
376	2	24.38	payée	6	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
377	3	36.57	payée	4	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
378	4	48.76	annulée	1	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
379	1	12.19	annulée	9	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
380	3	36.57	payée	1	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
381	4	48.76	payée	5	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
382	4	48.76	payée	8	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
383	3	36.57	payée	6	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
384	2	24.38	annulée	5	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
385	6	73.14	annulée	4	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
386	1	12.19	annulée	4	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
387	2	24.38	payée	6	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
388	1	12.19	payée	7	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
389	1	12.19	annulée	1	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
390	1	12.19	en attente	7	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
391	5	60.95	en attente	5	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
392	1	12.19	en attente	5	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
393	1	12.19	en attente	2	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
394	1	12.19	en attente	10	27	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
395	6	100.74	payée	3	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
396	6	100.74	annulée	7	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
397	4	67.16	en attente	1	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
398	2	33.58	en attente	10	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
399	6	100.74	payée	9	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
400	1	16.79	payée	4	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
401	3	50.37	en attente	7	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
402	5	83.95	payée	1	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
403	3	50.37	en attente	6	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
404	5	83.95	en attente	2	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
405	2	33.58	payée	4	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
406	1	16.79	annulée	6	28	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
407	1	11.05	payée	3	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
408	6	66.30	en attente	10	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
409	6	66.30	payée	1	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
410	1	11.05	en attente	2	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
411	2	22.10	payée	6	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
412	2	22.10	en attente	10	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
413	1	11.05	annulée	2	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
414	1	11.05	payée	6	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
415	1	11.05	annulée	1	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
416	1	15.69	payée	2	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
417	5	78.45	annulée	10	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
418	1	15.69	annulée	10	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
419	6	94.14	en attente	6	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
420	6	94.14	payée	10	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
421	1	15.69	payée	9	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
422	1	15.69	annulée	10	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
423	1	15.69	annulée	2	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
424	2	31.38	payée	8	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
425	5	78.45	payée	4	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
426	5	78.45	payée	7	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
427	2	31.38	annulée	5	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
428	1	15.69	payée	10	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
429	3	47.07	annulée	3	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
430	4	62.76	en attente	6	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
431	2	31.38	annulée	10	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
432	2	31.38	en attente	7	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
433	2	31.38	payée	3	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
434	1	7.49	payée	1	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
435	5	37.45	annulée	9	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
436	2	14.98	annulée	6	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
437	5	37.45	payée	6	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
438	2	14.98	payée	1	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
439	3	22.47	payée	2	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
440	4	29.96	annulée	4	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
441	1	7.49	en attente	8	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
442	1	7.49	en attente	2	31	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
443	1	9.65	annulée	6	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
444	3	28.95	annulée	3	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
445	6	57.90	payée	3	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
446	2	19.30	annulée	10	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
447	2	19.30	annulée	7	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
448	3	28.95	payée	4	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
449	5	48.25	payée	9	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
450	3	28.95	annulée	9	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
451	1	9.65	payée	9	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
452	1	9.65	annulée	3	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
453	1	9.65	payée	2	32	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
454	2	39.90	en attente	1	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
455	6	119.70	annulée	5	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
456	4	79.80	payée	6	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
457	5	99.75	annulée	5	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
458	4	79.80	payée	3	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
459	2	39.90	annulée	2	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
460	6	119.70	payée	8	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
461	4	79.80	en attente	9	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
462	2	39.90	annulée	5	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
463	4	79.80	payée	5	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
464	3	59.85	annulée	6	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
465	2	39.90	payée	5	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
466	3	59.85	annulée	10	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
467	1	19.95	annulée	1	33	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
468	6	48.66	en attente	8	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
469	4	32.44	en attente	6	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
470	6	48.66	en attente	8	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
471	3	24.33	en attente	7	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
472	3	24.33	en attente	10	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
473	1	8.11	en attente	1	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
474	1	8.11	annulée	5	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
475	3	24.33	payée	3	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
476	1	8.11	annulée	2	34	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
477	6	41.22	en attente	9	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
478	1	6.87	annulée	8	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
479	5	34.35	annulée	10	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
480	4	27.48	annulée	7	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
481	4	27.48	payée	4	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
482	5	34.35	en attente	8	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
483	1	6.87	en attente	8	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
484	3	20.61	annulée	7	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
485	4	27.48	en attente	5	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
486	6	41.22	en attente	6	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
487	1	6.87	payée	7	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
488	6	41.22	annulée	8	35	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
489	1	7.69	en attente	3	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
490	5	38.45	payée	5	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
491	4	30.76	annulée	2	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
492	3	23.07	annulée	6	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
493	1	7.69	payée	6	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
494	6	46.14	payée	6	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
495	3	23.07	annulée	9	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
496	5	38.45	en attente	3	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
497	1	7.69	payée	5	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
498	3	23.07	payée	1	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
499	3	23.07	payée	3	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
500	2	15.38	payée	3	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
501	2	15.38	annulée	5	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
502	6	46.14	payée	7	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
503	6	46.14	annulée	10	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
504	1	7.69	en attente	5	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
505	4	30.76	annulée	7	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
506	3	23.07	annulée	7	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
507	4	30.76	en attente	6	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
508	3	23.07	en attente	3	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
509	1	7.69	en attente	5	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
510	2	15.38	en attente	1	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
511	1	7.69	payée	1	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
512	3	23.07	en attente	9	36	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
513	6	109.74	en attente	2	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
514	1	18.29	annulée	9	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
515	5	91.45	en attente	8	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
516	2	36.58	en attente	1	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
517	6	109.74	annulée	6	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
518	5	91.45	payée	9	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
519	4	73.16	en attente	3	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
520	3	54.87	annulée	3	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
521	5	91.45	annulée	4	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
522	6	109.74	annulée	10	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
523	1	18.29	annulée	6	37	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
524	4	31.96	en attente	9	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
525	5	39.95	payée	10	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
526	6	47.94	annulée	9	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
527	1	7.99	payée	7	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
528	4	31.96	en attente	6	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
529	6	47.94	en attente	4	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
530	1	7.99	en attente	4	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
531	3	23.97	en attente	9	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
532	5	39.95	annulée	2	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
533	6	47.94	en attente	8	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
534	1	7.99	payée	1	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
535	4	31.96	annulée	7	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
536	2	15.98	annulée	8	38	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
537	1	12.99	payée	4	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
538	4	51.96	annulée	8	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
539	6	77.94	payée	6	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
540	4	51.96	annulée	4	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
541	4	51.96	annulée	1	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
542	2	25.98	annulée	1	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
543	1	12.99	annulée	1	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
544	3	38.97	annulée	6	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
545	3	38.97	annulée	4	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
546	5	64.95	en attente	9	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
547	2	25.98	payée	8	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
548	5	25.45	en attente	4	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
549	3	15.27	payée	9	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
550	1	5.09	payée	9	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
551	6	30.54	annulée	5	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
552	4	20.36	payée	2	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
553	6	30.54	payée	8	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
554	6	30.54	annulée	10	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
555	4	20.36	payée	2	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
556	1	5.09	payée	1	40	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
557	6	53.70	en attente	8	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
558	3	26.85	payée	10	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
559	4	35.80	payée	2	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
560	3	26.85	en attente	2	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
561	3	26.85	annulée	4	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
562	3	26.85	annulée	10	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
563	4	35.80	en attente	8	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
564	2	17.90	en attente	10	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
565	1	8.95	payée	9	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
566	1	8.95	annulée	4	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
567	3	26.85	annulée	9	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
568	1	8.95	payée	1	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
569	2	17.90	annulée	10	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
570	1	8.95	annulée	9	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
571	4	35.80	payée	6	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
572	2	17.90	payée	4	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
573	1	8.95	en attente	8	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
574	2	17.90	payée	9	41	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
575	6	101.70	annulée	2	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
576	4	67.80	en attente	10	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
577	4	67.80	payée	6	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
578	6	101.70	payée	5	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
579	3	50.85	en attente	8	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
580	2	33.90	payée	1	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
581	3	50.85	annulée	5	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
582	5	84.75	annulée	3	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
583	4	67.80	payée	6	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
584	3	50.85	payée	7	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
585	2	33.90	en attente	10	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
586	3	50.85	annulée	7	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
587	2	33.90	payée	5	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
588	6	101.70	payée	3	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
589	4	67.80	annulée	7	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
590	6	101.70	payée	4	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
591	1	16.95	payée	3	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
592	6	101.70	payée	3	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
593	2	33.90	payée	10	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
594	1	16.95	payée	10	42	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
595	2	35.78	en attente	3	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
596	4	71.56	en attente	3	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
597	2	35.78	payée	5	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
598	3	53.67	annulée	5	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
599	6	107.34	payée	5	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
600	3	53.67	payée	2	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
601	2	35.78	payée	7	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
602	3	53.67	payée	10	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
603	4	71.56	en attente	4	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
604	1	17.89	en attente	10	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
605	1	17.89	en attente	9	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
606	3	53.67	payée	2	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
607	1	17.89	annulée	8	43	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
608	2	26.80	payée	2	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
609	5	67.00	annulée	6	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
610	1	13.40	annulée	2	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
611	5	67.00	en attente	3	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
612	6	80.40	payée	10	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
613	2	26.80	payée	3	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
614	4	53.60	annulée	3	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
615	4	53.60	en attente	5	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
616	5	67.00	en attente	1	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
617	6	80.40	en attente	10	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
618	1	13.40	en attente	5	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
619	1	13.40	payée	4	44	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
620	3	27.57	payée	3	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
621	2	18.38	payée	2	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
622	1	9.19	payée	9	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
623	6	55.14	en attente	10	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
624	5	45.95	payée	5	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
625	3	27.57	payée	9	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
626	6	55.14	annulée	6	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
627	2	18.38	en attente	9	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
628	2	18.38	en attente	1	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
629	5	45.95	en attente	2	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
630	2	18.38	en attente	7	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
631	3	27.57	annulée	2	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
632	1	9.19	en attente	4	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
633	1	9.19	payée	6	45	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
634	4	48.76	annulée	10	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
635	6	73.14	payée	7	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
636	3	36.57	en attente	10	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
637	5	60.95	payée	3	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
638	6	73.14	payée	10	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
639	5	60.95	payée	10	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
640	5	60.95	annulée	6	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
641	3	36.57	payée	10	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
642	1	12.19	payée	2	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
643	1	12.19	en attente	10	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
644	2	24.38	en attente	1	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
645	4	48.76	en attente	2	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
646	3	36.57	payée	2	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
647	4	25.80	en attente	5	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
648	1	6.45	en attente	3	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
649	3	19.35	payée	8	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
650	6	38.70	en attente	6	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
651	3	19.35	payée	9	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
652	2	12.90	annulée	1	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
653	4	25.80	annulée	6	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
654	1	6.45	payée	7	47	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
655	6	39.30	payée	1	48	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
656	5	32.75	en attente	4	48	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
657	5	32.75	annulée	8	48	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
658	2	13.10	annulée	2	48	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
659	1	6.55	en attente	2	48	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
660	1	6.55	annulée	7	48	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
661	1	6.55	payée	6	48	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
662	6	42.54	payée	5	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
663	5	35.45	annulée	9	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
664	3	21.27	payée	10	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
665	3	21.27	en attente	4	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
666	5	35.45	annulée	4	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
667	6	42.54	annulée	10	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
668	5	35.45	en attente	10	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
669	2	14.18	annulée	3	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
670	3	21.27	payée	5	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
671	1	7.09	payée	7	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
672	2	14.18	en attente	2	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
673	3	21.27	en attente	5	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
674	2	14.18	en attente	4	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
675	1	7.09	en attente	9	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
676	4	28.36	payée	7	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
677	5	35.45	annulée	9	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
678	4	28.36	annulée	10	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
679	1	7.09	annulée	7	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
680	4	28.36	en attente	9	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
681	2	14.18	payée	6	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
682	5	35.45	en attente	10	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
683	2	14.18	en attente	8	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
684	1	7.09	en attente	3	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
685	2	14.18	annulée	8	49	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
686	3	33.81	payée	8	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
687	1	11.27	annulée	1	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
688	5	56.35	en attente	3	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
689	4	45.08	annulée	3	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
690	5	56.35	payée	9	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
691	4	45.08	annulée	1	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
692	3	33.81	annulée	10	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
693	3	33.81	annulée	2	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
694	2	22.54	payée	10	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
695	2	22.54	en attente	10	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
696	4	45.08	payée	2	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
697	3	33.81	payée	9	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
698	5	56.35	payée	5	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
699	4	45.08	en attente	7	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
700	5	56.35	annulée	3	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
701	1	11.27	en attente	6	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
702	4	45.08	annulée	10	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
703	6	67.62	en attente	1	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
704	1	11.27	annulée	2	50	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
705	2	28.38	payée	7	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
706	2	28.38	annulée	7	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
707	3	42.57	en attente	2	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
708	4	56.76	en attente	5	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
709	1	14.19	payée	9	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
710	1	14.19	annulée	6	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
711	5	70.95	en attente	6	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
712	3	42.57	payée	5	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
713	6	85.14	payée	9	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
714	2	28.38	en attente	7	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
715	1	14.19	annulée	3	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
716	2	28.38	annulée	9	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
717	1	14.19	annulée	10	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
718	3	42.57	annulée	4	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
719	6	85.14	annulée	5	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
720	1	14.19	annulée	6	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
721	1	14.19	en attente	2	51	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
722	2	13.78	en attente	10	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
723	2	13.78	payée	10	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
724	2	13.78	en attente	4	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
725	2	13.78	en attente	10	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
726	1	6.89	annulée	10	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
727	2	13.78	payée	2	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
728	3	20.67	en attente	8	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
729	1	6.89	annulée	3	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
730	4	27.56	annulée	1	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
731	3	20.67	en attente	3	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
732	5	34.45	en attente	3	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
733	3	20.67	annulée	8	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
734	2	13.78	payée	7	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
735	1	6.89	en attente	10	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
736	2	13.78	annulée	6	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
737	5	34.45	payée	8	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
738	5	34.45	en attente	10	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
739	1	6.89	annulée	1	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
740	6	41.34	en attente	10	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
741	5	34.45	annulée	3	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
742	3	20.67	en attente	5	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
743	2	13.78	annulée	9	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
744	2	13.78	payée	2	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
745	1	6.89	en attente	5	52	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
746	2	38.38	payée	5	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
747	4	76.76	payée	3	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
748	1	19.19	payée	6	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
749	1	19.19	annulée	3	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
750	1	19.19	annulée	9	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
751	6	115.14	payée	1	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
752	3	57.57	payée	1	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
753	4	76.76	annulée	7	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
754	3	57.57	annulée	9	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
755	5	95.95	annulée	4	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
756	4	76.76	en attente	6	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
757	2	38.38	en attente	10	53	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
758	2	31.18	payée	4	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
759	2	31.18	payée	2	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
760	1	15.59	annulée	4	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
761	3	46.77	en attente	7	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
762	4	62.36	payée	10	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
763	4	62.36	en attente	4	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
764	5	77.95	payée	4	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
765	1	15.59	en attente	8	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
766	4	62.36	en attente	6	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
767	5	77.95	payée	10	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
768	1	15.59	payée	7	54	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
769	4	31.20	payée	8	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
770	5	39.00	en attente	7	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
771	6	46.80	payée	6	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
772	2	15.60	payée	3	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
773	5	39.00	en attente	9	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
774	6	46.80	en attente	10	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
775	6	46.80	annulée	10	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
776	5	39.00	payée	6	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
777	3	23.40	annulée	6	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
778	2	15.60	en attente	5	55	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
779	3	29.85	annulée	4	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
780	3	29.85	payée	8	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
781	1	9.95	en attente	6	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
782	6	59.70	en attente	3	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
783	4	39.80	annulée	3	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
784	5	49.75	en attente	10	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
785	5	49.75	payée	7	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
786	2	19.90	en attente	5	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
787	3	29.85	annulée	2	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
788	2	19.90	annulée	3	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
789	1	9.95	annulée	7	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
790	6	59.70	annulée	9	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
791	1	9.95	en attente	2	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
792	3	29.85	en attente	10	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
793	5	49.75	en attente	10	56	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
794	3	52.95	en attente	6	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
795	4	70.60	en attente	10	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
796	4	70.60	en attente	5	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
797	3	52.95	payée	8	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
798	3	52.95	annulée	8	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
799	3	52.95	annulée	4	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
800	2	35.30	annulée	8	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
801	3	52.95	annulée	6	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
802	3	52.95	annulée	10	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
803	2	35.30	en attente	9	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
804	2	35.30	payée	10	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
805	2	35.30	payée	9	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
806	1	17.65	payée	7	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
807	4	70.60	annulée	3	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
808	5	88.25	en attente	1	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
809	6	105.90	payée	4	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
810	3	52.95	payée	9	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
811	5	88.25	annulée	4	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
812	2	35.30	annulée	9	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
813	6	105.90	payée	10	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
814	2	34.58	en attente	7	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
815	4	69.16	annulée	4	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
816	2	34.58	payée	9	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
817	1	17.29	annulée	6	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
818	6	103.74	en attente	10	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
819	5	86.45	en attente	10	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
820	6	103.74	en attente	3	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
821	3	51.87	en attente	5	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
822	2	34.58	annulée	1	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
823	2	34.58	annulée	2	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
824	2	34.58	annulée	1	58	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
825	2	38.80	annulée	7	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
826	3	58.20	payée	3	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
827	4	77.60	payée	2	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
828	1	19.40	en attente	5	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
829	4	77.60	en attente	8	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
830	2	38.80	annulée	3	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
831	2	38.80	annulée	1	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
832	5	97.00	en attente	7	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
833	1	19.40	en attente	10	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
834	5	97.00	en attente	8	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
835	2	38.80	en attente	6	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
836	1	19.40	annulée	7	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
837	4	77.60	annulée	8	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
838	5	97.00	payée	10	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
839	4	77.60	en attente	7	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
840	1	19.40	en attente	3	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
841	3	58.20	annulée	8	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
842	5	97.00	payée	5	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
843	4	77.60	payée	3	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
844	2	38.80	payée	3	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
845	5	97.00	en attente	4	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
846	4	77.60	payée	1	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
847	2	38.80	annulée	2	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
848	2	38.80	en attente	8	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
849	4	30.00	EN_ATTENTE	1	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
850	4	30.00	EN_ATTENTE	1	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
851	4	30.00	EN_ATTENTE	1	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
852	2	24.00	EN_ATTENTE	1	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
853	2	24.00	EN_ATTENTE	1	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
854	2	24.00	EN_ATTENTE	1	2	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
855	5	55.25	EN_ATTENTE	15	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
856	1	19.40	EN_ATTENTE	15	59	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
857	2	22.10	EN_ATTENTE	15	29	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
858	2	24.38	EN_ATTENTE	15	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
859	2	31.38	EN_ATTENTE	15	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
860	1	12.19	EN_ATTENTE	15	46	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
861	1	17.65	EN_ATTENTE	15	57	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
862	3	30.36	EN_ATTENTE	15	23	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
863	1	12.29	EN_ATTENTE	15	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
864	1	12.29	EN_ATTENTE	15	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
865	1	12.29	EN_ATTENTE	15	25	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
866	2	31.38	EN_ATTENTE	15	30	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
867	2	40.00	EN_ATTENTE	16	61	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
868	1	25.00	EN_ATTENTE	15	63	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
869	1	12.99	EN_ATTENTE	16	39	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
870	5	125.00	EN_ATTENTE	16	63	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
871	1	18.20	EN_ATTENTE	16	20	2025-09-05 16:14:12.913321+02	2025-09-05 16:14:12.913321+02
1	1	12.99	payée	7	1	2025-09-05 16:14:12.913321+02	2025-09-07 16:36:16.640066+02
872	1	25.00	EN_ATTENTE	16	63	2025-09-07 18:01:44.218748+02	2025-09-07 18:01:44.218748+02
873	2	29.90	EN_ATTENTE	16	13	2025-09-07 18:05:37.450335+02	2025-09-07 18:05:37.450335+02
874	1	25.00	EN_ATTENTE	16	63	2025-09-07 18:36:46.856318+02	2025-09-07 18:36:46.856318+02
875	1	6.45	EN_ATTENTE	10	47	2025-10-31 19:43:02.763661+01	2025-10-31 19:43:02.763661+01
876	1	14.95	EN_ATTENTE	19	13	2025-11-22 07:58:08.042405+01	2025-11-22 07:58:08.042405+01
877	1	6.87	EN_ATTENTE	19	35	2025-11-22 07:58:33.367583+01	2025-11-22 07:58:33.367583+01
878	2	15.38	EN_ATTENTE	19	36	2025-11-22 10:26:47.413228+01	2025-11-22 10:26:47.413228+01
879	1	14.19	EN_ATTENTE	19	51	2025-11-24 19:49:58.857001+01	2025-11-24 19:49:58.857001+01
880	1	6.89	EN_ATTENTE	19	52	2025-11-25 18:40:31.813707+01	2025-11-25 18:40:31.813707+01
\.


--
-- Data for Name: siege; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siege (id_siege, numero_siege, type_siege, position_x, position_y, id_salle) FROM stdin;
1	A1	STANDARD	11	2	1
2	A2	PMR	1	6	1
3	A3	STANDARD	18	1	1
4	A4	STANDARD	15	8	1
5	A5	PMR	11	10	1
6	A6	STANDARD	15	19	1
7	A7	STANDARD	14	11	1
8	A8	PMR	10	20	1
9	A9	STANDARD	10	4	1
10	A10	STANDARD	1	10	1
11	B1	PMR	18	11	1
12	B2	PMR	6	8	1
13	B3	PMR	19	13	1
14	B4	STANDARD	9	14	1
15	B5	STANDARD	8	13	1
16	B6	STANDARD	3	3	1
17	B7	STANDARD	16	8	1
18	B8	STANDARD	18	16	1
19	B9	PMR	6	18	1
20	B10	STANDARD	5	7	1
21	C1	STANDARD	1	20	1
22	C2	PMR	11	18	1
23	C3	PMR	19	1	1
24	C4	PMR	2	12	1
25	C5	STANDARD	4	5	1
26	C6	STANDARD	18	0	1
27	C7	STANDARD	0	8	1
28	C8	PMR	13	2	1
29	C9	STANDARD	15	18	1
30	C10	STANDARD	17	18	1
31	D1	PMR	5	9	1
32	D2	PMR	7	9	1
33	D3	STANDARD	12	10	1
34	D4	STANDARD	2	10	1
35	D5	STANDARD	8	2	1
36	D6	STANDARD	16	15	1
37	D7	PMR	4	3	1
38	D8	PMR	18	2	1
39	D9	STANDARD	3	16	1
40	D10	PMR	11	19	1
41	E1	STANDARD	12	11	1
42	E2	PMR	6	19	1
43	E3	STANDARD	9	11	1
44	E4	PMR	10	12	1
45	E5	PMR	20	6	1
46	E6	STANDARD	7	16	1
47	E7	PMR	15	6	1
48	E8	PMR	1	2	1
49	E9	PMR	18	8	1
50	E10	STANDARD	10	10	1
51	F1	PMR	12	12	1
52	F2	PMR	1	3	1
53	F3	STANDARD	19	7	1
54	F4	PMR	13	3	1
55	F5	PMR	11	15	1
56	F6	PMR	16	16	1
57	F7	PMR	18	18	1
58	F8	PMR	9	2	1
59	F9	STANDARD	1	9	1
60	F10	STANDARD	15	6	1
61	G1	PMR	8	18	1
62	G2	STANDARD	12	20	1
63	G3	STANDARD	8	0	1
64	G4	PMR	19	13	1
65	G5	STANDARD	10	1	1
66	G6	STANDARD	16	8	1
67	G7	STANDARD	6	5	1
68	G8	PMR	16	17	1
69	G9	PMR	10	9	1
70	G10	PMR	5	2	1
71	H1	PMR	10	9	1
72	H2	PMR	8	14	1
73	H3	STANDARD	9	18	1
74	H4	STANDARD	18	19	1
75	H5	STANDARD	0	0	1
76	H6	STANDARD	11	17	1
77	H7	PMR	9	14	1
78	H8	PMR	3	9	1
79	H9	STANDARD	2	15	1
80	H10	PMR	9	4	1
81	I1	PMR	6	7	1
82	I2	PMR	17	4	1
83	I3	PMR	18	5	1
84	I4	STANDARD	13	10	1
85	I5	STANDARD	2	18	1
86	I6	PMR	6	7	1
87	I7	PMR	9	12	1
88	I8	PMR	17	20	1
89	I9	STANDARD	2	12	1
90	I10	PMR	6	3	1
91	J1	STANDARD	5	11	1
92	J2	PMR	0	10	1
93	J3	PMR	16	9	1
94	J4	PMR	14	2	1
95	J5	STANDARD	15	13	1
96	J6	PMR	11	8	1
97	J7	PMR	4	5	1
98	J8	PMR	10	17	1
99	J9	STANDARD	5	2	1
100	J10	PMR	17	10	1
101	K1	STANDARD	8	6	1
102	K2	STANDARD	13	17	1
103	K3	PMR	16	19	1
104	K4	STANDARD	3	18	1
105	K5	STANDARD	8	20	1
106	K6	PMR	2	17	1
107	K7	STANDARD	10	5	1
108	A1	PMR	20	5	2
109	A2	STANDARD	4	13	2
110	A3	STANDARD	11	8	2
111	A4	PMR	16	4	2
112	A5	PMR	8	11	2
113	A6	PMR	17	17	2
114	A7	STANDARD	19	6	2
115	A8	PMR	7	8	2
116	A9	PMR	19	11	2
117	A10	STANDARD	15	11	2
118	B1	STANDARD	7	5	2
119	B2	PMR	9	0	2
120	B3	STANDARD	10	8	2
121	B4	STANDARD	8	12	2
122	B5	PMR	0	13	2
123	B6	PMR	20	3	2
124	B7	PMR	13	17	2
125	B8	STANDARD	16	20	2
126	B9	PMR	18	3	2
127	B10	PMR	3	0	2
128	C1	PMR	12	12	2
129	C2	STANDARD	10	12	2
130	C3	PMR	14	18	2
131	C4	PMR	12	10	2
132	C5	PMR	19	10	2
133	C6	STANDARD	15	18	2
134	C7	PMR	1	4	2
135	C8	STANDARD	17	14	2
136	C9	STANDARD	3	2	2
137	C10	STANDARD	12	19	2
138	D1	PMR	19	12	2
139	D2	STANDARD	15	20	2
140	D3	STANDARD	13	14	2
141	D4	PMR	10	14	2
142	D5	STANDARD	10	10	2
143	D6	PMR	14	3	2
144	D7	PMR	15	11	2
145	D8	STANDARD	11	2	2
146	D9	PMR	0	11	2
147	D10	PMR	10	18	2
148	E1	PMR	15	20	2
149	E2	PMR	3	14	2
150	E3	STANDARD	5	10	2
151	E4	STANDARD	16	4	2
152	E5	PMR	10	12	2
153	E6	PMR	8	18	2
154	E7	STANDARD	2	9	2
155	E8	STANDARD	16	9	2
156	E9	PMR	19	16	2
157	E10	STANDARD	7	4	2
158	F1	STANDARD	20	17	2
159	F2	STANDARD	20	7	2
160	F3	PMR	14	10	2
161	F4	PMR	7	17	2
162	F5	STANDARD	7	0	2
163	F6	PMR	0	10	2
164	F7	STANDARD	4	8	2
165	F8	PMR	2	13	2
166	F9	STANDARD	0	0	2
167	F10	PMR	10	5	2
168	G1	PMR	8	15	2
169	G2	PMR	9	15	2
170	G3	PMR	18	8	2
171	G4	PMR	9	1	2
172	G5	STANDARD	12	3	2
173	G6	STANDARD	17	9	2
174	G7	STANDARD	1	4	2
175	G8	PMR	11	0	2
176	G9	STANDARD	1	16	2
177	G10	PMR	19	8	2
178	H1	PMR	10	15	2
179	H2	STANDARD	8	11	2
180	H3	PMR	1	12	2
181	H4	PMR	18	6	2
182	H5	PMR	12	13	2
183	H6	PMR	12	0	2
184	H7	PMR	17	1	2
185	H8	STANDARD	4	6	2
186	H9	STANDARD	15	9	2
187	H10	PMR	19	12	2
188	I1	STANDARD	15	11	2
189	I2	STANDARD	9	16	2
190	I3	STANDARD	17	15	2
191	I4	PMR	11	19	2
192	I5	PMR	4	7	2
193	I6	STANDARD	14	3	2
194	I7	STANDARD	13	19	2
195	I8	PMR	16	1	2
196	I9	PMR	11	17	2
197	I10	PMR	13	13	2
198	J1	PMR	19	20	2
199	J2	PMR	11	16	2
200	J3	PMR	12	8	2
201	J4	PMR	12	6	2
202	J5	STANDARD	20	6	2
203	J6	STANDARD	3	20	2
204	J7	STANDARD	16	0	2
205	J8	STANDARD	8	1	2
206	J9	PMR	13	19	2
207	J10	PMR	9	0	2
208	K1	STANDARD	15	9	2
209	K2	STANDARD	18	9	2
210	K3	PMR	7	0	2
211	K4	STANDARD	14	15	2
212	K5	PMR	13	13	2
213	K6	STANDARD	2	20	2
214	K7	STANDARD	7	18	2
215	K8	STANDARD	16	4	2
216	K9	STANDARD	4	18	2
217	K10	PMR	18	12	2
218	L1	PMR	5	11	2
219	L2	PMR	1	14	2
220	L3	STANDARD	17	10	2
221	L4	PMR	12	0	2
222	L5	STANDARD	2	9	2
223	L6	STANDARD	7	11	2
224	L7	STANDARD	17	5	2
225	L8	STANDARD	4	16	2
226	L9	STANDARD	0	10	2
227	L10	STANDARD	8	18	2
228	M1	PMR	19	17	2
229	M2	STANDARD	13	2	2
230	M3	STANDARD	6	10	2
231	M4	PMR	16	4	2
232	M5	STANDARD	15	11	2
233	M6	PMR	14	16	2
234	M7	PMR	18	20	2
235	M8	PMR	9	15	2
236	M9	STANDARD	6	13	2
237	M10	STANDARD	6	0	2
238	N1	STANDARD	19	2	2
239	N2	PMR	7	11	2
240	N3	PMR	20	1	2
241	N4	PMR	12	15	2
242	N5	STANDARD	18	14	2
243	N6	STANDARD	13	18	2
244	N7	PMR	5	11	2
245	N8	PMR	18	3	2
246	N9	STANDARD	0	10	2
247	N10	PMR	0	12	2
248	O1	PMR	11	9	2
249	O2	PMR	13	11	2
250	O3	PMR	18	2	2
251	O4	PMR	5	6	2
252	O5	STANDARD	8	12	2
253	O6	STANDARD	13	2	2
254	O7	STANDARD	17	15	2
255	O8	STANDARD	2	12	2
256	O9	PMR	11	4	2
257	O10	STANDARD	19	8	2
258	P1	STANDARD	4	1	2
259	P2	PMR	5	6	2
260	P3	PMR	10	0	2
261	P4	PMR	2	13	2
262	P5	STANDARD	19	17	2
263	P6	PMR	4	5	2
264	P7	STANDARD	15	6	2
265	P8	STANDARD	6	11	2
266	P9	STANDARD	7	11	2
267	P10	PMR	11	15	2
268	Q1	PMR	11	13	2
269	Q2	STANDARD	20	18	2
270	Q3	PMR	3	11	2
271	Q4	PMR	5	1	2
272	Q5	STANDARD	4	11	2
273	Q6	PMR	9	12	2
274	Q7	PMR	16	14	2
275	Q8	PMR	15	3	2
276	Q9	STANDARD	8	18	2
277	Q10	STANDARD	8	3	2
278	R1	PMR	18	11	2
279	R2	PMR	18	20	2
280	R3	PMR	3	18	2
281	R4	PMR	12	0	2
282	R5	STANDARD	20	20	2
283	R6	PMR	18	15	2
284	R7	STANDARD	19	8	2
285	R8	PMR	2	16	2
286	R9	STANDARD	18	11	2
287	R10	STANDARD	4	19	2
288	S1	PMR	8	20	2
289	S2	PMR	14	20	2
290	S3	STANDARD	4	0	2
291	S4	PMR	2	17	2
292	A1	PMR	18	14	3
293	A2	PMR	12	17	3
294	A3	PMR	15	12	3
295	A4	PMR	8	9	3
296	A5	STANDARD	18	1	3
297	A6	PMR	6	17	3
298	A7	STANDARD	12	5	3
299	A8	STANDARD	9	6	3
300	A9	STANDARD	1	9	3
301	A10	PMR	6	7	3
302	B1	PMR	16	20	3
303	B2	PMR	6	19	3
304	B3	STANDARD	19	16	3
305	B4	PMR	17	14	3
306	B5	STANDARD	19	1	3
307	B6	PMR	16	13	3
308	B7	STANDARD	14	15	3
309	B8	PMR	20	6	3
310	B9	PMR	12	3	3
311	B10	PMR	7	0	3
312	C1	STANDARD	12	18	3
313	C2	PMR	6	7	3
314	C3	PMR	2	12	3
315	C4	PMR	11	19	3
316	C5	PMR	19	2	3
317	C6	PMR	11	2	3
318	C7	PMR	13	11	3
319	C8	STANDARD	15	7	3
320	C9	PMR	9	20	3
321	C10	PMR	1	5	3
322	D1	PMR	4	14	3
323	D2	STANDARD	9	11	3
324	D3	STANDARD	15	0	3
325	D4	PMR	16	14	3
326	D5	PMR	18	6	3
327	D6	PMR	20	8	3
328	D7	PMR	11	13	3
329	D8	STANDARD	15	13	3
330	D9	STANDARD	3	15	3
331	D10	STANDARD	0	9	3
332	E1	STANDARD	6	9	3
333	E2	STANDARD	20	16	3
334	E3	STANDARD	17	6	3
335	E4	PMR	3	4	3
336	E5	PMR	5	6	3
337	E6	STANDARD	1	19	3
338	E7	STANDARD	8	18	3
339	E8	STANDARD	15	11	3
340	E9	PMR	17	14	3
341	E10	STANDARD	7	10	3
342	F1	STANDARD	4	16	3
343	F2	STANDARD	8	1	3
344	F3	PMR	16	6	3
345	F4	STANDARD	4	13	3
346	F5	STANDARD	5	15	3
347	F6	PMR	2	10	3
348	F7	PMR	17	2	3
349	F8	PMR	7	13	3
350	F9	PMR	7	4	3
351	F10	PMR	13	5	3
352	A1	STANDARD	9	10	4
353	A2	STANDARD	16	9	4
354	A3	STANDARD	3	14	4
355	A4	STANDARD	13	12	4
356	A5	STANDARD	12	1	4
357	A6	STANDARD	13	4	4
358	A7	PMR	8	17	4
359	A8	STANDARD	14	1	4
360	A9	STANDARD	8	5	4
361	A10	PMR	4	19	4
362	B1	STANDARD	8	10	4
363	B2	PMR	1	13	4
364	B3	PMR	19	5	4
365	B4	STANDARD	10	9	4
366	B5	STANDARD	19	1	4
367	B6	PMR	7	4	4
368	B7	PMR	7	15	4
369	B8	PMR	17	6	4
370	B9	PMR	12	3	4
371	B10	PMR	6	4	4
372	C1	STANDARD	16	1	4
373	C2	PMR	1	15	4
374	C3	STANDARD	5	13	4
375	C4	STANDARD	13	7	4
376	C5	PMR	5	0	4
377	C6	PMR	19	7	4
378	C7	STANDARD	15	5	4
379	C8	PMR	3	2	4
380	C9	STANDARD	6	12	4
381	C10	PMR	16	12	4
382	D1	STANDARD	16	16	4
383	D2	STANDARD	19	4	4
384	D3	STANDARD	18	20	4
385	D4	STANDARD	0	17	4
386	D5	STANDARD	0	9	4
387	D6	PMR	2	11	4
388	D7	STANDARD	3	10	4
389	D8	STANDARD	1	20	4
390	D9	PMR	14	6	4
391	D10	STANDARD	0	12	4
392	E1	STANDARD	4	15	4
393	E2	PMR	20	19	4
394	E3	PMR	9	18	4
395	E4	STANDARD	14	9	4
396	E5	PMR	18	19	4
397	E6	STANDARD	20	2	4
398	E7	STANDARD	20	19	4
399	E8	PMR	19	4	4
400	E9	STANDARD	10	8	4
401	E10	PMR	14	16	4
402	F1	STANDARD	4	11	4
403	F2	STANDARD	2	19	4
404	F3	STANDARD	20	6	4
405	F4	PMR	0	2	4
406	F5	PMR	15	16	4
407	F6	PMR	0	5	4
408	F7	PMR	0	17	4
409	F8	STANDARD	17	1	4
410	F9	STANDARD	5	6	4
411	F10	STANDARD	6	16	4
412	G1	STANDARD	7	7	4
413	G2	PMR	17	2	4
414	G3	PMR	8	9	4
415	G4	STANDARD	16	14	4
416	G5	PMR	13	17	4
417	G6	PMR	7	12	4
418	G7	STANDARD	10	17	4
419	G8	PMR	6	16	4
420	G9	PMR	14	8	4
421	G10	PMR	10	0	4
422	A1	STANDARD	0	17	5
423	A2	PMR	2	13	5
424	A3	PMR	3	2	5
425	A4	PMR	6	2	5
426	A5	PMR	8	7	5
427	A6	STANDARD	19	3	5
428	A7	STANDARD	13	0	5
429	A8	PMR	16	15	5
430	A9	STANDARD	7	14	5
431	A10	PMR	20	0	5
432	B1	PMR	16	15	5
433	B2	PMR	12	12	5
434	B3	PMR	8	14	5
435	B4	PMR	17	5	5
436	B5	PMR	6	18	5
437	B6	PMR	1	3	5
438	B7	PMR	10	13	5
439	B8	STANDARD	18	17	5
440	B9	STANDARD	15	17	5
441	B10	STANDARD	11	16	5
442	C1	STANDARD	3	20	5
443	C2	STANDARD	17	15	5
444	C3	STANDARD	17	10	5
445	C4	PMR	7	16	5
446	C5	STANDARD	20	20	5
447	C6	PMR	11	12	5
448	C7	PMR	0	9	5
449	C8	STANDARD	10	9	5
450	C9	PMR	2	19	5
451	C10	PMR	0	15	5
452	D1	STANDARD	8	18	5
453	D2	STANDARD	9	11	5
454	D3	STANDARD	0	2	5
455	D4	PMR	2	2	5
456	D5	PMR	12	4	5
457	D6	STANDARD	6	6	5
458	D7	PMR	3	14	5
459	D8	PMR	9	18	5
460	D9	PMR	16	0	5
461	D10	PMR	0	1	5
462	E1	STANDARD	20	13	5
463	E2	STANDARD	7	16	5
464	E3	STANDARD	20	5	5
465	E4	STANDARD	7	12	5
466	E5	STANDARD	11	0	5
467	E6	STANDARD	0	5	5
468	E7	PMR	15	15	5
469	E8	PMR	12	0	5
470	E9	STANDARD	8	12	5
471	E10	STANDARD	7	15	5
472	F1	STANDARD	2	0	5
473	F2	PMR	1	0	5
474	F3	PMR	19	16	5
475	F4	PMR	4	4	5
476	F5	PMR	17	9	5
477	F6	STANDARD	4	15	5
478	F7	PMR	8	11	5
479	F8	STANDARD	15	4	5
480	F9	STANDARD	11	11	5
481	F10	STANDARD	15	4	5
482	G1	STANDARD	10	1	5
483	G2	STANDARD	5	5	5
484	G3	STANDARD	19	19	5
485	G4	STANDARD	3	0	5
486	G5	PMR	4	7	5
487	G6	PMR	19	6	5
488	G7	PMR	20	8	5
489	G8	PMR	15	2	5
490	G9	STANDARD	20	8	5
491	G10	PMR	2	7	5
492	H1	PMR	8	1	5
493	H2	STANDARD	10	3	5
494	H3	PMR	0	10	5
495	H4	PMR	3	6	5
496	H5	PMR	20	3	5
497	H6	PMR	4	19	5
498	H7	PMR	8	6	5
499	H8	PMR	13	9	5
500	H9	STANDARD	12	4	5
501	H10	PMR	4	1	5
502	I1	STANDARD	8	4	5
503	I2	STANDARD	19	14	5
504	I3	PMR	4	0	5
505	I4	PMR	6	1	5
506	I5	STANDARD	6	12	5
507	I6	STANDARD	10	7	5
508	I7	STANDARD	12	18	5
509	I8	STANDARD	16	11	5
510	I9	PMR	8	5	5
511	I10	STANDARD	5	15	5
512	J1	STANDARD	7	15	5
513	J2	STANDARD	8	4	5
514	J3	PMR	11	12	5
515	J4	PMR	9	3	5
516	J5	STANDARD	1	15	5
517	J6	PMR	11	18	5
518	J7	PMR	11	4	5
519	J8	PMR	18	19	5
520	J9	STANDARD	2	3	5
521	J10	STANDARD	18	7	5
522	K1	PMR	14	12	5
523	K2	STANDARD	3	5	5
524	K3	PMR	19	9	5
525	K4	PMR	4	10	5
526	K5	STANDARD	7	12	5
527	K6	PMR	2	5	5
528	K7	STANDARD	14	2	5
529	K8	PMR	9	12	5
530	K9	STANDARD	9	10	5
531	K10	STANDARD	12	20	5
532	L1	PMR	0	17	5
533	L2	PMR	5	10	5
534	L3	PMR	16	15	5
535	L4	STANDARD	15	5	5
536	L5	PMR	13	17	5
537	L6	PMR	18	5	5
538	L7	STANDARD	9	15	5
539	L8	STANDARD	4	7	5
540	L9	STANDARD	9	11	5
541	L10	PMR	18	20	5
542	M1	PMR	13	14	5
543	M2	STANDARD	13	17	5
544	M3	PMR	6	3	5
545	M4	STANDARD	3	12	5
546	M5	PMR	20	12	5
547	M6	PMR	4	9	5
548	A1	PMR	13	18	6
549	A2	STANDARD	17	6	6
550	A3	STANDARD	18	9	6
551	A4	STANDARD	11	16	6
552	A5	PMR	12	11	6
553	A6	PMR	6	9	6
554	A7	STANDARD	15	5	6
555	A8	STANDARD	5	11	6
556	A9	STANDARD	18	17	6
557	A10	STANDARD	1	13	6
558	B1	PMR	2	20	6
559	B2	STANDARD	6	20	6
560	B3	PMR	11	1	6
561	B4	STANDARD	1	9	6
562	B5	STANDARD	9	8	6
563	B6	PMR	2	8	6
564	B7	STANDARD	1	7	6
565	B8	STANDARD	12	10	6
566	B9	STANDARD	1	20	6
567	B10	STANDARD	5	11	6
568	C1	STANDARD	8	16	6
569	C2	PMR	6	8	6
570	C3	PMR	7	8	6
571	C4	STANDARD	11	5	6
572	C5	STANDARD	18	10	6
573	C6	PMR	14	2	6
574	C7	PMR	15	3	6
575	C8	STANDARD	19	5	6
576	C9	PMR	1	0	6
577	C10	PMR	2	11	6
578	D1	STANDARD	11	19	6
579	D2	PMR	3	2	6
580	D3	STANDARD	11	0	6
581	D4	PMR	7	6	6
582	D5	STANDARD	9	0	6
583	D6	STANDARD	12	0	6
584	D7	PMR	2	7	6
585	D8	PMR	3	1	6
586	D9	PMR	8	10	6
587	D10	STANDARD	19	16	6
588	E1	STANDARD	10	4	6
589	E2	PMR	16	0	6
590	E3	STANDARD	6	19	6
591	E4	PMR	11	19	6
592	E5	STANDARD	14	11	6
593	E6	PMR	17	3	6
594	E7	STANDARD	8	7	6
595	E8	STANDARD	0	1	6
596	E9	PMR	14	1	6
597	E10	STANDARD	6	17	6
598	F1	PMR	18	19	6
599	F2	PMR	15	10	6
600	F3	PMR	5	9	6
601	F4	STANDARD	5	19	6
602	F5	STANDARD	4	18	6
603	F6	PMR	13	7	6
604	F7	STANDARD	10	2	6
605	F8	STANDARD	17	6	6
606	F9	PMR	9	0	6
607	F10	PMR	20	11	6
608	G1	PMR	17	18	6
609	G2	PMR	5	8	6
610	G3	STANDARD	17	6	6
611	G4	PMR	13	19	6
612	G5	PMR	0	19	6
613	G6	PMR	5	20	6
614	G7	STANDARD	1	9	6
615	G8	PMR	4	4	6
616	G9	PMR	12	8	6
617	G10	STANDARD	11	12	6
618	H1	PMR	0	18	6
619	H2	STANDARD	12	13	6
620	H3	STANDARD	3	15	6
621	H4	PMR	3	20	6
622	H5	STANDARD	20	5	6
623	H6	STANDARD	17	0	6
624	H7	STANDARD	7	10	6
625	H8	PMR	15	7	6
626	H9	PMR	13	14	6
627	H10	PMR	17	7	6
628	I1	STANDARD	1	5	6
629	I2	STANDARD	10	6	6
630	I3	PMR	0	3	6
631	I4	PMR	6	16	6
632	I5	STANDARD	15	3	6
633	I6	STANDARD	18	18	6
634	I7	STANDARD	13	0	6
635	I8	STANDARD	10	12	6
636	I9	STANDARD	4	2	6
637	I10	STANDARD	11	4	6
638	J1	STANDARD	16	17	6
639	J2	STANDARD	17	16	6
640	J3	PMR	0	15	6
641	J4	PMR	10	12	6
642	J5	PMR	6	12	6
643	J6	PMR	1	14	6
644	J7	PMR	14	20	6
645	J8	STANDARD	4	15	6
646	J9	PMR	1	13	6
647	J10	STANDARD	20	11	6
648	K1	STANDARD	2	4	6
649	K2	PMR	11	9	6
650	K3	PMR	13	18	6
651	K4	STANDARD	5	10	6
652	K5	STANDARD	6	2	6
653	K6	PMR	14	1	6
654	K7	PMR	0	1	6
655	K8	STANDARD	19	20	6
656	K9	STANDARD	6	7	6
657	K10	STANDARD	15	13	6
658	L1	STANDARD	4	7	6
659	L2	STANDARD	2	14	6
660	L3	STANDARD	6	1	6
661	L4	STANDARD	14	15	6
662	L5	PMR	16	16	6
663	L6	PMR	0	4	6
664	L7	PMR	5	20	6
665	L8	STANDARD	19	8	6
666	L9	PMR	13	16	6
667	L10	STANDARD	16	0	6
668	M1	STANDARD	11	3	6
669	M2	STANDARD	16	0	6
670	M3	PMR	17	7	6
671	M4	STANDARD	18	4	6
672	M5	STANDARD	0	11	6
673	M6	PMR	2	20	6
674	M7	PMR	1	18	6
675	A1	STANDARD	17	8	7
676	A2	PMR	5	19	7
677	A3	STANDARD	3	9	7
678	A4	PMR	14	17	7
679	A5	PMR	6	2	7
680	A6	STANDARD	13	7	7
681	A7	STANDARD	11	13	7
682	A8	STANDARD	18	0	7
683	A9	STANDARD	10	3	7
684	A10	PMR	14	14	7
685	B1	PMR	2	17	7
686	B2	PMR	17	11	7
687	B3	STANDARD	10	20	7
688	B4	STANDARD	2	18	7
689	B5	STANDARD	14	18	7
690	B6	PMR	17	9	7
691	B7	PMR	5	19	7
692	B8	STANDARD	20	1	7
693	B9	PMR	20	12	7
694	B10	STANDARD	5	2	7
695	C1	PMR	7	7	7
696	C2	PMR	9	1	7
697	C3	PMR	10	18	7
698	C4	STANDARD	18	7	7
699	C5	PMR	9	17	7
700	C6	STANDARD	10	3	7
701	C7	STANDARD	3	17	7
702	C8	STANDARD	8	6	7
703	C9	STANDARD	2	17	7
704	C10	PMR	10	1	7
705	D1	PMR	17	0	7
706	D2	STANDARD	17	14	7
707	D3	PMR	19	14	7
708	D4	PMR	2	15	7
709	D5	STANDARD	0	1	7
710	D6	PMR	0	11	7
711	D7	STANDARD	20	3	7
712	D8	STANDARD	2	1	7
713	D9	STANDARD	15	7	7
714	D10	PMR	10	5	7
715	E1	PMR	9	11	7
716	E2	STANDARD	15	13	7
717	E3	STANDARD	10	17	7
718	E4	PMR	1	5	7
719	E5	STANDARD	15	18	7
720	E6	PMR	4	10	7
721	E7	PMR	12	3	7
722	E8	STANDARD	17	14	7
723	E9	STANDARD	15	15	7
724	E10	PMR	7	11	7
725	F1	STANDARD	18	15	7
726	F2	PMR	20	12	7
727	F3	STANDARD	15	4	7
728	F4	PMR	20	16	7
729	F5	PMR	4	3	7
730	F6	PMR	19	3	7
731	F7	PMR	5	0	7
732	F8	STANDARD	16	6	7
733	F9	STANDARD	10	14	7
734	F10	PMR	7	4	7
735	G1	STANDARD	1	11	7
736	G2	PMR	13	3	7
737	G3	STANDARD	4	17	7
738	G4	PMR	13	7	7
739	G5	STANDARD	9	12	7
740	G6	STANDARD	10	3	7
741	G7	PMR	8	16	7
742	G8	PMR	11	1	7
743	G9	PMR	7	14	7
744	G10	STANDARD	4	12	7
745	H1	STANDARD	12	0	7
746	H2	PMR	15	11	7
747	H3	PMR	2	4	7
748	H4	STANDARD	18	9	7
749	H5	PMR	5	13	7
750	H6	PMR	3	19	7
751	H7	STANDARD	16	10	7
752	H8	STANDARD	12	17	7
753	H9	PMR	13	8	7
754	H10	STANDARD	1	2	7
755	I1	PMR	10	19	7
756	I2	STANDARD	16	5	7
757	A1	STANDARD	10	10	8
758	A2	PMR	0	15	8
759	A3	STANDARD	9	17	8
760	A4	STANDARD	18	2	8
761	A5	STANDARD	19	10	8
762	A6	PMR	0	1	8
763	A7	STANDARD	7	20	8
764	A8	STANDARD	18	19	8
765	A9	PMR	2	9	8
766	A10	PMR	8	19	8
767	B1	STANDARD	14	1	8
768	B2	PMR	17	10	8
769	B3	PMR	1	18	8
770	B4	PMR	5	11	8
771	B5	PMR	13	5	8
772	B6	STANDARD	6	17	8
773	B7	STANDARD	19	14	8
774	B8	STANDARD	8	4	8
775	B9	PMR	13	13	8
776	B10	STANDARD	10	3	8
777	C1	STANDARD	11	5	8
778	C2	STANDARD	11	13	8
779	C3	PMR	5	11	8
780	C4	PMR	0	4	8
781	C5	STANDARD	10	20	8
782	C6	PMR	14	2	8
783	C7	PMR	10	20	8
784	C8	STANDARD	9	16	8
785	C9	PMR	2	10	8
786	C10	STANDARD	11	2	8
787	D1	STANDARD	12	7	8
788	D2	PMR	7	20	8
789	D3	PMR	12	19	8
790	D4	PMR	5	13	8
791	D5	STANDARD	5	17	8
792	D6	STANDARD	15	11	8
793	D7	STANDARD	17	19	8
794	D8	PMR	6	18	8
795	D9	STANDARD	14	17	8
796	D10	PMR	7	5	8
797	E1	PMR	2	17	8
798	E2	PMR	7	18	8
799	E3	PMR	6	19	8
800	E4	STANDARD	4	9	8
801	E5	PMR	12	0	8
802	E6	STANDARD	16	14	8
803	E7	STANDARD	10	19	8
804	E8	PMR	15	18	8
805	E9	PMR	12	7	8
806	E10	PMR	13	6	8
807	F1	PMR	14	16	8
808	F2	STANDARD	17	12	8
809	F3	PMR	11	15	8
810	F4	PMR	12	7	8
811	F5	PMR	6	5	8
812	F6	STANDARD	4	20	8
813	F7	STANDARD	2	0	8
814	F8	PMR	10	14	8
815	F9	PMR	6	14	8
816	F10	PMR	13	9	8
817	G1	STANDARD	11	15	8
818	G2	PMR	4	10	8
819	G3	STANDARD	5	4	8
820	G4	PMR	3	14	8
821	G5	PMR	20	18	8
822	G6	STANDARD	16	14	8
823	G7	STANDARD	20	16	8
824	G8	PMR	13	7	8
825	G9	STANDARD	4	10	8
826	G10	STANDARD	20	5	8
827	H1	PMR	14	4	8
828	H2	PMR	17	1	8
829	H3	STANDARD	5	19	8
830	H4	STANDARD	1	0	8
831	H5	PMR	3	9	8
832	H6	STANDARD	4	0	8
833	H7	STANDARD	20	16	8
834	H8	PMR	14	3	8
835	H9	PMR	3	4	8
836	H10	STANDARD	15	14	8
837	I1	PMR	12	18	8
838	I2	PMR	1	4	8
839	I3	PMR	0	3	8
840	I4	PMR	12	1	8
841	I5	STANDARD	20	16	8
842	I6	PMR	14	10	8
843	I7	PMR	16	16	8
844	I8	STANDARD	5	16	8
845	I9	STANDARD	16	15	8
846	A1	PMR	2	14	9
847	A2	PMR	8	10	9
848	A3	PMR	5	8	9
849	A4	PMR	9	2	9
850	A5	PMR	4	0	9
851	A6	PMR	17	13	9
852	A7	PMR	0	4	9
853	A8	PMR	0	8	9
854	A9	STANDARD	0	18	9
855	A10	STANDARD	11	5	9
856	B1	STANDARD	2	12	9
857	B2	STANDARD	6	20	9
858	B3	STANDARD	16	7	9
859	B4	PMR	17	18	9
860	B5	PMR	10	15	9
861	B6	PMR	0	10	9
862	B7	STANDARD	18	15	9
863	B8	PMR	8	2	9
864	B9	STANDARD	8	5	9
865	B10	PMR	5	20	9
866	C1	STANDARD	9	7	9
867	C2	PMR	5	6	9
868	C3	STANDARD	20	20	9
869	C4	PMR	3	2	9
870	C5	PMR	8	17	9
871	C6	STANDARD	11	16	9
872	C7	PMR	15	9	9
873	C8	STANDARD	6	16	9
874	C9	STANDARD	19	7	9
875	C10	PMR	11	3	9
876	D1	PMR	4	8	9
877	D2	PMR	3	9	9
878	D3	STANDARD	18	0	9
879	D4	PMR	3	1	9
880	D5	PMR	8	11	9
881	D6	PMR	10	2	9
882	D7	STANDARD	12	15	9
883	D8	PMR	10	19	9
884	D9	PMR	0	3	9
885	D10	STANDARD	0	18	9
886	E1	PMR	12	16	9
887	E2	STANDARD	15	10	9
888	E3	PMR	15	4	9
889	E4	STANDARD	3	3	9
890	E5	PMR	17	6	9
891	E6	PMR	6	10	9
892	E7	PMR	6	12	9
893	E8	STANDARD	11	16	9
894	E9	STANDARD	8	17	9
895	E10	STANDARD	15	14	9
896	F1	STANDARD	19	10	9
897	F2	PMR	20	16	9
898	F3	STANDARD	12	8	9
899	F4	STANDARD	17	9	9
900	F5	STANDARD	10	9	9
901	F6	PMR	1	1	9
902	F7	STANDARD	11	15	9
903	F8	STANDARD	12	6	9
904	F9	STANDARD	14	15	9
905	F10	STANDARD	16	4	9
906	G1	STANDARD	13	4	9
907	G2	STANDARD	17	0	9
908	G3	PMR	10	13	9
909	G4	PMR	16	1	9
910	G5	PMR	3	14	9
911	G6	STANDARD	2	3	9
912	G7	PMR	5	14	9
913	G8	PMR	19	12	9
914	G9	STANDARD	8	3	9
915	G10	STANDARD	4	20	9
916	H1	STANDARD	1	3	9
917	H2	PMR	7	3	9
918	H3	PMR	15	20	9
919	H4	PMR	17	14	9
920	H5	PMR	1	8	9
921	H6	PMR	5	18	9
922	H7	PMR	10	19	9
923	H8	PMR	2	11	9
924	H9	PMR	11	7	9
925	H10	PMR	9	1	9
926	I1	STANDARD	10	12	9
927	I2	STANDARD	14	3	9
928	I3	PMR	9	17	9
929	I4	PMR	8	9	9
930	I5	PMR	3	13	9
931	I6	STANDARD	20	10	9
932	I7	PMR	8	17	9
933	I8	STANDARD	3	17	9
934	I9	STANDARD	1	19	9
935	I10	STANDARD	17	12	9
936	J1	STANDARD	14	11	9
937	J2	STANDARD	5	4	9
938	J3	STANDARD	16	14	9
939	J4	PMR	3	3	9
940	J5	STANDARD	6	20	9
941	J6	STANDARD	14	12	9
942	J7	STANDARD	15	10	9
943	J8	PMR	4	4	9
944	J9	PMR	18	7	9
945	J10	PMR	12	17	9
946	K1	STANDARD	14	20	9
947	K2	PMR	12	13	9
948	K3	PMR	9	6	9
949	K4	PMR	11	10	9
950	K5	STANDARD	6	3	9
951	K6	PMR	3	0	9
952	K7	STANDARD	15	2	9
953	K8	PMR	0	7	9
954	K9	STANDARD	14	8	9
955	K10	STANDARD	5	15	9
956	L1	PMR	6	2	9
957	L2	STANDARD	0	12	9
958	A1	STANDARD	20	19	10
959	A2	PMR	15	6	10
960	A3	PMR	4	16	10
961	A4	PMR	8	0	10
962	A5	STANDARD	5	8	10
963	A6	STANDARD	1	5	10
964	A7	STANDARD	10	9	10
965	A8	PMR	18	9	10
966	A9	STANDARD	15	18	10
967	A10	STANDARD	6	4	10
968	B1	STANDARD	15	3	10
969	B2	PMR	11	7	10
970	B3	STANDARD	16	5	10
971	B4	STANDARD	6	8	10
972	B5	STANDARD	9	0	10
973	B6	STANDARD	8	12	10
974	B7	STANDARD	11	13	10
975	B8	STANDARD	5	8	10
976	B9	PMR	20	7	10
977	B10	PMR	11	11	10
978	C1	PMR	12	15	10
979	C2	STANDARD	19	7	10
980	C3	STANDARD	1	10	10
981	C4	STANDARD	19	20	10
982	C5	STANDARD	9	12	10
983	C6	STANDARD	20	9	10
984	C7	STANDARD	13	14	10
985	C8	PMR	19	5	10
986	C9	PMR	19	8	10
987	C10	PMR	3	2	10
988	D1	STANDARD	12	18	10
989	D2	STANDARD	7	9	10
990	D3	PMR	11	2	10
991	D4	PMR	2	6	10
992	D5	PMR	11	15	10
993	D6	PMR	12	3	10
994	D7	PMR	0	8	10
995	D8	PMR	3	12	10
996	D9	STANDARD	18	9	10
997	D10	PMR	9	10	10
998	E1	PMR	10	2	10
999	E2	PMR	18	5	10
1000	E3	PMR	14	9	10
1001	E4	PMR	5	13	10
1002	E5	STANDARD	9	13	10
1003	E6	PMR	9	5	10
1004	E7	STANDARD	0	13	10
1005	E8	STANDARD	16	6	10
1006	E9	PMR	13	11	10
1007	E10	STANDARD	12	13	10
1008	F1	PMR	0	19	10
1009	F2	STANDARD	6	11	10
1010	F3	PMR	6	6	10
1011	F4	STANDARD	18	14	10
1012	F5	STANDARD	9	20	10
1013	F6	PMR	1	3	10
1014	F7	STANDARD	9	20	10
1015	F8	STANDARD	19	5	10
1016	F9	PMR	18	13	10
1017	F10	STANDARD	17	10	10
1018	G1	PMR	17	11	10
1019	G2	PMR	14	6	10
1020	G3	PMR	15	15	10
1021	G4	PMR	12	14	10
1022	G5	PMR	9	3	10
1023	G6	PMR	20	20	10
1024	G7	STANDARD	0	15	10
1025	G8	STANDARD	8	12	10
1026	G9	STANDARD	6	9	10
1027	G10	STANDARD	11	11	10
1028	H1	STANDARD	12	9	10
1029	H2	STANDARD	1	3	10
1030	H3	PMR	15	1	10
1031	H4	STANDARD	5	6	10
1032	H5	PMR	7	20	10
1033	H6	STANDARD	4	1	10
1034	H7	PMR	17	14	10
1035	H8	STANDARD	12	3	10
1036	H9	PMR	18	2	10
1037	H10	PMR	0	12	10
1038	I1	PMR	19	1	10
1039	I2	STANDARD	11	11	10
1040	I3	STANDARD	0	5	10
1041	I4	STANDARD	4	9	10
1042	I5	PMR	11	1	10
1043	I6	PMR	11	10	10
1044	I7	STANDARD	17	7	10
1045	I8	PMR	3	12	10
1046	I9	STANDARD	15	7	10
1047	I10	PMR	19	18	10
1048	J1	STANDARD	11	2	10
1049	J2	PMR	13	7	10
1050	A1	PMR	1	7	11
1051	A2	STANDARD	8	6	11
1052	A3	PMR	2	8	11
1053	A4	PMR	1	15	11
1054	A5	STANDARD	7	19	11
1055	A6	STANDARD	19	5	11
1056	A7	PMR	4	10	11
1057	A8	STANDARD	18	9	11
1058	A9	PMR	19	11	11
1059	A10	STANDARD	9	4	11
1060	B1	STANDARD	7	14	11
1061	B2	PMR	14	17	11
1062	B3	PMR	6	18	11
1063	B4	STANDARD	19	13	11
1064	B5	PMR	10	5	11
1065	B6	PMR	6	10	11
1066	B7	PMR	18	2	11
1067	B8	STANDARD	3	12	11
1068	B9	STANDARD	2	13	11
1069	B10	PMR	14	15	11
1070	C1	STANDARD	9	5	11
1071	C2	PMR	10	14	11
1072	C3	PMR	19	13	11
1073	C4	PMR	9	6	11
1074	C5	PMR	15	10	11
1075	C6	PMR	2	1	11
1076	C7	STANDARD	17	14	11
1077	C8	PMR	20	5	11
1078	C9	PMR	10	6	11
1079	C10	STANDARD	13	18	11
1080	D1	PMR	18	10	11
1081	D2	PMR	5	9	11
1082	D3	PMR	2	1	11
1083	D4	PMR	20	0	11
1084	D5	STANDARD	11	12	11
1085	D6	STANDARD	9	1	11
1086	D7	PMR	14	18	11
1087	D8	STANDARD	4	2	11
1088	D9	PMR	18	18	11
1089	D10	PMR	6	7	11
1090	E1	STANDARD	5	18	11
1091	E2	STANDARD	13	16	11
1092	E3	STANDARD	9	3	11
1093	E4	PMR	6	11	11
1094	E5	PMR	5	11	11
1095	E6	STANDARD	6	2	11
1096	E7	PMR	1	13	11
1097	E8	PMR	5	4	11
1098	E9	PMR	1	16	11
1099	E10	PMR	7	0	11
1100	F1	STANDARD	15	0	11
1101	F2	STANDARD	8	10	11
1102	F3	PMR	11	6	11
1103	F4	STANDARD	15	7	11
1104	F5	PMR	5	9	11
1105	F6	PMR	2	11	11
1106	F7	STANDARD	14	5	11
1107	F8	PMR	18	15	11
1108	F9	STANDARD	8	4	11
1109	F10	PMR	19	18	11
1110	G1	STANDARD	0	10	11
1111	G2	PMR	6	15	11
1112	G3	PMR	17	3	11
1113	G4	PMR	13	5	11
1114	G5	STANDARD	6	19	11
1115	G6	PMR	5	18	11
1116	G7	STANDARD	18	9	11
1117	G8	STANDARD	12	5	11
1118	G9	STANDARD	6	18	11
1119	G10	STANDARD	7	8	11
1120	H1	STANDARD	12	1	11
1121	H2	STANDARD	16	9	11
1122	H3	PMR	8	18	11
1123	H4	STANDARD	10	4	11
1124	H5	STANDARD	3	16	11
1125	H6	PMR	17	12	11
1126	H7	STANDARD	14	15	11
1127	H8	STANDARD	12	13	11
1128	H9	PMR	6	3	11
1129	H10	PMR	19	7	11
1130	I1	STANDARD	1	7	11
1131	I2	STANDARD	12	18	11
1132	I3	PMR	7	8	11
1133	I4	PMR	9	3	11
1134	I5	PMR	15	13	11
1135	I6	STANDARD	4	0	11
1136	I7	PMR	19	8	11
1137	I8	STANDARD	12	19	11
1138	I9	STANDARD	19	19	11
1139	I10	STANDARD	11	19	11
1140	J1	PMR	3	9	11
1141	J2	PMR	5	19	11
1142	J3	PMR	20	1	11
1143	J4	PMR	1	7	11
1144	J5	STANDARD	13	5	11
1145	J6	PMR	7	1	11
1146	J7	PMR	20	10	11
1147	J8	PMR	0	6	11
1148	J9	PMR	15	13	11
1149	J10	STANDARD	10	14	11
1150	K1	PMR	4	14	11
1151	K2	PMR	3	9	11
1152	K3	PMR	3	14	11
1153	K4	STANDARD	11	1	11
1154	K5	STANDARD	11	0	11
1155	K6	PMR	1	11	11
1156	K7	STANDARD	8	5	11
1157	K8	PMR	2	18	11
1158	K9	PMR	19	0	11
1159	K10	STANDARD	7	10	11
1160	L1	PMR	14	9	11
1161	L2	STANDARD	9	12	11
1162	L3	PMR	11	12	11
1163	L4	PMR	19	10	11
1164	L5	STANDARD	20	4	11
1165	A1	STANDARD	13	12	12
1166	A2	STANDARD	5	9	12
1167	A3	STANDARD	8	19	12
1168	A4	PMR	7	6	12
1169	A5	STANDARD	2	0	12
1170	A6	PMR	10	1	12
1171	A7	PMR	0	10	12
1172	A8	STANDARD	3	20	12
1173	A9	STANDARD	16	11	12
1174	A10	PMR	6	19	12
1175	B1	PMR	14	2	12
1176	B2	PMR	0	0	12
1177	B3	STANDARD	4	17	12
1178	B4	PMR	1	5	12
1179	B5	PMR	4	8	12
1180	B6	STANDARD	7	15	12
1181	B7	PMR	0	20	12
1182	B8	PMR	16	11	12
1183	B9	PMR	11	12	12
1184	B10	PMR	18	13	12
1185	C1	STANDARD	20	3	12
1186	C2	PMR	10	8	12
1187	C3	PMR	16	3	12
1188	C4	PMR	7	2	12
1189	C5	PMR	2	18	12
1190	C6	PMR	5	17	12
1191	C7	STANDARD	11	12	12
1192	C8	STANDARD	12	7	12
1193	C9	PMR	10	0	12
1194	C10	PMR	10	4	12
1195	D1	PMR	10	14	12
1196	D2	PMR	20	5	12
1197	D3	STANDARD	20	8	12
1198	D4	PMR	6	19	12
1199	D5	PMR	11	17	12
1200	D6	STANDARD	1	10	12
1201	D7	STANDARD	8	5	12
1202	D8	PMR	4	13	12
1203	D9	PMR	18	1	12
1204	D10	PMR	11	9	12
1205	E1	STANDARD	14	15	12
1206	E2	STANDARD	2	14	12
1207	E3	PMR	0	9	12
1208	E4	STANDARD	1	12	12
1209	E5	STANDARD	17	16	12
1210	E6	PMR	20	7	12
1211	E7	PMR	13	18	12
1212	E8	PMR	0	16	12
1213	E9	PMR	17	4	12
1214	E10	STANDARD	11	13	12
1215	F1	PMR	9	15	12
1216	F2	PMR	13	20	12
1217	F3	STANDARD	12	14	12
1218	F4	PMR	7	13	12
1219	F5	PMR	17	9	12
1220	F6	PMR	12	15	12
1221	F7	PMR	0	5	12
1222	F8	STANDARD	13	9	12
1223	F9	PMR	18	5	12
1224	F10	PMR	0	4	12
1225	G1	STANDARD	9	7	12
1226	G2	STANDARD	14	17	12
1227	G3	PMR	18	3	12
1228	G4	PMR	15	3	12
1229	G5	STANDARD	9	17	12
1230	G6	PMR	0	10	12
1231	G7	PMR	4	7	12
1232	G8	PMR	15	6	12
1233	G9	PMR	17	19	12
1234	G10	STANDARD	11	8	12
1235	H1	PMR	5	3	12
1236	H2	STANDARD	12	18	12
1237	H3	PMR	1	0	12
1238	H4	PMR	11	3	12
1239	H5	STANDARD	0	7	12
1240	H6	PMR	20	10	12
1241	H7	STANDARD	18	11	12
1242	H8	STANDARD	8	17	12
1243	H9	STANDARD	5	10	12
1244	H10	PMR	8	1	12
1245	I1	STANDARD	4	17	12
1246	I2	PMR	1	13	12
1247	I3	PMR	16	4	12
1248	I4	PMR	2	17	12
1249	I5	STANDARD	9	20	12
1250	I6	STANDARD	19	0	12
1251	I7	PMR	2	4	12
1252	I8	PMR	10	16	12
1253	I9	PMR	14	18	12
1254	I10	PMR	5	8	12
1255	J1	STANDARD	20	12	12
1256	J2	STANDARD	17	8	12
1257	J3	PMR	20	10	12
1258	J4	STANDARD	7	13	12
1259	J5	STANDARD	9	11	12
1260	J6	STANDARD	3	9	12
1261	J7	STANDARD	11	6	12
1262	J8	STANDARD	0	6	12
1263	J9	PMR	9	1	12
1264	J10	PMR	17	8	12
1265	K1	STANDARD	4	8	12
1266	K2	PMR	13	14	12
1267	K3	STANDARD	9	17	12
1268	K4	PMR	2	15	12
1269	K5	STANDARD	4	15	12
1270	K6	STANDARD	19	12	12
1271	K7	STANDARD	2	7	12
1272	K8	PMR	17	3	12
1273	K9	PMR	1	8	12
1274	K10	PMR	16	18	12
1275	L1	PMR	4	17	12
1276	L2	PMR	20	0	12
1277	A1	STANDARD	6	1	13
1278	A2	PMR	0	11	13
1279	A3	STANDARD	19	17	13
1280	A4	STANDARD	12	1	13
1281	A5	PMR	14	4	13
1282	A6	PMR	20	18	13
1283	A7	PMR	11	7	13
1284	A8	STANDARD	20	6	13
1285	A9	STANDARD	15	12	13
1286	A10	PMR	14	15	13
1287	B1	STANDARD	18	7	13
1288	B2	STANDARD	6	0	13
1289	B3	PMR	17	11	13
1290	B4	PMR	6	12	13
1291	B5	STANDARD	7	15	13
1292	B6	PMR	19	6	13
1293	B7	STANDARD	1	10	13
1294	B8	PMR	18	2	13
1295	B9	PMR	3	13	13
1296	B10	STANDARD	10	0	13
1297	C1	STANDARD	1	1	13
1298	C2	STANDARD	2	12	13
1299	C3	PMR	18	20	13
1300	C4	STANDARD	5	14	13
1301	C5	STANDARD	7	2	13
1302	C6	STANDARD	11	19	13
1303	C7	STANDARD	15	9	13
1304	C8	PMR	16	11	13
1305	C9	STANDARD	14	11	13
1306	C10	STANDARD	11	5	13
1307	D1	PMR	19	1	13
1308	D2	PMR	9	5	13
1309	D3	PMR	8	11	13
1310	D4	PMR	13	17	13
1311	D5	PMR	11	17	13
1312	D6	PMR	19	14	13
1313	D7	PMR	16	9	13
1314	D8	PMR	0	2	13
1315	D9	STANDARD	2	15	13
1316	D10	STANDARD	0	14	13
1317	E1	PMR	4	20	13
1318	E2	PMR	14	8	13
1319	E3	PMR	18	12	13
1320	E4	PMR	12	15	13
1321	E5	STANDARD	8	15	13
1322	E6	PMR	11	1	13
1323	E7	STANDARD	16	8	13
1324	E8	PMR	12	17	13
1325	E9	PMR	15	6	13
1326	E10	PMR	16	7	13
1327	F1	STANDARD	9	12	13
1328	F2	STANDARD	5	6	13
1329	F3	PMR	18	19	13
1330	F4	STANDARD	7	9	13
1331	F5	STANDARD	4	13	13
1332	F6	STANDARD	19	8	13
1333	F7	PMR	16	3	13
1334	F8	PMR	10	13	13
1335	F9	PMR	10	17	13
1336	F10	PMR	5	8	13
1337	G1	STANDARD	2	9	13
1338	G2	PMR	1	20	13
1339	G3	PMR	1	20	13
1340	G4	STANDARD	9	10	13
1341	G5	PMR	10	6	13
1342	G6	PMR	10	9	13
1343	G7	PMR	6	19	13
1344	G8	PMR	8	10	13
1345	G9	STANDARD	20	15	13
1346	G10	PMR	14	13	13
1347	H1	PMR	10	15	13
1348	H2	PMR	10	17	13
1349	H3	PMR	9	14	13
1350	H4	PMR	17	2	13
1351	H5	PMR	3	3	13
1352	H6	PMR	15	6	13
1353	H7	STANDARD	12	1	13
1354	H8	PMR	8	8	13
1355	H9	STANDARD	8	17	13
1356	H10	STANDARD	18	1	13
1357	I1	PMR	15	20	13
1358	I2	PMR	2	20	13
1359	I3	STANDARD	4	12	13
1360	I4	STANDARD	3	10	13
1361	I5	PMR	12	9	13
1362	I6	PMR	3	6	13
1363	I7	PMR	3	9	13
1364	I8	STANDARD	6	15	13
1365	I9	STANDARD	20	10	13
1366	I10	STANDARD	13	4	13
1367	J1	PMR	14	5	13
1368	J2	PMR	14	15	13
1369	J3	PMR	11	1	13
1370	J4	STANDARD	13	11	13
1371	J5	STANDARD	20	6	13
1372	J6	STANDARD	18	10	13
1373	J7	STANDARD	8	12	13
1374	J8	STANDARD	8	5	13
1375	J9	PMR	5	10	13
1376	J10	PMR	16	13	13
1377	K1	PMR	3	16	13
1378	K2	STANDARD	12	16	13
1379	K3	STANDARD	4	0	13
1380	K4	PMR	14	20	13
1381	K5	PMR	10	3	13
1382	K6	PMR	4	16	13
1383	K7	PMR	12	14	13
1384	K8	STANDARD	3	1	13
1385	K9	STANDARD	3	12	13
1386	K10	PMR	19	0	13
1387	L1	STANDARD	15	11	13
1388	L2	STANDARD	16	8	13
1389	L3	PMR	4	19	13
1390	L4	PMR	20	11	13
1391	L5	PMR	5	19	13
1392	L6	PMR	19	7	13
1393	L7	PMR	10	4	13
1394	L8	PMR	17	1	13
1395	L9	PMR	2	0	13
1396	L10	PMR	7	12	13
1397	M1	PMR	20	5	13
1398	M2	PMR	5	7	13
1399	M3	PMR	2	17	13
1400	M4	STANDARD	13	16	13
1401	M5	STANDARD	4	9	13
1402	M6	STANDARD	13	20	13
1403	M7	PMR	20	20	13
1404	M8	PMR	14	4	13
1405	M9	STANDARD	14	10	13
1406	M10	STANDARD	4	8	13
1407	N1	STANDARD	17	12	13
1408	N2	PMR	13	6	13
1409	N3	STANDARD	7	8	13
1410	N4	STANDARD	5	5	13
1411	N5	STANDARD	18	9	13
1412	N6	PMR	20	19	13
1413	N7	STANDARD	14	12	13
1414	N8	STANDARD	14	15	13
1415	N9	STANDARD	8	20	13
1416	N10	STANDARD	0	7	13
1417	O1	STANDARD	7	4	13
1418	O2	PMR	0	20	13
1419	O3	STANDARD	18	14	13
1420	O4	STANDARD	15	2	13
1421	O5	STANDARD	16	9	13
1422	O6	PMR	11	9	13
1423	O7	STANDARD	17	0	13
1424	O8	STANDARD	2	14	13
1425	O9	STANDARD	13	9	13
1426	O10	STANDARD	2	16	13
1427	P1	STANDARD	11	10	13
1428	P2	STANDARD	14	2	13
1429	P3	STANDARD	14	6	13
1430	P4	STANDARD	2	14	13
1431	P5	PMR	18	2	13
1432	P6	STANDARD	5	18	13
1433	P7	STANDARD	14	13	13
1434	P8	PMR	8	4	13
1435	P9	PMR	10	10	13
1436	P10	PMR	18	18	13
1437	Q1	PMR	13	19	13
1438	Q2	STANDARD	12	15	13
1439	Q3	PMR	8	15	13
1440	Q4	STANDARD	20	0	13
1441	Q5	STANDARD	13	11	13
1442	A1	STANDARD	20	17	14
1443	A2	PMR	5	9	14
1444	A3	STANDARD	15	6	14
1445	A4	PMR	18	9	14
1446	A5	STANDARD	2	2	14
1447	A6	PMR	11	4	14
1448	A7	STANDARD	4	9	14
1449	A8	PMR	4	4	14
1450	A9	PMR	7	17	14
1451	A10	PMR	5	18	14
1452	B1	STANDARD	11	4	14
1453	B2	STANDARD	16	8	14
1454	B3	PMR	19	2	14
1455	B4	PMR	7	19	14
1456	B5	PMR	17	15	14
1457	B6	PMR	7	10	14
1458	B7	PMR	20	17	14
1459	B8	STANDARD	17	10	14
1460	B9	STANDARD	4	6	14
1461	B10	PMR	2	9	14
1462	C1	STANDARD	20	9	14
1463	C2	STANDARD	2	2	14
1464	C3	PMR	8	0	14
1465	C4	STANDARD	10	3	14
1466	C5	STANDARD	8	0	14
1467	C6	STANDARD	19	9	14
1468	C7	PMR	5	15	14
1469	C8	PMR	14	20	14
1470	C9	PMR	13	6	14
1471	C10	STANDARD	4	20	14
1472	D1	PMR	14	9	14
1473	D2	STANDARD	12	1	14
1474	D3	STANDARD	15	19	14
1475	D4	STANDARD	2	11	14
1476	D5	STANDARD	11	2	14
1477	D6	STANDARD	14	2	14
1478	D7	STANDARD	16	8	14
1479	D8	STANDARD	6	8	14
1480	D9	STANDARD	5	20	14
1481	D10	PMR	20	20	14
1482	E1	STANDARD	4	18	14
1483	E2	PMR	15	4	14
1484	E3	STANDARD	7	15	14
1485	E4	STANDARD	10	18	14
1486	E5	STANDARD	20	20	14
1487	E6	STANDARD	1	19	14
1488	E7	STANDARD	13	13	14
1489	E8	PMR	12	20	14
1490	E9	STANDARD	19	0	14
1491	E10	STANDARD	16	12	14
1492	F1	STANDARD	3	14	14
1493	F2	STANDARD	13	2	14
1494	F3	STANDARD	6	7	14
1495	F4	PMR	15	13	14
1496	F5	STANDARD	4	13	14
1497	F6	PMR	10	15	14
1498	F7	STANDARD	16	7	14
1499	F8	PMR	4	4	14
1500	F9	STANDARD	10	0	14
1501	F10	STANDARD	11	6	14
1502	G1	PMR	12	17	14
1503	G2	PMR	5	3	14
1504	G3	PMR	17	15	14
1505	G4	PMR	13	16	14
1506	G5	PMR	1	14	14
1507	G6	STANDARD	10	18	14
1508	G7	PMR	2	18	14
1509	G8	STANDARD	14	2	14
1510	G9	PMR	10	13	14
1511	G10	STANDARD	5	9	14
1512	H1	STANDARD	5	4	14
1513	H2	PMR	10	6	14
1514	H3	PMR	12	0	14
1515	H4	PMR	4	7	14
1516	H5	PMR	8	7	14
1517	H6	STANDARD	18	4	14
1518	H7	PMR	14	12	14
1519	H8	PMR	6	16	14
1520	H9	PMR	19	1	14
1521	H10	PMR	0	16	14
1522	I1	STANDARD	12	9	14
1523	I2	STANDARD	17	4	14
1524	I3	PMR	1	20	14
1525	I4	STANDARD	8	2	14
1526	I5	STANDARD	16	4	14
1527	I6	PMR	5	13	14
1528	I7	PMR	9	4	14
1529	I8	PMR	15	7	14
1530	I9	STANDARD	6	8	14
1531	I10	STANDARD	16	0	14
1532	J1	PMR	8	15	14
1533	J2	PMR	15	0	14
1534	J3	PMR	12	18	14
1535	J4	PMR	9	17	14
1536	J5	STANDARD	0	8	14
1537	J6	STANDARD	16	9	14
1538	J7	PMR	19	4	14
1539	J8	PMR	4	18	14
1540	J9	STANDARD	13	1	14
1541	J10	PMR	12	20	14
1542	K1	PMR	8	0	14
1543	K2	STANDARD	18	2	14
1544	K3	STANDARD	15	18	14
1545	K4	STANDARD	1	13	14
1546	K5	PMR	1	4	14
1547	K6	PMR	20	14	14
1548	K7	PMR	16	1	14
1549	K8	STANDARD	13	12	14
1550	K9	STANDARD	0	3	14
1551	K10	STANDARD	13	7	14
1552	L1	STANDARD	20	4	14
1553	L2	STANDARD	8	3	14
1554	L3	STANDARD	18	7	14
1555	L4	PMR	10	8	14
1556	L5	PMR	6	7	14
1557	L6	PMR	4	10	14
1558	L7	PMR	4	3	14
1559	L8	STANDARD	16	7	14
1560	L9	PMR	12	4	14
1561	L10	STANDARD	16	17	14
1562	M1	PMR	12	18	14
1563	M2	PMR	12	4	14
1564	M3	PMR	3	10	14
1565	M4	PMR	3	0	14
1566	M5	STANDARD	18	3	14
1567	M6	STANDARD	19	11	14
1568	M7	STANDARD	7	14	14
1569	M8	STANDARD	9	10	14
1570	M9	STANDARD	17	7	14
1571	M10	STANDARD	20	14	14
1572	N1	PMR	9	16	14
1573	N2	PMR	2	10	14
1574	N3	PMR	12	9	14
1575	N4	STANDARD	13	10	14
1576	N5	PMR	19	17	14
1577	N6	STANDARD	6	19	14
1578	N7	PMR	9	16	14
1579	N8	PMR	18	0	14
1580	N9	STANDARD	10	9	14
1581	N10	PMR	4	17	14
1582	O1	STANDARD	10	17	14
1583	O2	PMR	17	12	14
1584	O3	STANDARD	14	12	14
1585	O4	PMR	6	3	14
1586	O5	PMR	15	20	14
1587	O6	STANDARD	15	15	14
1588	O7	PMR	15	1	14
1589	O8	PMR	0	5	14
1590	O9	PMR	18	11	14
1591	O10	PMR	17	17	14
1592	P1	PMR	2	0	14
1593	P2	PMR	1	18	14
1594	P3	PMR	12	13	14
1595	P4	PMR	17	5	14
1596	P5	PMR	8	15	14
1597	P6	PMR	14	19	14
1598	P7	STANDARD	6	11	14
1599	P8	PMR	1	0	14
1600	P9	PMR	16	6	14
1601	P10	STANDARD	8	4	14
1602	Q1	PMR	9	3	14
1603	Q2	PMR	2	7	14
1604	Q3	PMR	19	5	14
1605	A1	PMR	10	3	15
1606	A2	PMR	16	14	15
1607	A3	STANDARD	3	6	15
1608	A4	STANDARD	1	16	15
1609	A5	STANDARD	17	2	15
1610	A6	PMR	14	14	15
1611	A7	STANDARD	20	18	15
1612	A8	PMR	16	9	15
1613	A9	PMR	0	15	15
1614	A10	PMR	0	18	15
1615	B1	STANDARD	13	12	15
1616	B2	STANDARD	12	7	15
1617	B3	STANDARD	0	10	15
1618	B4	PMR	16	7	15
1619	B5	PMR	1	13	15
1620	B6	PMR	13	10	15
1621	B7	PMR	4	6	15
1622	B8	PMR	11	15	15
1623	B9	STANDARD	11	19	15
1624	B10	STANDARD	14	3	15
1625	C1	STANDARD	13	20	15
1626	C2	STANDARD	4	10	15
1627	C3	PMR	16	6	15
1628	C4	STANDARD	3	18	15
1629	C5	PMR	5	7	15
1630	C6	STANDARD	10	5	15
1631	C7	PMR	20	9	15
1632	C8	STANDARD	19	20	15
1633	C9	PMR	13	17	15
1634	C10	PMR	3	17	15
1635	D1	PMR	10	9	15
1636	D2	PMR	10	8	15
1637	D3	PMR	2	9	15
1638	D4	PMR	15	0	15
1639	D5	STANDARD	11	13	15
1640	D6	PMR	11	1	15
1641	D7	STANDARD	3	13	15
1642	D8	PMR	5	7	15
1643	D9	PMR	7	2	15
1644	D10	STANDARD	11	5	15
1645	E1	STANDARD	2	9	15
1646	E2	STANDARD	11	12	15
1647	E3	STANDARD	4	6	15
1648	E4	PMR	10	6	15
1649	E5	STANDARD	3	17	15
1650	E6	PMR	13	11	15
1651	E7	PMR	0	18	15
1652	E8	PMR	15	20	15
1653	E9	PMR	3	13	15
1654	E10	PMR	9	19	15
1655	F1	STANDARD	8	6	15
1656	F2	STANDARD	0	18	15
1657	F3	STANDARD	3	1	15
1658	F4	PMR	8	6	15
1659	F5	STANDARD	4	8	15
1660	F6	PMR	14	2	15
1661	F7	PMR	14	6	15
1662	F8	PMR	5	17	15
1663	F9	STANDARD	9	11	15
1664	F10	PMR	8	7	15
1665	G1	PMR	17	9	15
1666	G2	STANDARD	2	6	15
1667	G3	STANDARD	18	17	15
1668	G4	PMR	13	13	15
1669	G5	PMR	5	1	15
1670	G6	PMR	16	2	15
1671	G7	STANDARD	13	10	15
1672	G8	STANDARD	13	5	15
1673	G9	PMR	20	8	15
1674	G10	STANDARD	18	15	15
1675	H1	STANDARD	5	7	15
1676	H2	PMR	4	11	15
1677	H3	STANDARD	11	1	15
1678	H4	PMR	8	16	15
1679	H5	STANDARD	18	8	15
1680	H6	STANDARD	6	19	15
1681	H7	PMR	8	8	15
1682	H8	STANDARD	15	6	15
1683	H9	STANDARD	10	4	15
1684	H10	STANDARD	12	5	15
1685	I1	PMR	4	13	15
1686	I2	STANDARD	12	19	15
1687	I3	STANDARD	9	17	15
1688	I4	STANDARD	10	14	15
1689	I5	PMR	19	19	15
1690	I6	STANDARD	0	14	15
1691	I7	PMR	6	4	15
1692	I8	STANDARD	3	2	15
1693	I9	STANDARD	18	14	15
1694	I10	STANDARD	7	9	15
1695	J1	STANDARD	20	14	15
1696	J2	PMR	3	15	15
1697	J3	PMR	6	16	15
1698	J4	PMR	17	16	15
1699	J5	STANDARD	4	15	15
1700	J6	STANDARD	18	0	15
1701	J7	PMR	17	5	15
1702	J8	STANDARD	5	19	15
1703	J9	STANDARD	11	14	15
1704	J10	STANDARD	10	17	15
1705	K1	PMR	5	14	15
1706	K2	STANDARD	13	0	15
1707	K3	STANDARD	7	2	15
1708	K4	STANDARD	7	8	15
1709	K5	STANDARD	7	8	15
1710	K6	STANDARD	12	15	15
1711	K7	STANDARD	12	13	15
1712	K8	STANDARD	4	5	15
1713	K9	PMR	10	7	15
1714	K10	PMR	15	10	15
1715	L1	PMR	19	14	15
1716	L2	STANDARD	2	8	15
1717	L3	PMR	14	8	15
1718	L4	STANDARD	2	17	15
1719	L5	STANDARD	12	0	15
1720	L6	PMR	18	9	15
1721	L7	PMR	13	19	15
1722	L8	PMR	2	15	15
1723	L9	PMR	18	15	15
1724	L10	PMR	17	19	15
1725	M1	PMR	2	2	15
1726	M2	STANDARD	17	14	15
1727	M3	PMR	15	9	15
1728	M4	STANDARD	10	1	15
1729	M5	PMR	3	13	15
1730	M6	STANDARD	10	14	15
1731	M7	STANDARD	19	19	15
1732	M8	PMR	10	16	15
1733	M9	PMR	17	19	15
1734	M10	STANDARD	8	19	15
1735	N1	PMR	20	4	15
1736	N2	PMR	18	12	15
1737	N3	PMR	10	12	15
1738	N4	PMR	20	17	15
1739	N5	STANDARD	10	4	15
1740	N6	STANDARD	16	13	15
1741	N7	STANDARD	10	10	15
1742	N8	STANDARD	10	10	15
1743	N9	STANDARD	6	17	15
1744	N10	PMR	18	7	15
1745	O1	STANDARD	19	2	15
1746	O2	STANDARD	9	6	15
1747	O3	PMR	7	10	15
1748	O4	PMR	17	6	15
1749	O5	STANDARD	18	13	15
1750	O6	PMR	11	8	15
1751	O7	STANDARD	17	3	15
1752	O8	PMR	1	18	15
1753	O9	STANDARD	13	9	15
1754	O10	PMR	4	6	15
1755	P1	STANDARD	9	14	15
1756	P2	STANDARD	11	5	15
1757	P3	PMR	6	16	15
1758	P4	STANDARD	19	16	15
1759	P5	PMR	15	14	15
1760	P6	PMR	6	13	15
1761	P7	PMR	13	11	15
1762	P8	STANDARD	6	18	15
1763	P9	STANDARD	10	12	15
1764	P10	STANDARD	0	7	15
1765	Q1	PMR	10	10	15
1766	Q2	PMR	6	12	15
1767	Q3	PMR	7	13	15
1768	Q4	PMR	16	12	15
1769	Q5	STANDARD	17	6	15
1770	Q6	STANDARD	11	15	15
1771	Q7	PMR	18	4	15
1772	Q8	PMR	19	15	15
1773	Q9	PMR	7	8	15
1774	Q10	PMR	14	10	15
1775	R1	STANDARD	14	14	15
1776	R2	STANDARD	20	3	15
1777	R3	PMR	12	14	15
1778	R4	PMR	7	7	15
1779	R5	STANDARD	11	5	15
1780	R6	STANDARD	2	5	15
1781	R7	STANDARD	4	10	15
1782	R8	STANDARD	19	4	15
1783	R9	PMR	19	4	15
1784	R10	PMR	15	14	15
1785	S1	PMR	8	7	15
1786	S2	STANDARD	14	10	15
1787	S3	PMR	8	4	15
1788	S4	PMR	8	8	15
1789	S5	PMR	10	13	15
1790	S6	STANDARD	0	18	15
1791	S7	PMR	8	12	15
1792	S8	PMR	12	8	15
1793	S9	STANDARD	14	5	15
1794	S10	STANDARD	12	19	15
1795	T1	PMR	7	8	15
1796	T2	STANDARD	5	2	15
1797	T3	STANDARD	12	16	15
1798	T4	PMR	2	0	15
1799	A1	PMR	17	5	16
1800	A2	PMR	6	15	16
1801	A3	PMR	20	2	16
1802	A4	PMR	9	20	16
1803	A5	STANDARD	20	6	16
1804	A6	PMR	1	19	16
1805	A7	PMR	11	14	16
1806	A8	PMR	8	11	16
1807	A9	STANDARD	6	4	16
1808	A10	PMR	7	10	16
1809	B1	STANDARD	3	5	16
1810	B2	STANDARD	3	10	16
1811	B3	PMR	16	6	16
1812	B4	STANDARD	5	10	16
1813	B5	PMR	4	1	16
1814	B6	STANDARD	20	4	16
1815	B7	PMR	2	8	16
1816	B8	PMR	16	15	16
1817	B9	STANDARD	11	1	16
1818	B10	PMR	10	8	16
1819	C1	PMR	8	2	16
1820	C2	STANDARD	8	17	16
1821	C3	PMR	6	17	16
1822	C4	STANDARD	1	9	16
1823	C5	PMR	7	9	16
1824	C6	STANDARD	7	15	16
1825	C7	STANDARD	8	16	16
1826	C8	STANDARD	13	13	16
1827	C9	PMR	20	18	16
1828	C10	PMR	18	18	16
1829	D1	PMR	1	7	16
1830	D2	STANDARD	7	2	16
1831	D3	STANDARD	10	5	16
1832	D4	STANDARD	1	10	16
1833	D5	PMR	20	18	16
1834	D6	PMR	15	0	16
1835	D7	STANDARD	19	13	16
1836	D8	STANDARD	20	13	16
1837	D9	STANDARD	10	14	16
1838	D10	STANDARD	16	19	16
1839	E1	STANDARD	19	6	16
1840	E2	PMR	7	13	16
1841	E3	PMR	20	19	16
1842	E4	PMR	3	5	16
1843	E5	STANDARD	18	9	16
1844	E6	PMR	2	3	16
1845	E7	STANDARD	6	18	16
1846	E8	STANDARD	3	1	16
1847	E9	STANDARD	19	1	16
1848	E10	STANDARD	17	6	16
1849	F1	PMR	18	17	16
1850	F2	PMR	7	8	16
1851	F3	STANDARD	5	5	16
1852	A1	PMR	20	1	17
1853	A2	PMR	15	14	17
1854	A3	STANDARD	2	2	17
1855	A4	STANDARD	12	0	17
1856	A5	PMR	14	8	17
1857	A6	PMR	18	19	17
1858	A7	PMR	12	11	17
1859	A8	STANDARD	1	3	17
1860	A9	STANDARD	12	11	17
1861	A10	STANDARD	15	4	17
1862	B1	PMR	18	12	17
1863	B2	STANDARD	17	20	17
1864	B3	PMR	12	17	17
1865	B4	STANDARD	10	16	17
1866	B5	PMR	5	11	17
1867	B6	PMR	18	1	17
1868	B7	PMR	7	16	17
1869	B8	STANDARD	11	11	17
1870	B9	STANDARD	9	7	17
1871	B10	PMR	9	2	17
1872	C1	PMR	11	1	17
1873	C2	STANDARD	16	5	17
1874	C3	PMR	11	17	17
1875	C4	STANDARD	10	10	17
1876	C5	STANDARD	6	11	17
1877	C6	STANDARD	17	16	17
1878	C7	PMR	19	20	17
1879	C8	PMR	19	6	17
1880	C9	PMR	8	15	17
1881	C10	STANDARD	3	13	17
1882	D1	PMR	20	11	17
1883	D2	STANDARD	7	3	17
1884	D3	PMR	14	7	17
1885	D4	STANDARD	5	1	17
1886	D5	PMR	9	13	17
1887	D6	STANDARD	4	3	17
1888	D7	STANDARD	8	18	17
1889	D8	STANDARD	6	8	17
1890	D9	STANDARD	16	0	17
1891	D10	STANDARD	13	6	17
1892	E1	STANDARD	4	1	17
1893	E2	STANDARD	15	8	17
1894	E3	PMR	6	7	17
1895	E4	PMR	13	14	17
1896	E5	STANDARD	7	0	17
1897	E6	PMR	8	16	17
1898	E7	STANDARD	18	16	17
1899	E8	PMR	3	6	17
1900	E9	STANDARD	6	3	17
1901	E10	PMR	4	10	17
1902	F1	STANDARD	3	10	17
1903	F2	PMR	3	11	17
1904	F3	STANDARD	12	9	17
1905	F4	PMR	20	3	17
1906	F5	PMR	20	5	17
1907	F6	PMR	8	14	17
1908	F7	PMR	2	1	17
1909	F8	PMR	6	13	17
1910	F9	STANDARD	15	19	17
1911	F10	PMR	11	9	17
1912	G1	PMR	13	20	17
1913	G2	STANDARD	8	2	17
1914	G3	STANDARD	17	20	17
1915	G4	PMR	18	16	17
1916	G5	PMR	9	4	17
1917	G6	STANDARD	11	11	17
1918	G7	PMR	5	3	17
1919	G8	STANDARD	3	6	17
1920	G9	STANDARD	0	20	17
1921	G10	STANDARD	5	4	17
1922	H1	STANDARD	13	17	17
1923	H2	PMR	9	9	17
1924	H3	STANDARD	17	16	17
1925	H4	STANDARD	9	16	17
1926	H5	STANDARD	17	15	17
1927	H6	STANDARD	4	9	17
1928	H7	STANDARD	17	12	17
1929	H8	STANDARD	18	3	17
1930	H9	STANDARD	5	19	17
1931	H10	STANDARD	7	13	17
1932	I1	PMR	9	19	17
1933	I2	PMR	1	9	17
1934	I3	STANDARD	10	8	17
1935	I4	STANDARD	2	15	17
1936	I5	PMR	15	15	17
1937	I6	PMR	13	11	17
1938	I7	PMR	6	8	17
1939	A1	STANDARD	12	7	18
1940	A2	PMR	1	3	18
1941	A3	PMR	5	0	18
1942	A4	PMR	15	13	18
1943	A5	STANDARD	5	1	18
1944	A6	STANDARD	2	1	18
1945	A7	STANDARD	7	13	18
1946	A8	PMR	11	2	18
1947	A9	STANDARD	0	10	18
1948	A10	PMR	13	20	18
1949	B1	PMR	0	11	18
1950	B2	PMR	14	3	18
1951	B3	PMR	11	18	18
1952	B4	PMR	7	20	18
1953	B5	PMR	12	14	18
1954	B6	STANDARD	7	0	18
1955	B7	PMR	7	15	18
1956	B8	PMR	15	10	18
1957	B9	STANDARD	1	1	18
1958	B10	PMR	0	9	18
1959	C1	STANDARD	15	0	18
1960	C2	PMR	18	18	18
1961	C3	PMR	6	13	18
1962	C4	PMR	7	12	18
1963	C5	STANDARD	9	14	18
1964	C6	PMR	11	8	18
1965	C7	STANDARD	11	1	18
1966	C8	STANDARD	7	2	18
1967	C9	STANDARD	16	8	18
1968	C10	PMR	14	9	18
1969	D1	STANDARD	20	2	18
1970	D2	STANDARD	10	19	18
1971	D3	STANDARD	5	13	18
1972	D4	PMR	12	19	18
1973	D5	PMR	6	12	18
1974	D6	PMR	18	11	18
1975	D7	PMR	9	12	18
1976	D8	PMR	5	5	18
1977	D9	STANDARD	17	7	18
1978	D10	STANDARD	11	0	18
1979	E1	PMR	18	19	18
1980	E2	STANDARD	10	14	18
1981	E3	PMR	13	8	18
1982	E4	PMR	16	7	18
1983	E5	PMR	13	0	18
1984	E6	STANDARD	12	13	18
1985	E7	PMR	0	6	18
1986	E8	PMR	17	10	18
1987	E9	STANDARD	19	16	18
1988	E10	STANDARD	10	10	18
1989	F1	PMR	9	12	18
1990	F2	STANDARD	18	0	18
1991	F3	PMR	18	1	18
1992	F4	STANDARD	1	1	18
1993	F5	STANDARD	11	19	18
1994	F6	PMR	12	19	18
1995	F7	PMR	0	7	18
1996	F8	STANDARD	6	18	18
1997	F9	STANDARD	13	5	18
1998	F10	STANDARD	16	4	18
1999	G1	STANDARD	17	19	18
2000	G2	PMR	2	3	18
2001	G3	STANDARD	17	19	18
2002	G4	STANDARD	13	11	18
2003	G5	PMR	2	11	18
2004	G6	STANDARD	9	5	18
2005	G7	STANDARD	6	6	18
2006	G8	PMR	20	0	18
2007	G9	STANDARD	13	1	18
2008	G10	PMR	18	2	18
2009	H1	STANDARD	20	15	18
2010	H2	STANDARD	17	4	18
2011	H3	STANDARD	0	4	18
2012	H4	STANDARD	19	18	18
2013	H5	PMR	1	1	18
2014	H6	PMR	16	18	18
2015	H7	PMR	3	14	18
2016	H8	PMR	4	17	18
2017	H9	PMR	13	6	18
2018	H10	PMR	13	2	18
2019	I1	PMR	11	18	18
2020	I2	PMR	13	17	18
2021	I3	PMR	13	20	18
2022	I4	STANDARD	13	9	18
2023	I5	STANDARD	1	15	18
2024	I6	PMR	12	9	18
2025	I7	STANDARD	20	5	18
2026	I8	PMR	13	7	18
2027	I9	PMR	17	0	18
2028	I10	PMR	16	17	18
2029	J1	PMR	13	5	18
2030	J2	PMR	7	13	18
2031	J3	STANDARD	1	6	18
2032	J4	STANDARD	10	13	18
2033	J5	PMR	10	13	18
2034	J6	STANDARD	13	17	18
2035	J7	STANDARD	3	11	18
2036	J8	PMR	12	10	18
2037	J9	STANDARD	9	9	18
2038	J10	PMR	2	8	18
2039	K1	PMR	9	19	18
2040	K2	STANDARD	19	7	18
2041	K3	STANDARD	10	18	18
2042	K4	STANDARD	15	0	18
2043	K5	PMR	12	9	18
2044	K6	PMR	13	20	18
2045	K7	PMR	14	13	18
2046	K8	STANDARD	3	16	18
2047	K9	STANDARD	0	8	18
2048	K10	STANDARD	7	12	18
2049	L1	STANDARD	6	1	18
2050	L2	STANDARD	13	0	18
2051	L3	STANDARD	11	4	18
2052	L4	PMR	7	20	18
2053	L5	PMR	13	13	18
2054	L6	PMR	16	16	18
2055	L7	STANDARD	15	2	18
2056	L8	PMR	16	9	18
2057	L9	PMR	6	11	18
2058	L10	PMR	2	3	18
2059	A1	PMR	15	16	19
2060	A2	STANDARD	1	0	19
2061	A3	PMR	11	9	19
2062	A4	PMR	19	20	19
2063	A5	STANDARD	20	3	19
2064	A6	PMR	11	6	19
2065	A7	STANDARD	15	16	19
2066	A8	PMR	4	13	19
2067	A9	STANDARD	12	7	19
2068	A10	STANDARD	0	12	19
2069	B1	STANDARD	14	3	19
2070	B2	PMR	3	17	19
2071	B3	PMR	16	12	19
2072	B4	STANDARD	16	20	19
2073	B5	STANDARD	3	7	19
2074	B6	PMR	5	9	19
2075	B7	STANDARD	10	10	19
2076	B8	PMR	6	12	19
2077	B9	PMR	8	10	19
2078	B10	PMR	17	2	19
2079	C1	PMR	2	12	19
2080	C2	STANDARD	11	13	19
2081	C3	STANDARD	8	5	19
2082	C4	STANDARD	4	11	19
2083	C5	PMR	17	17	19
2084	C6	STANDARD	8	6	19
2085	C7	STANDARD	16	5	19
2086	C8	STANDARD	17	5	19
2087	C9	PMR	2	13	19
2088	C10	STANDARD	5	20	19
2089	D1	PMR	8	17	19
2090	D2	STANDARD	10	8	19
2091	D3	STANDARD	10	12	19
2092	D4	PMR	16	0	19
2093	D5	PMR	5	13	19
2094	D6	PMR	11	5	19
2095	D7	STANDARD	18	0	19
2096	D8	PMR	0	5	19
2097	D9	STANDARD	15	15	19
2098	D10	PMR	12	16	19
2099	E1	STANDARD	20	20	19
2100	E2	PMR	7	10	19
2101	E3	PMR	14	4	19
2102	E4	PMR	1	17	19
2103	E5	PMR	16	17	19
2104	E6	STANDARD	11	17	19
2105	E7	STANDARD	2	1	19
2106	E8	PMR	2	16	19
2107	E9	PMR	16	6	19
2108	E10	STANDARD	6	5	19
2109	F1	STANDARD	19	14	19
2110	F2	STANDARD	17	16	19
2111	F3	STANDARD	5	13	19
2112	F4	PMR	19	13	19
2113	F5	STANDARD	4	5	19
2114	F6	STANDARD	8	7	19
2115	F7	STANDARD	14	13	19
2116	F8	STANDARD	14	8	19
2117	F9	PMR	10	8	19
2118	F10	PMR	5	3	19
2119	G1	STANDARD	15	10	19
2120	G2	PMR	6	18	19
2121	G3	PMR	15	1	19
2122	G4	PMR	13	2	19
2123	G5	STANDARD	3	13	19
2124	G6	PMR	6	19	19
2125	G7	STANDARD	10	14	19
2126	G8	STANDARD	7	7	19
2127	G9	STANDARD	12	17	19
2128	G10	STANDARD	17	12	19
2129	H1	PMR	2	13	19
2130	H2	STANDARD	17	12	19
2131	H3	STANDARD	6	8	19
2132	H4	PMR	6	4	19
2133	H5	PMR	12	14	19
2134	H6	STANDARD	8	19	19
2135	H7	PMR	17	7	19
2136	H8	PMR	18	11	19
2137	H9	STANDARD	16	13	19
2138	H10	STANDARD	5	15	19
2139	I1	STANDARD	9	1	19
2140	I2	PMR	0	0	19
2141	I3	PMR	10	4	19
2142	I4	STANDARD	15	17	19
2143	I5	STANDARD	8	2	19
2144	I6	PMR	19	6	19
2145	I7	PMR	17	20	19
2146	I8	STANDARD	16	12	19
2177	A1	STANDARD	1	1	20
2178	A2	STANDARD	1	2	20
2179	A3	STANDARD	1	3	20
2180	A4	STANDARD	1	4	20
2181	A5	STANDARD	1	5	20
2182	A6	STANDARD	1	6	20
2183	B1	STANDARD	2	1	20
2184	B2	STANDARD	2	2	20
2185	B3	STANDARD	2	3	20
2186	B4	STANDARD	2	4	20
2187	B5	STANDARD	2	5	20
2188	B6	STANDARD	2	6	20
2189	C1	STANDARD	3	1	20
2190	C2	STANDARD	3	2	20
2191	C3	STANDARD	3	3	20
2192	C4	STANDARD	3	4	20
2193	C5	STANDARD	3	5	20
2194	C6	STANDARD	3	6	20
2195	D1	STANDARD	4	1	20
2196	D2	STANDARD	4	2	20
2197	D3	STANDARD	4	3	20
2198	D4	STANDARD	4	4	20
2199	D5	STANDARD	4	5	20
2200	D6	STANDARD	4	6	20
2201	E1	STANDARD	5	1	20
2202	E2	STANDARD	5	2	20
2203	E3	STANDARD	5	3	20
2204	E4	STANDARD	5	4	20
2205	E5	STANDARD	5	5	20
2206	E6	STANDARD	5	6	20
2327	A1	STANDARD	1	1	22
2328	A2	STANDARD	1	2	22
2329	A3	STANDARD	1	3	22
2330	A4	STANDARD	1	4	22
2331	A5	STANDARD	1	5	22
2332	A6	STANDARD	1	6	22
2333	B1	STANDARD	2	1	22
2334	B2	STANDARD	2	2	22
2335	B3	STANDARD	2	3	22
2336	B4	STANDARD	2	4	22
2337	B5	STANDARD	2	5	22
2338	B6	STANDARD	2	6	22
2339	C1	STANDARD	3	1	22
2340	C2	STANDARD	3	2	22
2341	C3	STANDARD	3	3	22
2342	C4	STANDARD	3	4	22
2343	C5	STANDARD	3	5	22
2344	C6	STANDARD	3	6	22
2345	D1	STANDARD	4	1	22
2346	D2	STANDARD	4	2	22
2347	D3	STANDARD	4	3	22
2348	D4	STANDARD	4	4	22
2349	D5	STANDARD	4	5	22
2350	D6	STANDARD	4	6	22
2351	E1	STANDARD	5	1	22
2352	E2	STANDARD	5	2	22
2353	E3	STANDARD	5	3	22
2354	E4	STANDARD	5	4	22
2355	E5	STANDARD	5	5	22
2356	E6	STANDARD	5	6	22
2447	A1	PMR	1	1	23
2448	A2	PMR	1	2	23
2460	A14	PMR	1	14	23
2419	A3	STANDARD	1	3	21
2420	A4	STANDARD	1	4	21
2421	A5	STANDARD	1	5	21
2422	A6	STANDARD	1	6	21
2423	B1	STANDARD	2	1	21
2424	B2	STANDARD	2	2	21
2425	B3	STANDARD	2	3	21
2426	B4	STANDARD	2	4	21
2427	B5	STANDARD	2	5	21
2428	B6	STANDARD	2	6	21
2429	C1	STANDARD	3	1	21
2430	C2	STANDARD	3	2	21
2431	C3	STANDARD	3	3	21
2432	C4	STANDARD	3	4	21
2433	C5	STANDARD	3	5	21
2434	C6	STANDARD	3	6	21
2435	D1	STANDARD	4	1	21
2436	D2	STANDARD	4	2	21
2437	D3	STANDARD	4	3	21
2438	D4	STANDARD	4	4	21
2439	D5	STANDARD	4	5	21
2440	D6	STANDARD	4	6	21
2441	E1	STANDARD	5	1	21
2442	E2	STANDARD	5	2	21
2443	E3	STANDARD	5	3	21
2444	E4	STANDARD	5	4	21
2445	E5	STANDARD	5	5	21
2446	E6	STANDARD	5	6	21
2417	A1	PMR	1	1	21
2418	A2	PMR	1	2	21
2449	A3	STANDARD	1	3	23
2450	A4	STANDARD	1	4	23
2451	A5	STANDARD	1	5	23
2452	A6	STANDARD	1	6	23
2453	A7	STANDARD	1	7	23
2454	A8	STANDARD	1	8	23
2455	A9	STANDARD	1	9	23
2456	A10	STANDARD	1	10	23
2457	A11	STANDARD	1	11	23
2458	A12	STANDARD	1	12	23
2459	A13	STANDARD	1	13	23
2461	B1	STANDARD	2	1	23
2462	B2	STANDARD	2	2	23
2463	B3	STANDARD	2	3	23
2464	B4	STANDARD	2	4	23
2465	B5	STANDARD	2	5	23
2466	B6	STANDARD	2	6	23
2467	B7	STANDARD	2	7	23
2468	B8	STANDARD	2	8	23
2469	B9	STANDARD	2	9	23
2470	B10	STANDARD	2	10	23
2471	B11	STANDARD	2	11	23
2472	B12	STANDARD	2	12	23
2473	B13	STANDARD	2	13	23
2474	B14	STANDARD	2	14	23
2475	C1	STANDARD	3	1	23
2476	C2	STANDARD	3	2	23
2477	C3	STANDARD	3	3	23
2478	C4	STANDARD	3	4	23
2479	C5	STANDARD	3	5	23
2480	C6	STANDARD	3	6	23
2481	C7	STANDARD	3	7	23
2482	C8	STANDARD	3	8	23
2483	C9	STANDARD	3	9	23
2484	C10	STANDARD	3	10	23
2485	C11	STANDARD	3	11	23
2486	C12	STANDARD	3	12	23
2487	C13	STANDARD	3	13	23
2488	C14	STANDARD	3	14	23
2489	D1	STANDARD	4	1	23
2490	D2	STANDARD	4	2	23
2491	D3	STANDARD	4	3	23
2492	D4	STANDARD	4	4	23
2493	D5	STANDARD	4	5	23
2494	D6	STANDARD	4	6	23
2495	D7	STANDARD	4	7	23
2496	D8	STANDARD	4	8	23
2497	D9	STANDARD	4	9	23
2498	D10	STANDARD	4	10	23
2499	D11	STANDARD	4	11	23
2500	D12	STANDARD	4	12	23
2501	D13	STANDARD	4	13	23
2502	D14	STANDARD	4	14	23
2503	E1	STANDARD	5	1	23
2504	E2	STANDARD	5	2	23
2505	E3	STANDARD	5	3	23
2506	E4	STANDARD	5	4	23
2507	E5	STANDARD	5	5	23
2508	E6	STANDARD	5	6	23
2509	E7	STANDARD	5	7	23
2510	E8	STANDARD	5	8	23
2511	E9	STANDARD	5	9	23
2512	E10	STANDARD	5	10	23
2513	E11	STANDARD	5	11	23
2514	E12	STANDARD	5	12	23
2515	E13	STANDARD	5	13	23
2516	E14	STANDARD	5	14	23
2517	F1	STANDARD	6	1	23
2518	F2	STANDARD	6	2	23
2519	F3	STANDARD	6	3	23
2520	F4	STANDARD	6	4	23
2521	F5	STANDARD	6	5	23
2522	F6	STANDARD	6	6	23
2523	F7	STANDARD	6	7	23
2524	F8	STANDARD	6	8	23
2525	F9	STANDARD	6	9	23
2526	F10	STANDARD	6	10	23
2527	F11	STANDARD	6	11	23
2528	F12	STANDARD	6	12	23
2529	F13	STANDARD	6	13	23
2530	F14	STANDARD	6	14	23
2531	G1	STANDARD	7	1	23
2532	G2	STANDARD	7	2	23
2533	G3	STANDARD	7	3	23
2534	G4	STANDARD	7	4	23
2535	G5	STANDARD	7	5	23
2536	G6	STANDARD	7	6	23
2537	G7	STANDARD	7	7	23
2538	G8	STANDARD	7	8	23
2539	G9	STANDARD	7	9	23
2540	G10	STANDARD	7	10	23
2541	G11	STANDARD	7	11	23
2542	G12	STANDARD	7	12	23
2543	G13	STANDARD	7	13	23
2544	G14	STANDARD	7	14	23
2550	A6	STANDARD	1	6	25
2551	A7	STANDARD	1	7	25
2552	B1	STANDARD	2	1	25
2553	B2	STANDARD	2	2	25
2554	B3	STANDARD	2	3	25
2555	B4	STANDARD	2	4	25
2556	B5	STANDARD	2	5	25
2557	B6	STANDARD	2	6	25
2558	B7	STANDARD	2	7	25
2559	C1	STANDARD	3	1	25
2560	C2	STANDARD	3	2	25
2561	C3	STANDARD	3	3	25
2562	C4	STANDARD	3	4	25
2563	C5	STANDARD	3	5	25
2564	C6	STANDARD	3	6	25
2565	C7	STANDARD	3	7	25
2566	D1	STANDARD	4	1	25
2567	D2	STANDARD	4	2	25
2568	D3	STANDARD	4	3	25
2569	D4	STANDARD	4	4	25
2570	D5	STANDARD	4	5	25
2571	D6	STANDARD	4	6	25
2572	D7	STANDARD	4	7	25
2573	E1	STANDARD	5	1	25
2574	E2	STANDARD	5	2	25
2575	E3	STANDARD	5	3	25
2576	E4	STANDARD	5	4	25
2577	E5	STANDARD	5	5	25
2578	E6	STANDARD	5	6	25
2579	E7	STANDARD	5	7	25
2580	F1	STANDARD	6	1	25
2581	F2	STANDARD	6	2	25
2582	F3	STANDARD	6	3	25
2583	F4	STANDARD	6	4	25
2584	F5	STANDARD	6	5	25
2585	F6	STANDARD	6	6	25
2586	F7	STANDARD	6	7	25
2587	G1	STANDARD	7	1	25
2588	G2	STANDARD	7	2	25
2589	G3	STANDARD	7	3	25
2590	G4	STANDARD	7	4	25
2591	G5	STANDARD	7	5	25
2592	G6	STANDARD	7	6	25
2593	G7	STANDARD	7	7	25
2594	H1	STANDARD	8	1	25
2595	H2	STANDARD	8	2	25
2596	H3	STANDARD	8	3	25
2597	H4	STANDARD	8	4	25
2598	H5	STANDARD	8	5	25
2599	H6	STANDARD	8	6	25
2600	H7	STANDARD	8	7	25
2601	I1	STANDARD	9	1	25
2602	I2	STANDARD	9	2	25
2603	I3	STANDARD	9	3	25
2604	I4	STANDARD	9	4	25
2605	I5	STANDARD	9	5	25
2606	I6	STANDARD	9	6	25
2607	I7	STANDARD	9	7	25
2608	J1	STANDARD	10	1	25
2609	J2	STANDARD	10	2	25
2610	J3	STANDARD	10	3	25
2611	J4	STANDARD	10	4	25
2612	J5	STANDARD	10	5	25
2613	J6	STANDARD	10	6	25
2614	J7	STANDARD	10	7	25
2545	A1	PMR	1	1	25
2546	A2	PMR	1	2	25
2547	A3	PMR	1	3	25
2548	A4	PMR	1	4	25
2549	A5	PMR	1	5	25
2738	A4	STANDARD	1	4	28
2739	A5	STANDARD	1	5	28
2740	A6	STANDARD	1	6	28
2741	A7	STANDARD	1	7	28
2742	A8	STANDARD	1	8	28
2743	A9	STANDARD	1	9	28
2744	A10	STANDARD	1	10	28
2745	B1	STANDARD	2	1	28
2746	B2	STANDARD	2	2	28
2747	B3	STANDARD	2	3	28
2748	B4	STANDARD	2	4	28
2749	B5	STANDARD	2	5	28
2750	B6	STANDARD	2	6	28
2751	B7	STANDARD	2	7	28
2752	B8	STANDARD	2	8	28
2753	B9	STANDARD	2	9	28
2754	B10	STANDARD	2	10	28
2755	C1	STANDARD	3	1	28
2756	C2	STANDARD	3	2	28
2757	C3	STANDARD	3	3	28
2758	C4	STANDARD	3	4	28
2759	C5	STANDARD	3	5	28
2760	C6	STANDARD	3	6	28
2761	C7	STANDARD	3	7	28
2762	C8	STANDARD	3	8	28
2763	C9	STANDARD	3	9	28
2764	C10	STANDARD	3	10	28
2765	D1	STANDARD	4	1	28
2766	D2	STANDARD	4	2	28
2767	D3	STANDARD	4	3	28
2768	D4	STANDARD	4	4	28
2769	D5	STANDARD	4	5	28
2770	D6	STANDARD	4	6	28
2771	D7	STANDARD	4	7	28
2772	D8	STANDARD	4	8	28
2773	D9	STANDARD	4	9	28
2774	D10	STANDARD	4	10	28
2775	E1	STANDARD	5	1	28
2776	E2	STANDARD	5	2	28
2777	E3	STANDARD	5	3	28
2778	E4	STANDARD	5	4	28
2779	E5	STANDARD	5	5	28
2780	E6	STANDARD	5	6	28
2781	E7	STANDARD	5	7	28
2782	E8	STANDARD	5	8	28
2783	E9	STANDARD	5	9	28
2784	E10	STANDARD	5	10	28
2785	F1	STANDARD	6	1	28
2786	F2	STANDARD	6	2	28
2787	F3	STANDARD	6	3	28
2788	F4	STANDARD	6	4	28
2789	F5	STANDARD	6	5	28
2790	F6	STANDARD	6	6	28
2791	F7	STANDARD	6	7	28
2792	F8	STANDARD	6	8	28
2793	F9	STANDARD	6	9	28
2794	F10	STANDARD	6	10	28
2735	A1	PMR	1	1	28
2736	A2	PMR	1	2	28
2737	A3	PMR	1	3	28
2797	A3	STANDARD	1	3	27
2798	A4	STANDARD	1	4	27
2799	A5	STANDARD	1	5	27
2800	A6	STANDARD	1	6	27
2801	A7	STANDARD	1	7	27
2802	A8	STANDARD	1	8	27
2803	A9	STANDARD	1	9	27
2805	B1	STANDARD	2	1	27
2806	B2	STANDARD	2	2	27
2807	B3	STANDARD	2	3	27
2808	B4	STANDARD	2	4	27
2809	B5	STANDARD	2	5	27
2810	B6	STANDARD	2	6	27
2811	B7	STANDARD	2	7	27
2812	B8	STANDARD	2	8	27
2813	B9	STANDARD	2	9	27
2814	B10	STANDARD	2	10	27
2815	C1	STANDARD	3	1	27
2816	C2	STANDARD	3	2	27
2817	C3	STANDARD	3	3	27
2818	C4	STANDARD	3	4	27
2819	C5	STANDARD	3	5	27
2820	C6	STANDARD	3	6	27
2821	C7	STANDARD	3	7	27
2822	C8	STANDARD	3	8	27
2823	C9	STANDARD	3	9	27
2824	C10	STANDARD	3	10	27
2825	D1	STANDARD	4	1	27
2826	D2	STANDARD	4	2	27
2827	D3	STANDARD	4	3	27
2828	D4	STANDARD	4	4	27
2829	D5	STANDARD	4	5	27
2830	D6	STANDARD	4	6	27
2831	D7	STANDARD	4	7	27
2832	D8	STANDARD	4	8	27
2833	D9	STANDARD	4	9	27
2834	D10	STANDARD	4	10	27
2835	E1	STANDARD	5	1	27
2836	E2	STANDARD	5	2	27
2837	E3	STANDARD	5	3	27
2838	E4	STANDARD	5	4	27
2839	E5	STANDARD	5	5	27
2840	E6	STANDARD	5	6	27
2841	E7	STANDARD	5	7	27
2842	E8	STANDARD	5	8	27
2843	E9	STANDARD	5	9	27
2844	E10	STANDARD	5	10	27
2795	A1	PMR	1	1	27
2796	A2	PMR	1	2	27
2804	A10	PMR	1	10	27
\.


--
-- Data for Name: reservation_siege; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation_siege (id_reservation, id_siege) FROM stdin;
1	2070
2	2082
2	2089
2	2134
2	2078
2	2111
2	2122
3	2146
3	2080
3	2069
3	2098
4	2133
4	2125
5	2105
5	2066
5	2076
6	2118
7	2087
7	2097
7	2071
8	2075
8	2131
9	2124
9	2141
9	2128
9	2065
9	2074
10	2077
10	2064
10	2119
10	2142
11	2099
12	2129
12	2102
13	2091
14	924
14	860
14	899
14	892
15	902
15	934
15	868
15	926
16	864
16	940
16	927
16	883
17	948
17	914
17	930
18	921
18	922
19	954
20	861
20	952
20	888
21	879
21	915
21	891
21	896
22	913
22	850
22	874
22	916
23	889
24	904
24	911
24	957
24	880
24	935
24	881
25	877
25	859
25	854
25	890
25	851
26	939
26	857
27	897
28	865
29	947
29	848
30	853
30	912
31	936
31	878
31	861
32	952
32	916
33	923
33	917
33	901
33	862
33	942
34	904
35	943
35	930
36	955
36	860
36	855
37	954
38	941
38	870
38	857
38	957
38	918
38	854
39	900
40	933
40	896
40	934
40	902
41	903
41	895
41	863
41	905
41	949
42	925
42	859
42	906
43	884
43	907
43	929
44	963
44	976
45	986
45	983
45	965
45	1026
45	964
46	984
46	1040
46	1028
46	1037
46	972
47	1022
48	1047
48	1046
48	1038
48	1001
49	1018
50	958
50	1011
51	1049
51	1045
51	1039
51	987
51	1012
52	988
52	961
52	1027
52	1015
52	1029
52	1034
53	982
53	1025
53	1043
54	1008
54	970
55	970
55	1027
55	980
55	976
56	978
56	985
56	1017
56	1011
56	992
56	994
57	1039
58	1038
59	967
59	1036
59	1014
59	1035
59	1040
60	999
60	1041
60	1029
61	984
62	1020
62	973
62	1023
62	972
63	986
63	1005
64	971
65	1016
65	963
65	1021
65	1002
65	995
65	1043
66	959
66	1001
67	804
68	832
68	777
68	759
68	807
68	841
69	775
69	779
70	838
70	792
70	795
70	762
70	797
71	783
72	782
72	801
72	822
72	842
72	763
72	813
73	833
73	845
73	789
73	765
73	823
74	781
74	816
75	757
75	843
75	825
75	826
75	815
76	772
76	802
76	766
77	1093
77	1065
77	1100
77	1115
77	1090
77	1142
78	1079
78	1161
78	1134
78	1126
78	1099
78	1089
79	1058
80	1066
81	1125
81	1160
82	1154
82	1071
82	1124
83	1076
83	1149
83	1063
83	1153
84	1069
84	1158
84	1091
84	1083
85	1072
85	1064
85	1108
86	1051
86	1145
86	1082
86	1132
86	1163
87	1111
88	1074
88	1136
89	1112
89	1070
90	1109
90	1061
90	1054
90	1133
90	1085
90	1157
91	696
91	750
92	675
92	676
92	722
92	747
92	691
92	716
93	699
93	753
93	681
93	710
93	687
93	719
94	744
94	680
94	755
94	682
95	694
95	712
95	739
95	701
95	731
95	692
96	724
97	743
97	729
98	754
98	705
99	686
100	732
100	740
101	1261
101	1236
101	1202
101	1196
102	1269
102	1252
102	1208
102	1201
102	1209
103	1177
103	1187
104	1198
104	1222
104	1234
104	1274
105	1213
105	1275
105	1219
105	1210
105	1179
105	1258
106	1273
107	1192
108	1259
108	1224
108	1256
109	1180
109	1175
109	1218
109	1195
109	1189
110	1229
110	1231
110	1215
111	1170
111	1250
111	1272
112	1216
112	1253
112	1171
112	1267
113	1193
113	1232
114	1247
115	1178
115	1247
115	1193
115	1273
115	1165
115	1231
116	1250
116	1179
116	1265
117	1203
117	1270
117	1196
117	1198
118	1199
118	1261
119	1262
119	1264
119	1252
120	1275
120	1214
120	1222
120	1173
120	1191
121	1218
122	1171
123	1175
124	1263
124	1166
124	1213
124	1206
124	1169
125	1167
125	1251
126	1195
126	1211
126	1197
126	1204
126	1226
126	1172
127	1190
127	1260
127	1272
127	1201
127	1237
128	1334
128	1383
128	1343
128	1342
128	1303
128	1284
129	1434
129	1333
129	1375
129	1338
129	1279
130	1387
130	1282
130	1371
130	1404
131	1391
132	1299
132	1301
132	1428
132	1365
132	1425
132	1372
133	1435
134	1353
134	1363
134	1420
134	1423
134	1277
134	1367
135	1405
136	1395
136	1381
137	1409
137	1417
137	1317
137	1291
137	1325
138	1430
138	1364
138	1356
138	1330
139	1380
139	1313
139	1323
139	1331
140	1320
141	1411
141	1292
141	1394
141	1290
141	1378
142	1412
142	1373
142	1326
142	1407
142	1418
142	1368
143	1382
143	1352
143	1310
143	1344
144	1436
144	1416
144	1286
145	1393
145	1433
146	195
146	273
146	228
146	269
147	267
148	256
148	197
149	156
149	193
149	253
149	168
149	260
149	264
150	248
150	148
150	212
151	289
151	160
151	110
152	182
152	191
152	261
152	143
152	157
153	158
153	179
154	287
154	150
154	135
154	276
154	167
154	227
155	257
155	140
155	274
156	166
156	268
156	187
156	229
156	129
157	114
158	245
159	204
160	244
160	183
161	169
162	174
162	120
162	239
162	242
162	210
163	216
163	122
163	206
163	139
163	123
164	236
165	284
165	176
165	271
165	109
165	192
166	133
167	234
167	145
167	263
168	281
168	218
169	270
169	280
169	147
169	117
169	215
170	513
171	455
171	434
171	505
171	457
171	529
172	485
172	430
172	488
173	443
173	462
173	491
173	542
174	458
174	438
174	445
174	437
174	544
174	524
175	532
175	498
175	439
175	435
175	519
176	515
176	475
177	507
177	465
178	533
178	448
178	496
179	470
179	539
179	516
179	530
179	479
180	482
180	528
180	541
180	468
180	433
181	508
181	495
181	502
181	472
181	526
181	431
182	471
182	436
182	425
183	981
183	1012
183	986
183	974
184	1028
184	978
185	977
185	961
185	1014
185	1025
186	1002
187	1042
187	1005
188	1015
188	976
189	1010
189	968
190	1027
190	1034
190	970
190	1047
190	1009
190	1018
191	1020
191	989
191	1046
191	963
191	1004
192	967
192	1029
192	1049
192	1016
192	993
192	1040
193	1045
194	1044
195	1814
196	1851
196	1820
196	1815
197	1826
197	1849
197	1821
197	1812
197	1802
198	1816
198	1840
198	1842
199	1807
199	1823
199	1831
200	1818
200	1838
201	1808
201	1824
202	1844
203	1819
204	1996
204	2056
204	1957
204	1969
204	2031
204	2008
205	1946
205	2050
205	2036
206	1952
206	2001
206	1944
206	1974
206	2041
207	1989
207	1953
207	2045
208	1972
209	2038
209	1987
209	1986
209	1971
209	2052
209	2040
210	2012
210	2033
211	2004
211	1982
212	2049
212	1979
212	2011
212	2007
213	2016
213	2014
214	2026
214	1954
214	1939
214	2058
214	2055
214	1975
215	1943
215	2039
216	1951
217	1981
217	1950
217	2023
218	2035
218	1956
219	1062
219	1122
220	1067
220	1104
220	1064
220	1153
221	1145
222	1073
222	1079
223	1148
223	1065
223	1057
223	1099
223	1086
224	1085
224	1150
224	1146
225	1120
226	1055
226	1108
226	1095
226	1134
227	1130
227	1096
227	1052
227	1157
227	1151
227	1053
228	1063
228	1105
228	1160
228	1100
228	1074
228	1094
229	1124
230	1133
230	1142
231	1112
231	1132
232	1101
232	1068
232	1147
232	1056
232	1115
232	1136
233	1155
234	1715
235	1662
235	1796
235	1793
235	1649
235	1780
236	1702
237	1788
237	1650
237	1679
237	1637
237	1629
238	1612
239	1652
240	1701
240	1745
240	1700
240	1740
240	1797
240	1623
241	1638
241	1672
242	1767
242	1641
242	1693
242	1713
242	1711
242	1772
243	1748
243	1778
243	1622
244	1627
245	1665
245	1734
245	1695
245	1784
246	1682
247	1749
247	1714
248	1785
248	1759
248	1613
248	1699
248	1741
248	1758
249	1718
249	1733
249	1790
249	1625
249	1777
249	1712
250	1640
250	1651
250	1630
250	1692
251	1619
251	1739
251	1642
251	1720
251	1616
251	1750
252	1626
253	1704
253	1639
253	1722
253	1670
253	1686
253	1787
254	1721
254	1708
254	1782
255	1643
255	1773
255	1609
256	1687
256	1684
256	1716
257	1125
257	1157
257	1146
257	1115
257	1162
257	1161
258	1133
258	1108
259	1144
259	1124
260	1101
261	1083
261	1100
261	1088
261	1056
261	1147
262	1135
262	1094
263	1137
263	1064
264	1077
264	1120
265	1086
265	1090
265	1091
265	1074
266	1164
266	1095
267	1106
267	1075
267	1081
268	1127
268	1082
268	1149
268	1079
268	1080
268	1096
269	1159
269	1148
269	1138
269	1057
269	1097
270	1154
270	1123
270	1114
271	1139
272	900
273	952
273	929
274	890
275	939
275	857
275	862
276	901
276	937
276	899
277	872
277	863
278	940
278	847
278	858
278	894
278	893
278	875
279	850
279	945
279	931
279	910
280	874
280	852
280	886
281	913
281	906
281	869
281	933
281	873
281	898
282	902
282	916
282	864
282	853
283	861
283	920
284	918
285	923
285	934
285	879
285	941
285	854
285	856
286	657
287	656
287	596
287	645
287	650
288	568
288	671
288	597
288	574
289	610
289	636
289	582
289	655
289	644
290	668
290	560
290	554
290	651
290	617
290	575
291	673
291	631
291	624
291	642
292	620
293	581
293	579
293	646
294	653
294	577
295	662
295	615
296	585
297	648
297	571
297	593
297	639
297	592
297	605
298	649
298	594
298	622
298	552
299	663
299	640
299	589
299	559
299	553
300	570
300	638
301	1463
301	1514
302	1590
302	1585
303	1466
303	1471
303	1537
303	1498
304	1579
304	1510
305	1591
305	1583
305	1601
306	1456
306	1478
306	1508
306	1604
306	1528
306	1553
307	1488
308	1551
308	1600
308	1554
308	1530
309	1581
309	1543
309	1444
309	1500
309	1542
310	1582
310	1580
310	1487
310	1526
310	1588
311	1461
311	1454
311	1570
312	1533
312	1527
312	1558
312	1497
312	1502
313	1563
313	1541
313	1539
313	1575
313	1593
314	1516
314	1520
315	1534
315	1495
316	1462
316	1445
316	1513
316	1518
317	1592
317	1574
317	1449
317	1446
317	1501
318	1457
318	1489
318	1602
318	1485
319	1521
320	1663
320	1700
320	1749
320	1716
321	1691
321	1728
321	1623
321	1751
321	1657
321	1754
322	1635
322	1665
322	1715
322	1775
322	1711
323	1769
323	1778
324	1651
324	1719
324	1704
325	1633
325	1649
325	1687
326	1627
326	1694
326	1638
326	1788
326	1739
326	1619
327	1653
327	1755
327	1760
328	1744
328	1695
329	1750
329	1676
329	1625
330	1783
330	1610
330	1655
330	1790
330	1721
331	1709
332	1683
332	1606
332	1756
333	1685
333	1696
334	1781
334	1736
334	1677
334	1796
334	1670
335	1777
335	1675
335	1729
336	1789
336	1605
336	1701
336	1650
336	1712
336	1776
337	1707
337	1798
338	1648
339	1608
339	1703
339	1702
339	1792
339	1697
340	1686
341	1771
341	1674
341	1774
341	1720
341	1761
342	1741
343	978
344	1035
344	984
344	988
344	976
344	1031
344	963
345	1026
345	964
345	990
345	1043
346	989
347	977
347	1015
347	996
347	1030
347	985
347	995
348	1049
348	992
348	1028
348	1044
348	1022
349	1036
350	993
350	1045
350	1005
351	1040
351	1042
351	970
351	1018
351	1010
351	1003
352	1047
352	960
353	1012
354	648
354	572
354	555
354	607
355	593
355	631
355	664
355	556
355	662
356	586
356	615
356	628
356	576
357	651
357	619
358	625
358	603
358	627
358	658
358	639
358	670
359	616
359	613
359	609
360	559
360	660
360	561
360	611
360	595
361	549
361	652
362	629
362	585
362	571
362	641
363	643
363	584
364	560
364	659
364	602
364	655
365	618
365	566
365	558
365	635
365	587
366	598
366	657
366	581
366	588
367	1885
367	1881
367	1907
368	1913
368	1868
368	1916
369	1920
369	1925
369	1892
369	1871
369	1930
370	1910
370	1937
370	1890
371	1936
371	1897
371	1872
371	1867
371	1918
371	1861
372	1899
372	1891
373	1862
373	1931
373	1938
373	1873
373	1917
374	1896
374	1895
374	1906
374	1912
374	1933
374	1865
375	1857
376	1060
376	1133
377	1135
377	1074
377	1093
378	1123
378	1142
378	1097
378	1080
379	1150
380	1118
380	1073
380	1087
381	1067
381	1158
381	1115
381	1059
382	1078
382	1066
382	1117
382	1100
383	1147
383	1113
383	1128
384	1063
384	1096
385	1107
385	1159
385	1131
385	1137
385	1139
385	1086
386	1126
387	1098
387	1057
388	1101
389	1132
390	1153
391	1140
391	1052
391	1108
391	1061
391	1054
392	1064
393	1068
394	1102
395	865
395	897
395	951
395	922
395	902
395	876
396	925
396	895
396	948
396	954
396	863
396	921
397	930
397	905
397	866
397	898
398	847
398	846
399	881
399	859
399	848
399	949
399	919
399	932
400	887
401	880
401	934
401	892
402	852
402	911
402	893
402	929
402	927
403	861
403	884
403	936
404	864
404	909
404	914
404	950
404	947
405	923
405	935
406	857
407	1830
408	1807
408	1815
408	1824
408	1828
408	1827
408	1843
409	1821
409	1816
409	1844
409	1848
409	1849
409	1817
410	1809
411	1837
411	1826
412	1818
412	1846
413	1831
414	1812
415	1799
416	466
417	425
417	442
417	481
417	441
417	492
418	478
419	531
419	489
419	483
419	496
419	497
419	465
420	448
420	509
420	487
420	520
420	459
420	452
421	533
422	495
423	476
424	437
424	514
425	453
425	422
425	505
425	518
425	511
426	502
426	539
426	503
426	464
426	467
427	470
427	460
428	426
429	498
429	516
429	450
430	524
430	529
430	527
430	519
431	506
431	499
432	469
432	444
433	490
433	454
434	338
435	346
435	294
435	344
435	319
435	334
436	301
436	351
437	335
437	343
437	327
437	306
437	308
438	336
438	292
439	317
439	304
439	330
440	349
440	339
440	307
440	347
441	302
442	332
443	377
444	376
444	403
444	374
445	368
445	356
445	392
445	352
445	365
445	361
446	369
446	384
447	382
447	358
448	370
448	379
448	383
449	371
449	386
449	417
449	412
449	389
450	364
450	420
450	418
451	413
452	402
453	359
454	1964
454	2040
455	2038
455	1979
455	2009
455	1965
455	2034
455	2051
456	1981
456	2019
456	1966
456	1970
457	2044
457	1941
457	2018
457	2045
457	2002
458	1943
458	2029
458	1946
458	1961
459	1955
459	1997
460	1982
460	1985
460	1994
460	2053
460	1954
460	1991
461	2026
461	1986
461	1992
461	2015
462	1944
462	2023
463	2048
463	1973
463	1969
463	1990
464	1958
464	2028
464	2042
465	1962
465	2033
466	1942
466	1977
466	2054
467	2013
468	364
468	358
468	391
468	385
468	395
468	373
469	417
469	383
469	355
469	353
470	421
470	360
470	413
470	406
470	359
470	404
471	388
471	387
471	354
472	389
472	418
472	403
473	352
474	366
475	371
475	370
475	398
476	409
477	1060
477	1140
477	1088
477	1102
477	1148
477	1086
478	1134
479	1081
479	1063
479	1109
479	1085
479	1076
480	1115
480	1108
480	1050
480	1122
481	1147
481	1153
481	1072
481	1073
482	1091
482	1071
482	1137
482	1133
482	1069
483	1158
484	1056
484	1164
484	1159
485	1118
485	1162
485	1144
485	1160
486	1161
486	1116
486	1079
486	1143
486	1146
486	1100
487	1107
488	1124
488	1062
488	1152
488	1055
488	1110
488	1112
489	229
490	118
490	113
490	224
490	240
490	191
491	243
491	133
491	153
491	277
492	274
492	207
492	238
493	112
494	222
494	141
494	271
494	260
494	270
494	181
495	137
495	228
495	231
496	197
496	148
496	253
496	178
496	170
497	257
498	149
498	177
498	155
499	201
499	172
499	287
500	184
500	211
501	136
501	156
502	121
502	250
502	119
502	110
502	167
502	176
503	214
503	227
503	179
503	202
503	209
503	173
504	125
505	132
505	218
505	129
505	128
506	249
506	281
506	111
507	221
507	219
507	264
507	290
508	189
508	245
508	190
509	144
510	183
510	216
511	127
512	255
512	126
512	276
513	857
513	956
513	955
513	887
513	884
513	917
514	946
515	897
515	855
515	865
515	947
515	923
516	867
516	920
517	859
517	925
517	864
517	862
517	892
517	879
518	941
518	926
518	916
518	935
518	877
519	928
519	853
519	905
519	868
520	919
520	912
520	903
521	927
521	933
521	911
521	872
521	924
522	950
522	940
522	944
522	901
522	910
522	929
523	846
524	2006
524	2001
524	1986
524	1965
525	2052
525	2023
525	2057
525	1975
525	1947
526	2020
526	2025
526	2038
526	1989
526	2035
526	2036
527	2056
528	1966
528	1984
528	1963
528	1953
529	2042
529	1992
529	1998
529	2058
529	1960
529	2018
530	2031
531	1939
531	1956
531	2013
532	2012
532	2021
532	1940
532	1970
532	1962
533	2009
533	2027
533	2022
533	2045
533	1977
533	1955
534	1991
535	1979
535	1995
535	1959
535	1990
536	1969
536	2029
537	762
538	775
538	832
538	787
538	818
539	796
539	815
539	808
539	758
539	791
539	802
540	801
540	823
540	760
540	841
541	839
541	761
541	835
541	757
542	759
542	845
543	774
544	840
544	767
544	844
545	833
545	776
545	781
546	770
546	827
546	763
546	805
546	798
547	822
547	807
548	1032
548	968
548	1038
548	1031
548	964
549	973
549	1016
549	985
550	993
551	1002
551	960
551	986
551	1033
551	1018
551	976
552	965
552	999
552	1036
552	1034
553	1001
553	1014
553	1011
553	980
553	1041
553	982
554	1007
554	992
554	1029
554	1049
554	998
554	1035
555	1020
555	1046
555	988
555	987
556	963
557	1117
557	1078
557	1141
557	1100
557	1093
557	1080
558	1146
558	1056
558	1053
559	1142
559	1150
559	1153
559	1113
560	1139
560	1051
560	1103
561	1073
561	1074
561	1055
562	1149
562	1158
562	1075
563	1115
563	1082
563	1098
563	1062
564	1085
564	1101
565	1126
566	1123
567	1161
567	1129
567	1145
568	1119
569	1162
569	1156
570	1079
571	1104
571	1116
571	1089
571	1063
572	1068
572	1110
573	1065
574	1058
574	1124
575	110
575	271
575	208
575	246
575	137
575	187
576	207
576	262
576	188
576	132
577	226
577	153
577	182
577	163
578	239
578	191
578	277
578	179
578	243
578	216
579	138
579	267
579	183
580	241
580	127
581	210
581	248
581	235
582	275
582	161
582	171
582	140
582	144
583	113
583	121
583	150
583	130
584	265
584	112
584	128
585	170
585	278
586	174
586	131
586	233
587	148
587	214
588	122
588	166
588	194
588	160
588	230
588	184
589	169
589	185
589	229
589	257
590	287
590	143
590	220
590	193
590	286
590	240
591	259
592	245
592	227
592	276
592	165
592	180
592	280
593	120
593	175
594	236
595	2075
595	2098
596	2105
596	2092
596	2089
596	2113
597	2146
597	2128
598	2117
598	2067
598	2082
599	2138
599	2080
599	2123
599	2135
599	2101
599	2131
600	2124
600	2096
600	2069
601	2104
601	2079
602	2077
602	2066
602	2126
603	2121
603	2106
603	2115
603	2143
604	2119
605	2112
606	2114
606	2139
606	2090
607	2095
608	53
608	47
609	32
609	10
609	18
609	77
609	35
610	45
611	56
611	15
611	62
611	90
611	17
612	27
612	105
612	67
612	42
612	14
612	51
613	86
613	48
614	106
614	57
614	5
614	96
615	37
615	46
615	49
615	79
616	61
616	23
616	60
616	28
616	16
617	65
617	34
617	39
617	81
617	103
617	71
618	73
619	41
620	8
620	103
620	43
621	76
621	90
622	69
623	22
623	92
623	70
623	61
623	101
623	48
624	86
624	75
624	99
624	84
624	66
625	56
625	97
625	9
626	83
626	96
626	17
626	64
626	4
626	87
627	38
627	42
628	50
628	46
629	71
629	49
629	68
629	94
629	93
630	26
630	21
631	37
631	85
631	74
632	67
633	15
634	1952
634	2013
634	2054
634	1963
635	1980
635	1962
635	1981
635	1996
635	2000
635	1991
636	2050
636	2012
636	1955
637	1945
637	1965
637	2016
637	1947
637	2038
638	2053
638	1988
638	1949
638	2040
638	1957
638	1964
639	1978
639	1979
639	2056
639	2034
639	2028
640	1961
640	2058
640	1977
640	2037
640	2047
641	2029
641	1953
641	1990
642	2017
643	1939
644	2052
644	1968
645	1975
645	1943
645	1958
645	2021
646	1950
646	1995
646	1986
647	347
647	312
647	302
647	306
648	338
649	324
649	296
649	321
650	307
650	342
650	344
650	341
650	313
650	295
651	328
651	335
651	308
652	345
652	298
653	331
653	294
653	309
653	330
654	336
655	1809
655	1802
655	1842
655	1833
655	1848
655	1807
656	1844
656	1841
656	1838
656	1850
656	1815
657	1836
657	1812
657	1808
657	1800
657	1831
658	1832
658	1814
659	1835
660	1805
661	1846
662	1654
662	1641
662	1677
662	1778
662	1611
662	1723
663	1721
663	1753
663	1711
663	1631
663	1707
664	1682
664	1742
664	1790
665	1766
665	1796
665	1758
666	1754
666	1716
666	1729
666	1694
666	1628
667	1797
667	1661
667	1696
667	1647
667	1791
667	1678
668	1774
668	1639
668	1652
668	1671
668	1798
669	1613
669	1700
670	1784
670	1720
670	1748
671	1712
672	1786
672	1674
673	1792
673	1667
673	1760
674	1683
674	1629
675	1608
676	1640
676	1735
676	1773
676	1624
677	1772
677	1715
677	1622
677	1788
677	1757
678	1666
678	1789
678	1709
678	1764
679	1693
680	1664
680	1636
680	1686
680	1668
681	1634
681	1763
682	1746
682	1688
682	1704
682	1605
682	1625
683	1730
683	1689
684	1779
685	1679
685	1708
686	1579
686	1456
686	1519
687	1461
688	1491
688	1549
688	1469
688	1457
688	1485
689	1443
689	1531
689	1476
689	1589
690	1594
690	1573
690	1507
690	1497
690	1513
691	1582
691	1477
691	1486
691	1541
692	1482
692	1460
692	1530
693	1474
693	1575
693	1551
694	1603
694	1512
695	1565
695	1537
696	1488
696	1494
696	1466
696	1498
697	1536
697	1526
697	1552
698	1567
698	1445
698	1501
698	1490
698	1525
699	1448
699	1464
699	1465
699	1451
700	1580
700	1471
700	1571
700	1473
700	1538
701	1548
702	1509
702	1458
702	1566
702	1496
703	1520
703	1452
703	1450
703	1543
703	1587
703	1502
704	1462
705	957
705	924
706	952
706	925
707	918
707	862
707	891
708	882
708	939
708	932
708	919
709	849
710	956
711	953
711	876
711	903
711	911
711	947
712	879
712	898
712	866
713	871
713	901
713	907
713	921
713	900
713	897
714	940
714	946
715	869
716	899
716	910
717	877
718	923
718	886
718	850
719	934
719	896
719	922
719	848
719	858
719	874
720	937
721	917
722	1450
722	1593
723	1566
723	1531
724	1570
724	1471
725	1602
725	1549
726	1535
727	1576
727	1555
728	1495
728	1567
728	1589
729	1465
730	1505
730	1489
730	1557
730	1503
731	1594
731	1546
731	1448
732	1551
732	1453
732	1588
732	1539
732	1520
733	1485
733	1496
733	1584
734	1499
734	1542
735	1514
736	1454
736	1600
737	1568
737	1510
737	1527
737	1490
737	1532
738	1474
738	1445
738	1603
738	1524
738	1585
739	1601
740	1466
740	1500
740	1599
740	1457
740	1595
740	1550
741	1452
741	1493
741	1463
741	1534
741	1449
742	1442
742	1491
742	1456
743	1581
743	1533
744	1598
744	1521
745	1583
746	968
746	1049
747	1021
747	1016
747	1023
747	977
748	988
749	1030
750	1032
751	1007
751	1040
751	991
751	978
751	1022
751	1036
752	1047
752	1014
752	1012
753	1031
753	963
753	972
753	1039
754	993
754	980
754	1029
755	973
755	983
755	1045
755	1020
755	1024
756	1015
756	1044
756	958
756	1001
757	1011
757	1019
758	746
758	689
759	731
759	702
760	750
761	748
761	687
761	717
762	756
762	753
762	677
762	738
763	695
763	682
763	706
763	714
764	686
764	718
764	712
764	693
764	749
765	711
766	740
766	685
766	720
766	700
767	709
767	752
767	730
767	727
767	723
768	732
769	873
769	908
769	872
769	936
770	948
770	894
770	864
770	912
770	930
771	900
771	846
771	861
771	896
771	954
771	887
772	862
772	902
773	891
773	939
773	926
773	923
773	855
774	940
774	876
774	942
774	854
774	847
774	928
775	867
775	919
775	889
775	892
775	955
775	953
776	937
776	916
776	870
776	934
776	945
777	871
777	858
777	890
778	881
778	850
779	584
779	591
779	555
780	672
780	612
780	586
781	573
782	597
782	559
782	607
782	606
782	592
782	590
783	662
783	608
783	659
783	622
784	562
784	561
784	560
784	644
784	667
785	550
785	632
785	647
785	553
785	620
786	585
786	583
787	626
787	552
787	563
788	638
788	657
789	629
790	605
790	619
790	588
790	639
790	567
790	571
791	666
792	645
792	633
792	660
793	649
793	568
793	548
793	574
793	627
794	1328
794	1410
794	1359
795	1330
795	1292
795	1384
795	1386
796	1351
796	1367
796	1381
796	1286
797	1426
797	1332
797	1364
798	1412
798	1363
798	1287
799	1336
799	1303
799	1431
800	1312
800	1406
801	1304
801	1435
801	1296
802	1440
802	1344
802	1321
803	1419
803	1305
804	1408
804	1392
805	1402
805	1374
806	1345
807	1306
807	1317
807	1282
807	1324
808	1421
808	1347
808	1382
808	1327
808	1315
809	1361
809	1326
809	1297
809	1418
809	1290
809	1323
810	1346
810	1438
810	1339
811	1341
811	1404
811	1338
811	1375
811	1420
812	1377
812	1353
813	1379
813	1360
813	1334
813	1391
813	1366
813	1343
814	2102
814	2101
815	2066
815	2146
815	2074
815	2128
816	2079
816	2080
817	2137
818	2103
818	2062
818	2134
818	2123
818	2077
818	2098
819	2126
819	2144
819	2105
819	2082
819	2100
820	2130
820	2110
820	2135
820	2114
820	2086
820	2119
821	2095
821	2084
821	2142
822	2125
822	2131
823	2108
823	2071
824	2116
824	2060
825	206
825	234
826	185
826	196
826	179
827	290
827	275
827	282
827	117
828	279
829	255
829	164
829	118
829	160
830	123
830	161
831	248
831	287
832	153
832	258
832	257
832	166
832	284
833	140
834	132
834	127
834	264
834	187
834	163
835	259
835	139
836	281
837	214
837	158
837	237
837	219
838	220
838	113
838	135
838	182
838	180
839	245
839	243
839	215
839	263
840	274
841	112
841	141
841	224
842	210
842	236
842	167
842	138
842	240
843	204
843	213
843	260
843	247
844	286
844	154
845	194
845	191
845	130
845	188
845	119
846	131
846	250
846	151
846	176
847	108
847	199
848	232
848	253
57	8
57	9
853	8
853	9
855	1803
855	1814
855	1820
855	1838
855	1835
856	114
857	1832
857	1845
858	2022
858	2023
859	480
859	493
860	1944
861	1277
862	1607
862	1609
862	1611
863	557
864	550
865	551
866	449
866	471
867	2181
867	2185
868	2456
869	764
870	2450
870	2451
870	2462
870	2463
870	2464
871	942
872	2539
873	427
873	428
874	2538
875	299
876	545
877	1135
878	208
878	220
879	906
880	1580
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (sid, sess, expire) FROM stdin;
uHf-cbqcloWKzXuvZlQ017Iyi6wRuAgT	{"cookie":{"originalMaxAge":604800000,"expires":"2025-12-09T10:43:39.636Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"flash":{}}	2025-12-09 14:21:27
VxIrP3MEe3YAaudhvRWOFsI-Cj4Hg8d3	{"cookie":{"originalMaxAge":604800000,"expires":"2025-12-03T09:55:01.927Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"flash":{}}	2025-12-03 10:55:10
\.


--
-- Name: cinema_id_cinema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_id_cinema_seq', 7, true);


--
-- Name: employe_id_employe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employe_id_employe_seq', 11, true);


--
-- Name: film_id_film_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_id_film_seq', 27, true);


--
-- Name: note_id_note_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.note_id_note_seq', 305, true);


--
-- Name: reservation_id_reservation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_reservation_seq', 880, true);


--
-- Name: salle_id_salle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salle_id_salle_seq', 30, true);


--
-- Name: seance_id_seance_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seance_id_seance_seq', 68, true);


--
-- Name: siege_id_siege_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siege_id_siege_seq', 2844, true);


--
-- Name: utilisateur_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_user_seq', 19, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 6wP8XGG8HL4HWKv9nmoEfePFTiYRS6sKFyrXK1FkiKfVgPegw2dap6gIEVgRkIa

