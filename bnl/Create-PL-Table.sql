CREATE TABLE scc.ces
(
    status text,
    score integer,
    weighted decimal,
    survey_date date,
    outreach_team text,
    iname text,
    fname text,
    mname text,
    lname text,
    dob date,
    age integer,
    ssn text,
    sleeping_location text,
    loh decimal,
    family_size integer,
    homelessness_documentation text,
    chronic_documentation text,
    disability_documentation text,
    chronic text,
    dr_date date,
    match_date date,
    housuing_provider text,
    unit_id text,
    housing_type text,
    housed_date date,
    deceased text,
    inactive_date date,
    inactive text,
    housed_elsewhere text,
    special_population text,
    contact_date text,
    notes text,
    surveycity_daycity_sleepcity text,
    spa text,
    ces_uid text,
    PRIMARY KEY (ces_uid, survey_date, status)
);

ALTER TABLE scc.ces
    OWNER to postgres;
