create table Student (
  id int unsigned not null auto_increment primary key comment '학번',
  createdate timestamp DEFAULT CURRENT_TIMESTAMP comment '등록일시',
  updatedate timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '수정일시',
  name varchar(31) not null comment '이름',
  birthdt varchar(10) not null comment '생년월일',
  major smallint unsigned not null comment '학과 id',
  mobile varchar(13) not null comment '휴대폰번호', -- 010-0000-0000 형식일 때
  email varchar(127) not null comment '이메일',
  gender bit not null default 0 comment '성별(1:',
  -- ismale boolean not null default '성별',
  graduatedAt varchar(10) null comment '졸업일'
) AUTO_INCREMENT=1;

create table Major(
  id smallint unsigned primary key auto_increment comment '학과명',
  name varchar(31) not null comment '학과이름'
);

drop table Major;

desc Student;

alter table Student modify column name varchar(25) not null comment '이름';

alter table Student add constraint foreign key (major) references Major (id);

