package org.ugsworld.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ugsworld.domain.BoardVO;
import org.ugsworld.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardServiceTest {
	@Inject
	private BoardService service;
	
	@Test
	public void regist() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("서비스로 등록");
		vo.setContent("서비스로 등록 내용");
		vo.setWriter("전종훈");
		service.regist(vo);
	}
	
	
}
