select * from members;
insert into members values('test','1234','테스트','test@com','01000000000','hello','hi',0,1);
insert into members values('test2','1234','홍길동','test1@com','01051215121','hello','12',0,1);
insert into members values('test3','3457','김길동','test2@com','01033545811','hello','34',0,1);
insert into members values('test4','5321','김사랑','test3@com','01055321512','hello','45',0,1);
insert into members values('test5','0011','원빈','test4@com','01070405052','hello','56',0,1);
commit;

select * from profiles;
insert into profiles values('test','abcd','abcd01','내 프로필','내 미니홈피','안녕~',1);
insert into profiles values('test2','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);
insert into profiles values('test3','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);
insert into profiles values('test4','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);
insert into profiles values('test5','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);

select * from goods;
insert into goods values('mu01',200,'프리스타일-Y','프리스타일.jpg','music');
insert into goods values('mu02',190,'이은미-애인있어요','프리스타일.jpg','music');
insert into goods values('mu03',210,'MC몽-180도','180도.jpg','music');
insert into goods values('bg01',60,'반짝배경','starbg.jpg','background');
insert into goods values('bg02',70,'하와이배경','hawai.jpg','background');

select * from purchase;
insert into purchase values(1,'test','mu01',sysdate);
insert into purchase values(2,'test2','mu02',sysdate);
insert into purchase values(3,'test3','bg02',sysdate);
select * from basicsetting;
insert into basicsetting values(1,'music',1,'test',1);
insert into basicsetting values(3,'bacground',1,'test3',3);
select * from board;
insert into board values(1,'test','테스트제목','테스트내용',1,sysdate);
insert into board values(2,'test','테스트제목','테스트내용',1,sysdate);
insert into board values(3,'test','테스트제목','테스트내용',1,sysdate);
insert into board values(4,'test','테스트제목','테스트내용',1,sysdate);

commit;