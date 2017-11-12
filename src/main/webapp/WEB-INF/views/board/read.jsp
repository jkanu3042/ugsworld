<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>    

<form role="form" method="post">
	<input type="hidden" name="bno" value="${boardVO.bno}">
</form>

<div class="box-body">
     <div class="row">
         <div class="col-sm-12">
             <h2>${boardVO.title}</h2>
             <h5><span class="glyphicon glyphicon-time"></span>
	          Post by ${boardVO.writer}, ${boardVO.regdate }
	         </h5>
            
             <p style="font-size:15px;">${boardVO.content}</p>

             <br><br>
             <hr/>
           </div>
      	</div>
   </div>
<div class="box-footer">
	<button type="submit" class="btn btn-warning">Modify</button>
	<button type="submit" class="btn btn-danger">REMOVE</button>
	<button type="submit" class="btn btn-primary">LIST ALL</button>
</div>
<!-- /.box-body -->
<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	$(".btn-warning").on("click", function() {
		formObj.attr("action", "/board/modify");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/board/remove");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		self.location = "/board/listAll";
	});
	
});
</script>


<%@include file="../include/footer.jsp"%>