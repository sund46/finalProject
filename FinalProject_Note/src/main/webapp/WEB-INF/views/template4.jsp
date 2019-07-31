<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.tiny.cloud/1/thfe5r10bknp9pbzrorb1rah5doyys51i6hsjncezu0tpruv/tinymce/5/tinymce.min.js"></script>
  <script src="./resources/js/ko_KR.js"></script>
  <script>
  tinymce.init({
	  selector:'textarea',
	  language : 'ko_KR',
	  height: 500,
	  plugins: [
	    'link image imagetools table code'
	  ],
	  menubar:false,
	  toolbar: 'undo redo | styleselect | fontselect | fontsizeselect | bold italic | alignleft aligncenter alignright alignjustify | image code table',
	  
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
	  
	  
	  </script>
</head>
<body>
	<form method="post">
		<textarea><b>테스트입니다.</b></textarea>
	</form>
	<button class="btn" onclick="test()">내용 가져오기</button>
	<script>
	function test(){
		console.log(tinyMCE.activeEditor.getContent());
	};
	</script>
</body>
</html>