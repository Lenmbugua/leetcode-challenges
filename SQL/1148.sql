SELECT Distinct viewer_id as id
FROM Views 
WHERE author_id = viewer_id
ORDER BY viewer_id 