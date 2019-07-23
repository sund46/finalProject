<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 링크 : https://kslee7746.tistory.com/entry/JSP-jQuery%EB%A1%9C-%EA%B0%84%EB%8B%A8%ED%95%9C-%ED%85%8D%EC%8A%A4%ED%8A%B8-%ED%8E%B8%EC%A7%91%EA%B8%B0-%EB%A7%8C%EB%93%A4%EA%B8%B0 -->
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#text {

    -moz-appearance: textfield-multiline;

    -webkit-appearance: textarea;

    border: 1px solid gray;

    font: medium -moz-fixed;

    font: -webkit-small-control;

    overflow: auto;

    padding: 2px;

    resize: both;

  }
</style>
</head>
<body>

  <div style="background-color:#CCFFFF; width:390px; padding: 10px;">

    <button id="selectAll">전체선택</button>

    <button id="bold">굵게</button>

    <button id="italic">기울임</button>

    <button id="underLine">밑줄</button>

    <br/>

    <button id="justifyLeft">왼쪽정렬</button>

    <button id="justifyCenter">가운데정렬</button>

    <button id="justifyRight">오른쪽정렬</button>

    <br/>



    <select id="fontName" width="50px">

        <option value="">글꼴 선택</option>

        <option value="돋움">돋움</option>

        <option value="굴림">굴림</option>

        <option value="궁서">궁서</option>

        <option value="바탕">바탕</option>

        <option value="맑은 고딕">맑은 고딕</option>

    </select>

    <select id="fontSize" width="50px">

        <option value="">글자 크기</option>

        <option value="1">4px</option>

        <option value="2">8px</option>

        <option value="3">10px</option>

        <option value="4">12px</option>

        <option value="5">16px</option>

        <option value="6">20px</option>

        <option value="7">30px</option>

    </select>

    <select id="foreColor" width="50px">

        <option value="">글자 색깔</option>

        <option value="#f00">빨강</option>

        <option value="#00f">파랑</option>

        <option value="#0f0">초록</option>

        <option value="#ffff00">노랑</option>

        <option value="#000">검정</option>

    </select>

    <select id="hiliteColor" width="50px">

        <option value="">글자 배경색</option>

        <option value="#f00">빨강</option>

        <option value="#00f">파랑</option>

        <option value="#0f0">초록</option>

        <option value="#ffff00">노랑</option>

        <option value="#000">검정</option>

    </select>

  </div>

  <div id="text" contenteditable="true" style="width:400px; height:400px;">텍스트 편집기</div>
	
	<script>
		$('button').click(function(){
	
		    document.execCommand($(this).attr('id'), false, true);
		});
	
		$('select').change(function(){
	
		    document.execCommand($(this).attr('id'), false, $(this).val());
		});
	</script>
	
</body>
</html>