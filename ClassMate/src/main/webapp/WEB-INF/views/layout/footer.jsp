<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
  // 모달 열기
  function openModal(modalname) {
    $("#modal").fadeIn(300);
    $("." + modalname).fadeIn(300);


  };
  function openModal2(modalname) {
    $("#modal2").fadeIn(300);
    $("." + modalname).fadeIn(300);
    

  };
  
  function openModal3(modalname) {
    $("#modal3").fadeIn(300);
    $("." + modalname).fadeIn(300);


  };
  

  // 외부 영역 클릭시 팝업 닫기
  $(document).mouseup(function (e) {
    var modal = $(".modal-con");
    if (!modal.is(e.target) && modal.has(e.target).length === 0) {
      $("#modal").fadeOut(300);
      modal.fadeOut(300);
	

     	$('html, body').css({ 'overflow': 'auto', 'height': '100%' });
    	  

      

    }
  });
  
  // 외부 영역 클릭시 팝업 닫기
   $(document).mouseup(function (e) {
    var modal2 = $(".modal-con2");
    if (!modal2.is(e.target) && modal2.has(e.target).length === 0) {
      $("#modal2").fadeOut(300);
      modal2.fadeOut(300);
	

      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });


      
      
    }
  }); 
  
  
  // 외부 영역 클릭시 팝업 닫기
  $(document).mouseup(function (e) {
    var modal3 = $(".modal-con3");
    if (!modal3.is(e.target) && modal3.has(e.target).length === 0) {
      $("#modal3").fadeOut(300);
      modal3.fadeOut(300);


     $('html, body').css({ 'overflow': 'auto', 'height': '100%' });


      
      
    }
  });
  
  //닫기 버튼 클릭시 팝업 닫기
  $(function(){
	  $("#closeModal").click(function (e) {
		    var modal = $(".modal-con");
		      $("#modal").fadeOut(300);
		      modal.fadeOut(300);
		      
		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });
		    
	});
});

  //닫기 버튼 클릭시 팝업 닫기
  $(function(){
	   $("#closeModal2").click(function (e) {
		    var modal2 = $(".modal-con2");
		      $("#modal2").fadeOut(300);
		      modal2.fadeOut(300);

		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });

	}); 
});
  
  //닫기 버튼 클릭시 팝업 닫기
  $(function(){
	   $("#closeModal3").click(function (e) {
		    var modal3 = $(".modal-con3");
		      $("#modal3").fadeOut(300);
		      modal3.fadeOut(300);

		      $('html, body').css({ 'overflow': 'auto', 'height': '100%' });

	}); 
});
  
$(document).ready(function () {
	//사이트 소개
	// 마우스를 올리면 글자색과 언더라인 변경
	$("#terms1").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "underline");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "none");
	    }
	});
	
	//이용약관
	// 마우스를 올리면 글자색과 언더라인 변경
	$("#terms2").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "underline");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "none");
	    }
	});
	
	//이용약관 닫기
	// 마우스를 올리면 글자색과 언더라인 변경
	$("#closeModal").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "underline");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "none");
	    }
	});
	
	//개인 정보 처리 방침
	// 마우스를 올리면 글자색과 언더라인 변경
	$("#terms3").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "underline");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "none");
	    }
	});
	
	//개인 정보 처리 방침 닫기
	// 마우스를 올리면 글자색과 언더라인 변경
	$("#closeModal2").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "underline");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "none");
	    }
	});
	
	//위치 기반 서비스 이용 약관
	// 마우스를 올리면 글자색과 언더라인 변경
	$("#terms4").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "underline");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "none");
	    }
	});
	
	//위치 기반 서비스 이용 약관 닫기
	// 마우스를 올리면 글자색과 언더라인 변경
	$("#closeModal3").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "underline");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("text-decoration", "none");
	    }
	});
});


</script>

<style type="text/css">

#modal{
  display:none;
  position:fixed; z-index: 10;
  width:100%; height:100%;
  top:0; left:0;
  background:rgba(0,0,0,0.3);
}


.modal-con{
  display:none;
  position:fixed; z-index: 10;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 40%;
  min-height: 85%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
  background : #000;
  color: #fff;
  text-align: center;
  margin-top: 30px;
  position: relative; z-index: 10;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
  height: 50vh;
  overflow-y: auto; 
  position: relative; z-index: 10;
}

#modal2{
  display:none;
  position:fixed; z-index: 10; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}


.modal-con2{
  display:none;
  position:fixed; z-index: 10;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 40%;
  min-height: 85%;
  background:#fff;
}
.modal-con2 .title2{
  font-size:20px; 
  padding: 20px; 
  background : #000;
  color: #fff;
  text-align: center;
  margin-top: 30px;
  position:relative; z-index: 10;
}
.modal-con2 .con2{
  font-size:15px; line-height:1.3;
  padding: 30px;
  height: 50vh;
  overflow-y: auto;
  position:relative; z-index: 10; 
}


#modal3{
  display:none;
  position:fixed; z-index: 10;
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}


.modal-con3{
  display:none;
  position:fixed; z-index: 10;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 40%;
  min-height: 85%;
  background:#fff;
}
.modal-con3 .title3{
  font-size:20px; 
  padding: 20px; 
  background : #000;
  color: #fff;
  text-align: center;
  margin-top: 30px;
  position:relative; z-index: 10;
}
.modal-con3 .con3{
  font-size:15px; line-height:1.3;
  padding: 30px;
  height: 50vh;
  overflow-y: auto; 
  position:relative; z-index: 10;
}


.vl {
    border-left: 2px solid #DBDCDD;
    height: 15px;
}





.subtilte{
	text-align: center;
	margin-top: 25px;
	color: gray;
	font-size: 18px;
	
}

.terms{
	font-size: 14px;
}

.closeModal{
	text-decoration: none;
	color: black;
}


</style>

</body>

<hr>
<div class="footer" style="margin-left: 180px; margin-bottom: 70px;">

<div id="modal" class="close"></div>
  <div class="modal-con modal1" style="border-radius: 8px;">
    <p class="title"><strong>이용약관</strong></p>
    <div>
    <p class="subtilte"><strong>ClassMate의 회원 약관은 다음과 같습니다</strong></p>
    </div>
    <div class="con" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">

	<c:import url="/WEB-INF/views/main/useTerms.jsp"></c:import>

    </div>
    <div style="text-align: center;">
    	<a href="javascript:return false;" class="closeModal" id="closeModal" style="text-decoration: none; color: black;">닫기</a>
    </div>
  </div>

<div id="modal2" class="close2"></div>
  <div class="modal-con2 modal2" style="border-radius: 8px;">
    <p class="title2"><strong>개인 정보 처리 방침</strong></p>
    <div>
    <p class="subtilte"><strong>ClassMate의 개인 정보 처리 방침은 다음과 같습니다</strong></p>
    </div>
    <div class="con2" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">

	<c:import url="/WEB-INF/views/main/privacyPolicy.jsp"></c:import>

    </div>
        <div style="text-align: center;">
    	<a href="javascript:return false;" class="closeModal" id="closeModal2" style="text-decoration: none; color: black;">닫기</a>
    </div>
  </div>

<div id="modal3" class="close3"></div>
  <div class="modal-con3 modal3" style="border-radius: 8px;">
    <p class="title3"><strong>위치 기반 서비스 이용약관</strong></p>
    <div>
    <p class="subtilte"><strong>ClassMate의 위치 기반 서비스에 관련된 이용약관은 아래와 같습니다.</strong></p>
    </div>
    <div class="con3" style="border: 0.5px solid #80808080; margin: 43px; margin-top: 25px;">
    
	<c:import url="/WEB-INF/views/main/locationBased.jsp"></c:import>
    
    </div>
        <div style="text-align: center;">
    	<a href="javascript:return false;" class="closeModal" id="closeModal3" style="text-decoration: none; color: black;">닫기</a>
    </div>
  </div>
    


<table>
	<tr>
		<td style="padding-right: 15px;"><a href="/main/site" class="terms" style="text-decoration: none; color: black;" id="terms1">사이트 소개</a></td>
		<td style="padding-right: 15px;"><div class="vl"></div></td>
		<td style="padding-right: 15px;"><a href="javascript:openModal('modal1');" class="terms" style="text-decoration: none; color: black;" id="terms2">이용약관</a></td>
		<td style="padding-right: 15px;"><div class="vl"></div></td>
		<td style="padding-right: 15px;"><a href="javascript:openModal2('modal2');" class="terms" style="text-decoration: none; color: black;" id="terms3">개인 정보 처리 방침</a></td>
		<td style="padding-right: 15px;"><div class="vl"></div></td>
		<td style="padding-right: 15px;"><a href="javascript:openModal3('modal3');" class="terms" style="text-decoration: none; color: black;" id="terms4">위치 기반 서비스 이용 약관</a></td>
	</tr>
</table>
<br><br>
<span style="color: #464646;"><small>사업자등록번호 : xxx-81-00277</small></span><br>
<span style="color: #464646;"><small>이메일 : ask@101.inc</small></span><br>
<span style="color: #464646;"><small>대표전화 : 1800-2109</small></span><br>
<span style="color: #464646;"><small>광고 제휴 : yeah0203@naver.com</small></span><br>
<span style="color: #464646;"><small>서울특별시 강남구 테헤란로 xxx, 1-11층, 13층(역삼동, 호산빌딩)</small></span>




</div>

</html>