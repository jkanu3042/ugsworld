<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header_detail.jsp"%>    

<style>
	.header {
		border : none;
		border-top: 1px dotted black;
	    color: #fff;
	    background-color: #fff;
	    height: 1px;
	}

</style>

<form role="form" action="modifyPage" method="post">
  	<input type="hidden" name='bno' value = "${boardVO.bno}">
  	<input type="hidden" name='page' value= "${cri.page }">
  	<input type="hidden" name='perPageNum' value="${cri.perPageNum }">
</form>

<section class="content">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">

				<div class="box-header">
					<h3 class="box-title">${boardVO.title}</h3>
				</div>
				<div class="box-body">
		            <h5><span class="glyphicon glyphicon-time"></span>
			        Post by ${boardVO.writer}, ${boardVO.regdate }
			        </h5>
			        <hr class="header">
		            <p style="font-size:15px;">${boardVO.content}</p>
		
		            <br><br>
			    </div>
			<div class="box-footer">
				<button type="submit" class="btn btn-warning">Modify</button>
				<button type="submit" class="btn btn-danger">REMOVE</button>
				<button type="submit" class="btn btn-primary">LIST ALL</button>
			</div>
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
	$(".btn-warning").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "/board/modifyPage");
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/board/removePage");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/listPage");
		formObj.submit();
	});
	
});
</script>


<%@include file="../include/footer.jsp"%>