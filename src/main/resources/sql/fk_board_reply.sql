alter table tbl_reply add constraint fk_board 
foreign key (bno) references tbl_board (bno);
