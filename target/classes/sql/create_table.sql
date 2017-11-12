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



