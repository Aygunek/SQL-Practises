USE AdventureWorks2012

--QUERY-1
--List the employees who are more 55 years old and working 12 ten years
SELECT *
FROM
(SELECT hre.BusinessEntityID, pp.FirstName, pp.LastName, hre.JobTitle,hre.BirthDate,hre.HireDate, CAST(GETDATE() AS DATE) AS 'SYSDATE',
DATEDIFF(YEAR,hre.BirthDate,CAST(GETDATE() AS DATE)) AS 'EmployeeAge',
DATEDIFF(YEAR,hre.HireDate,CAST(GETDATE() AS DATE)) AS 'WorkingYears'
FROM HumanResources.Employee hre
INNER JOIN Person.Person pp ON hre.BusinessEntityID = pp.BusinessEntityID) PosFireList
WHERE PosFireList.EmployeeAge>55
AND WorkingYears >12;