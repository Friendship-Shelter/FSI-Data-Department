CREATE TABLE scc.bnl

    (eid integer NOT NULL PRIMARY KEY,
    uid text NOT NULL,
    pid integer NOT NULL,
    cname text,
	fname text,
	lname text,
	dob date,
    start_date date NOT NULL,
    exit_date date,
    hoh text,
    age integer,
    ethnicity text,
    gender text,
    race text,
    veteran text,
    program_city text,
    chronic text,
	prior_residence text,
    episode_date date,
    city_last_address text,
    city_prior text,
    destination text,
    disability text,
    chronic_disability text,
    developmental_disability text,
    hiv_disability text,
    mh_disability text,
    physical_disability text,
    sud_disability text,
	aname text,
    pname text,
    ptype text,
    city_current text)

TABLESPACE pg_default;

ALTER TABLE scc.bnl
    OWNER to postgres;
