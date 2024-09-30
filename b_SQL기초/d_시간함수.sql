# now(), sysdate(), current_timestamp();

select now()
	, sysdate()
	, current_timestamp;

# now() : 서버의 시간을 가져오는 함수 
# sysdate() : 호출되는 시점을 반환 
# current_timestampe : now()와 동일 

# 차이점 
-- now(), current_timestamp
-- : 실행되는 시점에서 시간이 반환 

-- sysdate()
-- : 호출되는 시점의 시간이 반환 

select now()
	, sysdate()
    , current_timestamp
    , sleep(5) -- 시간을 지연시키는 함수 (5초 지연)
    , now()
	, sysdate() -- 값이 호출되는 시점이 반환! (혼자 다름) 
    , current_timestamp;
