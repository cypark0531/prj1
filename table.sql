
/* Drop Tables */

DROP TABLE basicsetting CASCADE CONSTRAINTS;
DROP TABLE basket CASCADE CONSTRAINTS;
DROP TABLE boardreply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE diary CASCADE CONSTRAINTS;
DROP TABLE friend CASCADE CONSTRAINTS;
DROP TABLE friendsay CASCADE CONSTRAINTS;
DROP TABLE galery CASCADE CONSTRAINTS;
DROP TABLE REFUND CASCADE CONSTRAINTS;
DROP TABLE purchase CASCADE CONSTRAINTS;
DROP TABLE GOODS CASCADE CONSTRAINTS;
DROP TABLE histories CASCADE CONSTRAINTS;
DROP TABLE profiles CASCADE CONSTRAINTS;
DROP TABLE schedule CASCADE CONSTRAINTS;
DROP TABLE visit CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;




/* Create Tables */

-- ��ǥ�������̺�
CREATE TABLE basicsetting
(
	-- �⺻������ȣ
	bsnum number(10) NOT NULL,
	-- ��ǥ����ī�װ�
	bscategory varchar2(20),
	-- ��ǥ����
	bsset number(2),
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ���Ź�ȣ
	purnum number(10) NOT NULL,
	PRIMARY KEY (bsnum)
);


-- ��ٱ���
CREATE TABLE basket
(
	-- �ٽ��Ϲ�ȣ
	basnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
    --����
    gsaveimg varchar2(30),
	gorgimg varchar2(30),
    -- ��ǰ����
	gprice number(10) NOT NULL,
    --��ǰ�̸�
    gname varchar2(100) NOT NULL UNIQUE,
	-- ��ǰ�ڵ�
	gcode varchar2(20) NOT NULL,
	-- ī�װ�
	gcategory varchar2(10),
	PRIMARY KEY (basnum)
);


-- �Խ���
CREATE TABLE board
(
	-- �Խ��ǹ�ȣ
	bnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- �Խ�������
	btitle varchar2(20) NOT NULL,
	-- �Խ��Ǳ�
	bcontent varchar2(200) NOT NULL,
	-- �Խ��� ����
	bopen number(3) NOT NULL,
	-- ��¥
	regdate date,
	PRIMARY KEY (bnum)
);


-- �Խ��� ���
CREATE TABLE boardreply
(
	-- �Խ��Ǵ�۹�ȣ
	BRNUM number(10) NOT NULL,
	-- �Խ��ǹ�ȣ
	bnum number(10) NOT NULL,
	-- ȣ��Ʈ���̵�
	hid varchar2(20) NOT NULL,
	-- ��۳���
	brcontent varchar2(100) NOT NULL,
	-- �Խ��Ǳ׷�
	bgroup number(10),
	-- �Խ��Ǵ���
	brlevel number(3),
	-- �Խ��Ǵ����¼���
	brstep number(3),
	-- �۾���
	gid varchar2(20) NOT NULL,
	-- ���۳�¥
	regdate date,
	PRIMARY KEY (BRNUM)
);


-- ���̾
CREATE TABLE diary
(
	-- ���̾��ȣ
	dnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ���̾����
	dcontent varchar2(200),
	-- ���̾����
	dopen number(3),
	-- ��¥
	regdate date,
	PRIMARY KEY (dnum)
);


-- ���̸α�
CREATE TABLE friend
(
	-- ģ����ȣ
	friendnum number(10) NOT NULL,
	-- ȣ��Ʈ���̵�
	hid varchar2(20) NOT NULL,
	-- �Խ�Ʈ���̵�
	gid varchar2(20) NOT NULL,
	-- ���̻���
	friendstate varchar2(2),
	PRIMARY KEY (friendnum)
);


-- ������
CREATE TABLE friendsay
(
	-- �������ȣ
	fsnum number(10) NOT NULL,
	-- ȣ��Ʈ���̵�
	hid varchar2(20) NOT NULL,
	-- ������ ����
	fscontent varchar2(100),
	-- ����������¼���
	fsstep number(10),
	-- ��������
	fsgroup number(10),
	-- ��¥
	regdate date,
	-- �۾���
	gid varchar2(20) NOT NULL,
	PRIMARY KEY (fsnum)
);


-- ������
CREATE TABLE gallery
(
	-- ��������ȣ
	galnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ����������
	galtitle varchar2(100),
	-- ������ ����
	galcontent varchar2(500),
	-- ������ ����
	galorgname varchar2(100),
	-- ������ �����̸�
	galsavename varchar2(100),
	-- ������ ����
	galopen number(3),
	-- ��¥
	regdate date,
	PRIMARY KEY (galnum)
);


-- ��ǰ
CREATE TABLE GOODS
(
	-- ��ǰ�ڵ�
	gcode varchar2(20) NOT NULL,
	-- ��ǰ����
	gprice number(10) NOT NULL,
	-- ��ǰ�̸�
	gname varchar2(100) NOT NULL UNIQUE,
	-- ��ǰ����
	gsaveimg varchar2(30),
	gorgimg varchar2(30),
	--��ũ
	 glink varchar2(100) UNIQUE,
	-- ī�װ�
	gcategory varchar2(10),
	PRIMARY KEY (gcode)
);


-- ����
CREATE TABLE histories
(
	-- ���Ϲ�ȣ
	hnum number(10) NOT NULL,
	-- ȣ��Ʈ���̵�
	hid varchar2(20) NOT NULL,
	-- ���� ����
	htitle varchar2(30) NOT NULL,
	-- ���� ����
	hcontent varchar2(300) NOT NULL,
	-- �۾���
	gid varchar2(20) NOT NULL,
	-- ��¥
	regdate date,
	PRIMARY KEY (hnum)
);


-- ȸ��
CREATE TABLE members
(
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ��й�ȣ
	pwd varchar2(20) NOT NULL,
	-- �̸�
	name varchar2(20) NOT NULL UNIQUE,
	-- �̸���
	email varchar2(30) NOT NULL UNIQUE,
	-- ��ȭ��ȣ
	phone varchar2(15) NOT NULL UNIQUE,
	-- ����
	question varchar2(30),
	-- �亯
	answer varchar2(20) NOT NULL,
	-- ĳ��
	money number(10),
	-- Ȱ��ȭ
	active number(2),
	PRIMARY KEY (id)
);


-- ������
CREATE TABLE profiles
(
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- �������̹���
	porgimg varchar2(100),
	-- �����ʴ�ȭ��(����)
	psaveimg varchar2(100),
	-- �����ʴ�ȭ��(����)
	ptitle varchar2(100),
	-- Ȩ�� ����
	htitle varchar2(100),
	-- �������ڱ�Ұ�
	pintro varchar2(500),
	-- �����ʰ���
	popen number(2),
	PRIMARY KEY (id)
);


-- ���Ÿ��
CREATE TABLE purchase
(
	-- ���Ź�ȣ
	purnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ��ǰ�ڵ�
	gcode varchar2(20) NOT NULL,
	-- ��ǰ����
	gprice number(10) NOT NULL,
	-- ��¥
	regdate date,
	PRIMARY KEY (purnum)
);


-- ȯ��
CREATE TABLE REFUND
(
	-- ȯ�ҹ�ȣ
	refnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ��ǰ�ڵ�
	gcode varchar2(20) NOT NULL,
	-- ȯ�һ���
	refstate number(2),
	-- ���Ź�ȣ
	purnum number(10) NOT NULL,
	-- ��¥
	regdate date,
	PRIMARY KEY (refnum)
);


-- �����췯
CREATE TABLE schedule
(
	-- �����췯��ȣ
	schnum number(10) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ������ ����
	schtitle varchar2(20) NOT NULL,
	-- �����쳻��
	schcontent varchar2(20) NOT NULL,
	-- �������������
	schopen number(3) NOT NULL,
	-- �����쳯¥
	schdate date NOT NULL,
	PRIMARY KEY (schnum)
);


-- �湮��
CREATE TABLE visit
(
	-- �湮��ȣ
	vnum number(20) NOT NULL,
	-- ���̵�
	id varchar2(20) NOT NULL,
	-- ���� �湮�ڼ�
	dayvisitnum number(10),
	-- ��¥
	regdate date,
	PRIMARY KEY (vnum)
);
--������
create table STORAGEBOX(
  --���� ��ȣ (������)
   anum number(10) not null primary key,
   --���̵�
   id varchar2(20) not null,
   --��ǰ �ڵ�
   gcode varchar2(20) NOT NULL,
   --���� ��ũ
   glink varchar2(100) UNIQUE,
   -- ��ǰ����
	gsaveimg varchar2(30),
	gorgimg varchar2(30),
	gname varchar2(20),
	purnum number(10),
	--ī�װ�
	gcategory varchar2(20),
	basicsetting number(2)
  );



/* Create Foreign Keys */

ALTER TABLE boardreply
	ADD FOREIGN KEY (bnum)
	REFERENCES board (bnum)
	ON DELETE CASCADE
;


ALTER TABLE basket
	ADD FOREIGN KEY (gcode)
	REFERENCES GOODS (gcode)
	ON DELETE CASCADE
;


ALTER TABLE purchase
	ADD FOREIGN KEY (gcode)
	REFERENCES GOODS (gcode)
	ON DELETE CASCADE
;


ALTER TABLE REFUND
	ADD FOREIGN KEY (gcode)
	REFERENCES GOODS (gcode)
	ON DELETE CASCADE
;


ALTER TABLE basicsetting
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE basket
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE boardreply
	ADD FOREIGN KEY (hid)
	REFERENCES members (id)
;


ALTER TABLE boardreply
	ADD FOREIGN KEY (gid)
	REFERENCES members (id)
;


ALTER TABLE diary
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE friend
	ADD FOREIGN KEY (hid)
	REFERENCES members (id)
;


ALTER TABLE friend
	ADD FOREIGN KEY (gid)
	REFERENCES members (id)
;


ALTER TABLE friendsay
	ADD FOREIGN KEY (gid)
	REFERENCES members (id)
;


ALTER TABLE friendsay
	ADD FOREIGN KEY (hid)
	REFERENCES members (id)
;


ALTER TABLE galery
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE histories
	ADD FOREIGN KEY (hid)
	REFERENCES members (id)
;


ALTER TABLE histories
	ADD FOREIGN KEY (gid)
	REFERENCES members (id)
;


ALTER TABLE profiles
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE purchase
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE REFUND
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE schedule
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE visit
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE basicsetting
	ADD FOREIGN KEY (purnum)
	REFERENCES purchase (purnum)
	ON DELETE CASCADE
;
ALTER TABLE REFUND
	ADD FOREIGN KEY (purnum)
	REFERENCES purchase (purnum)
	ON DELETE CASCADE
;
ALTER TABLE STORAGEBOX
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
	ON DELETE CASCADE
;
ALTER TABLE STORAGEBOX
	ADD FOREIGN KEY (purnum)
	REFERENCES purchase (purnum)
	ON DELETE CASCADE
;




