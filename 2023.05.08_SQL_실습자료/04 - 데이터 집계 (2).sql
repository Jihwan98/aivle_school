/*
데이터 집계 (2)
*/


-- 데이터베이스 연결
USE hrdb2019;

-- RANK : 1, 2, 2, 4, …
-- DENSE_RANK : 1, 2, 2, 3, …
-- ROW_NUMBER : 1, 2, 3, 4, …
-- nTILE(3) : 1, 1, 1, 2, 2, 2, 3, 3, 3

-- 1) RANK: 1, 2, 2, 4

-- 전제 순위 조회
SELECT emp_id, emp_name, dept_id, gender, phone, salary
   FROM employee
   WHERE retire_date IS NULL
   ORDER BY salary DESC;

-- 전제 순위 조회
SELECT emp_id, emp_name, dept_id, gender, phone, salary,
       RANK() OVER(ORDER BY salary DESC) AS rnk
   FROM employee
   WHERE retire_date IS NULL;
   
-- 전제 순위 조회
SELECT emp_id, emp_name, dept_id, gender, phone, salary,
       RANK() OVER(ORDER BY salary DESC) AS rnk
   FROM employee
   WHERE retire_date IS NULL
   ORDER BY emp_name;
   
-- 남녀별 순위 조회
SELECT emp_id, emp_name, dept_id, gender, phone, salary,
       RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rnk
   FROM employee
   WHERE retire_date IS NULL;


-- Q) 남녀별 1등 조회
-- 하위쿼리(쿼리문 안에 또 다른 쿼리)
SELECT * FROM (
	SELECT emp_id, emp_name, dept_id, gender, phone, salary,
		RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rnk
		FROM employee
		WHERE retire_date IS NULL
	) AS T
   WHERE rnk = 1;

   
   
-- 2) DENSE_RANK: 1, 2, 2, 3

-- 전체 순위 조회
SELECT emp_id, emp_name, dept_id, gender, phone, salary, 
	   DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
   FROM employee
   WHERE retire_date IS NULL;

-- 남녀별 순위 조회
SELECT emp_id, emp_name, dept_id, gender, phone, salary, 
	   DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rnk
   FROM employee
   WHERE retire_date IS NULL;


-- 3) ROW_NUMBER: 1, 2, 3, 4

-- 번호 붙여 조회
SELECT ROW_NUMBER() OVER(ORDER BY emp_id ASC) AS num,
       emp_id, emp_name, dept_id, gender, phone, salary
   FROM employee
   WHERE retire_date IS NULL;

-- 남녀별 번호 붙여 조회
SELECT ROW_NUMBER() OVER(PARTITION BY gender ORDER BY emp_id ASC) AS num,
	   emp_id, emp_name, dept_id, gender, phone, salary
   FROM employee
   WHERE retire_date IS NULL;


-- Q) 남녀 1번부터 3번까지 조회



-- 4) NTILE: 1, 1, 1, 2, 2, 2, 3, 3, 3

-- 급여 순으로 3등분 
SELECT emp_id, emp_name, dept_id, gender, phone, salary,
	   NTILE(3) OVER(ORDER BY salary DESC) AS grp
   FROM employee
   WHERE retire_date IS NULL;
   
SELECT emp_id, emp_name, dept_id, gender, phone, salary,
	   ELT(NTILE(3) OVER(ORDER BY salary DESC), '상', '중', '하') AS grp
   FROM employee
   WHERE retire_date IS NULL;

-- 남녀별 급여순으로 3등분
SELECT emp_id, emp_name, dept_id, gender, phone, salary,
	   NTILE(3) OVER(PARTITION BY gender ORDER BY salary DESC) AS grp
   FROM employee
   WHERE retire_date IS NULL;
   
-- OVER()
SELECT emp_name, dept_id, gender, salary,
		COUNT(*) OVER() AS cnt,
		SUM(salary) OVER() AS tot_salary,
		AVG(salary) OVER() AS avg_salary
    FROM employee
    WHERE retire_date IS NULL AND salary > 0;
    
-- OVER() #2
SELECT emp_name, dept_id, gender, salary,
		COUNT(*) 	OVER(ORDER BY emp_name) AS cnt,
		SUM(salary) OVER(ORDER BY emp_name) AS tot_salary,
		AVG(salary) OVER(ORDER BY emp_name) AS avg_salary
    FROM employee
    WHERE retire_date IS NULL AND salary > 0;

-- OVER() #3
SELECT emp_name, dept_id, gender, salary,
		COUNT(*) 	OVER(PARTITION BY dept_id ORDER BY emp_name) AS cnt,
		SUM(salary) OVER(PARTITION BY dept_id ORDER BY emp_name) AS tot_salary,
		AVG(salary) OVER(PARTITION BY dept_id ORDER BY emp_name) AS avg_salary
    FROM employee
    WHERE retire_date IS NULL AND salary > 0;