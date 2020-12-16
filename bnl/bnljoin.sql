CREATE VIEW scc.bnljoin AS
SELECT DISTINCT *
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
		AND goosey.destination <> 'Transitional housing for homeless persons (including homeless youth)') AS goosey_left,
(SELECT bnl.uid AS cid, MAX(bnl.eid) AS recent_enrollment
FROM scc.bnl
GROUP BY bnl.uid) AS goosey_right
WHERE goosey_right.cid = goosey_left.uid AND goosey_left.eid = goosey_right.recent_enrollment
