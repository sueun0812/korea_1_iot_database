### d_삭제명령어 ###

# delete VS drop VS truncate #

-- 공통점
-- : 삭제를 담당하는 키워드

-- 차이점sys_config
# 1) delete (DML)
# : 테이블의 틀은 남기면서 데이터를 삭제 - 적은 용량의 데이터 | 조건이 필요한 데이터 

# 2) drop (DDL)
# : 테이블 자체를 삭제 

# 3) truncate (DDL)
# : 테이블의 틀은 남기면서 데이터를 삭제 - 대용량의 데이터

-- 대용량 테이블의 생성 
create table `big1` (select * from `world`.`city`, `sakila`.`country`);
create table `big2` (select * from `world`.`city`, `sakila`.`country`);
create table `big3` (select * from `world`.`city`, `sakila`.`country`);

delete from big1; -- 2.266초 (가장 느림)
select * from big1; -- 테이블 형식은 남아있음 

drop table big2; -- 0.031초 (가장 빠름)
# select * from big2 -- 테이블 자체가 삭제되었기 때문에 실행 X

truncate table big3; -- 0.031초 
select * from big3;	-- 테이블 형식은 남아있음 


