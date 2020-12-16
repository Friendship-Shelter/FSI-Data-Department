CREATE MATERIALIZED VIEW scc.bnljoin AS
SELECT *
FROM
(SELECT DISTINCT *, ((current_date - episode_date)/30) AS loh,
	(CASE
		WHEN age > 64 THEN 1
		WHEN age < 26 THEN 1
		ELSE 0
	END) AS age_point,
	(CASE
		WHEN chronic = 'Yes' THEN 1
		ELSE 0
	END) AS chronic_point,
	(CASE
		WHEN veteran = 'Yes' THEN 1
		ELSE 0
	END) AS veteran_point,
	(CASE
		WHEN chronic_disability = 'Yes'
			AND mh_disability = 'Yes'
			AND (sud_disability = 'Alcohol Abuse'
					OR sud_disability = 'Drug Abuse'
					OR sud_disability = 'Both Alcohol and Drug Abuse')
			THEN 1
		ELSE 0
	END) AS tm_point
FROM (SELECT *
FROM (SELECT *
FROM scc.actions RIGHT JOIN (
					SELECT DISTINCT *
					FROM scc.bnl
						LEFT JOIN (SELECT ces.status, ces.ces_uid
									FROM scc.ces) AS status
						ON status.ces_uid =
							LEFT(bnl.fname, 2) ||
							LEFT(bnl.lname, 2) ||
							bnl.dob+2 - '1900-01-01') AS cesjoin USING(uid, cname)) AS goosey
WHERE goosey.exit_date ISNULL
	OR goosey.exit_date > current_date - 90
		AND goosey.destination <> 'Permanent housing (other than RRH) for formerly homeless persons'
		AND goosey.destination <> 'Rental by client, no ongling housing subsidy'
		AND goosey.destination <> 'Rental by client, with other ongoing housing subsidy'
		AND goosey.destination <> 'Rental by client, with RRH or equivalent subsidy'
		AND goosey.destination <> 'Rental by client, with HCV voucher (tenant or project based)'
		AND goosey.destination <> 'Staying or living with family, permanent tenure'
		AND goosey.destination <> 'Staying or living with friends, permanent tenure'
		AND goosey.destination <> 'Hospital or other residential non-psychiatric medical facility'
		AND goosey.destination <> 'Hotel or motel paid for without emergency shelter voucher'
		AND goosey.destination <> 'Long-term care facility or nursing home'
		AND goosey.destination <> 'Staying or living with family, temporary tenure (e.g. room, apartment or house)'
		AND goosey.destination <> 'Staying or living with friends, temporary tenure (e.g. room, apartment or house)'
		AND goosey.destination <> 'Transitional housing for homeless persons (including homeless youth)') AS dumb) AS dumber
WHERE meeting_date = '2020-12-04' OR meeting_date IS null
