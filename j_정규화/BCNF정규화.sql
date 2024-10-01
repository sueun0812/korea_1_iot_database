### BCNF (Boyce-Codd NF) ###

# 보이스-코드 정규화 
# : 모든 결정자가 후보키가 되어야 하는 DB 정규화 형태 
# : 3NF의 조건을 충족하며 추가로 모든 결정자가 후보키인 조건을 만족 

# cf) 후보키 
# : 테이블에서 각 행을 유일하게 식별할 수 있는 최소한의 속성 집합 

# cf) 결정자 
# : 하나의 속성 또는 속성 집합이 다른 속성을 결정할 수 있는 경우 
#	> 해당 속성 집합을 '결정자'라고 표현 

create table `example_3nf` (
	std_id int, -- 학생 번호
    std_name varchar(100), -- 학생 이름 
    course_id varchar(100), -- 과목 번호 
    score int, -- 점수
    course_name varchar(100), -- 과목명
    primary key (std_id, course_id)
    # 학생 번호, 과목 번호가 복합 키로 사용 
);

# 과목 번호는 과목명을 결정 
# '학생 번호 + 과목 번호'가 테이블 행을 유일하게 식별 >> 복합키(후보키)

# > '과목 번호'가 후보키는 아니지만 결정자 역할 
#	: 과목 번호만이 과목명을 결정 (BCNF 위반) 

# BCNF에 맞는 테이블 구조 
# 과목 정보를 분리하여 '과목 번호'가 후보키가 되는 새로운 테이블 생성 
create table 과목 (
	과목코드 varchar(10) primary key,
    과목명 varchar(50)
);

create table 성적 (
	학번 varchar(10),
    과목코드 varchar(10),
    점수 int,
    primary key(학번, 과목코드),
    foreign key (과목코드) references 과목(과목코드)
);

insert into 과목 
values
	('123', 'dbms'),
	('234', '빅데이터');
    
insert into 성적 
values
	('101', '123', 95),
	('102', '234', 85),
	('103', '123', 95);

