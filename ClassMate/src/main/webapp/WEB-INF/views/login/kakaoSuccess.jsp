<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
    src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
    margin: 0;
    padding: 0;
}

h3 {
    display: inline-block;
    padding: 0.6em;
}
</style>
<script type="text/javascript">
    $(document).ready(function() {
        var name = "<c:out value='${userInfo.userName}'/>";
        var email = "<c:out value='${userInfo.userEmail}'/>";
        $("#name").html("환영합니다. " + name + "님");
        $("#email").html(email);
    });
</script>

</head>
<body>
    <div
        style="background-color: #ffcc00; width: 100%; height: 50px; text-align: center; color: black;">
        <h3>SIST Kakao_Login Success</h3>
    </div>
    <br>
    <h2 style="text-align: center" id="name"></h2>
    <h4 style="text-align: center" id="email"></h4>

    <p>이메일: ${userInfo.userEmail}</p>
    <p>이름: ${userInfo.userName}</p>
    <p>성별: ${userInfo.userGender}</p>
    <p>생년월일: ${userInfo.userBirthday}</p>
    <p>전화번호: ${userInfo.userPhone}</p>
</body>
</html>
