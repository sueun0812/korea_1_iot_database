### 조인(join) ###

# 외부 조인 (outer join)
# : 두 개 이상의 테이블을 연결할 때, 조인 조건에 맞지 않는 행도 포함하여 결과를 반환
# > 한 쪽 테이블의 데이터가 없으면 null 값이 반환 

# 외부 조인 종류 
# left (outer) join, right (outer) join, full (outer) join 

# 1. left join
# : 왼쪽 테이블의 모든 행을 포함 
# : 오른쪽 테이블에서 일치하는 값이 없을 경우 null로 채움 

# 2. right join 
# : 오른쪽 테이블의 모든 행을 포함 
# : 왼쪽 테이블에서 일치하는 값이 없을 경우 null로 채움 

# 3. full join
# : 양쪽 테이블의 모든 행을 포함, 일치하지 않으면 null로 채움

### left outer join 예제 ###
use `join`;

create table customer (
	customer_id int auto_increment primary key,
    name varchar(50)
);

create table orders (
	order_id int primary key,
    customer_id int,
    order_date date,
    foreign key(customer_id) references customer(customer_id)
);

insert into customer (name) 
values
	('정재원'), 
	('최준혁'), 
	('최소윤'); 
 
insert into orders
values
	(101, 1, '2024-09-20'),
	(102, 2, '2024-09-26');
    
### 외부 조인 예제 ###
select
	C.name, O.order_id, O.order_date
from 
	customer C
		left outer join orders O
        on C.customer_id = O.customer_id;
        -- on 조건과 일치하는 데이터가 있으면 데이터 반환 
        -- , 없을 경우 null을 반환 
        
### right 외부 조인 ###
select
	C.name, O.order_id, O.order_date
from
	customer C
		right outer join orders O -- 오른쪽의 결합 테이블의 모든 데이터를 반환 
        on C.customer_id = O.customer_id;

### left 외부 조인 ###
# 각 고객의 이름과 해당 고객이 주문한 총 주문 건수의 주문 날짜를 조회 
# 주문이 없는 고객도 포함하여 조회, 주문 건수는 0으로 표시 

select 
	C.name, count(O.order_id) as total_orders, max(O.order_date) as last_order_date
from
	customer C
		left join orders O
        on C.customer_id = O.customer_id
group by
	C.name;

 