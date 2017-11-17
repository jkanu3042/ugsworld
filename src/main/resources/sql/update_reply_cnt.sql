update tbl_board set replycnt = 
(select count(rno) from tbl_reply where bno = tbl_board.bno) where bno >0;