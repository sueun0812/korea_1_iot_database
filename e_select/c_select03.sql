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
    
select * from members
order by
	grade asc, points asc;