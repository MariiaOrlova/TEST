SELECT test.call_logs.From, SUM(A.Money) AS Charges
FROM test.call_logs
LEFT JOIN test.numbers
ON test.numbers.Phone_Number=test.call_logs.To
INNER JOIN test.rates AS A
ON A.Money!=0
WHERE test.numbers.Phone_Number IS NULL
GROUP BY test.call_logs.From
ORDER BY Charges DESC
LIMIT 10;
