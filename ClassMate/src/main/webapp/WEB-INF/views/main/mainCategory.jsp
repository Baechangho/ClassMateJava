<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	// 마우스를 올리면 글자색과 언더라인 변경
	$(".mainCategoryItem").mouseover(function () {
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("background-color", "#F0C610");
	        $(this).find("#mainFont").css("color", "white");
	        $(this).find("#mainImg").css("filter", "invert(100%)");
	    }
	}).mouseout(function () {
	    // 마우스를 떼면 초기 스타일로 변경
	    if (!$(this).hasClass("clicked")) {
	        $(this).css("background-color", "white");
	        $(this).find("#mainFont").css("color", "black");
	        $(this).find("#mainImg").css("filter", "invert(0%)");
	    }
	});
	
});
</script>

<style type="text/css">
.defaultWidth{
	margin-left: 400px;
	margin-right: 400px;
	margin-top: 35px;
	text-align: center;
	margin-bottom: 60px;
}

    .mainCategoryContainer {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-template-columns: 150px 150px 150px;
        grid-template-rows: 150px 150px 150px;
        align-items: center;
        justify-content: center;
    }

    .mainCategoryItem {
        text-align: center;
        padding: 23px;
        transition: background-color 0.3s, color 0.3s;
    }

    #mainImg {
        width: 70px;
    }

    p {
        font-size: 27px;
        color: black;
    }
    
</style>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="defaultWidth">
    <h1>카테고리 대분류</h1>

    <div class="mainCategoryContainer">
         <a href="/main/subCategory?mainCategoryNo=${list[0].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/art.png" id="mainImg" alt="예술">
                <p id="mainFont">예술</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[1].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/sports.png" id="mainImg" alt="운동">
                <p id="mainFont">운동</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[2].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/cook.png" id="mainImg" alt="요리">
                <p id="mainFont">요리</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[3].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/travel.png" id="mainImg" alt="여행">
                <p id="mainFont">여행</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[4].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/book.png" id="mainImg" alt="성장">
                <p id="mainFont">성장</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[5].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/it.png" id="mainImg" alt="IT">
                <p id="mainFont">IT</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[6].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/fashion.png" id="mainImg" alt="패션">
                <p id="mainFont">패션</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[7].mainCategoryNo}" class="mainCategoryNo">
    	    <div class="mainCategoryItem">
                <img src="/resources/img/creative.png" id="mainImg" alt="창작">
                <p id="mainFont">창작</p>
	        </div>
         </a>

         <a href="/main/subCategory?mainCategoryNo=${list[8].mainCategoryNo}" class="mainCategoryNo">
        	<div class="mainCategoryItem">
                <img src="/resources/img/culture.png" id="mainImg" alt="문화">
                <p id="mainFont">문화</p>
        	</div>
         </a>
    </div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
