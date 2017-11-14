package org.ugsworld.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.ugsworld.domain.ReplyVO;
import org.ugsworld.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO dao;
	
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		return dao.list(bno);
	}
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void deleteReply(Integer rno) throws Exception {
		dao.delete(rno);
	}


}
