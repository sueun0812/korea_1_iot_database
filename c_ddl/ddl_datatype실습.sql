### ddl & 데이터 타입 복숩 ###

/*
	1. ddl
    create(생성), drop(삭제), alter(수정), truncate(삭제)
    >> 데이터베이스, 테이블에 적용 
    
    +) use : 데이터베이스를 지정하는 키워드
    +) desc(describe) : 테이블 구조 조회
    +) show 데이터베이스명 : 데이터베이스 목록 조회 
    +) if exists / if not exists : 존재할 경우 실행 / 존재하지 않을 경우 실행
    
    2. 데이터 타입 
    : 정수형, 문자형, 실수형, 논리형, 날짜형, 열거형 
*/

/* 예제 실습 ddl_datatype실습 */
# 1. 데이터베이스 생성
# 야구 팀 관리 데이터를 저장하는 데이터베이스
# : baseball_league;
create database `baseball_league`;

# 2. 데이터베이스 선택
use `baseball_league`;

# 3. 테이블 생성
# >> a. 팀 테이블 생성
# : teams(team_id, name, city, founded_year)
create table teams(
	team_id int,
    name varchar(100),
    city varchar(100),
    founded_year year -- 날짜형 중 연도 데이터만 저장하는 타입 : 'YYYY'로 저장
);

# >> b. 선수 테이블 생성
# : players(player_id, name, position)
# position 열거형 (타자, 투수, 내야수, 외야수)
create table players(
	player_id int,
    name varchar(100),
    position enum('타자', '투수', '내야수', '외야수')
);

# 4. 각 테이블 구조 확인
desc teams;
describe players;

# 5. 테이블 구조 수정
# : players테이블에 birth_date 컬럼 추가
alter table `players`
add birth_day date;

describe players;


# 6. 테이블 삭제
# : 테이블이 존재한다면 테이블 삭제
drop table if exists games;
drop table if exists players;

# 7. 데이터베이스 삭제
drop database baseball_league;
