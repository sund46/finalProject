<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
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

</head>
<body>
	<div>
		<div class="container" style="width:100%; height:100%; padding:none;">
			<div class="note-Editor" style="width:100%; height:100%">
				<div class="Editor-Title" style="width:100%">
					<div class="Editor" style="width:100%;border:1px solid red">
						
					</div>
					<div class="Title" style="width:100%;border:1px solid blue">
						<input type="text" placeholder="제목 없음" style="font-size:30px;width:100%; height:70px" />
					</div>
				</div>
				
				<div id="text" contenteditable="true" style="width:100%; height:400px;">텍스트 편집기</div>
			</div>			
		</div>
	</div>
	
	
	
</body>
</html>