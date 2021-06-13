Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test','1234','테스트','test@com','01000000000','hello','hi',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test5','0011','원빈','test4@com','01070405052','hello','56',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test4','5321','김사랑','test3@com','01055321512','hello','45',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test3','3457','김길동','test2@com','01033545811','hello','34',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test2','1234','홍길동','test1@com','01051215121','hello','12',0,1);

Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test','abcd','abcd01','내 프로필','내 미니홈피','안녕~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test2','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test3','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test4','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test5','vasda','vasda','테스트 프로필','미니홈피 설정','하위~',1);


create sequence gallery_seq;
create sequence schedule_seq;
create sequence profile_seq;
create sequence friend_seq;
create sequence storagebox_seq;



Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('mu01',200,'프리스타일-Y','프리스타일.jpg','music');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('mu02',190,'이은미-애인있어요','프리스타일.jpg','music');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('mu03',210,'MC몽-180도','180도.jpg','music');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('bg01',60,'반짝배경','starbg.jpg','background');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('bg02',70,'하와이배경','hawai.jpg','background');

Insert into SCOTT.PURCHASE (PURNUM,ID,GCODE,REGDATE) values (1,'test','mu01',to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.PURCHASE (PURNUM,ID,GCODE,REGDATE) values (2,'test2','mu02',to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.PURCHASE (PURNUM,ID,GCODE,REGDATE) values (3,'test3','bg02',to_date('21/05/31','RR/MM/DD'));

Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (7,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (8,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (9,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (10,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (11,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (12,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (13,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (14,'test','테스트1','이건',3,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (15,'test','테스트2','몰랐지',2,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (16,'test','a','b',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (1,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (2,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (3,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (4,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (5,'test2','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (6,'test','테스트제목','테스트내용',1,to_date('21/05/31','RR/MM/DD'));


commit;