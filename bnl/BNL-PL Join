SELECT DISTINCT pl.status AS "CES Status", bnl.uid "Clients Unique Identifier"
FROM data_department.pl, data_department.bnl
WHERE bnl.cname = (pl.first_name || ' ' || pl.last_name)
