package org.ugsworld.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ugsworld.domain.BoardVO;
import org.ugsworld.domain.Criteria;
import org.ugsworld.domain.SearchCriteria;
import org.ugsworld.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardServiceTest {
	@Inject
	private BoardService service;
	
	private static final Logger logger =
							LoggerFactory.getLogger(BoardService.class);
	
//	@Test
//	public void regist() throws Exception {
//		BoardVO vo = new BoardVO();
//		vo.setTitle("서비스로 등록");
//		vo.setContent("서비스로 등록 내용");
//		vo.setWriter("전종훈");
//		service.regist(vo);
//	}
	
	@Test
	public void list() throws Exception {
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<BoardVO> list = service.listSearchCriteria(cri);
		for(BoardVO vo : list) {
			System.out.println(vo.getFullName());
		}
		
		
	}
	
	
}
