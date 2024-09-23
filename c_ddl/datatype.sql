# -- datatype --

### SQL의 데이터 형식 ###
# 정수형, 문자형, 논리형, 날짜형

/*
	1. 정수형
    : 숫자 데이터를 저장하는데 사용
    >> 데이터 타입에 따라 메모리 사용 공간이 다름
    
    a) tinyint
	   : 1byte(8비트)
       : -128 ~ 127
       EX) 나이, 성별코드 등
       
    b) smallint
	   : 2byte(16비트)
       : -32,768 ~ 32,767
       EX) 사원번호, 우편번호 등
    
    c) int
	   : 4byte(32비트)
       : 약 -21억 ~ 약 21억
	   EX) 일반적인 용도로 가장 많이 사용되는 정수형 타입
       EX) 고객 ID, 주문 번호 등
       
	d) bigint
       : 8byte(64비트)
       : 약 -900경 ~ 약 900 경
       EX) 금융권, 천문학 등에서 주로 사용 
*/

create database if not exists `example`;
use `example`;

create table `integer` (
	t_col tinyint,
    s_col smallint,
    i_col int,
    b_col bigint
);

# insert 키워드 : 데이터 삽입
# Out of range 오류 : 해당 데이터 타입에 범위를 벗어나는 경우 발생 
insert into `integer`
value (127, 32767, 2000000000, 9000000000000000);

# unsigned : 부호가 없는 정수 
# > 정수의 시작을 0부터 시작
# > 범위는 그대로 인식 (EX. tinyint 0 ~ 255까지)
# EX) 키, 나이, 가격 등을 설정할 때 사용 (음수값이 없는 경우)

create table person (
	age tinyint unsigned, -- 나이 (0 ~ 255살 범위)
    height smallint unsigned -- 키 (0 ~ 65535 범위)
);

insert into person
values (130, 250);

/*
	2. 문자형
    : 텍스트 데이터 저장
    : char(개수), varchar(개수)
    
    a) char(개수) : 1 ~ 255바이트
    : 고정 길이 문자형
    EX) char(10)의 10자리 중 3자리만 사용하는 경우, 7자리가 비워진 상태로 메모리 낭비 
    >> 길이가 항상 일정하기 때문에 검색 속도가 빠름 
    >> 짧은 문자열 저장에 사용 
    EX) 성별, 국가코드(KOR, CHI, JPA)
    
    b) varchar(개수) : 1 ~ 1638 바이트
    : 가변 길이 문자형
    EX) varchar(10)의 10자리 중 3자리만 사용하는 경우, 7자리는 사라짐
    >> 길이가 일정하지 않아 검색 속도가 느림
    >> 선언된 길이 내에서 필요한 만큼만 데이터를 저장
    EX) 주소, 상품명 등 
    
    cf) 문자 수와 바이트 수의 차이
    # 영어 : 1바이트에 1개의 알파벳
    # 한글 : utf-8 기준 한 글자 당 약 3바이트를 사용
    >> varchar(255) : 255 / 3 = 약 85글자
    
    cf) 다량의 텍스트 데이터 형식
    a) text 형식 : 1 ~ 약 6000 바이트
	   longtext 형식 : 1 ~ 42억 바이트
    
    b) blob (binary long object) : 이미지, 동영상 등의 데이터
       blob 형식 : 1 ~ 약 6000 바이트
	   longblob 형식 : 1 ~ 42억 바이트
*/

create table `character` (
	name varchar(100), -- 제품명(가변길이)
    category char(10), -- 카테고리(고정길이)
    description text, -- 제품 설명(대용량 텍스트)
    image blob
);

insert into `character`
values ('Laptop', 'Electric', '삼성 갤럭시 북4 노트북 프로', 'example.com');

