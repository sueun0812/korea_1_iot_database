### 스토어드 프로시저 예제 ###

use baseball_league;

# 1. 변수 사용 
# : 팀 ID를 변수에 저장, 저장된 팀 ID를 사용하여 선수 조회

set @team_id = 1;

select * from players
where
	team_id = @team_id;
    
# 2. 스토어드 프로시저 
drop procedure if exists CheckPosition;

delimiter $$

# 프로시저명 옆의 소괄화는 해당 프로시저에 전달할 데이터를 명시 
# : 매개 변수 
# : in 매개변수명 데이터타입 
create procedure CheckPosition(in p_player_id int)
begin
	# 프로시저 내에서 사용할 지역 변수 
    # : declare 지역변수명 데이터타입;
	declare v_player_position varchar(100);
    select
		# 매개 변수의 값에 해당하는 선수의 포지션을 가져옴 
        # A into B
        # : A를 B에 넣다 
		position into v_player_position
	from
		players
	where 
		player_id = p_player_id;
        
	if v_player_position = '타자' then
		select '해당 선수는 타자입니다.';
	else
		select '해당 선수는 타자가 아닙니다.';
	end if;
end $$

# 구분 문자 변경
# delimiter 구분기호 
delimiter ;

call CheckPosition(101);
call CheckPosition(105);

select * from players;