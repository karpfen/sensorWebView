CREATE TABLE public.observation
(
  id integer NOT NULL,
  geom geometry,
  "timestamp" timestamp without time zone,
  heartrate integer DEFAULT 0,
  CONSTRAINT observations_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
