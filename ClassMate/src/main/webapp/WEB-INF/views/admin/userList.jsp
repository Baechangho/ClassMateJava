<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<%-- <% ============================================================================= %> --%>

<style type="text/css">
.userManagement{
	background: rgb(241,196,15);
	
}

#userListTb{
border-top: 2px solid #ccc; 
border-bottom: 2px solid #ccc; 
width: 690px; 
margin: auto;

}

.userListTh{
background: rgb(220,220,220);
border-bottom: 2px solid #ccc;
font-size: 15px;
padding-top: 5px;
padding-bottom: 5px;

}

.userListTd{
border-bottom: 1px solid #ccc; 
font-size: 15px;
padding-top: 2px;
padding-bottom: 2px;
padding-right: 0;

}

#delCheckbox{
position:absolute;
width:20px;
height:20px;
top:10%;
margin-left: 5px;

}

.userListTd:hover:not(.active){
cursor:pointer;

}
</style>


<%-- 페이징 CSS --%>
<style type="text/css">
#pagination {
   margin-top: -40px;
   margin-bottom: 50px;
}

#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingWaiting {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;"

}

#pagingNow {
   border-radius: 4px; 
   color: black; 
   background-color: rgb(241,196,15); 
   border: 1px solid rgb(251,206,25);
   margin: 3.5px; 
   text-align: center;"

}

#pagingAfter,#pagingBefore {
   border-radius: 4px; 
   color: black; 
   background-color: #f1f3f5; 
   border: 1px solid #d10d10d10;
   margin: 3.5px; 
   text-align: center;
}

</style>

<%-- <% ============================================================================= %> --%>

<script type="text/javascript">
$(function(){

	$(".dropTag").change(function(){
		
		$('#userListForm').submit();
		
	})
	
});

$(function(){
	
	var delCheckbox = document.getElementById("delCheckbox");
	
	$("#delCheckbox").click(function(){
		if($(this).is(":checked")){
			delCheckbox.value = 1;
			$('#userListForm').submit();
		} else {
			delCheckbox.value = 0; 
			$('#userListForm').submit();
		}
	})
	
});

$(function(){
	
    $('.userListTr').mouseover(function() {
        $(this).children('td').css('background-color', '#e9e9e9'); 
    });

    $('.userListTr').mouseout(function() {
        $(this).children('td').css('background-color', 'initial');
    });

})
</script>	

<%-- 클릭시 유저 상세보기로 --%>
<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">

<c:set var="list" value="${map.list[i] }" />

<script type="text/javascript">
$(function(){
	
	$(".userInfo${list.userNo}").click(function(){
		
		
		location.href = '../admin/userDetailedInfo?curPage=${paging.curPage}&sort=${sort}&delCheckbox=${delCheckbox}&userNo=${list.userNo}';
		
	})
	
});
</script>
</c:if>
</c:forEach>
</c:if>

<%-- <% ============================================================================= %> --%>

<div style="border: 1px solid #ccc; text-align: center; width: 820px; margin-left: 72px; margin-bottom: 20px; margin-top: 78px;">	
<div style="font-size: 22px; font-weight:bold; margin-bottom: 17px; margin-top: 20px;">&#x003C; 회원 관리 &#x003E;</div>

<form id="userListForm" action="../admin/userList" method="get">
	<div style="text-align: left; margin-left: 62px; margin-bottom: 10px">
		
		<input style="display: none" type="text" readonly="readonly" name="curPage" value="${paging.curPage}">
		
		<div>
		<c:if test="${sort eq 0}">
		<select class="dropTag" name="sort" id="sort">
			<option value="0">회원번호▲</option>
			<option value="1">회원번호▼</option>
			<option value="2">이름▲</option>
			<option value="3">이름▼</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 1}">
		<select class="dropTag" name="sort" id="sort">
			<option value="1">회원번호▼</option>
			<option value="0">회원번호▲</option>
			<option value="2">이름▲</option>
			<option value="3">이름▼</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 2}">
		<select class="dropTag" name="sort" id="sort">
			<option value="2">이름▲</option>
			<option value="0">회원번호▲</option>
			<option value="1">회원번호▼</option>
			<option value="3">이름▼</option>
		</select>
		</c:if>
		
		<c:if test="${sort eq 3}">
		<select class="dropTag" name="sort" id="sort">
			<option value="3">이름▼</option>
			<option value="0">회원번호▲</option>
			<option value="1">회원번호▼</option>
			<option value="2">이름▲</option>
		</select>
		</c:if>
		
		<div style="position:relative; float: right; margin-right: 87px;" >
		
		<c:if test="${delCheckbox eq 0}">
        	탈퇴 회원 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="0">
        </c:if>
        <c:if test="${delCheckbox eq 1}">
        	탈퇴 회원 조회<input id="delCheckbox" type="checkbox" name="delCheckbox" value="1" checked="checked">
		</c:if>
		
        </div>
        
        </div>
        
	</div>
</form>

<table id="userListTb">	
	
<tr>
	<th class="userListTh" width="7%">회원번호</th>
	<th class="userListTh" width="10%">아이디</th>
	<th class="userListTh" width="10%">회원명</th>
	<th class="userListTh" width="10%">가입일</th>
	<th class="userListTh" width="10%">강사 여부<br>
</tr>

<c:if test="${delCheckbox eq 0}">
<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">

<c:set var="list" value="${map.list[i] }" />
<c:set var="teacherApplylist" value="${map.teacherApplylist[i] }" />

	<tr class="userListTr" >
		<td class="userListTd userInfo${list.userNo }">${list.userNo }</td>
		<td class="userListTd userInfo${list.userNo }">${list.userId }</td>
		<td class="userListTd userInfo${list.userNo }">${list.userName }</td>
		<td class="userListTd userInfo${list.userNo }">${list.userDateCreated }</td>
		<td class="userListTd userInfo${list.userNo }">
			<c:if test="${empty teacherApplylist.passOrNot && list.userNo != 0}">
				일반회원
			</c:if>
			<c:if test="${empty teacherApplylist.passOrNot && list.userNo == 0}">
				관리자
			</c:if>
			<c:if test="${not empty teacherApplylist.passOrNot}">
				<c:if test="${teacherApplylist.passOrNot == 0}">
					일반회원
				</c:if>
				<c:if test="${teacherApplylist.passOrNot != 0}">
					강사회원
				</c:if>
			</c:if>
		</td>
	</tr>
</c:if>
</c:forEach>
</c:if>
</c:if>

<c:if test="${delCheckbox eq 1}">
<c:if test="${paging.totalCount > 0}">
<c:forEach var="i" begin="${paging.startNo-1}" end="${paging.endNo-1}" >
<c:if test="${i < paging.totalCount}">

<c:set var="list" value="${map.list[i] }" />
<c:set var="teacherApplylist" value="${map.teacherApplylist[i] }" />

	<tr class="userListTr" >
		<td class="userListTd userInfo${list.userNo }">${list.userNo }</td>
		<td class="userListTd userInfo${list.userNo }">${list.userId }</td>
		<td class="userListTd userInfo${list.userNo }">${list.userName }</td>
		<td class="userListTd userInfo${list.userNo }">${list.userDateCreated }</td>
		<td class="userListTd userInfo${list.userNo }">
			<c:if test="${empty teacherApplylist.passOrNot}">
				일반회원
			</c:if>
			<c:if test="${not empty teacherApplylist.passOrNot}">
				<c:if test="${teacherApplylist.passOrNot == 0}">
					일반회원
				</c:if>
				<c:if test="${teacherApplylist.passOrNot != 0}">
					강사회원
				</c:if>
			</c:if>
		</td>
	</tr>
</c:if>
</c:forEach>
</c:if>
</c:if>
	
</table>

<div style="margin-top: 30px;">

</div>
<%-- <% ============================================================================= %> --%>

<div id="pagination">
	<ul class="pagination pagination-sm justify-content-center" style="margin-top: 80px;">
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
		<li style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage - 1 }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingBefore">&lt;</a>
		</li>
	</c:if>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link active" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingNow">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item" style="width: 45px;">
			<a class="page-link" href="<%= request.getContextPath() %>?curPage=${i }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingWaiting">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item" style="width: 45px;">
		<a class="page-link" href="<%= request.getContextPath() %>?curPage=${paging.curPage + 1 }&sort=${sort}&delCheckbox=${delCheckbox}" id="pagingAfter">&gt;</a>
		</li>
	</c:if>
      
	</ul>
</div><!--#questionPagination -->	

<%-- <% ============================================================================= %> --%>

</div>
		
<%-- <% ============================================================================= %> --%>		
	
<c:import url="/WEB-INF/views/layout/adminFooter.jsp" />