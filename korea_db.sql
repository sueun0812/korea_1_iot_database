/*
	회원(members) 관리 테이블
    
    - 회원 ID(member_id) : 정수형, 기본 키, 자동 증가
    - 이름(name) : 가변문자형(255)
    - 성별(gender) : 열거형(Male, Female, Other)
    - 지역코드(area_code) : 가변문자형(10)
    - 회원등급(grade) : 열거형(Bronze, Silver, Gold, Platinum, Diamond)
    - 연락처(contact) : 가변문자형(20)
    - 포인트(points) : smallint 기본값 0 지정
    - 가입일(join_date) : 날짜형
    
    >> 모든 컬럼은 비워질 수 없음
*/
drop database if exists `korea_db`;

create database `korea_db`;
use `korea_db`;

create table `korea_db`.`members` (
	member_id int auto_increment Primary key,
    name varchar(255) not null,
    gender enum('Male', 'Female', 'Other') not null,
    area_code varchar(10) not null,
    grade enum('Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond') default 'Bronze',
    contact varchar(20) not null,
    points smallint default 0,
    join_date date not null
);

insert into `korea_db`.`members` 
	(name, gender, area_code, grade, contact, points, join_date)
values
	('Jin', 'Male', 'SEOUL', 'Bronze', '010-1234-5678', 100, '2023-01-01'),
	('Hana', 'Female', 'BUSAN', 'Silver', '010-2345-6789', 200, '2022-01-02'),
	('Sung', 'Male', 'DAEJEON', 'Gold', '010-3456-7890', 300, '2020-01-03'),
	('Minji', 'Female', 'BUSAN', 'Platinum', '010-4567-8901', 400, '2022-01-04'),
	('Joon', 'Male', 'DAEJEON', 'Diamond', '010-5678-9012', 500, '2019-01-05'),
	('Yuna', 'Female', 'BUSAN', 'Bronze', '010-6789-0123', null, '2024-01-06'),
	('Hyun', 'Male', 'SEOUL', 'Silver', '010-7890-1234', 150, '2024-01-07'),
	('Eunji', 'Female', 'BUSAN', 'Gold', '010-8901-2345', null, '2024-01-08'),
	('Kyung', 'Male', 'JEJU', 'Platinum', '010-9012-3456', 350, '2022-01-09'),
	('Sooyoung', 'Female', 'JEJU', 'Diamond', '010-0123-4567', 600, '2018-01-10');
    
    desc `members`;
    select * from `members`;