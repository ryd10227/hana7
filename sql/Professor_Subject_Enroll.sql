create table Professor (
  id smallint primary key not null auto_increment comment '교수번호',
  name varchar(31) not null comment '교수명',
  likecnt int not null default 0
);

-- primary key는 alter 할 수 없음
-- alter table Prof modify column id smallint unsigned primary key not null comment '교수번호';
alter table Professor modify column id smallint unsigned not null comment '교수번호';

create table Subject (
  id smallint unsigned not null primary key,
  name varchar(31) not null comment '과목명',
  professor smallint unsigned null comment '교수번호',
  foreign key fk_Subject_professor_Professor (professor) references Professor (id)
	on Update cascade on Delete set null
);

desc Student;

create table Enroll (
  id int unsigned not null primary key,
  subject smallint unsigned not null comment '과목번호',
  student int unsigned not null comment '학번',
  foreign key fk_Enroll_subject (subject)
								-- 과목이 지워지면 같이 지워지게
	references Subject (id) on Update cascade on Delete cascade,
  foreign key fk_Enroll_student (student)
	references Student (id) on Update cascade on Delete cascade
);
