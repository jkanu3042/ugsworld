create table tbl_board (
	bno int not null auto_increment,
    title varchar(200) not null,
    content text NULL,
    writer varchar(50) not null,
    regdate timestamp not null default now(),
    viewcnt int default 0,
    replycnt int default 0,
    primary key(bno)
);

create table tbl_reply (
	rno int not null auto_increment,
    bno int not null default 0,
    replytext varchar(1000) not null,
    replyer varchar(50) not null,
    regdate	timestamp not null default now(),
    updatedate timestamp not null default now(),
    primary key(rno)
);

alter table tbl_reply add constraint fk_board 
foreign key (bno) references tbl_board (bno);

update tbl_board set replycnt = 
(select count(rno) from tbl_reply where bno = tbl_board.bno) where bno >0;



create table tbl_attach(
	fullName varchar(150) not null,
	bno int not null,
	regdate timestamp default now(),
	primary key(fullName)

);
alter table tbl_attach add constraint fk_board_attach
foreign key (bno) references tbl_board (bno);
