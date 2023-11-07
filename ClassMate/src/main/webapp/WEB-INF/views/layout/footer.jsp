<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">


// 모달 열기
function openModal(modalname){
	  $("#modal").fadeIn(300);
	  $("."+modalname).fadeIn(300);
	}
	
$("#modal, .close").on('click',function(){
	  $("#modal").fadeOut(300);
	  $(".modal-con").fadeOut(300);
	});

	
$(".modal-con").on('click', function (event) {
	  event.stopPropagation(); // 이벤트 전파 중지
	});

	$("#modal").on('click', function () {
	  $("#modal").fadeOut(300);
	  $(".modal-con").fadeOut(300);
	});
	

	
	
</script>

<style type="text/css">

*{margin:0; padding:0;}
a.button{display:inline-block; text-decoration:none; color:#000;}

#modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}


.modal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 30%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
  background : #000;
  color: #fff;
  text-align: center;
  margin-top: 30px;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
  height: 50vh;
  overflow-y: auto; 
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#fff; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}

.vl {
    border-left: 2px solid #DBDCDD;
    height: 15px;
}

td{
	padding-right: 15px;
}

.footer{
	margin: 15px;
}


</style>
<hr style="margin-top: 60px;">

<div class="footer">

<div id="modal"></div>
  <div class="modal-con modal1">
    <p class="title">이용약관</p>
    <div class="con">
ClassMate 회원 약관<br><br><br>


제 1 장 총칙<br><br>

제 1 조 목적<br><br>

이 약관은 ClassMate가 제공하는 서비스인 http://www.ClassMate.or.kr의 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>

제 2 조 약관의 효력과 변경<br><br>

1) 약관은 이용자에게 공시함으로써 효력을 발생합니다.<br><br>

2) KH정보교육원은 교육원 사정상 변경의 경우와 영업상 중요사유가 있을 때 약관을 변경할 수 있으며, 변경된 약관은 전항과 같은 방법으로 효력을 발생합니다.<br><br>

제 3 조 약관 외 준칙<br><br>

이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.<br><br><br>


제 2 장 회원 가입과 서비스 이용<br><br>

제 1 조 이용 계약의 성립<br><br>

1)ClassMate에서 운영하는 모든 회원서비스는 이 약관에 동의한 이용자들에게 무료로 제공 되는 서비스입니다.<br>
이용자가 "동의합니다" 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.<br><br>

2) 회원에 가입하여 서비스를 이용하고자 하는 희망자는 회사에서 요청하는 개인 신상정보를 제공해야 합니다.<br><br>

3) 등록정보<br>
ClassMate는 이용자 등록정보를 집단적인 형태로 사용할 수는 있지만 각 이용자 개인 정보는, 불법적이거나 기타 다른 불온한 문제를 일으킬 경우를 제외하고, 이용자의 동의 없이는 절대 공개하지 않습니다.<br>
ClassMate를 이용하여 타인에게 피해를 주거나 미풍양속을 해치는 행위를(즉 욕설, 비방성글, 인신공격성 발언, 사회적질서를 혼란시키는 유언비어등)한 이용자는 회원자격이 박탈되며, 이로 인해 발생되는 모든 사회적문제는 ClassMate에서 책임지지 않습니다.<br><br>

4) 약관의 수정<br>
ClassMate는 이 약관을 변경할 수 있으며 변경된 약관은 서비스 화면에 게재하거나 기타 다른 방법으로 이용자에게 공지함으로써 효력을 발생합니다.<br><br>

5) ID와 패스워드<br>
이용자번호(ID)와 비밀번호(password)에 관한 모든 관리책임은 이용자에게 있습니다.<br>
이용자에게 부여된 이용자번호(ID) 및 비밀번호(password)의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 이용자에게 있습니다.<br>
자신의 ID가 부정하게 사용된 경우 이용자는 반드시 ClassMate에 그 사실을 통보해야 합니다.<br><br>

6) 사용자 정보<br>
ClassMate에 기재하는 모든 이용자 정보는 이름을 포함하여 모두 실제 데이타인 것으로 간주됩니다.<br>
실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, ClassMate의 서비스 제한 조치를 받을 수 있습니다.<br><br>

7) 광고 게재 및 컨텐츠 제휴<br>
ClassMate는 광고수익과 컨텐츠 제휴를 기반으로 컨텐츠 서비스를 제공하고 있습니다.<br>
ClassMate의 서비스를 이용하고자 하는 이용자는 광고게재및 컨텐츠제휴에 대해 동의하는 것으로 간주됩니다.<br><br><br>


제 3 장 계약 해지 및 서비스 이용제한<br><br>

제 1 조 계약 해지 및 이용제한<br><br>

이용자가 이용 계약을 해지 하고자 하는 때에는 이용자 본인이 직접 온라인을 통해 관리자에게 메일을 보내어 해지 신청을 하여야 합니다.<br><br>

회사는 이용자가 다음 사항에 해당하는 행위를 하였을 경우 사전 통지 없이 이용 계약을 해지 하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.<br><br>

(1) 공공 질서 및 미풍 양속에 반하는 경우<br><br>

(2) 범죄적 행위에 관련되는 경우<br><br>

(3) 이용자가 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행 할 경우<br><br>

(4) 타인의 서비스 아이디 및 비밀 번호를 도용한 경우<br><br>

(5) 타인의 명예를 손상시키거나 불이익을 주는 경우<br><br>

(6) 같은 사용자가 다른 아이디로 이중 등록을 한 경우<br><br>

(7) 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우<br><br>

(8) 기타 관련법령이나 회사가 정한 이용조건에 위배되는 경우<br><br>

제 2 조 이용 제한의 해제 절차<br><br>

(1) 회사는 규정에 의하여 이용제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 서면 또는 전화 등의 방법에 의하여 해당 이용자 또는 대리인에게 통지합니다. 다만, 회사가 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 그러하지 아니합니다.<br><br>

(2) 제1항의 규정에 의하여 이용정지의 통지를 받은 이용자 또는 그 대리인은 그 이용정지의 통지에 대하여 이의가 있을 때에는 이의신청을 할 수 있습니다.<br><br>

(3) 회사는 제2항의 규정에 의한 이의신청에 대하여 그 확인을 위한 기간까지 이용정지를 일시 연기할 수 있으며, 그 결과를 이용자 또는 그 대리인에게 통지합니다.<br><br>

(4) 회사는 이용정지 기간 중에 그 이용정지 사유가 해소된 것이 확인된 경우 에는 이용정지조치를 즉시 해제합니다.<br><br>

제 3 조 이용자의 게시물<br><br>

회사는 이용자가 게시하거나 등록하는 서비스 내의 내용물이 다음 각 사항에 해당된다고 판단되는 경우에 사전 통지 없이 삭제할 수 있습니다.<br><br>

(1) 다른 이용자 또는 제 3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우<br><br>

(2) 공공질서 및 미풍 양속에 위반되는 내용인 경우<br><br>

(3) 범죄적 행위에 결부된다고 인정되는 내용일 경우<br><br>

(4) 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br><br>

(5) 기타 관계 법령이나 회사에서 정한 규정에 위배되는 경우<br><br><br>


제 4 장 계약변경 등<br><br>

제 1 조 계약사항의 변경<br><br>

(1) 이용자는 주소 또는 이용계약 내용을 변경하거나, 서비스 를 해지할 경우에는 전화나 서비스를 통해서 이용계약을 변경/ 해지하여야 합니다.<br><br><br>


제 5 장 정보의 제공<br>

제 1 조 정보의 제공<br>

(1) 회사는 이용자가 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서는 전자우편이나 서신우편 등의 방법으로 이용자에게 제공할 수 있습니다.<br>


제 6 장 손해 배상<br>
제 1 조<br><br>

1) 손해배상<br>
ClassMate는 서비스 이용과 관련하여 이용자에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다.<br>
서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 ClassMate의 소재지를 관할하는 법원을 관할법원으로 합니다.<br><br>

[부 칙]<br><br><br>


( 시 행 일 ) 이 약관은 2015년 01월 12일부터 시행합니다.
    </div>
  </div>

<table>
	<tr>
		<td>사이트 소개</a></td>
		<td><div class="vl"></div></td>
		<td><a href="javascript:openModal('modal1');" class="button modal-open">이용약관</td>
		<td><div class="vl"></div></td>
		<td>개인 정보 처리 방침</td>
		<td><div class="vl"></div></td>
		<td>위치 기반 서비스 이용 약관</td>
	</tr>
</table>
<br><br>
<span><small>문의 전화 : 010-9318-5539</small></span><br>
<span><small>광고 제휴 : yeah0203@naver.com</small></span><br>
<span><small>소재지 : XXX XXXX XXXX XX</small></span>



</div>

</body>
</html>