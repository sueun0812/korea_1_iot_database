### DDL 문법 정리 ###

# --- 데이터 베이스 ---
# 1. 데이터베이스 생성(create)
create database if not exists database_name;

# cf) 데이터베이스의 유무를 확인하고 오류를 방지하는 SQL문
#	  , 존재하지 않을 경우에만 새로 생성
# -- if not exists 사용
create database if not exists database_name;

# 2. 데이터베이스 선택(use)
# use 키워드를 사용하여 DB 선택 시 모든 SQL 명령어가 선택된 DB 내에서 실행
# , 스키마명을 더블클릭한 것과 동일함
use sys;
use database_name;

# 3. 데이터베이스 삭제
# 데이터베이스 삭제 기능, 해당 작업은 실행 후 되돌릴 수 없음
drop database database_name;

# 4. 데이터베이스 목록 조회
# : 서버에 존재하는 모든 데이터베이스 목록을 확인
# show databases;
show databases;

# --- 테이블 ---
# 1. 테이블 생성 (create table)
create database if not exists example;
use example;
create table students ( # 테이블 생성 시 데이터베이스명이 필수는 아니나 오류 방지를 위해 권장함
	student_id int primary key,
    name varchar(100) not null,
    age int not null,
    major varchar(100)
);

# 2. 테이블의 구조 조회 (describe, decs)
# 테이블 구조 : 정의된 컬럼, 데이터 타입, 키 정보(제약조건) 등을 조회 가능
# describe 테이블명;
# describe students;
desc students;

# Field : 각 컬럼의 이름, Type : 각 컬럼의 데이터 타입, Null : Null 허용 여부
# Key : 각 컬럼의 제약사항(키), Default : 기본값 지정, Extra : 제약사항-추가옵션

# --- 테이블 수정 ---
# alter table
# : 이미 존재하는 테이블의 구조를 변경하는데 사용
# > 컬럼 또는 제약 조건을 추가, 수정, 삭제

# - 컬럼 - 
# a) 컬럼 추가 add (colunm)
# alter table 테이블명 add column 컬럼명 데이터타입 기타사항;
alter table `students`
add email varchar(255);

desc students;

# b) 컬럼 수정 modify (column)
# alter table 테이블명 modify column 컬럼명 새로운컬럼_데이터타입
alter table students
modify email varchar(100);

desc students;

# c) 컬럼 삭제 drop (column)
# alter table 테이블명 drop 컬럼명;
alter table students
drop email;

desc students;

# cf. if exists / if not exists
# : 선택적 키워드, 테이블이 존재하는 경우에만 삭제를 수행
# > 존재할 때만 삭제하기 때문에 오류가 발생하지 않음
drop table if exists `lectures`;
drop table `students`;

# cf. 데이터베이스와 테이블을 동시 지정
# : 테이블의 위치를 명확하게 전달하기 위해 .기호를 사용하여 경로 지정을 권장
# > 데이터베이스.테이블명

# cf) truncate
# : 테이블의 모든 데이터를 삭제하고 초기 상태로 되돌림
# > 데이터베이스, 테이블의 구조는 삭제되지 않음

# vs drop
# drop : 전체 구조물을 삭제
