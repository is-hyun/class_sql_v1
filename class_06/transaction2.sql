-- DELIMITER(구분자) : "여기까지가 한 문장" 이라는 표시를 바꾸는 명령입니다. 
-- MySQL 는 세미콜론을 만나면 문장이 끝난줄 알고 자동 실행해 버립니다. 
-- 그런데 프로시저 구문 안에도 세미콜론이 여러개 나올 수 있어서 다 읽기 전에 구문을 실행해 버린다. 
-- 그래서 잠시 구분자를 ; 세미콜론에서 --> // 로 바꿔두는 작업입니다.  

DELIMITER // 

create procedure 송금하기() -- 아무 이름이나 상관없음 심지어 --> 송금하기() 	
begin
	start transaction; 
    update accounts set balance = balance - 20000
    where account_id = 1 and balance >= 20000;
    
    IF ROW_COUNT() = 0 THEN  
    rollback;
    select '잔액부족' as 결과; 
    ELSE 
		update accounts set balance = balance + 20000 where account_id = 2; 
        commit; 
        select '송금 완료' as 결과; 
    END IF;
END // 
--  여기까지 프로시저의 끝입니다. 

DELIMITER ; 
-- 다시 구분자를 ; 세미콜론으로 변경 


-- 프로시저를 만들었으면 프로시저 호출해서 사용 
CALL 송금하기(); 

select * from accounts; 