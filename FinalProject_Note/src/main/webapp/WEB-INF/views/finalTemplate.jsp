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
				// enable title field in the Image dialog
				  image_title: true, 
				  // enable automatic uploads of images represented by blob or data URIs
				  automatic_uploads: true,
				  // URL of our upload handler (for more details check: https://www.tinymce.com/docs/configure/file-image-upload/#images_upload_url)
				  // images_upload_url: 'postAcceptor.php',
				  // here we add custom filepicker only to Image dialog
				  file_picker_types: 'image', 
				  // and here's our custom image picker
				  file_picker_callback: function(cb, value, meta) {
				    var input = document.createElement('input');
				    input.setAttribute('type', 'file');
				    input.setAttribute('accept', 'image/*');
				    
				    // Note: In modern browsers input[type="file"] is functional without 
				    // even adding it to the DOM, but that might not be the case in some older
				    // or quirky browsers like IE, so you might want to add it to the DOM
				    // just in case, and visually hide it. And do not forget do remove it
				    // once you do not need it anymore.

				    input.onchange = function() {
				      var file = this.files[0];
				      
				      var reader = new FileReader();
				      reader.onload = function () {
				        // Note: Now we need to register the blob in TinyMCEs image blob
				        // registry. In the next release this part hopefully won't be
				        // necessary, as we are looking to handle it internally.
				        var id = 'blobid' + (new Date()).getTime();
				        var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
				        var base64 = reader.result.split(',')[1];
				        var blobInfo = blobCache.create(id, file, base64);
				        blobCache.add(blobInfo);

				        // call the callback and populate the Title field with the file name
				        cb(blobInfo.blobUri(), { title: file.name });
				      };
				      reader.readAsDataURL(file);
				    };
				    
				    input.click();
				  }
				  });
		});
	  //https://stackoverflow.com/questions/44694579/how-to-upload-images-in-spring-mvc-from-tinymce-editor
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
		<form action="${pageContext.request.contextPath}/note/insertNote.do" style="height:100%" method="post">
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














