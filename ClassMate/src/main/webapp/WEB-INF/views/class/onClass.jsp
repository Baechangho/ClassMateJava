<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ClassMate ON클래스 강의실</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
/* 추가적인 스타일링 */
.hero-section {
	background-color: #FFF0B1;
	padding: 30px;
	border-radius: 8px;
	margin-bottom: 30px;
}

#qaSection:hover {
	cursor: pointer;
}

/* ClassMate 텍스트 스타일 (회색 + 2배 크기) */
.hero-title {
	color: gray;
	font-size: 2em; /* 2배 크기로 설정 */
}

/* 나머지 텍스트 스타일 (검정색) */
.hero-subtitle {
	color: black; /* 나머지 텍스트를 검정색으로 유지 */
	font-size: 2em;
}

.hero-text {
	color: black;
	font-size: 1.5em;
}
/* ON클래스 강의실 텍스트 스타일 (굵게) */
.hero-subtitle {
	font-weight: bold; /* ON클래스 강의실 텍스트를 두꺼운 굵기로 유지 */
}

.qa-card, .video-card {
	border: none;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out;
}

.qa-card:hover, .video-card:hover {
	transform: translateY(-10px);
}

.qa-section, .video-section {
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 30px;
}
</style>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        // 대상 div의 클래스나 ID를 사용하여 선택
        const qaSection = document.querySelector('.qa-section');
        const videoSection = document.querySelector('.video-section');

        qaSection.addEventListener('click', () => {
            // 이 부분에 원하는 URL을 입력
            window.location.href = '/class/onClassQABoardList?classNo=' + ${lecture.classNo};
        });

        videoSection.addEventListener('click', () => {
            // 이 부분에 원하는 URL을 입력
            window.location.href = '/class/onClassVideoList?classNo=' + ${lecture.classNo};
        });
    });
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/layout/header.jsp" />
	<div style="max-width: 1000px; margin: auto;">
		<div class="container mt-5">
			<!-- Hero Section with Class Information -->
			<div class="row hero-section">
				<div class="col-md-6 my-auto">
					<div class="hero-title mb-2">ClassMate</div>
					<div class="hero-subtitle mb-4">ON클래스 강의실</div>
					<p class="hero-text">강의명 : ${lecture.className }</p>
					<p class="hero-text">강사명 : ${lecture.teacher }</p>
				</div>
				<div class="col-md-6">
					<img src="/upload/${lecture.headImg}" alt="Class Image"
						class="img-fluid rounded">
				</div>
			</div>

			<!-- ClassVideo Section -->
			<div class="video-section mb-4" id="videoSection">
				<h2 class="text-center mb-4">ON클래스 동영상 리스트</h2>
				<div class="row">
					<c:forEach var="video" items="${classVideo}" varStatus="status">
						<div class="col-md-4 mb-4">
							<a href="/class/onClassVideo?videoNo=${video.videoNo}"
								class="text-decoration-none">
								<div class="card video-card">
									<div class="card-body">
										<h5 class="card-title video-title">레슨
											${video.videoLesson}</h5>
										<!-- 동영상 썸네일 이미지 또는 대체 이미지 표시 -->
<!-- 										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" -->
<!-- 											fill="currentColor" class="bi bi-play-btn-fill" -->
<!-- 											viewBox="0 0 16 16"> -->
<!--   <path -->
<!-- 												d="M0 12V4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2m6.79-6.907A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" /> -->
<!-- </svg> -->
<%-- 										<img src="/upload/${video.storedName}" --%>
<%-- 											alt="레슨 ${video.videoLesson} 이미지" class="img-fluid"> --%>
										<p class="card-text video-text">${video.originName}</p>
									</div>
								</div>
							</a>
						</div>
						<!-- 3개의 카드가 나열된 후, 다음 줄로 넘어가기 위한 조건 -->
						<c:if test="${status.count % 3 == 0 && !status.last}">
				</div>
				<div class="row">
					</c:if>
					</c:forEach>
				</div>
			</div>

			<!-- Q&A Section -->
<div class="qa-section" id="qaSection">
    <h2 class="text-center mb-4">
        <a class="text-dark text-decoration-none">ON클래스 질문/답변</a>
    </h2>
    <div class="row">
        <c:choose>
            <c:when test="${empty questionAnswer}">
                <div class="col-md-12 text-center">
                    <p>아직 질문이 없네요... <a href="/class/onClassQAWrite?classNo=${lecture.classNo}">첫 질문하러 가기</a></p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="questionAnswer" items="${questionAnswer}" varStatus="status">
                    <div class="col-md-3 mb-4">
                        <div class="card qa-card">
                            <div class="card-body">
                                <h5 class="card-title qa-title">질문 ${status.index + 1}</h5>
                                <p class="card-text qa-text">${questionAnswer.questionContent }</p>
                            </div>
                        </div>
                    </div>
                    <!-- 4개의 카드가 나열된 후, 다음 줄로 넘어가기 위한 조건 -->
                    <c:if test="${status.count % 4 == 0 && !status.last}">
                </div>
                <div class="row">
                    </c:if>
                </c:forEach>
            </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
		</div>

	</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<!-- Bootstrap and other necessary scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
