package org.ugsworld.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ugsworld.domain.BoardVO;
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
	
	@Test
	public void testDelete() throws Exception {
		dao.delete(1);
		
	}
	
			
	

}
