
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

-- 대표설정테이블
CREATE TABLE basicsetting
(
	-- 기본설정번호
	bsnum number(10) NOT NULL,
	-- 대표설정카테고리
	bscategory varchar2(20),
	-- 대표설정
	bsset number(2),
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 구매번호
	purnum number(10) NOT NULL,
	PRIMARY KEY (bsnum)
);


-- 장바구니
CREATE TABLE basket
(
	-- 바스켓번호
	basnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
    --사진
    gsaveimg varchar2(30),
	gorgimg varchar2(30),
    -- 상품가격
	gprice number(10) NOT NULL,
    --상품이름
    gname varchar2(100) NOT NULL UNIQUE,
	-- 상품코드
	gcode varchar2(20) NOT NULL,
	-- 카테고리
	gcategory varchar2(10),
	PRIMARY KEY (basnum)
);


-- 게시판
CREATE TABLE board
(
	-- 게시판번호
	bnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 게시판제목
	btitle varchar2(20) NOT NULL,
	-- 게시판글
	bcontent varchar2(200) NOT NULL,
	-- 게시자 공개
	bopen number(3) NOT NULL,
	-- 날짜
	regdate date,
	PRIMARY KEY (bnum)
);


-- 게시판 댓글
CREATE TABLE boardreply
(
	-- 게시판댓글번호
	BRNUM number(10) NOT NULL,
	-- 게시판번호
	bnum number(10) NOT NULL,
	-- 호스트아이디
	hid varchar2(20) NOT NULL,
	-- 댓글내용
	brcontent varchar2(100) NOT NULL,
	-- 게시판그룹
	bgroup number(10),
	-- 게시판대댓글
	brlevel number(3),
	-- 게시판댓글출력순서
	brstep number(3),
	-- 글쓴이
	gid varchar2(20) NOT NULL,
	-- 대댓글날짜
	regdate date,
	PRIMARY KEY (BRNUM)
);


-- 다이어리
CREATE TABLE diary
(
	-- 다이어리번호
	dnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 다이어리내용
	dcontent varchar2(200),
	-- 다이어리공개
	dopen number(3),
	-- 날짜
	regdate date,
	PRIMARY KEY (dnum)
);


-- 일촌맺기
CREATE TABLE friend
(
	-- 친구번호
	friendnum number(10) NOT NULL,
	-- 호스트아이디
	hid varchar2(20) NOT NULL,
	-- 게스트아이디
	gid varchar2(20) NOT NULL,
	-- 일촌상태
	friendstate varchar2(2),
	PRIMARY KEY (friendnum)
);


-- 일촌평
CREATE TABLE friendsay
(
	-- 일촌평번호
	fsnum number(10) NOT NULL,
	-- 호스트아이디
	hid varchar2(20) NOT NULL,
	-- 일촌평 내용
	fscontent varchar2(100),
	-- 일촌평댓글출력순서
	fsstep number(10),
	-- 일촌평댓글
	fsgroup number(10),
	-- 날짜
	regdate date,
	-- 글쓴이
	gid varchar2(20) NOT NULL,
	PRIMARY KEY (fsnum)
);


-- 갤러리
CREATE TABLE gallery
(
	-- 갤러리번호
	galnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 갤러리제목
	galtitle varchar2(100),
	-- 갤러리 내용
	galcontent varchar2(500),
	-- 갤러리 사진
	galorgname varchar2(100),
	-- 갤러리 저장이름
	galsavename varchar2(100),
	-- 갤러리 오픈
	galopen number(3),
	-- 날짜
	regdate date,
	PRIMARY KEY (galnum)
);


-- 상품
CREATE TABLE GOODS
(
	-- 상품코드
	gcode varchar2(20) NOT NULL,
	-- 상품가격
	gprice number(10) NOT NULL,
	-- 상품이름
	gname varchar2(100) NOT NULL UNIQUE,
	-- 상품사진
	gsaveimg varchar2(30),
	gorgimg varchar2(30),
	--링크
	 glink varchar2(100) UNIQUE,
	-- 카테고리
	gcategory varchar2(10),
	PRIMARY KEY (gcode)
);


-- 방명록
CREATE TABLE histories
(
	-- 방명록번호
	hnum number(10) NOT NULL,
	-- 호스트아이디
	hid varchar2(20) NOT NULL,
	-- 방명록 제목
	htitle varchar2(30) NOT NULL,
	-- 방명록 내용
	hcontent varchar2(300) NOT NULL,
	-- 글쓴이
	gid varchar2(20) NOT NULL,
	-- 날짜
	regdate date,
	PRIMARY KEY (hnum)
);


-- 회원
CREATE TABLE members
(
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 비밀번호
	pwd varchar2(20) NOT NULL,
	-- 이름
	name varchar2(20) NOT NULL UNIQUE,
	-- 이메일
	email varchar2(30) NOT NULL UNIQUE,
	-- 전화번호
	phone varchar2(15) NOT NULL UNIQUE,
	-- 질문
	question varchar2(30),
	-- 답변
	answer varchar2(20) NOT NULL,
	-- 캐쉬
	money number(10),
	-- 활성화
	active number(2),
	PRIMARY KEY (id)
);


-- 프로필
CREATE TABLE profiles
(
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 프로필이미지
	porgimg varchar2(100),
	-- 프로필대화명(제목)
	psaveimg varchar2(100),
	-- 프로필대화명(제목)
	ptitle varchar2(100),
	-- 홈피 제목
	htitle varchar2(100),
	-- 프로필자기소개
	pintro varchar2(500),
	-- 프로필공개
	popen number(2),
	PRIMARY KEY (id)
);


-- 구매목록
CREATE TABLE purchase
(
	-- 구매번호
	purnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 상품코드
	gcode varchar2(20) NOT NULL,
	-- 상품가격
	gprice number(10) NOT NULL,
	-- 날짜
	regdate date,
	PRIMARY KEY (purnum)
);


-- 환불
CREATE TABLE REFUND
(
	-- 환불번호
	refnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 상품코드
	gcode varchar2(20) NOT NULL,
	-- 환불상태
	refstate number(2),
	-- 구매번호
	purnum number(10) NOT NULL,
	-- 날짜
	regdate date,
	PRIMARY KEY (refnum)
);


-- 스케쥴러
CREATE TABLE schedule
(
	-- 스케쥴러번호
	schnum number(10) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 스케쥴 제목
	schtitle varchar2(20) NOT NULL,
	-- 스케쥴내용
	schcontent varchar2(20) NOT NULL,
	-- 스케쥴공개여부
	schopen number(3) NOT NULL,
	-- 스케쥴날짜
	schdate date NOT NULL,
	PRIMARY KEY (schnum)
);


-- 방문자
CREATE TABLE visit
(
	-- 방문번호
	vnum number(20) NOT NULL,
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 일일 방문자수
	dayvisitnum number(10),
	-- 날짜
	regdate date,
	PRIMARY KEY (vnum)
);
--보관함
create table STORAGEBOX(
  --보관 번호 (시퀸스)
   anum number(10) not null primary key,
   --아이디
   id varchar2(20) not null,
   --상품 코드
   gcode varchar2(20) NOT NULL,
   --음악 링크
   glink varchar2(100) UNIQUE,
   -- 상품사진
	gsaveimg varchar2(30),
	gorgimg varchar2(30),
	gname varchar2(20),
	purnum number(10),
	--카테고리
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




