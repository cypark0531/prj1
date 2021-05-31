select * from members;
insert into members values('test','1234','占쌓쏙옙트','test@com','01000000000','hello','hi',0,1);
insert into members values('test2','1234','홍占썸동','test1@com','01051215121','hello','12',0,1);
insert into members values('test3','3457','占쏙옙役�','test2@com','01033545811','hello','34',0,1);
insert into members values('test4','5321','占쏙옙占쏙옙','test3@com','01055321512','hello','45',0,1);
insert into members values('test5','0011','占쏙옙占쏙옙','test4@com','01070405052','hello','56',0,1);
commit;

select * from profiles;
insert into profiles values('test','abcd','abcd01','占쏙옙 占쏙옙占쏙옙占쏙옙','占쏙옙 占싱댐옙홈占쏙옙','占싫놂옙~',1);
insert into profiles values('test2','vasda','vasda','占쌓쏙옙트 占쏙옙占쏙옙占쏙옙','占싱댐옙홈占쏙옙 占쏙옙占쏙옙','占쏙옙占쏙옙~',1);
insert into profiles values('test3','vasda','vasda','占쌓쏙옙트 占쏙옙占쏙옙占쏙옙','占싱댐옙홈占쏙옙 占쏙옙占쏙옙','占쏙옙占쏙옙~',1);
insert into profiles values('test4','vasda','vasda','占쌓쏙옙트 占쏙옙占쏙옙占쏙옙','占싱댐옙홈占쏙옙 占쏙옙占쏙옙','占쏙옙占쏙옙~',1);
insert into profiles values('test5','vasda','vasda','占쌓쏙옙트 占쏙옙占쏙옙占쏙옙','占싱댐옙홈占쏙옙 占쏙옙占쏙옙','占쏙옙占쏙옙~',1);

select * from goods;
insert into goods values('mu01',200,'占쏙옙占쏙옙占쏙옙타占쏙옙-Y','占쏙옙占쏙옙占쏙옙타占쏙옙.jpg','占쏙옙占쏙옙占쏙옙타占쏙옙.jpg','music');
insert into goods values('mu02',190,'占쏙옙占쏙옙占쏙옙-占쏙옙占쏙옙占쌍억옙占�','占쏙옙占쏙옙占쏙옙타占쏙옙.jpg','占쏙옙占쏙옙占쏙옙타占쏙옙.jpg','music');
insert into goods values('mu03',210,'MC占쏙옙-180占쏙옙','180占쏙옙.jpg','180占쏙옙.jpg','music');
insert into goods values('bg01',60,'占쏙옙짝占쏙옙占�','starbg.jpg','starbg.jpg','background');
insert into goods values('bg02',70,'占싹울옙占싱뱄옙占�','hawai.jpg','hawai.jpg','background');

select * from purchase;
insert into purchase values(1,'test','mu01',sysdate);
insert into purchase values(2,'test2','mu02',sysdate);
insert into purchase values(3,'test3','bg02',sysdate);
select * from basicsetting;
insert into basicsetting values(1,'music',1,'test',1);
insert into basicsetting values(3,'background',1,'test3',3);
select * from board;
insert into board values(1,'test','占쌓쏙옙트占쏙옙占쏙옙','占쌓쏙옙트占쏙옙占쏙옙',1,sysdate);
insert into board values(2,'test','占쌓쏙옙트占쏙옙占쏙옙','占쌓쏙옙트占쏙옙占쏙옙',1,sysdate);
insert into board values(3,'test','占쌓쏙옙트占쏙옙占쏙옙','占쌓쏙옙트占쏙옙占쏙옙',1,sysdate);
insert into board values(4,'test','占쌓쏙옙트占쏙옙占쏙옙','占쌓쏙옙트占쏙옙占쏙옙',1,sysdate);

commit;