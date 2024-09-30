### 데이터 형 변환 ###
# 기본 데이터 타입 간의 명시를 달리하는 문법 

### 형 변환의 종류 
# 1. 명시적인 변환 
# cast(), convart() - 형식만 다르고 기능은 동일

-- cast(값 as 데이터형식)
-- convert(값, 데이터형식)

use market_db;

select
	avg(price) as '평균 가격' -- 실수없이 반환 
from
	buy;
    
# cf) 형 변환 시 정수형 데이터 타입 - signed, unsigned만 사용 가능 
# signed : 부호가 있는 정수 
# unsigned : 부호가 없는 정수 
select
	cast(avg(price) as signed) '정수 평균 가격'
from
	buy;

# 날짜 형 변환 (포맷을 맞추기 위함)
# date타입 : YYYY-MM-DD

select cast('2022$12$12' as Date);
select cast('2022*12*12' as Date);
select cast('2022!12!12' as Date);

# 2. 묵시적인 변환 
# : 별도의 지시없이 자동 변환 

select '100' + '200';

# cf) 문자열을 이엉서 작성 : concat() 함수를 사용 
select concat('100', '200');
