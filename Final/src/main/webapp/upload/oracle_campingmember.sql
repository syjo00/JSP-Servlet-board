create table camping_member(
    id varchar2(30) primary key,
	passwd1 varchar2(30),
	name varchar2(30),
	email varchar2(30),
	phone varchar2(20),
	hobby varchar2(25),
	job varchar2(20),
	age varchar2(5),
	info varchar2(2000),
	reg_date timestamp
);

drop table camping_member;

delete from camping_member where id = 'hyun';

select * from camping_member;

commit

--시퀀스 생성
create sequence smartBoard_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 1000
	nocycle
	nocache;

--게시판 테이블 생성
create table smartBoard (
	num number primary key,
	writer varchar2(30) not null,
	email varchar2(40) not null,
	subject varchar2(50) not null,
	password varchar2(20) not null,
	reg_date Date,
	ref number,
	re_step number,
	re_level number,
	readCount number,
	content varchar2(500) not null
);

select * from tab;
select * from SMARTBOARD;

commit

-- oracle DB의 특성
번호가 1부터 나오지 않습니다.
서버를 내리고 다음날에 데이터를 입력하면 예측불가능한 시퀀스가 생성되어 사용됩니다.






