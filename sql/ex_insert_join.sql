-- Major 테이블에 경제학, 경영학 추가하세요.
insert into Major (name)
	values ('경제학'),
		   ('경영학');


-- Student 테이블에 5명 이상 추가하세요.
insert into Student (name, birthdt, major, mobile, email)
	values ('김일수', '19990202', 1, '01023324241', 'kim@gmail.com');

insert into Student (name, birthdt, major, mobile, email)
	values ('김이수', '19990204', 1, '01023324222', 'kim2@gmail.com'),
		   ('김삼수', '19990205', 1, '01023324223', 'kim3@gmail.com');

insert ignore into Student (name, birthdt, major, mobile, email)
	values ('김일수', '19990202', 1, '01023324241', 'kim@gmail.com');

insert ignore into Student (name, birthdt, major, mobile, email)
	values ('김사수', '19990204', 1, '01023324244', 'kim4@gmail.com');
    
insert into Student (name, birthdt, major, mobile, email)
	values ('김사수', '19990204', 1, '01023324244', 'kim4@gmail.com')
    on duplicate key update updatedate = now();

insert into Student (name, birthdt, major, mobile, email)
	values ('김오수', '19990205', 1, '01023324245', 'kim5@gmail.com');


-- Professor, Subject 테이블에 샘플 데이터를 등록하세요.
desc Professor;

insert into Professor (id, name)
	values (101, '김교수');

desc Subject;

insert into Subject (id, name)
	values (1001, '컴퓨터구조');


-- Enroll(수강신청) 테이블에 샘플 데이터를 등록하세요.
desc Enroll;

insert into Enroll (id, subject, student)
	values (11, 101, 5);


select * from Major;
select * from Student;
select * from Professor;
select * from Subject;
select * from Enroll;

select name, substring(name,1,1) from Student where name not like '김%';
alter table Professor modify column id SMALLINT NOT NULL AUTO_INCREMENT COMMENT '교수번호';

insert into Professor (name, likecnt)
	select concat(substring(name, 1, 1), '교수'), id from Student
	 where name not like '김%';

insert into Subject (name, professor)
	select concat('과목', id), id from Professor order by rand();
    
insert into Enroll (subject, student)
	select id, (select id from Student order by rand() limit 1) from Subject;

select * from Student order by rand() limit 1;

select name, mobile, email as email_address from Student;

select *, if(likecnt > 5, 'Best', 'Worst') as level from Professor;

select *, 
	(case likecnt when 2 then 'two' when 3 then 'three' else 'seven' end) as num,
	(case when likecnt > 5 then 'Best' when likecnt <= 2 then 'Worst' else 'mid' end)
     as level
  from Professor;
  
select ifnull(graduatedat, '재학중'), name from Student;

update Student set graduatedat = curdate()
	order by rand() limit 1;

SELECT 
    e.*,
    (SELECT 
            name
        FROM
            Subject
        WHERE
            id = e.subject) AS subject_name
FROM
    Enroll e;

SELECT 
    e.id, s.name, s.id AS subjectid
FROM
    Enroll e
        JOIN
    Subject s ON e.subject = s.id
WHERE
    e.id = 1;
   
select * from Professor where id < ANY(select id from Professor);
select * from Professor where id < SOME(select id from Professor);
select * from Professor where id < ALL(select id from Professor);

select * from Student where major not in (1,2,3);

show create table Student;

select * from Professor;

insert into Professor (name) values ('김교수');

select *
	from Subject s inner join Professor p;

select * 
	from Subject s, Professor p where s.professor = p.id;

select p.*, ifnull(s.name, '담당 교과 없음') subject
  from Professor p left outer join Subject s on p.id = s.professor;

insert into Enroll(subject, student)
  select 2, id from Student where id not in (select student from Enroll where subject = 2);

alter table Enroll add column iscaptain boolean default 0 comment '반장여부';

select * from Enroll order by subject, student;

SELECT 
    *
FROM
    (SELECT 
        en.subject, GROUP_CONCAT(s.name), GROUP_CONCAT(s.id)
    FROM
        Enroll en
    INNER JOIN Student s ON en.student = s.id
    WHERE
        s.name LIKE '김%'
    GROUP BY en.subject) sub
        INNER JOIN
    Enroll en ON sub.subject = en.subject
        AND sub.captain = en.student;
 
ALTER table Professor add column subjectcnt tinyint unsigned not null default 0;
 
select * from Subject;
select * from Professor;
 
UPDATE Professor p
SET 
    subjectcnt = (SELECT 
            COUNT(*)
        FROM
            Subject
        WHERE
            professor = p.id);


select * from Subject;
select * from Professor;

-- delete from Subject where ID  