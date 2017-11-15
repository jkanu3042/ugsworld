package org.ugsworld.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ugsworld.domain.Criteria;
import org.ugsworld.domain.ReplyVO;
import org.ugsworld.persistence.BoardDAO;
import org.ugsworld.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private BoardDAO boardDAO;
	
	//댓글 카운트 증가(트랜젝션 처리)
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		int bno = vo.getBno();
		replyDAO.create(vo);
		boardDAO.updateReplyCnt(bno, 1);
	}

	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		return replyDAO.list(bno);
	}
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		replyDAO.update(vo);
	}

	//댓글 카운트 감소(트랜젝션 처리)
	@Transactional
	@Override
	public void deleteReply(Integer rno) throws Exception {
		int bno = replyDAO.getBno(rno);
		replyDAO.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
		
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
		return replyDAO.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return replyDAO.count(bno);
	}


}
