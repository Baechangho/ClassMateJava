<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<c:import url="/WEB-INF/views/layout/teacherSide.jsp" />


<script type="text/javascript">

$(document).ready(function () {
    $('#btnRegist').click(function () {

        if ($("#classCheck option:selected").val() == 2 || $("#classCheck option:selected").val() == null) {
            event.preventDefault();
            alert("클래스를 선택해주세요");
            return; // 조건을 만족하면 여기서 함수 종료
        }

        var className = document.getElementById('className').value;
        var classStart = document.getElementById('classStart').value;
        var classEnd = document.getElementById('classEnd').value;
        var maxCount = document.getElementById('maxCount').value;
        var expense = document.getElementById('expense').value;
        var classInfo = document.getElementById('classInfo').value;
        var curriculum = document.getElementById('curriculum').value;
        var fileCount = document.getElementById('fileCount').value;
        var mainAddress = document.getElementById('mainAddress').value;
        var subAddress = document.getElementById('mainAddress').value;

        if ($("#classCheck option:selected").val() == 0 && mainAddress == "") {
            event.preventDefault();
            alert("주소를 검색해주세요");
            return;
        }
        if ($("#classCheck option:selected").val() == 0 && subAddress == "") {
            event.preventDefault();
            alert("상세주소를 적어주세요");
            return;
        }
        if (className == "") {
            event.preventDefault();
            alert("클래스 이름을 적어주세요");
            return;
        }
        if (classStart == "" || classEnd == "") {
            event.preventDefault();
            alert("클래스 날짜를 선택해주세요");
            return;
        }
        if (maxCount == "" || maxCount < 0) {
            event.preventDefault();
            alert("수강인원을 확인해주세요");
            return;
        }
        if (expense == "") {
            event.preventDefault();
            alert("수강 비용을 확인해주세요");
            return;
        }
        if (classInfo == "") {
            event.preventDefault();
            alert("클래스 정보를 적어주세요");
            return;
        }
        if (curriculum == "") {
            event.preventDefault();
            alert("커리큘럼을 적어주세요");
            return;
        }
    });
});

  
</script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("select[name=classCheck]").change(function(){
		  
	console.log($(this).val()); //value값 가져오기
		  
	var onOffNum = parseInt($(this).val());
	
	if($(this).val())
			
	$('#onOff').val(onOffNum);
			
		});
	
});
</script>

<script type="text/javascript">

$(document).ready(function() {
	  $('#classCheck').change(function() {
	    var Num = $('#classCheck option:selected').val();
	    if (Num == '1') {
	      $('#showMap').hide();
	      $('#deleteTableButton').show();
	      $('#dynamicTable').show();   
	    } else {
	      $('#showMap').show();
	      $('#deleteTableButton').hide();
	      $('#dynamicTable').hide();
	    }
	  }); 
	}); 

</script>

<script type="text/javascript"> 

function categoryUchange() {
	
	var 예술 = ["음악", "영화", "사진", "회화", "뮤지컬", "공예", "연기", "게임", "무용"];
	var 운동 = ["헬스", "무술", "러닝", "수영", "사이클링", "레저", "체조", "요가", "크로스핏"];
	var 요리 = ["중식", "양식", "한식", "채식", "디저트", "베이킹", "퓨전", "건강식", "간편식"];
	var 여행 = ["백패킹", "휴양지", "도보", "음식", "문화", "도심", "로드 트립", "정글", "섬",];
	var 성장 = ["직업", "창업", "금융", "건강", "자기개발", "기술", "비즈니스", "교육", "독서"];
	var IT = ["웹 개발", "앱 개발", "클라우드", "빅데이터", "프로그래밍 언어", "사이버 보안", "인공지능(AI)", "블록체인", "로봇 공학"];
	var 패션 = ["의류", "패션 디자인", "악세사리", "뷰티", "컬러 코디네이션", "코스튬", "컬처 패션", "리사이클 패션", "패션 브랜드"];
	var 창작 = ["영상 제작", "포토그래피", "디자인", "만화", "VR 및 AR", "음악 프로듀싱", "소셜 미디어", "캘리그라피", "키네틱 아트"];
	var 문화 = ["축제", "종교", "문학", "미술", "문화유산", "언어", "여행", "음악", "건축"];
	
	var mainCategoryName = document.getElementById("mainCategoryName");
	var subCategoryName = document.getElementById("subCategoryName");
	
	var selectedCategory = mainCategoryName.value;
	
	subCategoryName.innerHTML = "";
	
	// 선택한 대분류에 따라 소분류 설정
    switch (selectedCategory) {
    case "예술":
        categoryDropdown(예술);
        break;
    case "운동":
    	categoryDropdown(운동);
        break;
    case "요리":
    	categoryDropdown(요리);
        break;
    case "여행":
    	categoryDropdown(여행);
        break;
    case "성장":
    	categoryDropdown(성장);
        break;
    case "IT":
    	categoryDropdown(IT);
        break;
    case "패션":
    	categoryDropdown(패션);
        break;
    case "창작":
    	categoryDropdown(창작);
        break;
    case "문화":
    	categoryDropdown(문화);
        break;
    // 다른 대분류에 대한 case 추가
	}
}
	
function categoryDropdown(categoryArray) {
	
	var  subCategoryName = document.getElementById("subCategoryName");
	
	 for (var i = 0; i < categoryArray.length; i++) {
         var option = document.createElement("option");
         option.text = categoryArray[i];
         subCategoryName.add(option);
     }

     // 소분류 드랍다운 활성화
     subCategoryName.disabled = false;
	
}	

</script>

<script type="text/javascript">
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}

</script>

<style type="text/css">
     
    #dynamicTable input[type="file"] {
        display: none;
        margin-right: 10px;
        margin-bottom: 5px;
    }

    #dynamicTable input[type="number"] {
        display: none;
        margin-right: 10px;
        margin-bottom: 10px;
    }
    
    #dynamicTable td {

    }

    #deleteTableButton {
        cursor: pointer;
        color: blue;
        font-weight: bold;
        margin-top: 10px;
        display: none;
    }
    
    
file-input-container {
        width: 140px; /* 파일 입력 필드의 원하는 너비 설정 */
        overflow: hidden; /* 초과된 부분을 감출 수 있도록 설정 */
    }

    .file-input {
        width: 100%; /* 부모 요소의 100% 너비를 차지하도록 설정 */
    }
</style>

<style type="text/css">

.preview {
	margin-top: 10px;
	
}

</style>

<div class="cd1">
<div class="title" style="width: 900px;">
<h3 style= "text-align: center; font-weight: bold;">ON/OFF클래스 등록</h3>
<div style="margin-left: 750px; margin-bottom: 10px;"><select name="classCheck" id="classCheck">
  <option disabled="disabled" selected="selected" value="2">--선택해주세요--</option>
  <option value="1">on클래스</option>
  <option value="0">off클래스</option>
</select></div>
</div>
<hr>

<form action="/teacher/regist" method="post" id="submit" name="submit" enctype="multipart/form-data" style="width: 900px;">
<img id="preview" width="130" height="150"/>
<div class="fileBox">
	<label for="singleFile" style="display: block; margin-bottom: 5px; margin-top: 5px;">썸네일 등록</label>
	
	<input type="file"  name="singleFile" id="singleFile" onchange="readURL(this);" style="margin-bottom: 10px;"> 
</div>
<table class="table table-bordered">


<colgroup>
	<col style="width: 20%;">
	<col style="width: 80%;">
</colgroup>
<tr>
	<td class="table-primary">강사</td><td>${userName }</td>
</tr>
<tr>
	<td class="table-primary">카테고리</td>
	<td>
	 <label for="mainCategoryName">대분류 : </label>
	<select name="mainCategoryName" id="mainCategoryName" onchange="categoryUchange()">
	<option selected disabled>선택해주세요</option>
	<option value="예술">예술</option>
	<option value="운동">스포츠</option>
	<option value="요리">요리</option>
	<option value="여행">여행</option>
	<option value="성장">성장</option>
	<option value="IT">IT</option>
	<option value="패션">패션</option>
	<option value="창작">창작</option>
	<option value="culture">문화</option>
	</select>
	<img src="/resources/img/gonext.png" id="rightImg" alt="더하기" width="30" height="30" style="margin-left: 5px; margin-right: 5px;">
	<label for="subCategoryName">소분류 : </label>
	<select name="subCategoryName" id="subCategoryName" disabled>
	<option selected disabled>대분류를 먼저 선택해주세요</option>
	</select>
	</td>
</tr>
<tr>
	<td class="table-primary">클래스명</td><td><input type="text" name="className" id="className"></td>
</tr>
<tr>
	<td class="table-primary">클래스 기간</td><td><input type="date" name= "classStart" id="classStart">
		<img src="/resources/img/dash.png" id="tideImg" alt="물결" width="30" height="30" style="margin-left: 5px; margin-right: 5px;">
		 <input type="date" name="classEnd" id="classEnd"></td>
</tr>
<tr>
	<td class="table-primary">모집 정원</td><td><input type="number" name="maxCount" id="maxCount"> 명</td>
</tr>
<tr>
	<td class="table-primary">비용 및 안내</td><td><input type="text" name="expense" id="expense"> 원</td>
</tr>
<tr>
	<td class="table-primary">클래스 소개</td><td><textarea name="classInfo" id="classInfo" style="width: 700px; height: 180px;"></textarea></td>
</tr>
<tr>
	<td class="table-primary">커리큘럼</td><td><textarea name="curriculum" id="curriculum" style="width: 700px; height: 180px;"></textarea></td>
</tr>
</table>

	<input type="hidden" name="onOff" id="onOff" value="">


<!-- <tr>

	<td><button id="deleteTableButton" onclick="deleteTable(event)">테이블 삭제</button><td>
</tr>
<tr>	
    <td colspan="2"><table id="dynamicTable"></table></td>>
</tr>
    <input type="number" id="fileCount" name="fileCount" value="1" readonly style="display:none">	
    추가: 파일 개수를 입력하는 input -->

<script>
    // 함수를 호출하여 테이블 생성
    createDynamicTable(5, 4);

    function createDynamicTable(rows, cols) {
        // 테이블 엘리먼트 생성
        var table = document.getElementById('dynamicTable');

        // 행과 열을 반복하여 테이블 채우기
        for (var i = 0; i < rows; i++) {
            var row = table.insertRow(i);
            row.classList.add('tableRow'); // 행에 클래스 추가

            for (var j = 0; j < cols; j++) {
                var cell = row.insertCell(j);
                cell.classList.add('tableCell'); // 셀에 클래스 추가

                // input 엘리먼트 생성
                var input = document.createElement('input');
                input.type = 'file';
                input.id = 'fileInput_' + ((i * 4) + (j + 1)); // 고유한 id 부여
                input.name = 'fileInput_' + ((i * 4) + (j + 1)); // name 속성 부여
                input.style.width = '220px';
                
                var label = document.createElement('label');
                label.className = "input-file-button";
                label.htmlFor = input.id; // label과 input을 연결
                label.style.display = 'inline-block'; // label이 옆에 표시되도록 설정
                label.value = '값';

                var input2 = document.createElement('input');
                input2.type = 'number';
                input2.id = 'numberInput_' + ((i * 4) + (j + 1)); // 고유한 id 부여
                input2.name = 'numberInput_' + ((i * 4) + (j + 1)); // name 속성 부여
                input2.value = (i * 4) + (j + 1); // 열 번호로 초기값 설정
                input2.readOnly = true; // 읽기 전용으로 설정
                
                

                // input의 change 이벤트에 함수 연결
                input.addEventListener('change', function () {
                    handleFileInput(this);
                    label.innerText = this.value; // input 값이 변경되면 label에 반영
                });

                // cell에 input 추가
                cell.appendChild(input);
                cell.appendChild(input2);
                cell.appendChild(input2);

                // 첫 번째 셀인 경우 파일 입력을 보이게 처리
                if (i === 0 && j === 0) {
                    input.style.display = 'block';
                    input2.style.display = 'block';
                }
            }
        }

        // 테이블 밖의 삭제 버튼 표시
        var deleteTableButton = document.getElementById('deleteTableButton');
        deleteTableButton.style.display = 'block';
    }

    function handleFileInput(input) {
        // 현재 위치의 열과 행 찾기
        var cell = input.parentNode;
        var col = cell.cellIndex;
        var row = cell.parentNode.rowIndex;

        // 현재 위치의 행이 마지막 행이 아니면 다음 열에 input 추가
        if (col < 3) {
            var nextCell = cell.nextElementSibling;
            var nextInput = nextCell.querySelector('input[type="file"]');
            var nextInput2 = nextCell.querySelector('input[type="number"]');

            if (nextInput) {
                nextInput.style.display = 'block';
            }

            if (nextInput2) {
                nextInput2.style.display = 'block';
                var fileCountInput = document.getElementById('fileCount');
                fileCountInput.value = (nextInput2.value == 20) ? 20 : nextInput2.value - 1;
            }
        }

        // 현재 위치의 열이 마지막 열이 아니면 다음 행의 첫 번째 열에 input 추가
        if (row < 6 && col === 3) {
            var nextRow = cell.parentNode.nextElementSibling;
            if (nextRow) {
                var firstCell = nextRow.querySelector('td');
                if (firstCell) {
                    var firstInput = firstCell.querySelector('input[type="file"]');
                    var firstInput2 = firstCell.querySelector('input[type="number"]');

                    if (firstInput) {
                        firstInput.style.display = 'block';
                    }

                    if (firstInput2) {
                        firstInput2.style.display = 'block';
                        // fileCount를 최신 numberInput 값으로 설정
                        var fileCountInput = document.getElementById('fileCount');
                        // 예외처리: 20번째 셀인 경우 fileCount를 20으로 설정
                        fileCountInput.value = (firstInput2.value == 20) ? 20 : firstInput2.value - 1;
                    }
                }
            }
        }
    }

    function deleteTable(event) {

    	 // 폼의 자동 제출을 막기 위해 event.preventDefault() 호출
        event.preventDefault();
    	
    	// 테이블 엘리먼트 찾기
        var table = document.getElementById('dynamicTable'); 
    	
        $('#deleteTableButton').text('삭제').css('color', 'red');
        
        // 테이블 내의 모든 파일 값 초기화 및 셀 삭제
        for (var i = table.rows.length - 1; i >= 0; i--) {
            table.deleteRow(i);
        }

        // 삭제 버튼 숨기기
        var deleteTableButton = document.getElementById('deleteTableButton');
        deleteTableButton.style.display = 'none';

        // 테이블 내용을 1행 1열로 재생성
        createDynamicTable(5, 4);
    }


    function uploadFiles() {
        // FormData 생성
        var formData = new FormData();

        // 테이블 내의 파일들을 FormData에 추가
        var table = document.getElementById('dynamicTable');
        for (var i = 0; i < table.rows.length; i++) {
            var row = table.rows[i];
            for (var j = 0; j < row.cells.length; j++) {
                var cell = row.cells[j];

                // input type="file" 처리
                var fileInput = cell.querySelector('input[type="file"]');
                if (fileInput && fileInput.files.length > 0) {
                    for (var k = 0; k < fileInput.files.length; k++) {
                        formData.append(fileInput.name, fileInput.files[k]);
                    }
                }

                
                var numberInput = cell.querySelector('input[type="number"]');
                if (numberInput) {
                    formData.append(numberInput.name, numberInput.value);
                }
            }
        }

        // AJAX를 사용하여 FormData를 서버로 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/teacher/NewFile', true);
        xhr.onload = function () {
              if (xhr.status === 200) {
                console.log('Files uploaded successfully.');
            } else {
                console.error('File upload failed.');
            }
        };
        xhr.send(formData);
    }
    
    
</script>

<!-- </table>  -->

	<div><button id="deleteTableButton" onclick="deleteTable(event)">테이블 생성</button></div>

	
   <div style="width: 850px;"><table id="dynamicTable"></table></div>

    <input type="number" id="fileCount" name="fileCount" value="1" readonly style="display:none">	

<!-- <div>
	<div id="deleteTableButtonDiv"><button id="deleteTableButton" onclick="deleteTable(event)">테이블 생성</button></div>
    <div id="dynamicTableDiv"><table id="dynamicTable"></table></div>

    추가: 파일 개수를 입력하는 input
    <input type="number" id="fileCount" name="fileCount" value="1" readonly style="display:none">	
</div> -->
<div id="showMap" style="display: none">
<input type="text" id="mainAddress" name="mainAddress" placeholder="주소" readonly style="margin-left: 350px;">
<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
<input type="text" id="subAddress" name="subAddress" placeholder="상세 주소 입력" style="margin-left: 350px;">
<div id="map" style="width:100%;height:350px;margin-top:10px;display:none"></div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apikey}&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("mainAddress").value = addr;               
               
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();

    }
</script>



<br>

<div class="text-center">
	<button class="btn btn-warning" id="btnRegist">등록</button>
	<button type="reset" class="btn btn-secondary" id="btnCancel">취소</button>
</div>
</form>


</div>	<!-- total box -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />