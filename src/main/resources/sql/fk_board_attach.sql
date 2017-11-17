alter table tbl_attach add constraint fk_board_attach
foreign key (bno) references tbl_board (bno);
