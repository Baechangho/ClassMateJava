<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    // 장바구니 또는 ON 클래스 시작하기 버튼 클릭 시
    $("button").click(function () {
        var classNo = $("#classNo").val();
        var onOff = $("#onOff").val();
        var className = $("#className").val();
        var buttonType = $(this).attr("name");

        // AJAX를 사용하여 데이터를 서버로 전송
        $.ajax({
            type: "POST",
            url: "/main/basket",
            dataType: "json",
            data: {
                classNo: classNo,
                onOff: onOff,
                className: className,
                buttonType: buttonType
            },
            success: function (response) {

                var redirectUrl = response.redirect;

                if (response.error && response.error !== "") {
                    // alert 창을 먼저 표시
                    alert(response.error);

                        if (redirectUrl) {
                            window.location.href = redirectUrl;
                        } else {
                            console.log("리다이렉트 URL이 없습니다.");
                        }

                } else if (redirectUrl) {
                    // alert 창이 필요 없는 경우 바로 페이지 전환
                    window.location.href = redirectUrl;
                } else {
                    console.log("리다이렉트 URL이 없습니다.");
                }
            },
            error: function (error) {
                console.error("전송 오류: ", error);
            }
        });
    });
     
    // 클래스 소개와 커리큘럼의 상태를 저장하는 변수들
    var classInfoContainerVisible = false;
    var classCurriculumContainerVisible = false;

    // 클래스 소개 버튼 클릭 시
    $("#classInfo").click(function () {
        var classNo = $("#classNo").val();

        $.ajax({
            url: "/main/classInfo",
            method: "GET",
            data: {
                classNo: classNo
            },
            success: function (response) {
                console.log(response);
                displayClassInfo(response);
                // 커리큘럼 컨테이너를 숨김
                $("#classCurriculumContainer").hide();
                classCurriculumContainerVisible = false;
            },
            error: function (error) {
                console.error("Ajax 요청 실패!");
                console.error(error);
            }
        });
    });
    
    function formatDate(dateString) {
        try {
            const koreanMonths = {
                '1월': 'January',
                '2월': 'February',
                '3월': 'March',
                '4월': 'April',
                '5월': 'May',
                '6월': 'June',
                '7월': 'July',
                '8월': 'August',
                '9월': 'September',
                '10월': 'October',
                '11월': 'November',
                '12월': 'December'
            };

            // 예시: "12월 3, 2023"을 "December 3, 2023"로 변환
            const parts = dateString.split(' ');
            const standardDate = koreanMonths[parts[0]] + ' ' + parts[1].replace(',', '') + ', ' + parts[2];
            
            // 이 부분을 변경하여 날짜를 파싱하도록 수정할 수 있습니다.
            const parsedDate = new Date(standardDate);

            // 필요에 따라 날짜 형식을 조정할 수 있습니다.
            const year = parsedDate.getFullYear();
            const month = String(parsedDate.getMonth() + 1).padStart(2, '0');
            const day = String(parsedDate.getDate()).padStart(2, '0');
            
            return year + '-' + month + '-' + day;
        } catch (error) {
            console.error("Error formatting date:", error);
            return dateString;
        }
    }
    
    

    function displayClassInfo(data) {
        // 클릭 상태에 따라 토글 처리
        if (classInfoContainerVisible) {
            $("#classInfoContainer").hide();
        } else {
            $("#classInfoContainer").empty();
            if (data && data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                	 var classDate = new Date(data[i].classDate);
                     var classStart = new Date(data[i].classStart);
                     var classEnd = new Date(data[i].classEnd);

                     var classDateFormatted = classDate.toISOString().split('T')[0];
                     var classStartFormatted = classStart.toISOString().split('T')[0];
                     var classEndFormatted = classEnd.toISOString().split('T')[0];


                    var htmlContent =
                        '<div style="display: flex;">' +
                        '<div style="background-color: black; font-size: 30px; color: white; flex: auto; width: 551px; height: 550px;">' +
                            '<div style="padding-top: 50px; padding-left: 50px; padding-bottom: 50px; font-size: 20px;">' +
                                '강사명 : ' + data[i].teacher + '<br><br>' +
                                '강의기간<br>' + classStartFormatted + '~' + classEndFormatted + '<br><br>' +
                                '모집기간<br>' + classDateFormatted + '~' + classStartFormatted + '<br><br>' +
                                '모집인원 : ' + data[i].maxCount + '<br>' +
                                '금액 : ' + parseInt(data[i].expense) + '<br>' +
                            '</div>' +
                        '</div>' +
                        '<div style="width: 551px;">' +
                            '<div style="text-align: center; font-size: 36px;"><strong>클래스 소개</strong></div>' +
                            '<div style="padding: 50px;">' +
                                data[i].classInfo +
                            '</div>' +
                        '</div>' +
                        '</div>';

                    $("#classInfoContainer").append(htmlContent);
                }
                $("#classInfoContainer").show();
            } else {
                $("#classInfoContainer").text("클래스 정보가 없습니다.");
            }
        }

        // 클릭 상태를 업데이트
        classInfoContainerVisible = !classInfoContainerVisible;
    }
    

    // 커리큘럼 버튼 클릭 시
    $("#classCurriculum").click(function () {
        var classNo = $("#classNo").val();

        $.ajax({
            url: "/main/classInfo",
            method: "GET",
            data: {
                classNo: classNo
            },
            success: function (response) {
                console.log(response);
                displayClassCurriculum(response);
                // 클래스 소개 컨테이너를 숨김
                $("#classInfoContainer").hide();
                classInfoContainerVisible = false;
            },
            error: function (error) {
                console.error("Ajax 요청 실패!");
                console.error(error);
            }
        });
    });

    function displayClassCurriculum(data) {
        // 클릭 상태에 따라 토글 처리
        if (classCurriculumContainerVisible) {
            $("#classCurriculumContainer").hide();
        } else {
            $("#classCurriculumContainer").empty();
            if (data && data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                	 var classDate = new Date(data[i].classDate);
                     var classStart = new Date(data[i].classStart);
                     var classEnd = new Date(data[i].classEnd);

                     var classDateFormatted = classDate.toISOString().split('T')[0];
                     var classStartFormatted = classStart.toISOString().split('T')[0];
                     var classEndFormatted = classEnd.toISOString().split('T')[0];


                    var htmlContent =
                        '<div style="display: flex;">' +
                        '<div style="background-color: black; font-size: 30px; color: white; flex: auto; width: 551px; height: 550px;">' +
                            '<div style="padding-top: 50px; padding-left: 50px; padding-bottom: 50px; font-size: 20px;">' +
                                '강사명 : ' + data[i].teacher + '<br><br>' +
                                '강의기간<br>' + classStartFormatted + '~' + classEndFormatted + '<br><br>' +
                                '모집기간<br>' + classDateFormatted + '~' + classStartFormatted + '<br><br>' +
                                '모집인원 : ' + data[i].maxCount + '<br>' +
                                '금액 : ' + parseInt(data[i].expense) + '<br>' +
                            '</div>' +
                        '</div>' +
                        '<div style="width: 551px;">' +
                            '<div style="text-align: center; font-size: 36px;"><strong>커리큘럼</strong></div>' +
                            '<div style="padding: 50px;">' +
                                data[i].curriculum +
                            '</div>' +
                        '</div>' +
                        '</div>';

                    $("#classCurriculumContainer").append(htmlContent);
                }
                $("#classCurriculumContainer").show();
            } else {
                $("#classCurriculumContainer").text("클래스 정보가 없습니다.");
            }
        }

        // 클릭 상태를 업데이트
        classCurriculumContainerVisible = !classCurriculumContainerVisible;
    }
    
    
    
});
function redirectToLogin() {
	  alert('로그인이 필요합니다.');
	  window.location.href = '/user/login';
}




</script>

<style type="text/css">
.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
    margin-top: 60px;
	margin-bottom: 60px;
}


</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="defaultWidth">

    <c:forEach var="list" items="${list}">
    	<div style="text-align: center;">
        	<img style="width: 1103px; height: 783px;" src="/upload/${list.headImg }">
        </div>
        <div style="display: flex;">
	        <div style="text-align: center; margin-right: 52px; margin-left: 51px;">
		        <c:if test="${isLogin != null }">
		        	<button style=" border-radius:3px; border: none; color: white; background-color: black; padding: 15px; margin-top: 50px; padding-left: 70px; padding-right: 70px;  margin-right: 80px; margin-left: 80px;" type="button" name="main"><strong>ON 클래스 시작하기</strong></button><br>
		    	</c:if>
		    	<c:if test="${isLogin == null }">
		   			<button style=" border-radius:3px; border: none; color: white; background-color: black; padding: 15px; margin-top: 50px; padding-left: 70px; padding-right: 70px;  margin-right: 80px; margin-left: 80px;" onclick="redirectToLogin()"><strong>ON 클래스 시작하기</strong></button><br>
		   		</c:if>
		   		
		   		<div style="text-align: center; margin-top: 25px;">
			   		<c:if test="${isLogin != null }">
						<button type="button" name="basket"><img style="width: 50px;" src="/resources/img/basket.png"></button>
			    	</c:if>
			    
			    	<c:if test="${isLogin == null }">
			   			<a href="/user/login"><button onclick="alert('로그인이 필요합니다.')"><img style="width: 50px;" src="/resources/img/basket.png"></button></a>
			   		</c:if>
			   		
			   		<a href="https://www.instagram.com/" target='_blank'><img style="width: 50px; margin-left: 50px;" src="/resources/img/link.png"></a>
		   		</div>
		   		<div style="margin-top: 90px;">
		   			<a style="font-size: 23px; margin-right: 20px; margin-left: 20px; text-decoration: underline; cursor: pointer;" id="classInfo"><strong>클래스 소개</strong></a>
		   			<a style="font-size: 23px; margin-right: 20px; margin-left: 20px; text-decoration: underline; cursor: pointer;" id="classCurriculum"><strong style="margin-right: 20px;">커리큘럼</strong></a>
		   		</div>
	   		</div>
        	<div style="background-color: black; font-size: 35px; color: white; flex: auto; width: 551px; height: 550px;">
        		<div style="display: flex; justify-content: flex-end;"><img style=" height:100px; width: 60px; margin-right: 20px; margin-top: 20px;" src="/resources/img/on.png"></div>
        		<div style="margin-left: 25px;"><strong>${list.className }</strong></div>
        	</div>
	    </div>
	    <div id="classInfoContainer"></div>
	    <div id="classCurriculumContainer"></div>
	    
        <input type="text" id="classNo" value="${list.classNo}" style="display: none;" readonly="readonly">
        <input type="text" id="onOff" value="${list.onOff}" style="display: none;" readonly="readonly">
        <input type="text" id="className" value="${list.className}" style="display: none;" readonly="readonly">
    </c:forEach>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />