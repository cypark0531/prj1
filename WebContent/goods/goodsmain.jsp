<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<%
  String id = request.getParameter("id");
%>
</head>
<body>
<h1>GOODS</h1>
<form action="${pageContext.request.contextPath }/goods/goodsadd.jsp">
  <input type="submit" value="상품추가">
</form>
<form action="${pageContext.request.contextPath }/goods/goodslist">
  <input type="hidden" name="id" value="test1">
  <input type="submit" value="상품목록">
</form>
<form action="${pageContext.request.contextPath }/refund/refundlist">
  <input type="hidden" name="id" value="test1">
  <input type="submit" value="환불목록">
<!-- 
  수정
  장바구니 테이블 table 변경
  구매목록에서 gprice 컬럼 추가시킴 (gprice값을 받아와서 refund에 보내줘야되는데 gprice값을 못얻어와서)
  goods table에 glink컬럼 추가시킴(bgm링크를 받아와야함)

  환불 상태를 업데이트해서 완료하기
  ex)환불안함 0 환불대기상태 1 환불완료 2
  환불 신청을 하면 환불신청(1) 리스트만들고 고객환불리스트는 환불대기상태(리스트)로 저장 <-관리자만 들어갈수있게 만들어야되나?
  관리자가 환불리스트에서 환불수락 누르면 고객환불리스트에 환불완료라고 업데이트(2)되게 만들고 money 추가??
  *****이거 잘 모르겠음
  
  bgm을 src로 저장하기 
  goods테이블에 컬럼을 추가해서 거기에 link를 주고 홈컨트롤러에서 새창(보관함)으로뛰워서 음악 변경(버튼에 hidden으로 link값을 넘김)누르면 
  music.jsp에 requestScope.link로 넘겨서 변경할 수 있도록 하면될것같은데...? 할려고 그랬으나 내 능력으론 안됨....
  그래서 일단은 페이지 이동으로 해야될듯하다.
  https://sites.google.com/site/gdocs2direct/(다이렉트연결 링크 생성)
  https://drive.google.com/uc?export=download&id=1Wj2TOzTKCwpWjilAJSlstLKAlrjycIRK 눈사람
  https://drive.google.com/uc?export=download&id=1ieBCxuxTAxEUF9RnqHd5p28PaIp8xGRX 상상더하기
  https://drive.google.com/uc?export=download&id=1YjVNrvzGIwtbSyyrzXw50c4mtmxVgGbV celebrity
  https://www.klickaud.co/ 음원 다운(사운드클라우드 링크)
  구매하면 보관함에 insert 시켜야됨
  환불되면 보관함에서 delete 되야됨
  
  보관함 목록(링크있어야됨) 구현<= 이거 구매목록 테이블 재사용하면 안되나?
  create table STORAGE_BOX(보관함)(
  --보관 번호 (시퀸스)
   anum number(10) not null primary key,
   --아이디
   id varchar2(20) not null fk,
   --상품 코드
   gcode varchar2(20) NOT NULL,
   --음악 링크
   glink varchar2(100),
   -- 상품사진
	gsaveimg varchar2(30),
	gorgimg varchar2(30),
	--카테고리
	gcategory varchar2(20)
  );
  
  아이디가 없을경우 구매,장바구니,목록을 누르면 로그인창으로 갈수있도록 만들고싶음
 
-->
</form>
</body>
</html>