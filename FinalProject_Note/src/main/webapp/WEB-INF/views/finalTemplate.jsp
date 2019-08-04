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

<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"></script>
<script src="https://cdn.tiny.cloud/1/thfe5r10bknp9pbzrorb1rah5doyys51i6hsjncezu0tpruv/tinymce/5/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ko_KR.js"></script>
<script>
	var height;
		$(function(){
			var i = $('#text').css('height');
			var arr = i.split('p');
			
			console.log(arr[0]);
			height=arr[0]-2;
			console.log(height);
			tinymce.init({
				  selector:'textarea',
				  language : 'ko_KR',
				  height: height,
				  plugins: [
				    'link image imagetools table code'
				  ],
				  menubar:false,
				  toolbar: 'undo redo styleselect fontselect fontsizeselect bold italic alignleft aligncenter alignright alignjustify image code table',
				  
					/* without images_upload_url set, Upload tab won't show up*/
					images_upload_url: 'postAcceptor.php',
					
					/* we override default upload handler to simulate successful upload*/
					images_upload_handler: function (blobInfo, success, failure) {
					  setTimeout(function () {
					    /* no matter what you upload, we will turn it into TinyMCE logo :)*/
					    success('http://moxiecode.cachefly.net/tinymce/v9/images/logo.png');
					  }, 2000);
					}
				  });
		});
	  
		/*function insertNote(){
			var ncontent = tinyMCE.activeEditor.getContent();
			var ntitle = $('#ntitle').val();
			console.log($('#ncontent').html());
			console.log(ntitle);
			
			location.href="${pageContext.request.contextPath}/note/insertNote.do?ntitle="+ntitle+"&ncontent="+ncontent;
		};*/
		
	</script>
<style>
	.tablebutton{
		background:lightblue;
	}
	.setTable{
		position:absolute;
		padding:5px;
		margin-top:3px;
	}
	
</style>
</head>
<body style="height:100%">
	<div style="height:100%">
		<div class="container" style="width:100%; height:100%; padding:none;">
		<form action="${pageContext.request.contextPath}/note/insertNote.do" style="height:100%">
			<div>
				<div style="height:5.33333%;border-bottom:1px solid #ededed;padding:5px 0;" >
					<div style="width:50%;display:inline-block;float:left">
						<h4>NoteBook</h2>
					</div>
					<div style="width:50%; text-align:right;display:inline-block;">
						<input type="submit" class="btn" method="post" value="저장하기" style="background:#e8a121;color:#fff;font-weight:500"/>
					</div>
					
				</div>
			</div>
			<div class="note-Editor" style="width:100%; height:100%; padding:0 15px;">
				<div class="Editor-Title" style="width:100%;height:7.33333%">
					<div class="Title" style="width:100%;border-bottom:1px solid lightgray;height:100%">
						<input type="text" id="ntitle" name="ntitle" placeholder="제목 없음" style="font-size:30px;width:100%; height:100%; border:none; padding-left:10px" />
					</div>
				</div>
				<div id="text" style="overflow:auto;height:87.33333%;k">	
						<textarea id="ncontent" name="ncontent" style="border-color:transparent"><b>테스트입니다.</b></textarea>
				</div>
				<style>
					.tox-tinymce{
						border:none;
					}
					.tox-toolbar__group{
						display:none;
					}
				</style>
				
			</div>	
			</form>		
		</div>
	</div>
	
	
	
</body>
</html>














