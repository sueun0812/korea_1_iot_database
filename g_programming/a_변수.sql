### SQL 프로그래밍 언어 ###
use market_db;

select * from member;
select * from buy;

# 1. 변수 
# : 데이터를 담는 그릇, 데이터를 저장하기 위한 저장 공간 

-- 변수 선언 규칙 
# set @변수이름 - 변수의 값;

-- 변수 값 출력 
# select @변수이름; 

-- SQL 변수의 특징 
# : MySQL 워크벤치 시작 시 유지되지만, 종료할 경우 사라짐 (임시 저장 공간) 

-- SQL 변수 사용 예제 --

# 변수 선언 
set @myVar1 = 5;
set @myVar2 = 4.25;

# 변수 출력 
select @myVar1; -- SQL은 비절차적 언어이기 때문에 원하는 구문을 따로 실행 가능 
select @myVar1 + @myVar2;

# 테이블을 조회하면서 변수 사용 
set @txt = '가수 이름: ';
set @height = 166;
select
	@txt, mem_name
from
	member
where
	height > @height;
    
# limit 키워드에 변수 사용 불가 
# cf) limit 
#	  : 반환하는 행을 제한 

-- prepare, execute를 사용한 변수 사용 

# prepare : sql문을 실행하지 않고 준비 
# cf) prepare문에서의 '?' 사용 
#	  : 코드 작성 시에는 값이 채워지지 않음 
#		, 실행 시 채워짐 

# execute : 해당 키워드를 만나야 prepare 코드가 실행 
set @count = 3;

prepare mySQL
	from 'select mem_name, height
		from `member`
        order by `height`
        limit ?';
        
execute mySQL using @count;
# 코드 블록을 준비시키고 실행 시 변수값을 사용하는 경우 
# limit문에도 변수 사용이 가능 

# prepare 코드블록명
# from '실행할 코드 블록';

# execute 코드블록명 using 사용할변수;


