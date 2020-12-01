SELECT *
FROM data_department.bnl2, (SELECT bnl2.uid, MAX(eid) AS current_enrollment
								FROM data_department.bnl2
						   		GROUP BY bnl2.uid) AS bnl3
WHERE bnl2.uid = bnl3.uid AND bnl3.current_enrollment = bnl2.eid
