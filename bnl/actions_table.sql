CREATE TABLE scc.actions

    (cname text,
    uid text NOT NULL,
    action text,
    staff text,
	  target_date date,
	  meeting_date date,
    bucket text,
    bucket_date date,
    plan text,
    barrier text,
    PRIMARY KEY (uid, meeting_date)
  )
TABLESPACE pg_default;

ALTER TABLE scc.actions
    OWNER to postgres;
