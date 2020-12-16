SELECT DISTINCT
	score_blocks.cname,
	score_blocks.uid,
	score_blocks.eid,
	score_blocks.pname,
		ROUND((
			(
				CAST(score_blocks.age_point AS DECIMAL) +
				CAST(score_blocks.chronic_point AS DECIMAL) +
				CAST(score_blocks.veteran_point AS DECIMAL) +
				CAST(score_blocks.tm_point AS DECIMAL)) /
		CAST(top.top_points AS DECIMAL))/2 +
		COALESCE(CAST(score_blocks.loh AS DECIMAL)/CAST(top.top_loh AS DECIMAL), 0)/2, 4) AS weighted_score
FROM scc.score_blocks, scc.top
