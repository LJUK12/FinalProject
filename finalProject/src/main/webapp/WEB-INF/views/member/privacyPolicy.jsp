<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>개인정보 처리방침</title>
      <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
      <style type="text/css">
      	#container{
			width: 60%;
			margin: 0 20%;
			text-align: center;
		}
		
		#container>h3{
			margin-bottom: 15px;
			font-size: 1.5rem;
		}
		
		.article{
			text-align:left;
		}
      </style>
   </head>
   <body>
      <div id="wrap"> 

         <!-- TOP  -->
         <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
         <br><br><br><br>
         <section>
			<div id="container">
			<div>
            <h3>개인정보 처리방침</h3>
			</div>

            <div class="article">
               <h4>1.개인정보의 수집·이용 목적 : 회원관리</h4>
               <br>
               <h4>2. 수집하는 개인정보의 항목</h4>
               <br>
               <p class="article_text">
               필수정보 : 이름, 주소, 이메일, 휴대폰번호, 비밀번호, 로그인ID
               </p>
               <br>
               <h4>3. 개인정보의 보유·이용 기간 : 회원가입일로부터 회원 탈퇴시까지</h4>
               <br>
               <p class="article_text">
               개인정보보호법에 의거 통합회원 가입 후 2년이 경과한 경우 개인정보 수집·이용에 대한 재동의가 필요하며, 재동의하지 않을 경우 회원 정보가 삭제될 수 있습니다.(재동의 대상은 로그인 시 알려드립니다.)
               </p>
               <br>
               <h4>4. 동의거부 권리 및 거부할 경우의 불이익</h4>
               <br>
               <p class="article_text">
               * 귀하는 위 사항에 대하여 동의를 거부할 권리가 있으며, 필수정보 동의 거부시에는 회원가입이 제한될 수 있음을 알려드립니다.
               </p>
               <br>
	            바나다는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항을 통하여 공지할 것입니다.<br>
	            본 약관은 22년 2월 25일부터 시행합니다.
            </div>



         	</div>
         </section>

          <!-- BOTTOM  -->
         <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />

         </div>

    </body>
</html> 