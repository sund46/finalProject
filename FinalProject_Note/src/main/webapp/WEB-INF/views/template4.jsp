<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script> 
<script>

$(function(){
	tinymce.init({      
	      selector: 'textarea',  // change this value according to your HTML
	      auto_focus: 'element1',
	      toolbar: 'undo redo | imageupload',
	      setup: function(editor) {

	              // create input and insert in the DOM
	              var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
	              $(editor.getElement()).parent().append(inp);

	              // add the image upload button to the editor toolbar
	              editor.addButton('imageupload', {
	                text: 'Add image',  
	                icon: 'image',
	                onclick: function(e) { // when toolbar button is clicked, open file select modal
	                  inp.trigger('click');
	                }
	              });

	              // when a file is selected, upload it to the server
	              inp.on("change", function(e){
	                uploadFile($(this), editor);
	              });


	            function uploadFile(inp, editor) {
	              var input = inp.get(0);
	              var data = new FormData();
	              data.append('files', input.files[0]);

	              $.ajax({
	                url: '${pageContext.request.contextPath}/a/images',
	                type: 'POST',
	                data: data,
	                enctype: 'multipart/form-data',
	                dataType : 'json',
	                processData: false, // Don't process the files
	                contentType: false, // Set content type to false as jQuery will tell the server its a query string request
	                success: function(data, textStatus, jqXHR) {
	                  editor.insertContent('<img class="content-img" src="${pageContext.request.contextPath}' + data.location + '" data-mce-src="${pageContext.request.contextPath}' + data.location + '" />');
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                  if(jqXHR.responseText) {
	                    errors = JSON.parse(jqXHR.responseText).errors
	                    alert('Error uploading image: ' + errors.join(", ") + '. Make sure the file is an image and has extension jpg/jpeg/png.');
	                  }
	                }
	              });
	            }
	      }
	    });
});


</script>
</head>
<body>
	
	<textarea><b>테스트입니다.</b></textarea>
	<button class="btn" onclick="test()">내용 가져오기</button>
	<script>
	function test(){
		console.log(tinyMCE.activeEditor.getContent());
	};
	</script>
</body>
</html>