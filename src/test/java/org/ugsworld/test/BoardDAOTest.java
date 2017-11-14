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
import org.ugsworld.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {
	
	@Inject
	private BoardDAO dao;
	
	private static final Logger logger =
				LoggerFactory.getLogger(BoardDAOTest.class);
	
//	@Test
//	public void testCreate() throws Exception {		
//		BoardVO board = new BoardVO();
//		board.setWriter("전종훈");
//		board.setTitle("Test Title");
//		board.setContent("아아아아아");
//		dao.create(board);
//	}
	
//	@Test
//	public void read() throws Exception {
//		logger.info(dao.read(1).toString());
//	}
	
//	@Test
//	public void testUpdate() throws Exception {
//		BoardVO board = new BoardVO();
//		board.setBno(1);
//		board.setTitle("수정된 제목이다.");
//		board.setContent("수정된 내용이다.");
//		dao.update(board);
//	}
	
//	@Test
//	public void testDelete() throws Exception {
//		dao.delete(1);
//		
//	}
//	
//	@Test
//	public void TestListPage() throws Exception {
//		int page = 3;
//		List<BoardVO> list = dao.listPage(page);
//		
//		for (BoardVO boardVO : list) {
//			logger.info(boardVO.getBno()+":"+boardVO.getTitle());
//		}
//		
//		
//	}
	
	
//	@Test
//	public void testListCriteria() throws Exception{
//		Criteria cri = new Criteria();
//		cri.setPage(2);
//		cri.setPerPageNum(9);
//		
//		List<BoardVO> list = dao.listCriteria(cri);
//		
//		for(BoardVO vo : list) {
//			logger.info(vo.getBno()+ ":"+vo.getTitle());
//		}
//		
//	}
	
	@Test
	public void testDynamic1() throws Exception {
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("안녕하");
		cri.setSearchType("t");
		
		logger.info("=======================");
		
		List<BoardVO> list = dao.listSearch(cri);
		
		for (BoardVO board : list) {
			logger.info(board.getBno()+ ": "+ board.getTitle());
		}
		
		logger.info("========================");
		
		logger.info("COUNT" + dao.listSearchCount(cri));
	}
	

}
