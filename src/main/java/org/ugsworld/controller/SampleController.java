package org.ugsworld.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ugsworld.domain.SampleVO;

@RestController
@RequestMapping("/sample")
public class SampleController {
	
	@RequestMapping("/sendVO")
	public SampleVO sendVO() {
		SampleVO vo = new SampleVO();
		vo.setFirstName("�浿");
		vo.setLastName("�浿");
		vo.setMno(123);
		
		return vo;
	}
	
	
	
	
}
