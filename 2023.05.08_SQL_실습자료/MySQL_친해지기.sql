/*
MySQL 친해지기
*/

-- Server --> Database --> Schema --> Table
-- MySQL에서는 Database와 Schema를 동일

/*
[SQL 문 유형]

-- DDL문 : Data Definition Language
			CREATE, ALTER, DROP
-- DML문 : Data Manipulate Language
			SELECT, INSERT, UPDATE, DELETE
-- DCL문 : Data Control Language
			GRANT, REVOKE, DENY
*/

-- 1) MyDB 데이터베이스 만들기

CREATE DATABASE mydb;

-- 2) MyDB로 연결

USE mydb;

SELECT DATABASE();

-- 3) 테이블 만들기

CREATE TABLE friend (
	name varchar(20) not null,
    email varchar(60) null,
    phone varchar(20) null,
    birth_date date null,
	money int null
);

-- 데이터 추가
INSERT INTO friend VALUES('홍길동', 'hong@aivle.com', '010-1234-1234', '2020-01-01', '1000');

-- 확인alter
SELECT * FROM friend;






