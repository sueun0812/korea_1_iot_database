### 제3정규형 ###

# 3NF의 개념 
# : 이미 2NF(제2정규형)을 만족하는 테이블에서 모든 비기본 속성이 기본키에만 함수적으로 종속
# > 비기본 속성이 다른 비기본 속성에 종속되지 않아야 함

# cf) 이행적 종속성
# : 어떤 속성 A가 다른 속성 B에 종속되고 
#	, B가 또 다른 속성 C에 종속된 경우 
# >> A가 C에 이행적으로 종속됨 

# > 제3정규형의 경우 '이행적 종속성을 제거'

# 학번(PK) | 이름 | 학과 ID | 학과명 | 학과위치 
drop table departments_3;
drop table students_3;

-- 학과 테이블(학과ID, 학과명, 학과위치를 별도로 분리)
create table departments_3 (
	department_id int primary key,
    department_name varchar(100),
    location varchar(100)
);

-- 학생 테이블 
create table students_3 (
	student_id int primary key,
    name varchar(100),
    department_id int,
    foreign key (department_id) references department_3(department_id)
);

insert into departments_3
values
	(101, '컴공', '서울'),
    (201, '전자공학', '부산');
    
insert into students_3
values
	(1, '이기석', 101),
    (2, '박영준', 201),
    (3, '이승아', 103);
    
# 학생번호 > 강의 ID
# 강의ID > 강의 위치

select * from departments_3;

select S.student_id, S.name, D.department_name, D.location
from
	students_3 S
		join
			departments_3 D
		on S.department_id = D.department_id;

 