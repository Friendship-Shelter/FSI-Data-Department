SELECT *
FROM data_department.bnl FULL JOIN (
	SELECT DISTINCT  pl.status, bnl.uid
	FROM data_department.pl, data_department.bnl
	WHERE bnl.cname = (pl.first_name || ' ' || pl.last_name)) AS ces_bnl_status USING(uid) FULL JOIN(
		SELECT uid, STRING_AGG(DISTINCT pname, ', ')
		FROM data_department.bnl
		GROUP BY uid) AS concat_pname USING(uid) 
