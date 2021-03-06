<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>

	body {
		background-color: #ffffe0;
		/* background: url("https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMjVfOTUg%2FMDAxNjE2NjU0MzAyODA0.8qpcyIw3gwNDawEqIpOS5C8xd0ARF3To_SKeVQ7j9cwg.0cfChaGaJ8SK-IEBOx5mb7ZOZTwZ5XqKRNUxyLCBV7Eg.JPEG.qpdpxpfkd%2F20210324%25A3%25DF160114.jpg&type=sc960_832");
		background-repeat: no-repeat;
		height: 100vh;
		background-size: cover;
		*/
	}
	
	h1 {
		color:#8a2be2
	}
	
	.td {
		font-size: 20px;
		font-weight: 700;
		font-family: inherit;
		padding: 8px;
	}
	
	.td1 {
		color: lime;
	}

	.td1:hover {
		color: blue;
		cursor: pointer;
	}
	
	.td2 {
		color: red;
	}
	
	.td2:hover {
		cursor: not-allowed;
	}
	
	.door {
		font-size: 40px;
		text-align: left;
		color: #00ced1;
	}
	.divBody {
		text-align: center;
  
	}
	.divSeatTableSmall {
		display: inline-block;
	}
	.doorText {
		text-align: left;
	}
	.divForm {
		text-align: left;
		display: inline-block;
		
	}
	
	.divButton {
		text-align: left;
		font-size: 20px;
		font-weight: 600;
	}
	
	tbody, thead {
		background-color:
	}
	
	.back {
		font-size: 30px;
		font-weight: 600;
		color: blue;
	}
	
	.hdoor {
		color: #00ced1;
	}
	
	.formBtn {
		display: none;
	}
	
	.bt:hover {
		cursor: pointer;
	}
	
	input[type=text] {
		width: 20;
		height: 20;
		font-size: 18px;
		border: 0;
	}
	
	caption {
		color: blue;
		font-size:25px;
		font-weight: 600;
	}
	
	table {
		border: 1px;
	}
	
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	// ????????? ??????
	$(document).ready(function(){
		fnSeatCheck();
		fnCheckOut();
		fnSeatConfirm();
		fnSeatRenew();
	})
	
	
	// ??????
	
	
	// 4. ????????????
	function fnSeatRenew(){
		$('#btnSeatRenew').on('click', function(){
			$.ajax({
				url: '${contextPath}/seat/seatRenew',
				type: 'GET',
				dataType: 'json',
				success: function(obj){
					location.href='${contextPath}/seat/seatPage';
					alert('?????????????????????.');
				},
				error: function(jqXHR){
					alert('??????????????????.');
				}
			})
			
		})
	}
	
	
	
	// 3. ????????????
	function fnSeatConfirm(){
		$('#btnConfirm').on('click', function(){
			$.ajax({
				url: '${contextPath}/seat/seatConfirm',
				type: 'GET',
				data: $('#formConfirm').serialize(),
				dataType: 'json',
				success: function(obj){
					if(obj.res != null) {
						alert(obj.res.memberName + '?????? ??????????????? ' + obj.res.seatNo + '??? ?????????.');
					} else {
						alert('???????????? ?????? ????????? ????????????.');
					}
				},
				error: function(jqxhr){
					alert('???????????? ???????????????.');
				}
			})
		})
		
	}

	// 2. ??????
	function fnCheckOut(){
			$('#btnCheckOut').on('click', function(){

					$.ajax({
						url: '${contextPath}/seat/seatCheckOut',
						type: 'GET',
						data: $('#formCheckOut').serialize(),
						dataType: 'json',
						success: function(obj){
							if(obj.res > 0) {
								alert('?????? ?????????????????????.');
								location.href='${contextPath}/seat/seatPage';
							} else {
								alert('?????? ????????? ?????? ??? ????????????.');
							}
						},
						error: function(jqxhr){
							alert('?????? ????????? ???????????????.');
						}
					})
				
			})
		
	}
	
	// 1. ?????? ?????? ???????????? seatStatus ????????????.
	
	function fnSeatCheck(){
		$('.td').on('click', function(){
			$.ajax({
				url: '${contextPath}/seat/seatCheck',
				type: 'GET',
				data: 'seatNo=' + $(this).text(),
				dataType: 'json',
				success: function(obj){
					if(obj.seats.seatStatus == 1) {
						if(confirm(obj.seats.seatNo + '??? ????????? ?????????????????????????')){

							alert('?????????????????????. ??????????????? ' + obj.code + '?????????. ????????? ???????????? ???????????????.');
							location.href='${contextPath}/seat/upSeatStatus?seatNo=' + obj.seats.seatNo;
						}
					} else if(obj.seats.seatStatus == 2){
						alert('?????? ???????????? ???????????????. ?????? ????????? ??????????????????.');
					}
				}
			})
			
		})
	}
	
</script>

</head>
<body>

	<div class="divBody">
		<h1>????????? ???????????????</h1>
		
		<div class="divSeatTableSmall">
		    <table>
		    	<caption>?????????</caption>
		    	
		    	<thead>
		    		<tr>
		    			<td colspan="11" class="door"><i class="fa-solid fa-door-closed door"></i></td>
		    		</tr>
		    	</thead>
		    	<tbody class="tbody">
		    		
		    			<tr >
		    				<td class="hdoor"><div class="doorText" style="font-weight:700">?????????</div></td>
		    				<td colspan="5"></td>
		    				<c:forEach begin="0" end="4" items="${seats}" var="seat">
		    				
		    						
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    					<td colspan="6"></td>
		    				<c:forEach begin="5" end="9" items="${seats}" var="seat">
		    				
		    						
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="10" end="14" items="${seats}" var="seat">
		    				
		    				
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		    				<c:forEach begin="15" end="19" items="${seats}" var="seat">
		    				
		    				
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			
		    			<tr>
		    				<c:forEach begin="20" end="24" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="25" end="29" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="30" end="34" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="35" end="39" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="40" end="44" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="45" end="49" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<td colspan="11">&nbsp;</td>
		    			</tr>
		    			<tr>
		    				<td colspan="11">&nbsp;</td>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="50" end="54" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="55" end="59" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="60" end="64" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="65" end="69" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="70" end="74" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="75" end="79" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="80" end="84" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="85" end="89" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			
		    			<tr>
		    				<c:forEach begin="90" end="94" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    				<td></td>
		    				<c:forEach begin="95" end="99" items="${seats}" var="seat">
		    					<c:if test="${seat.seatStatus == 1}">
		    						<td class="td td1"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    					<c:if test="${seat.seatStatus == 2}">
		    						<td class="td td2"><i class="fa-solid fa-chair"></i>${seat.seatNo}</td>
		    					</c:if>
		    				</c:forEach>
		    			</tr>
		    			<tr>
		    				<td colspan="11" class="back">back</td>
		    			</tr>
		    			<tr>
		    				<td colspan="11">&nbsp;</td>
		    			</tr>
		    	</tbody>
		    	<tfoot>
		    		<tr>
		    			<td colspan="11">	
		    				<div class="divButton">
								????????????
								<form id="formCheckOut" class="divForm">
									<input type="hidden" name="" id="" value="">
									<input type="text" name="memberNo" id="memberNo1" placeholder="??????????????? ???????????????.">
									<input type="button" id="btnCheckOut" class="formBtn">
									<label for="btnCheckOut">&nbsp;<i class="fa-solid fa-magnifying-glass bt"></i>&nbsp;</label>
								</form>
								
								<br>
								
								????????????
								<form id="formConfirm" class="divForm">
									<input type="text" name="memberId" id="id2" placeholder="???????????? ???????????????.">
									<input type="button" value="??????" id="btnConfirm" class="formBtn">
									<label for="btnConfirm">&nbsp;<i class="fa-solid fa-magnifying-glass bt"></i>&nbsp;</label>
								</form>
								
								<br>
								
								????????????
								<input type="button" value="?????? ??????" id="btnSeatRenew" class="formBtn">
								<label for="btnSeatRenew">&nbsp;<i class="fa-solid fa-computer-mouse bt"></i>&nbsp;</label>
							</div>
						</td>
		    		</tr>
		    	</tfoot>
		    </table>
	    </div>

	
	</div>
</body>
</html>