SELECT A.UID, B.Name, COUNT(*) AS Activity
FROM test.call_logs AS A
INNER JOIN test.accounts AS B
ON A.UID=B.UID
WHERE A.From > 1
GROUP BY A.UID
ORDER BY Activity DESC
LIMIT 10;