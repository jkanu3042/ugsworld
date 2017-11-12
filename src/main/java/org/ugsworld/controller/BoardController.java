package org.ugsworld.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.ugsworld.domain.BoardVO;
import org.ugsworld.service.BoardService;


@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	private static final Logger logger =
					LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() throws Exception {
		
		logger.info("register get.......");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardVO board, Model model) throws Exception {
		
		logger.info("register post......");
		logger.info(board.toString());
		
		service.regist(board);
		
		model.addAttribute("result", "success");
		
		//return "/board/success";
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list...........");
	}
	
	

}
