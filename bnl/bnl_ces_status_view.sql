SELECT *, (
	SELECT string_agg(pname, ', ')
	FROM data_department.bnl
	GROUP BY uid)
FROM data_department.bnl FULL JOIN (
	SELECT DISTINCT  pl.status, bnl.uid
	FROM data_department.pl, data_department.bnl
	WHERE bnl.cname = (pl.first_name || ' ' || pl.last_name)) AS ces_bnl_status USING(uid)
