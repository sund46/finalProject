<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html style="height:100%">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	.tablebutton{
		background:lightblue;
	}
	.setTable{
		position:absolute;
	}
</style>
</head>
<body style="height:100%">
	<div style="height:100%">
		<div class="container" style="width:100%; height:100%; padding:none;">
			<div class="note-Editor" style="width:100%; height:100%; padding:0 15px;">
				<div class="Editor-Title" style="width:100%;">
					<div class="Editor" style="width:100%; border:1px solid red">
						<div class="btn tablebutton" onclick="addTable()" style="cursor:pointer;">표만들기</div>
						<div class="setTable" style="width:150px;height:170px; border:1px solid #000; background:#fff">
							<div style="height:150px  ;border-bottom:1px solid red">
								<div></div>
								<div></div>
							</div>
							<div style="height:20px">
							</div>
						</div>
					</div>
					<div class="Title" style="width:100%;border:1px solid blue">
						<input type="text" placeholder="제목 없음" style="font-size:30px;width:100%; height:70px" />
					</div>
				</div>
				<div style="overflow:auto;height:85%;border:1px solid black">	
					<div id="text" contenteditable="true" style="width:100%;height:100%">텍스트 편집기</div>				
				</div>

			</div>			
		</div>
	</div>
	
	
	
</body>
</html>