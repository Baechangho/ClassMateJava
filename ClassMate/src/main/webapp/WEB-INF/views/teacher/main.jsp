<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<div class="center-box">
<div class= "title">
<h1>강사페이지</h1>

<div id= "all"><a>전체보기</a></div>
</div>
<hr>

<script type="text/javascript"> 

function categoryUchange() {
	
	var cook = ["양식", "한식", "밀키트"];
	var beauty = ["헤어", "메이크업", "왁싱"];
	var sports = ["구기스포츠", "라켓스포츠", "수영"];
	var selfDevelopement = ["실무", "제테크", "자격증"];
	var design = ["패션", "악세사리", "가구"];
	var communication = ["토론", "어학", "발표"];
	var business = ["굿즈", "투잡", "제테크"];
	var create = ["문학", "음악", "팬픽"];
	var it = ["홈페이지", "어플리케이션", "프로그래밍 언어"];
	
	var target = document.getElementById("categoryD");

	if(z.value == a) var y = cook;
	else if(z.value == b) var y = beauty;
	else if(z.value == c) var y = sports;
	else if(z.value == d) var y = selfDevelopement;
	else if(z.value == e) var y = design;
	else if(z.value == f) var y = communication;
	else if(z.value == g) var y = business;
	else if(z.value == h) var y = create;
	else if(z.value == i) var y = it;
	
	target.options.length = 0;
	
	for (x in y) {
		var opt = document.createElement("option");
		opt.value = y[x];
		opt.innerHTML = y[x];
		target.appendChild(opt);
		
	}
	
}

</script>

<table>
<tr>
	<td class="table-info">카테고리</td>
	<td>
	<label>대분류</label>
	<select class="categoryControll" onchange="categoryUchange()" name="categoryU" id="categoryU">
	<option value="a">요리</option>
	<option value="b">뷰티</option>
	<option value="c">스포츠</option>
	<option value="d">자기개발</option>
	<option value="e">디자인</option>
	<option value="f">커뮤니케이션</option>
	<option value="g">비즈니스</option>
	<option value="h">창작</option>
	<option value="i">IT</option>
	</select>
	>
	<select class="categoryControll" name="categoryD" id="categoryD">
	<option>선택해주세요</option>
	</select>
	</td>
</tr>
</table>

<c:import url="/WEB-INF/views/layout/pagination.jsp" />
</div>

</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />