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
