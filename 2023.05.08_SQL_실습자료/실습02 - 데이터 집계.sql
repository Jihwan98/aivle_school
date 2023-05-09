/*
실습 - 데이터 집계
*/

-- 데이터베이스 연결
USE myshop2019;

    
-- Q01) 고객의 포인트 합을 조회하세요.
SELECT SUM(point) AS '포인트 합'
	FROM customer;


-- Q02) '서울' 지역 고객의 포인트 합을 조회하세요.

    

-- Q03) '서울' 지역 고객의 수를 조회하세요.
SELECT COUNT(*) AS '서울'
	FROM customer
    WHERE city = '서울';


-- Q04) '서울' 지역 고객의 포인트 합과 평균을 조회하세요.
 

    
-- Q05) '서울' 지역 고객의 포인트 합, 평균, 최댓값, 최솟값을 조회하세요.
SELECT 
	SUM(point) AS '포인트 합',
    AVG(point) AS '평균',
    MAX(point) AS '최대',
    MIN(point) AS '최소'
    FROM customer
    WHERE city = '서울';


-- Q06) 남녀별 고객의 수를 조회하세요.



-- Q07) 지역별 고객의 수를 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS cnt
	FROM customer
	GROUP BY city
    ORDER BY city ASC;
 
-- Q08) 지역별 고객의 수를 조회하세요.
--      단, 고객의 수가 10명 이상인 행만 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.

    
    
-- Q09) 남녀별 포인트 합을 조회하세요.
SELECT gender, SUM(point) AS sum_point
	FROM customer
    GROUP BY gender;


-- Q10) 지역별 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
    


-- Q11) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합이 1,000,000 이상인 행만 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
SELECT city, SUM(point) AS sum_point
	FROM customer
    GROUP BY city
    HAVING SUM(point) >= 1000000
    ORDER BY sum_point DESC;
   
   
-- Q12) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
    


-- Q13) 지역별 고객의 수, 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS '고객의 수', SUM(point) AS '포인트 합'
	FROM customer
    GROUP BY city
    ORDER BY city ASC;


-- Q14) 지역별 포인트 합, 포인트 평균을 조회하세요.
--      단, 포인트가 NULL이 아닌 고객을 대상으로 하며, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.



-- Q15) '서울', '부산', '대구' 지역 고객의 지역별, 남녀별 포인트 합과 평균을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순, 같은 지역은 성별을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city,
	SUM(IF (gender='M', point, 0)) AS M_point_sum,
	SUM(IF (gender='F', point, 0)) AS F_point_sum,
	AVG(IF (gender='M', point, 0)) AS M_point_avg,
	AVG(IF (gender='F', point, 0)) AS F_point_avg
	FROM customer
    WHERE city IN ('서울', '부산', '대구')
    GROUP BY city
    ORDER BY city ASC, gender ASC;


-- Q16) 2019년 1월 주문에 대하여 고객아이디별 전체금액 합을 조회하세요.



-- Q17) 다음 구문을 실행하여 YEAR, MONTH, DAY 함수 기능을 확인하고, 이후 쿼리문 작성 시 활용하세요.

SELECT order_date, YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, 
       DAY(order_date) AS order_day, total_due
	FROM order_header;


-- Q18) 주문연도별 전체금액 합을 조회하세요.
SELECT YEAR(order_date) AS order_year, SUM(total_due) AS total
	FROM order_header
    group by YEAR(order_date);

SELECT YEAR(order_date) AS order_year, 
	MONTH(order_date) AS order_month,
    SUM(total_due) AS total
	FROM order_header
    group by YEAR(order_date), MONTH(order_date);

-- Q19) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합을 조회하세요.
SELECT YEAR(order_date) as year,
	MONTH(order_date) as month,
    SUM(total_due) AS total
	FROM order_header
    WHERE order_date BETWEEN '2019-01-01 00:00:00' AND '2019-06-30 23:59:59'
    GROUP BY YEAR(order_date), MONTH(order_date);


-- Q20) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합과 평균을 조회하세요.
    

-- 참고 :
SELECT YEAR(order_date) AS 연도,
	SUM(IF(MONTH(order_date)=1, total_due, 0)) AS '1월',
	SUM(IF(MONTH(order_date)=2, total_due, 0)) AS '2월',
	SUM(IF(MONTH(order_date)=3, total_due, 0)) AS '3월',
	SUM(IF(MONTH(order_date)=4, total_due, 0)) AS '4월',
	SUM(IF(MONTH(order_date)=5, total_due, 0)) AS '5월',
	SUM(IF(MONTH(order_date)=6, total_due, 0)) AS '6월',
	SUM(IF(MONTH(order_date)=7, total_due, 0)) AS '7월',
	SUM(IF(MONTH(order_date)=8, total_due, 0)) AS '8월',
	SUM(IF(MONTH(order_date)=9, total_due, 0)) AS '9월',
	SUM(IF(MONTH(order_date)=10, total_due, 0)) AS '10월',
	SUM(IF(MONTH(order_date)=11, total_due, 0)) AS '11월',
	SUM(IF(MONTH(order_date)=12, total_due, 0)) AS '12월',
    SUM(total_due) AS 금액
	FROM order_header
    GROUP BY YEAR(order_date);
