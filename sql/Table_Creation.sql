CREATE TABLE patients (
	patient_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender CHAR(10),
	date_of_birth DATE,
	city TEXT,
	insurance_provider VARCHAR(50)
);

CREATE TABLE medications (
	med_id INT,
	patient_id INT,
	medication_name VARCHAR(50),
	dosage VARCHAR(50),
	start_date DATE,
	end_date DATE
);

CREATE TABLE doctors (
	doctor_id INT,
	doctor_name VARCHAR(50),
	specialty TEXT,
	clinic_location TEXT
);

CREATE TABLE diagnoses (
	diagnosis_id INT,
	appointment_id BIGINT,
	diagnosis_code VARCHAR(50),
	diagnosis_description VARCHAR(50)
);

CREATE TABLE billing (
	bill_id INT,
	appointment_id BIGINT,
	amount BIGINT,
	insurance_covered BIGINT,
	patient_paid BIGINT
);

CREATE TABLE appointments (
	appointment_id INT,
	patient_id BIGINT,
	doctor_id INT,
	appointment_date DATE,
	status VARCHAR(50),
	visit_reason VARCHAR(50)
);