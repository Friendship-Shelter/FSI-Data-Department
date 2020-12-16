CREATE VIEW scc.score_blocks AS
SELECT *,
	((current_date - episode_date)/30) AS loh,
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
FROM scc.bnl
WHERE exit_date ISNULL
	OR exit_date > current_date - 90
		AND destination <> 'Permanent housing (other than RRH) for formerly homeless persons'
		AND destination <> 'Rental by client, no ongling housing subsidy'
		AND destination <> 'Rental by client, with other ongoing housing subsidy'
		AND destination <> 'Rental by client, with RRH or equivalent subsidy'
		AND destination <> 'Rental by client, with HCV voucher (tenant or project based)'
		AND destination <> 'Staying or living with family, permanent tenure'
		AND destination <> 'Staying or living with friends, permanent tenure'
		AND destination <> 'Hospital or other residential non-psychiatric medical facility'
		AND destination <> 'Hotel or motel paid for without emergency shelter voucher'
		AND destination <> 'Long-term care facility or nursing home'
		AND destination <> 'Staying or living with family, temporary tenure (e.g. room, apartment or house)'
		AND destination <> 'Staying or living with friends, temporary tenure (e.g. room, apartment or house)'
		AND destination <> 'Transitional housing for homeless persons (including homeless youth)'
