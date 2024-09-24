### b_제약조건02 ###

/*
	4. check 제약조건
    : 입력되는 데이터를 점검하는 기능
    : 테이블의 열에 대해 특정 조건을 설정
	  , 조건을 만족하지 않는 경우 입력을 막음 
*/
create table employees (
	id int primary key,
    name varchar(100),
    age int,
    -- check 제약조건 사용 방법
    -- check (조건)
    # 조건식의 경우 다양한 연산자 사용
    check (age >= 20)
);

insert into `employees`
values (1, '이기석', 28);

insert into `employees`
values (2, '홍동현', 28);

insert into `employees`
values (3, null, 30);

/*
	5. not null 제약조건 
    : 특정 열에 null 값을 허용하지 않는다는 것을 의미 
    > 비워져있지 않도록 설정 
*/

create table `contacts` (
	id int primary key, -- PK값은 Not null을 지정하지 않아도 자동 지정!
    name varchar(100) not null,
    email varchar(100) not null
);

insert into `contacts`
values (1, '성찬영', 'qwe123');

-- insert into `contacts`
-- values (2, null, 'qwe123'); # - Error not null 오류 

/*
	default 제약조건
    : 테이블의 열에 값이 명시적으로 제공되지 않는 경우 사용되는 기본값 
    : 선택적인 필드에 대해 데이터 입력을 단순화하여 데이터의 무결성을 유지 
*/

create table `inquiry` (
	order_id int primary key,
    product_name varchar(100),
    -- default 제약 조건 설정 방법
    -- 컬럼명 데이터타입 default 기본값
    quntity int default 1 -- 기본 수량이 1
);

insert into `inquiry`
values (1, '노트북', 3);

insert into `inquiry` (order_id, product_name)
values (2, '스마트폰');

select * from `inquiry`;

