### a_트리거01 ###

# 트리거(trigger)
# : '방아쇠', 자동 실행 
# : 자동으로 수행하여 사용자가 추가 작업을 잊어버리는 실수를 방지 

# 트리거 사용 목적 
-- 수동으로 처리하는 일련 동작을 자동으로 처리하여 데이터의 오류를 방지 
-- 데이터 무결성 처리에 도움 

# insert, update, delete (DML, 데이터 조작 언어)작업이 발생하면 실행되는 코드 
# : 이벤트가 발생할 때 작동 

# 트리거 종류 
# after 트리거*, before 트리거 

# 트리거 문법 체계(기본 형식)
# : 스포어드 프로시저와 유사 

# cf) 차이점 : call 문으로 직접 실행 X
# 무조건 테이블에서 insert, update, delete 등의 이벤트가 발생하는 경우에만 자동 실행

use market_db;
create table if not exists trigger_table (
	id int,
    txt varchar(10)
);

insert into trigger_table
values
	(1, '레드벨벳'),
	(2, '잇지'),
	(3, '블랙핑크');
    
select * from trigger_table;

-- 트리거 생성 
drop trigger if exists myTrigger;

delimiter $$
create trigger myTrigger
	# 트리거 종류를 설정 
    # : 트리거종류 이벤트종류
    # 1) 트리거 종류 : after, before
    # 2) insert, update, delete
    after delete -- delete문이 발생된 이후에 작동 
    
    # on 조건으로 트리거를 부착할 테이블을 지정 
    on trigger_table
    for each row -- 각 행마다 적용시킴 (모든 트리거에 작성)

# 실제 트리거에서 작동할 부분 
begin 
    set @msg = '가수 그룹이 삭제됨';
end $$

delimiter ;

set @msg = '';
select @msg;

insert into trigger_table values (4, '마마무');
select @msg;

update trigger_table set txt = '블핑' where id = 3;
select @msg;

select * from trigger_table;
select @msg;

delete from trigger_table
where id = 4;
select @msg;

# 트리거 vs 트랜젝션 
# 트리거 : 특정 조건이 충족되거나 이벤트가 발생할 때 자동으로 실행 
# 트랜잭션 : 일련 동작의 묶음, 원자성을 보장 

# cf) 원자성 : 모두 성공 또는 모두 실패 
