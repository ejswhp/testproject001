<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<jsp:include page="header.jsp"/>
<script type="text/javascript">
	function replyForm(){
		$("#replyForm").show();
		var replyPosition=$("#replyForm").offset().top;
// 		alert(replyPosition);
		$("#container".aimate({
			"scrollTop":replyPosition
		},2000));
	}
	
	$(function(){
		$("#container form").submit(function(){
			var bool=true;
			$("#replyForm tr>td").each(function(){	//[td,td,td,td,td,td....]길이만큼each가 function를 실행
				if($(this).children().val()==""){
					alert($(this).children().attr("name")+"을 입력하세요");
					$(this).children().focus();//바로 입력할 수 있게 포커스(커서)를 준다.
					bool=false;//submit이벤트 취소를 위한 값저장
					return false;//each에 구현된 함수 종료
				}
			});//each종료
			return bool;//bool의 값이 false면 submit이벤트 취소됨
		});//submit종료
	});
</script>
</head>
<body>
<div id="container">
<h1>게시글<small>상세보기</small></h1>
<table class="table table-striped">
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.regdate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea class="form-control" rows="10" cols="60" readonly="readonly">${dto.content}</textarea> </td>
	</tr>
	<tr>
		<td colspan="2">
			<a class="btn btn-primary btn-sm" href="updateform.do?seq=${dto.seq}">수정</a>
			<a class="btn btn-danger btn-sm" href="muldel.do?chk=${dto.seq}">삭제</a>
			<button class="btn btn-warning btn-sm" onclick="replyForm()">답글</button>
			<button class="btn btn-success btn-sm" type="button" value="목록" onclick="boardList()">목록</button>
		</td>
	</tr>
	
</table>
<div id="replyForm">
<hr/>
<h2>답글달기</h2>
	<form action="replyboard.do" method="post">
		<input type="hidden" name="seq" value="${dto.seq}"/>
		<table class="table table-striped">
			<tr>
				<th>아이디</th>
				<td><input class="form-control" type="text" name="id"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" name="title"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control" rows="10" cols="60" name="content"></textarea> </td>
			</tr>
			<tr>				
				<td colspan="2">
					<input class="btn btn-primary btn-sm" type="submit" value="답글추가"/>
					<input class="btn btn-success btn-sm" type="button" value="목록" onclick="boardList()"/>
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>























