<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="UTF-8"> 
<title>Summernote</title> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="./resources/js/summernote.js"></script> 
<script src="./resources/js/summernote-ko-KR.js"></script>
<script src="./resources/js/summernote-table-styles.js"></script>
</head> 
<body> 
<div id="summernote"></div> 
<script> 

	$(document).ready(function() {
		  $('#summernote').summernote({
			  lang: 'ko-KR',
		      popover: {
		      table: [
		        ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
		        ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
		        ['custom', ['tableStyles']]
		      ],
		    },
		  });
		});
	
	
</script> 
</body> 
</html>