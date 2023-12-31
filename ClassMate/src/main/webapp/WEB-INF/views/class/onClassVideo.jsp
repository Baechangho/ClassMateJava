<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>${classVideo.videoLesson}차시강의</title>
<style>
.video-container {
	background-color: #f3f3f3; /* 배경색 설정 */
	border-radius: 10px;
	box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
	padding: 20px;
	margin-bottom: 20px;
}

.video-title {
	color: #333;
	font-weight: bold;
	margin-bottom: 15px;
}

.video-description {
	color: #666;
	font-size: 1.1em;
	margin-bottom: 20px;
}

.back-link {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	font-size: 1.2em;
	color: #007bff;
}

.back-link:hover {
	color: #0056b3;
	text-decoration: underline;
}

.btn-custom {
	background-color: #FFD700; /* 노란색 배경 */
	color: white; /* 흰색 글씨 */
	border: none; /* 테두리 제거 */
}

.btn-custom:hover {
	background-color: #e6c300; /* 마우스 오버 시 더 어두운 노란색 */
	color: white; /* 흰색 글씨 유지 */
}
.header-title {
	text-align: center;
	padding-bottom: 20px; /* 구분선과 제목 사이의 간격 */
	border-bottom: 10px solid #FFF0B1; /* 노란색 구분선 */
	margin-bottom: 30px; /* 구분선 아래 컨텐츠와의 간격 */
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/header.jsp" />

	<div class="container mt-5">
        <div class="row mb-2">
            <div class="col-12">
                <h1 class="header-title">진행중인 클래스</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="video-container">
                    <div class="embed-responsive embed-responsive-16by9">
                        <video class="embed-responsive-item" controls>
                            <source src="/upload/${classVideo.storedName}" type="video/mp4">
                            죄송합니다, 브라우저가 비디오 태그를 지원하지 않습니다.
                        </video>
                    </div>
                    <h1 class="video-title">${classVideo.videoLesson}차시강의</h1>
                    <p class="video-description">${classVideo.originName}</p>
                    <div class="text-center"> <!-- "목록" 버튼을 감싸는 div 추가 -->
                        <a href="/class/onClass?classNo=${classVideo.classNo}"
                            class="btn btn-custom back-link">목록</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<c:import url="/WEB-INF/views/layout/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
