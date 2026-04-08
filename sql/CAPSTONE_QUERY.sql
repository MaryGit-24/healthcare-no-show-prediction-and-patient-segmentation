--Healthcare SQL Mini Project Answers--

--1. List all patients who live in Seattle.--

CREATE VIEW seattle_patients AS
SELECT first_name || ' ' || last_name AS patient_name, city
FROM patients
WHERE city = 'Seattle';

--2. Find all medications where the dosage is greater than 50mg.--

CREATE VIEW greater_dosage AS
SELECT med_id, medication_name, dosage
FROM medications
WHERE CAST(regexp_replace(dosage, '[^0-9]', '', 'g') AS INT) > 50
ORDER BY dosage;

CREATE VIEW greater_dosage1 AS
WITH cleaned AS (
   SELECT
       med_id, medication_name, dosage,
       CAST(REGEXP_REPLACE(dosage, '[^0-9]', '', 'g') AS INT) AS dosage_value
   FROM medications
)
SELECT med_id, medication_name, dosage
FROM cleaned
WHERE dosage_value > 50
ORDER BY dosage_value;

--3. Get all completed appointments in February 2024.--

CREATE VIEW completed_app AS
SELECT patient_id, appointment_date, status
FROM appointments
WHERE appointment_date BETWEEN '2025-02-01' AND '2025-02-28'
AND status = 'Completed';

SELECT patient_id, appointment_date, status
FROM appointments
WHERE status = 'Completed'
AND EXTRACT(YEAR FROM appointment_date) = 2024
AND EXTRACT(MONTH FROM appointment_date) = 2;

--4. Show each doctor and how many appointments they completed.--

CREATE VIEW doctor_completed_app AS
SELECT d.doctor_id, d.doctor_name, COUNT(a.status) AS no_of_appointment
FROM appointments a
JOIN doctors d
ON d.doctor_id = a.doctor_id
WHERE status = 'Completed'
GROUP BY d.doctor_id, d.doctor_name
ORDER BY no_of_appointment;

--5. Find the most common diagnosis in the database.--

CREATE VIEW common_diagnosis AS
SELECT diagnosis_code, COUNT(*) AS diagnoses_count
FROM diagnoses
GROUP BY diagnosis_code
ORDER BY diagnoses_count DESC
LIMIT 1;

--6. List the total billing amount per patient.--

CREATE VIEW patient_billimg AS
SELECT p.first_name || ' ' || p.last_name AS patient_name, SUM(b.amount) AS billing_amount
FROM billing b
JOIN appointments a
ON a.appointment_id = b.appointment_id
JOIN patients p
ON p.patient_id = a.patient_id
GROUP BY patient_name
ORDER BY billing_amount;

--7. Which clinic location has the highest number of appointments?--

CREATE VIEW location_app AS
SELECT d.clinic_location, COUNT(a.appointment_id) AS no_of_appointment
FROM doctors d
JOIN appointments a
ON a.doctor_id = d.doctor_id
GROUP BY d.clinic_location
ORDER BY no_of_appointment DESC;

--8. Identify patients who have more than one diagnosis in 2024.--

CREATE VIEW patient_diagnosis AS
SELECT p.first_name || ' ' || p.last_name AS patient_name, COUNT(d.diagnosis_id) AS diagnosis_count
FROM patients p
JOIN appointments a
ON a.patient_id = p.patient_id
JOIN diagnoses d
ON d.appointment_id = a.appointment_id
WHERE EXTRACT(YEAR FROM appointment_date) = 2024
GROUP BY patient_name, a.appointment_date
ORDER BY diagnosis_count DESC
LIMIT 5;

--9. Rank doctors by total revenue generated.--

CREATE VIEW doc_rank_revenue AS
SELECT d.doctor_name, SUM(b.amount) AS total_revenue
FROM billing b
JOIN appointments a
ON a.appointment_id = b.appointment_id
JOIN doctors d
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_revenue DESC;

--10. For each patient, show their most recent appointment.--

CREATE VIEW recent_appoints AS
SELECT p.first_name || ' ' || p.last_name AS patient_name, MAX(a.appointment_date) AS recent_appointment
FROM patients p
JOIN appointments a
ON a.patient_id = p.patient_id
GROUP BY patient_name
ORDER BY recent_appointment DESC;

--11. Identify patients whose insurance covered less than 70% of their bill.--

CREATE VIEW insurance_coverage AS
WITH patient_bill AS(
	SELECT DISTINCT ON (p.first_name || ' ' || p.last_name)
		p.first_name || ' ' || p.last_name AS patient_name, p.insurance_provider,
		b.amount, b.insurance_covered, b.patient_paid
	FROM billing b
	JOIN appointments a
	ON a.appointment_id = b.appointment_id
	JOIN patients p
	ON p.patient_id = a.patient_id
),
insured_patient AS(
	SELECT patient_name, ROUND(insurance_covered * 100.0 / amount)::TEXT || '%' AS percent_covered
	FROM patient_bill
	WHERE insurance_covered < amount * 70 / 100
)
SELECT *
FROM insured_patient
ORDER BY percent_covered;

--12. Identify all diabetic patients and list their last medication renewal date.--

CREATE VIEW diabetic_pat AS
SELECT DISTINCT ON (p.first_name || ' ' || p.last_name)
	p.first_name || ' ' || p.last_name AS patient_name,
	d.diagnosis_code AS diabetic_diagnosis, m.start_date AS last_renewal_date
FROM appointments a
JOIN patients p
ON p.patient_id = a.patient_id
JOIN diagnoses d
ON a.appointment_id = d.appointment_id
JOIN medications m
ON p.patient_id = m.patient_id
WHERE d.diagnosis_code = 'E11';

--13. Which doctor has the lowest no‑show rate?--

CREATE VIEW no_show_doc AS
SELECT d.doctor_name, COUNT(a.status) AS no_show_rate
FROM appointments a
JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE status = 'No-show'
GROUP BY doctor_name
ORDER BY no_show_rate
LIMIT 1;

--14. Which age group has the highest incidence of hypertension (I10)?--

CREATE VIEW age_group_hyper AS
SELECT 
	CASE
		WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) BETWEEN 0 AND 17 THEN '0-17'
		WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) BETWEEN 18 AND 35 THEN '18-35'
		WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) BETWEEN 36 AND 50 THEN '36-50'
		ELSE '51+'
	END AS age_group, 
	COUNT(*) hypertensive_rate
FROM diagnoses d
JOIN appointments a
ON a.appointment_id = d.appointment_id
JOIN patients p
ON p.patient_id = a.patient_id
WHERE diagnosis_code = 'I10'
GROUP BY age_group
ORDER BY hypertensive_rate DESC;

--15. Which insurance provider covers the highest average amount?--

CREATE VIEW insurance_high_coverage AS
SELECT p.insurance_provider, AVG(b.insurance_covered) AS average_isurance
FROM billing b
JOIN appointments a
ON a.appointment_id = b.appointment_id
JOIN patients p
ON p.patient_id = a.patient_id
GROUP BY insurance_provider
ORDER BY average_isurance DESC
LIMIT 1;

--16. Determine peak days of the week for appointments.--

CREATE VIEW week_peak_days AS
SELECT
	TO_CHAR(appointment_date::DATE, 'Day') AS day_of_week,
	COUNT(*) AS appointment_count
FROM appointments
GROUP BY day_of_week
ORDER BY appointment_count DESC;

/* 17. From this data set, write out 3 other queries based on what was taught in class but the
queries should not be part of what has been asked already. */

18. Explain these queries and outcomes
19. Build a dashboard using powerBi.