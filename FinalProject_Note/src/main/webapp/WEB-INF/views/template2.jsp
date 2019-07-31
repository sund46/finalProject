<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<HTML>

<HEAD>
<TITLE>웹에디터 예제3</TITLE>
<script src="https://cdn.tiny.cloud/1/thfe5r10bknp9pbzrorb1rah5doyys51i6hsjncezu0tpruv/tinymce/5/tinymce.min.js"></script>
<script src="./resources/js/ko_KR.js"></script>
</HEAD>
<BODY>
<textarea>텍스트 편집기</textarea>
<script>
tinymce.init({
	selector: 'textarea',
	height: 600,
	plugins: 'image code',
	toolbar: 'undo redo | image code',
	
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
</BODY>

</HTML>