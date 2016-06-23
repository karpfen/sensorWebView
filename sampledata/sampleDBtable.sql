CREATE SEQUENCE public.sampledata_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE TABLE public.sampledata
(
  id integer NOT NULL DEFAULT nextval('sampledata_id_seq'::regclass),
  geom geometry,
  heartrate integer DEFAULT 0,
  "timestamp" timestamp without time zone,
  CONSTRAINT sampledata_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

INSERT INTO sampledata (geom, heartrate, timestamp) VALUES
((select st_geometryfromtext('Point(0.20182958 0.4920306)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:43', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.88937694 0.8082764)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:18', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.7870202 0.4920467)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:37', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.73253554 0.47588626)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:25', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.6624652 0.69314796)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:22', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.15017493 0.79694444)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:19', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.48150814 0.33039355)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:50', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.64671093 0.47087905)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:33', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.58516663 0.52410907)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:36', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.033571556 0.49835905)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:34', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.2579999 0.88733494)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:31', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.8047947 0.10429149)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:27', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.9439545 0.06934687)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:48', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.6288676 0.28840372)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:13', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.35838845 0.70798963)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:52', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.66073257 0.46325415)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:51', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.76752967 0.18862101)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:55', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.38405234 0.07820914)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:39', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.20250916 0.13816483)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:44', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.4492038 0.20205414)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:16', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.5015473 0.5404189)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:20', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.18896285 0.9974523)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:58', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.84746444 0.9865137)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:29', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.055250008 0.16527317)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:49', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.70191634 0.7873113)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:26', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.43228406 0.36061558)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:10', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.59296024 0.30948865)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:22', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.121583514 0.42674375)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:25', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.24598327 0.96284586)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:32', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.16187385 0.9966196)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:27', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.76375276 0.19369432)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:30', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.613393 0.55960083)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:22', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.460373 0.730539)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:27', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.994502 0.76540774)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:53', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.084091045 0.20809431)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:14', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.37394166 0.36774486)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:19', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.3699248 0.36025378)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:35', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.78144175 0.42197412)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:49', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.5365813 0.84012884)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:53', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.8614789 0.8178214)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:58', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.671574 0.68572533)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:18', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.24045473 0.91899145)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:47', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.1691876 0.7151506)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:38', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.25896335 0.513362)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:58', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.030195285 0.08922606)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:23', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.812562 0.76360804)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:21', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.9791229 0.727689)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:14', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.4928211 0.74901927)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:12', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.8803367 0.68533546)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:33', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.8935945 0.16214918)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:47', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.76117206 0.38590333)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:34', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.38544142 0.97286844)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:19', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.098438054 0.34550855)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:38', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.32586873 0.39837)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:37', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.66053015 0.6871875)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:37', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.19833583 0.36853787)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:35', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.6845414 0.018612467)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:52', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.61443454 0.19657294)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:46', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.11652531 0.70324117)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:58', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.19886562 0.24646747)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:31', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.9606647 0.95982707)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:15', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.7551941 0.7203155)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:34', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.92363787 0.7570225)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:16', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.6031682 0.0048859674)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:27', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.7549251 0.98128295)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:45', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.8287912 0.35059908)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:30', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.27001262 0.62184983)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:38', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.31138915 0.58613515)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:20', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.596161 0.68253547)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:55', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.62452334 0.47434312)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:34', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.8412042 0.5645213)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:20', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.25855428 0.6127588)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:46', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.09321711 0.8074519)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:55', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.5126302 0.19461323)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:27', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.39818147 0.28967327)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:54', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.95539135 0.7403132)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:28', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.41621986 0.40631267)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:58', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.58116204 0.1484856)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:29', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.6536574 0.9216989)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:34', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.8881389 0.21014473)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:49', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.13408595 0.35790703)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:56', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.69523585 0.48659468)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:55', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.77959996 0.08340095)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:27', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.88485533 0.12542044)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:25', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.5931691 0.026128115)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:57', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.62183636 0.53032446)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:14', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.48131785 0.8971534)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:39', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.33796802 0.60748416)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:54', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.5463659 0.3890498)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:46', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.69242156 0.6782684)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:19', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.26980475 0.3446996)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:10', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.29877952 0.7171523)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:21', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.86016405 0.8856939)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:11', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.648444 0.7829967)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:22', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.35406426 0.875814)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:19', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.92937374 0.8468511)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:15', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.83903223 0.4766733)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:33', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.33150053 0.46233392)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:21', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.45892727 0.4539084)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:18', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone)),
((select st_geometryfromtext('Point(0.61084133 0.20453621)')),(SELECT (100*random())::integer),(select to_timestamp('01/01/2000 00:00:46', 'DD/MM/YYYY hh24:mi:ss')::timestamp without time zone));