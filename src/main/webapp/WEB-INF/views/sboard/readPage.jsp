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
  	<input type="hidden" name="searchType" value="${cri.searchType }">
  	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>

<section class="content">
<div class="container">
	<div class="row">
		<div class="col-md-12">
		
			<!-- 컨텐츠 영역 시작 -->
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
				<ul class="mailbox-attachments clearfix uploadedList"></ul>    
				   
				<div class="box-footer">
					<button type="submit" id="modBtn" class="btn btn-warning">Modify</button>
					<button type="submit" id="rmBtn" class="btn btn-danger">REMOVE</button>
					<button type="submit" id="lsBtn" class="btn btn-primary">LIST ALL</button>
				</div>
			</div>
			<!-- 컨텐츠 영역 끝  -->
			
			
			<!-- 댓글 쓰기 창 시작 -->
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">댓글 쓰기</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label>
					<input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter">
					
					<label for="exampleInputEmail1">Reply Text</label>
					<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
				</div>
				
				<div class="box-footer">
					<button type="submit" class="btn btn-primary" id="replyAddBtn">댓글 쓰기</button>
				</div>
			
			</div>
			<!-- 댓글 쓰기 창 끝 -->
			
			<ul class="timeline">
				<li class="time-label" id="repliesDiv">
					<span class="bg-blue">
					댓글보기<small></small>
					</span>
				</li>
			</ul>
			
			<div class="text-center">
				<ul id="pagination" class="pagination pagination-sm no-margin">
				</ul>			
			</div>
			
			
				
		</div>	
	</div>
</div>

</section>

<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      
      <ul class="mailbox-attachments clearfix uploadedList"></ul>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>    

<!-- Handlerbars -->
<script src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     	<a class="btn btn-primary btn-xs"
			data-toggle="modal" data-target="#modifyModal">modify</a>
    </div>
  </div>			
</li>
{{/each}}
</script>
<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img">
		<img src="{{imgsrc}}" alt="Attachment">
  </span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
  </div>
</li>                
</script> 
<script>
var bno = ${boardVO.bno};
var replyPage = 1;


Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() +1;
	var date = dateObj.getDate();
	return year + "/"+month+"/"+date;
});

var printData = function(replyArr, target, templateObject) {
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);	
}

var printPaging = function(pageMaker, target) {
	var str = "";
	if (pageMaker.prev) {
		str += "<li><a href='" + (pageMaker.startPage - 1)
				+ "'> << </a></li>";
	}
	for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		var strClass = pageMaker.cri.page == i ? 'class=active' : '';
		str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
	}
	if (pageMaker.next) {
		str += "<li><a href='" + (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}
	target.html(str);
}

function getPage(pageInfo) {
	$.getJSON(pageInfo, function(data){
		printData(data.list, $("#repliesDiv") ,$('#template'));
		printPaging(data.pageMaker, $(".pagination"));
	
	});
}

$("#repliesDiv").on("click", function(){
	
	if($(".timeline li").size()>1) {
		return;
	}
	getPage("/replies/"+bno+"/1");

});

$(".pagination").on("click", "li a", function(event){
	event.preventDefault();
	
	replyPage = $(this).attr("href");
	
	getPage("/replies/"+bno+"/"+replyPage);
	
});

$("#replyAddBtn").on("click",function(){
	 
	 var replyerObj = $("#newReplyWriter");
	 var replytextObj = $("#newReplyText");
	 var replyer = replyerObj.val();
	 var replytext = replytextObj.val();
	
	  
	  $.ajax({
			type:'post',
			url:'/replies/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/"+bno+"/"+replyPage );
					replyerObj.val("");
					replytextObj.val("");
				}
		}});
});


$(".timeline").on("click", ".replyLi", function(event){
	
	var reply = $(this);
	
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
	
});


$("#replyModBtn").on("click",function(){
	  
	  var rno = $(".modal-title").html();
	  var replytext = $("#replytext").val();
	  
	  $.ajax({
			type:'put',
			url:'/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage );
				}
		}});
});

$("#replyDelBtn").on("click",function(){
	  
	  var rno = $(".modal-title").html();
	  var replytext = $("#replytext").val();
	  
	  $.ajax({
			type:'delete',
			url:'/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage );
				}
		}});
});

</script>

<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	$("#modBtn").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/modifyPage");
		formObj.submit();
	});
	
	$("#rmBtn").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	});
	
	$("#lsBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/list");
		formObj.submit();
	});
	
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/sboard/getAttach/"+bno, function(list){
		$(list).each(function() {
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
			
		});
	});
	
});
</script>


<%@include file="../include/footer.jsp"%>