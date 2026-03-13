-- 1. ANALYZING SMOKER VS NON-SMOKER COST GAP
SELECT smoker, ROUND(AVG(charges),2) AS ave_charges
FROM insurance_premiums 
GROUP BY smoker;

-- 2. AGE TRENDS FOR LARGE FAMILIES (3+ CHILDREN)
SELECT age, ROUND(AVG(charges),2) AS ave_charges, ROUND(MAX(charges),2) AS max_charge
FROM insurance_premiums 
WHERE children > 2
GROUP BY age
ORDER BY age DESC;

-- 3. RISK SEGMENTATION: BMI & SMOKING STATUS
SELECT CASE 
   WHEN bmi >=30 THEN 'Obese'
   ELSE 'Non-Obese' END AS bmi_category, 
ROUND(AVG(charges),2) AS avg_charges
FROM insurance_premiums
WHERE smoker = 'yes'
GROUP BY bmi_category;
