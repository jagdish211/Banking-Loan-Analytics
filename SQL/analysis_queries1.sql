create database Banking_loan_db;
use Banking_loan_db;

show tables;

-- Q1. What is the total number of loan applications?
SELECT COUNT(*) AS Total_Applications
FROM loan_applications;


-- Q2. What is the total loan amount?
SELECT SUM(Loan_Amount) AS Total_Loan_Amount
FROM loan_applications;


-- Q3. What is the average loan amount?
SELECT AVG(Loan_Amount) AS Average_Loan_Amount
FROM loan_applications;


-- Q4. What is the minimum loan amount?
SELECT MIN(Loan_Amount) AS Minimum_Loan_Amount
FROM loan_applications;


-- Q5. What is the maximum loan amount?
SELECT MAX(Loan_Amount) AS Maximum_Loan_Amount
FROM loan_applications;


-- Q6. What is the average credit score?
SELECT AVG(Credit_Score) AS Average_Credit_Score
FROM loan_applications;


-- Q7. How many applications are there for each loan type?
SELECT Loan_Type, COUNT(*) AS Total_Applications
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Total_Applications DESC;


-- Q8. What is the total loan amount for each loan type?
SELECT Loan_Type, SUM(Loan_Amount) AS Total_Loan_Amount
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Total_Loan_Amount DESC;


-- Q9. What is the average loan amount for each loan type?
SELECT Loan_Type, AVG(Loan_Amount) AS Average_Loan_Amount
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Average_Loan_Amount DESC;


-- Q10. Which loan type has the highest number of applications?
SELECT Loan_Type, COUNT(*) AS Total_Applications
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Total_Applications DESC;


-- Q11. Which loan type has the highest total loan amount?
SELECT Loan_Type, SUM(Loan_Amount) AS Total_Loan_Amount
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Total_Loan_Amount DESC;


-- Q12. What is the average loan tenure for each loan type?
SELECT Loan_Type, AVG(Loan_Tenure_Years) AS Average_Loan_Tenure
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Average_Loan_Tenure DESC;


-- Q13. How many applications were approved?
SELECT COUNT(*) AS Approved_Applications
FROM loan_applications
WHERE Approval_Status = 'Approved';


-- Q14. How many applications were rejected?
SELECT COUNT(*) AS Rejected_Applications
FROM loan_applications
WHERE Approval_Status = 'Rejected';


-- Q15. What is the overall approval rate?
SELECT
    COUNT(CASE WHEN Approval_Status = 'Approved' THEN 1 END) * 100.0
    / COUNT(*) AS Approval_Rate
FROM loan_applications;


-- Q16. What is the approval rate for each loan type?
SELECT
    Loan_Type,
    COUNT(CASE WHEN Approval_Status = 'Approved' THEN 1 END) * 100.0
    / COUNT(*) AS Approval_Rate
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Approval_Rate DESC;


-- Q17. What is the approval rate for each employment type?
SELECT
    Employment_Type,
    COUNT(CASE WHEN Approval_Status = 'Approved' THEN 1 END) * 100.0
    / COUNT(*) AS Approval_Rate
FROM loan_applications
GROUP BY Employment_Type
ORDER BY Approval_Rate DESC;


-- Q18. What is the approval rate by gender?
SELECT
    Gender,
    COUNT(CASE WHEN Approval_Status = 'Approved' THEN 1 END) * 100.0
    / COUNT(*) AS Approval_Rate
FROM loan_applications
GROUP BY Gender
ORDER BY Approval_Rate DESC;


-- Q19. What is the approval rate by credit score band?
SELECT
    Credit_Score_Band,
    COUNT(CASE WHEN Approval_Status = 'Approved' THEN 1 END) * 100.0
    / COUNT(*) AS Approval_Rate
FROM loan_applications
GROUP BY Credit_Score_Band
ORDER BY Approval_Rate DESC;


-- Q20. What is the approval status by income segment?
SELECT
    Income_Segment,
    Approval_Status,
    COUNT(*) AS Application_Count
FROM loan_applications
GROUP BY Income_Segment, Approval_Status
ORDER BY Income_Segment, Application_Count DESC;


-- Q21. How many applications are there in each age group?
SELECT
    Age_Group,
    COUNT(*) AS Total_Applications
FROM loan_applications
GROUP BY Age_Group
ORDER BY Total_Applications DESC;


-- Q22. How many applications are there in each income segment?
SELECT
    Income_Segment,
    COUNT(*) AS Total_Applications
FROM loan_applications
GROUP BY Income_Segment
ORDER BY Total_Applications DESC;


-- Q23. Which cities have the highest number of applications?
SELECT
    City,
    COUNT(*) AS Total_Applications
FROM loan_applications
GROUP BY City
ORDER BY Total_Applications DESC;


-- Q24. What is the average income for each employment type?
SELECT
    Employment_Type,
    AVG(Annual_Income) AS Average_Annual_Income
FROM loan_applications
GROUP BY Employment_Type
ORDER BY Average_Annual_Income DESC;


-- Q25. What is the average loan amount for each employment type?
SELECT
    Employment_Type,
    AVG(Loan_Amount) AS Average_Loan_Amount
FROM loan_applications
GROUP BY Employment_Type
ORDER BY Average_Loan_Amount DESC;


-- Q26. What is the average credit score for each employment type?
SELECT
    Employment_Type,
    AVG(Credit_Score) AS Average_Credit_Score
FROM loan_applications
GROUP BY Employment_Type
ORDER BY Average_Credit_Score DESC;


-- Q27. What is the distribution of loan status?
SELECT
    Loan_Status,
    COUNT(*) AS Loan_Count
FROM loan_applications
GROUP BY Loan_Status
ORDER BY Loan_Count DESC;


-- Q28. How many overdue and default loans are there for each loan type?
SELECT
    Loan_Type,
    SUM(CASE WHEN Loan_Status = 'Overdue' THEN 1 ELSE 0 END) AS Overdue_Loans,
    SUM(CASE WHEN Loan_Status = 'Default' THEN 1 ELSE 0 END) AS Default_Loans
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Default_Loans DESC, Overdue_Loans DESC;


-- Q29. What is the average payment delay for each loan type?
SELECT
    Loan_Type,
    AVG(Payment_Delay_Days) AS Average_Payment_Delay
FROM loan_applications
GROUP BY Loan_Type
ORDER BY Average_Payment_Delay DESC;


