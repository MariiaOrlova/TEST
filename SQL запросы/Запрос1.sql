SELECT SUM(Total.Intermediate_expenses) as Total_expenses FROM
(SELECT ROUND(SUM(A.Money), 2) AS Intermediate_expenses
FROM test.call_logs
LEFT JOIN test.numbers
ON test.numbers.Phone_Number=test.call_logs.To
INNER JOIN test.rates AS A
WHERE test.numbers.Phone_Number IS NULL
UNION
SELECT ROUND(SUM(B.Money), 2) AS Intermediate_expenses
FROM test.call_forwarding
LEFT JOIN test.numbers
ON test.numbers.Phone_Number=test.call_forwarding.To
INNER JOIN test.rates AS B
WHERE test.numbers.Phone_Number IS NULL) as Total
