<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header_detail.jsp"%>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
<form id='registerForm' role="form" method="post">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> 
			<input type="text"
				name='title' class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> 
			<input type="text"
				name="writer" class="form-control" placeholder="Enter Writer">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="10"
				placeholder="Enter ..." id="content_textarea"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">price</label>
			<input type="text"
				name="price" class="form-control" placeholder="Enter Price">
		</div>
		
		
		
		<!-- 이미지 드랍공간 -->
		<div class="form-group">
			<label for="exampleInputEmail1">File DROP here</label>
			<div class="fileDrop"></div>
		</div>
	</div>
	
	

	<div class="box-footer">
		<div>
			<hr>
		</div>
		
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
	
	
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
			</div>
		</div>
	</div>
</section>
<script src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img">
		<img src="{{imgsrc}}" alt="Attachment">
  </span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
		<i class="fa fa-fw fa-remove"></i>
	</a>
  </div>
</li>                
</script>  


<script>
var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		url : '/uploadAjax',
		data : formData,
		dataType : 'text',
		processData : false,
		contentType : false,
		type: 'POST',
		success : function(data) {
			
			var fileInfo = getFileInfo(data);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		}	
		
	});
	
})

$(".uploadedList").on("click",".delbtn",function(e){
	e.preventDefault();
	var fullName = $(this).attr("href");
	
	$.ajax({
		url:"/deleteFile",
		type:"post",
		data : {fileName:fullName},
		dataType:"text",
		success: function(result){
			if(result == "deleted") {
				$(this).parent("div").remove();
			}
		}
		
	});

});

$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str = "";
	
	$(".uploadedList .delbtn").each(function(index){
		str += "<input type='hidden' name='files["+index+"]' value='"+ $(this).attr("href")+ "'>";
	});
	that.append(str);
	
	$("#content_textarea").val().replace('/\n/g', '<br>') 
	
	
	that.get(0).submit();
});


</script>






<%@include file="../include/footer.jsp"%>
