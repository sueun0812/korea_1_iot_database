/*
	외부 조인 (outer join)
    : 두 테이블을 조인할 때 필요한 내용이 한쪽 테이블에만 있어도 결과를 추출하는 조인 
    >> 조인 조건 on식에 맞지 않는 행도 결과에 포함
    
    # 외부 조인의 종류 
    left outer join, right outer join, full outer join 
    
    # 기본 형태 
    select 열 목록
    from 기준 테이블 
		(left | right | full) outer join --- 기본 : left 
		on 조인될 조건 
	(where ...);
*/

# 1. left outer join 
# : 왼쪽 테이블의 모든 레코드와 오른쪽 테이블의 매칭되는 레코드만을 포함 

# 전체 회원에 대해 구매 기록(없더라도)을 출력 
select
	M.member_id, M.name, P.product_code, M.area_code
from
	members M
		left outer join purchases P
        on M.member_id = P.member_id
order by M.member_id;

# : left outer join : 왼쪽 테이블의 내용은 모두 출력되어야 함 !

# right outer join 예제
select
	M.member_id, M.name, P.product_code, M.area_code
from
	purchases P
right outer join 
	members M -- 오른쪽에 있는 회원 테이블을 기준으로 외부 조인
    on M.member_id = P.member_id
order by M.member_id;

# 외부 조인 예제 #
select
	M.member_id, P.product_code, M.name, M.contact
from
	members M
		left outer join purchases P
        on M.member_id = P.member_id
where
	P.product_code is null;