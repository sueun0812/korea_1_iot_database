### select문 정렬 ###
use korea_db;

# select A from B where C;

/*
	order by : 정렬
    limit : 결과 개수의 제한 
    distinct : 중복된 데이터를 제거 
    group by : 지정한 열 데이터들 중 같은 데이터끼리 묶어서 추출 
    having : 그룹화 된 데이터에 조건을 추가 
*/

# 1. order by
# : 데이터 정렬
-- 결과의 값이나 개수에 영향 X
-- 기본값 asc(오름차순), desc(내림차순) 
-- 오름차순 : 알파벳(a), 자음(ㄱ), 날짜(오래된 순), 숫자(작은 데이터부터)

select * from members
order by
	join_date desc;
    
select * from members
order by
	name;
    
-- 정렬된 데이터를 기반으로 추가 정렬 가능
-- 콤마로 정렬 상태를 나열
select * from members
order by
	grade asc, points asc;
    
# 2. limit
# : 출력하는 개수를 제한 (반환되는 행의 수를 제한)

# limit 행수 (offset 시작행)
# : 시작하는 행으로부터의 개수 제한 
# >> 생략할 경우 기본값 0

select * from members
limit 5 offset 3; -- 첫 번째 행의 경우 offset 0번 
    
select * from members
order by
	grade desc
limit 5;

# 3. distinct
# : 중복된 결과를 제거 
# >> 조회된 결과에서 중복된 데이터가 존재하면 1개만 남기고 생략 

# 조회할 열 이름 옆에 distinct 키워드를 작성 
select distinct area_code from members;
select distinct grade from members;

# 4. group by
# : 그룹으로 묶어주는 역할
# >> 여러 행을 그룹화하여 집계 함수를 적용에 주로 사용 

# cf) 집계 함수 
# : 그룹화 된 데이터에 대한 계산 

# sum(), avg(), min(), max()
# count() : 행의 개수 
# count(distinct) : 행의 개수(중복은 1개만 인정)

-- 등급별 회원 수 계산 
select grade, count(*) member_count from members
group by grade;

-- 지역별 평균 포인트 계산 
select area_code, avg(points) member_point from members
group by area_code;

# 5. having
# : group by와 함께 사용, 그룹화 된! 결과에 대한 조건을 지정
# > where과 유사하지만 그룹화 된! 데이터에 대한 조건에 사용 

select grade, count(*) as member_count from members
group by 
	grade 
having
	count(*) >= 2;
    
select area_code, avg(points) avg_points from members
group by area_code
having
	avg(points) > 200;