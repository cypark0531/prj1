Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test','1234','�׽�Ʈ','test@com','01000000000','hello','hi',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test5','0011','����','test4@com','01070405052','hello','56',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test4','5321','����','test3@com','01055321512','hello','45',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test3','3457','��浿','test2@com','01033545811','hello','34',0,1);
Insert into SCOTT.MEMBERS (ID,PWD,NAME,EMAIL,PHONE,QUESTION,ANSWER,MONEY,ACTIVE) values ('test2','1234','ȫ�浿','test1@com','01051215121','hello','12',0,1);

Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test','abcd','abcd01','�� ������','�� �̴�Ȩ��','�ȳ�~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test2','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test3','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test4','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);
Insert into PROFILES (ID,PORGIMG,PSAVEIMG,PTITLE,HPTITLE,PINTRO,POPEN) values ('test5','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);


create sequence gallery_seq;
create sequence schedule_seq;
create sequence profile_seq;
create sequence friend_seq;
create sequence storagebox_seq;



Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('mu01',200,'������Ÿ��-Y','������Ÿ��.jpg','music');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('mu02',190,'������-�����־��','������Ÿ��.jpg','music');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('mu03',210,'MC��-180��','180��.jpg','music');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('bg01',60,'��¦���','starbg.jpg','background');
Insert into SCOTT.GOODS (GCODE,GPRICE,GNAME,GIMG,GCATEGORY) values ('bg02',70,'�Ͽ��̹��','hawai.jpg','background');

Insert into SCOTT.PURCHASE (PURNUM,ID,GCODE,REGDATE) values (1,'test','mu01',to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.PURCHASE (PURNUM,ID,GCODE,REGDATE) values (2,'test2','mu02',to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.PURCHASE (PURNUM,ID,GCODE,REGDATE) values (3,'test3','bg02',to_date('21/05/31','RR/MM/DD'));

Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (7,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (8,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (9,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (10,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (11,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (12,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (13,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (14,'test','�׽�Ʈ1','�̰�',3,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (15,'test','�׽�Ʈ2','������',2,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (16,'test','a','b',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (1,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (2,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (3,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (4,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (5,'test2','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));
Insert into SCOTT.BOARD (BNUM,ID,BTITLE,BCONTENT,BOPEN,REGDATE) values (6,'test','�׽�Ʈ����','�׽�Ʈ����',1,to_date('21/05/31','RR/MM/DD'));


commit;