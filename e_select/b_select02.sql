### 서브 쿼리 (subquery) ###
# : 메인 쿼리 내부에서 실행되는 내부 쿼리 
# : 메인 쿼리에 데이터를 제공 
# >> 중첩 쿼리 

# (2023년 이후에 가입한 회원의) 지역 코드를 조회 

# 일반 조건 검색 쿼리 
select
	name, area_code
from
	members
where year(join_date) >= '2023';

# 서브 쿼리 

# members 테이블 
# : Bronze 등급이 아닌 모든 회원의 이름과 등급을 조회하는 쿼리를 작성
select name, grade
from members
where grade not in (
	select grade from members
    where
		grade = 'bronze'
);

# 회원의 등급별 포인트를 조회 
select grade, avg(points)
from (
	select grade, points
    from members
    where 
		points is not null
) as member_points
group by grade;

# 회원 중 가장 많은 포인트를 보유한 사람의 이름과 포인트를 조회 
select name, points
from members
where
	points = (
		select max(points) from members 
    );
    
select max(points) from members; # 600

