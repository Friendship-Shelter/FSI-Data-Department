SELECT DISTINCT
	cname AS "Name",
	uid AS "Unique ID",
	pname AS "Program Name",
	weighted_score/topscore.top_score AS "Score",
	status AS "CES Status",
	bucket AS "Housing Bucket",
	bucket_date AS "Date Bucket Changed",
	plan AS "Housing Plan",
	barrier AS "Current Barrier",
	greatscore."action" AS "Last Action",
	staff AS "Staff Responsible",
	target_date AS "Target Date"
FROM scc.greatscore, scc.topscore
WHERE chronic_point = 1 AND age > 64
ORDER BY "Score" DESC
