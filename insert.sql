select * from members;
insert into members values('test','1234','�׽�Ʈ','test@com','01000000000','hello','hi',0,1);
insert into members values('test2','1234','ȫ�浿','test1@com','01051215121','hello','12',0,1);
insert into members values('test3','3457','��浿','test2@com','01033545811','hello','34',0,1);
insert into members values('test4','5321','����','test3@com','01055321512','hello','45',0,1);
insert into members values('test5','0011','����','test4@com','01070405052','hello','56',0,1);
commit;

select * from profiles;
insert into profiles values('test','abcd','abcd01','�� ������','�� �̴�Ȩ��','�ȳ�~',1);
insert into profiles values('test2','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);
insert into profiles values('test3','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);
insert into profiles values('test4','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);
insert into profiles values('test5','vasda','vasda','�׽�Ʈ ������','�̴�Ȩ�� ����','����~',1);

select * from goods;
insert into goods values('mu01',200,'������Ÿ��-Y','������Ÿ��.jpg','������Ÿ��.jpg','music');
insert into goods values('mu02',190,'������-�����־��','������Ÿ��.jpg','������Ÿ��.jpg','music');
insert into goods values('mu03',210,'MC��-180��','180��.jpg','180��.jpg','music');
insert into goods values('bg01',60,'��¦���','starbg.jpg','starbg.jpg','background');
insert into goods values('bg02',70,'�Ͽ��̹��','hawai.jpg','hawai.jpg','background');

select * from purchase;
insert into purchase values(1,'test','mu01',sysdate);
insert into purchase values(2,'test2','mu02',sysdate);
insert into purchase values(3,'test3','bg02',sysdate);
select * from basicsetting;
insert into basicsetting values(1,'music',1,'test',1);
insert into basicsetting values(3,'bacground',1,'test3',3);
select * from board;
insert into board values(1,'test','�׽�Ʈ����','�׽�Ʈ����',1,sysdate);
insert into board values(2,'test','�׽�Ʈ����','�׽�Ʈ����',1,sysdate);
insert into board values(3,'test','�׽�Ʈ����','�׽�Ʈ����',1,sysdate);
insert into board values(4,'test','�׽�Ʈ����','�׽�Ʈ����',1,sysdate);

commit;