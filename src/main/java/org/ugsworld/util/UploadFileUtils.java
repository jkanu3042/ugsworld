package org.ugsworld.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	private static final Logger logger
					= LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, 
									String originalName,
									byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		
		//저장될 원본 파일의 이름
		String savedName = uid.toString()+"_"+originalName;
		
		//저장 될 디렉터리 경로 계산.
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath+savedPath,savedName);
		
		//target에 해당되는 파일에 원본 데이터 복사.
		FileCopyUtils.copy(fileData, target);
		
		//포멧 이름 출력
		String formatName = originalName.substring(originalName.lastIndexOf('.')+1);
		
		String uploadedFileName = null;
		
		
		//이미지 파일 외에 다른 경우엔 예외처리.
		if(MimeMediaUtil.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath,
									String path,
									String fileName) throws Exception {
			
				String iconName = 
						uploadPath + path + File.separator+fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}


	
	//업로드 된 파일 경로 설정.
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath
						   + File.separator 
						   + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator
						 + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		//경로 설정 후, 폴더 생성.
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
		
	}
	
	
	private static void makeDir(String uploadPath, String... paths) {
		//paths의 마지막요소, 즉 파일이 저장되는 최상단 폴더가 이미 존재하면 종료.
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		//각 path별 폴더 생성 코드.
		for(String path : paths) {
			
			File dirPath = new File(uploadPath+path);
			
			if(! dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath,
										String path,
										String fileName) throws Exception {
		BufferedImage sourceImg =
					ImageIO.read(new File(uploadPath+path, fileName));
		
		BufferedImage destImg = 
				Scalr.resize(sourceImg,
							Scalr.Method.AUTOMATIC,
							Scalr.Mode.FIT_TO_HEIGHT,
							100);
		String thumbnailName = 
				uploadPath + path+ File.separator + "s_"+fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = 
				fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}
	
	
	
	
	
}
