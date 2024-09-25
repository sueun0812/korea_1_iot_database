### join01 ###

/*
	조인(join)
    : 두 개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것
    
    종류 : 내부 조인, 외부 조인, 상호 조인, 자체 조인 
    
    1. 내부 조인(inner join)
    : 두 개 이상의 테이블에서 특정 열(기준 열)의 값이 일치하는 행만 가져오는 조인 
    >> 교집합을 반환 
    
    # 일대다 관계 (1 : M)
	  : 하나의 테이블의 한 행이 다른 테이블의 여러 행과 관련되는 경우 
      EX) members 테이블 - purchases 테이블 
      >> 각 회원은 여러 구매 기록을 가짐 (1회원 : 여러개의 구매 기록)
      
	  EX) 1명의 회사원 - 여러 번의 급여
          학생 테이블 - 학점 테이블 
	
    # 내부 조인의 기본 형태 
    select 열 목록 
    from 기준테이블(첫번째 테이블)
		(inner) join 두번째 테이블 
        on 조인될 조건 
	(where 조건 ...);
*/

# 내부 조인 예제 1
# : 구매 테이블에서 member_id가 1인 사람이 구매한 물건을 확인 
select * from purchases
	inner join members
    on purchases.member_id = members.member_id
where purchases.member_id = 1;

# cf) 조인 시 두 개 이상의 테이블에서 동일한 열 이름이 존재할 경우 
#	  테이블명.열이름 형식으로 표기를 권장!

# 내부 조인 예제 2
# 금액이 20000원 이상인 모든 구매 내역을 조회 
select
	M.name, P.purchase_date, P.amount
from
	members as M
		inner join purchases P
        on M.member_id = P.member_id
where
	P.amount >= 20000;
    
# 내부 조인 예제 3
# 회원 이름 별로 구매 금액을 내림차순 정렬
select 
	M.name, sum(P.amount) as total_purchase
from 
	members M
		join purchases P
        on M.member_id = P.member_id
group by
	M.name
order by
	total_purchase desc;
	
# 내부 조인 예제 4
# 단 한번이라도 구매한 기록이 있는 회원들을 추출
select
	distinct M.name, M.contact
from
	members M
		inner join purchases P
        on M.member_id = P.member_id;