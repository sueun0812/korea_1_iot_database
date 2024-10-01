### 비정규화 ###

# 비정규화(반정규화) 
# : 정규화된 DB를 성능 향상을 위해 의도적으로 다시 중복을 허용하는 과정

# 비정규화의 필요성 
# : 조회 성능의 향상, 쿼리의 복잡ㅈ성 감소 등 
# >> 시스템의 읽기 성능을 최적화 | 쓰기 작업 보다 읽기 작업이 많을 경우 

# 비정규화 예시 

# cf) 정규화 된 테이블
drop database if exists `비정규화`;
create database `비정규화`;
use `비정규화`;

-- 정규화 된 테이블 예시 
-- 1) 주문 테이블 
create table orders (
	order_id int primary key,
    customer_id int,
    order_date date,
    total_amount int,
    foreign key (customer_id) references customers(customer_id)
);

-- 2) 고객 테이블 
create table customers (
	customer_id int primary key,
    name varchar(100),
    address varchar(255)
);

-- 3) 주문 상세 테이블 
create table order_details (
	order_detail_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    price int,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

-- 4) 제품 테이블 
create table products (
	product_id int primary key,
    product_name varchar(100),
    price int
);

### 비정규화 ###
# 통합 주문 테이블 : 비정규화 적용
create table orders_denormalized (
	order_id int primary key, -- 주문 번호 
    customer_name varchar(100),
    customer_address varchar(255),
    order_date date,
    product_name varchar(100),
    quantity int,
    price int,
    total_amount int
);