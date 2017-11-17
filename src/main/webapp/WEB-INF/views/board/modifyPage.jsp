<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header_detail.jsp"%>    

<section class="content">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				
			<form role="form" action="modifyPage" method="post">	
				<input type="hidden" name="page" value="${cri.page }">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
				<input type="hidden" name="searchType" value="${cri.searchType }">
				<input type="hidden" name="keyword" value="${cri.keyword }">
			
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" value="${boardVO.title}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> <input
							type="text" name="writer" class="form-control"
							value="${boardVO.writer}">
					</div>					
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="10">${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Price</label> <input
							type="text" name="writer" class="form-control"
							value="${boardVO.price}">
					</div>
				</div>
			</form>
		</div>
		<div class="box-footer">
			<button type="submit" id="saveBtn" class="btn btn-primary">SAVE</button>
			<button type="submit" id="cancleBtn" class="btn btn-warning">CANCEL</button>
		</div>
	</div>
</div>
</div>
</section>


<!-- /.box-body -->
<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	$("#saveBtn").on("click", function() {
		formObj.submit();
	});
	
	$("#cancleBtn").on("click", function(){
		self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});

	
});
</script>


<%@include file="../include/footer.jsp"%>