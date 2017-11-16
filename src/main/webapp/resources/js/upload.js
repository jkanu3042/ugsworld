function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
	
}

function getFileInfo(fullName) {
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = '/displayFile?fileName='+fullName;
		//원본 이미지의 파일 이름.
		fileLink = fullName.substr(14);
		
		//2017/11/09
		var front = fullName.substr(0,12); 
		var end = fullName.substr(14);
		
		//원본이지미 경로
		getLink = "/displayFile?fileName="+front+end;		
	}else {
		imgsrc = "/resource/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return {fileName : fileName, imgsrc:imgsrc, getLink:getLink, fullName: fullName};
}
