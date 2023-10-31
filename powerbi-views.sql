CREATE OR REPLACE VIEW company.public.v_payments AS
SELECT p.paid::date AS paid, p.currency, p.user_id, p.amount, p.status
FROM company.public.payments p
;

DROP VIEW company.public.v_payments
;

CREATE OR REPLACE VIEW company.public.v_genders AS
SELECT *
FROM company.public.genders;

CREATE OR REPLACE VIEW company.public.v_countries AS
SELECT *
FROM company.public.countries;

CREATE OR REPLACE VIEW company.public.v_users AS
SELECT *
FROM company.public.users;

CREATE OR REPLACE VIEW company.public.v_currencies AS
SELECT *
FROM company.public.currency_eur
WHERE 1 = 1
  AND date >= '2014-01-01';
DROP VIEW company.public.v_currencies
;

SELECT *
FROM company.public.v_currencies
LIMIT 5
;

--Needed to limit data
SELECT MIN(date), MAX(date)
FROM company.public.v_currencies;

SELECT MIN(paid::date), MAX(paid::date)
FROM company.public.payments p

---Things that I found interesting
SELECT DISTINCT amount, currency
FROM company.public.payments
ORDER BY 1

SELECT user_id, COUNT(DISTINCT currency) AS all_c
FROM company.public.payments
GROUP BY 1
HAVING COUNT(DISTINCT currency) > 1
