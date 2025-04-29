show create database testdb;

create table T (
id int not null auto_increment primary key,
name varchar(31) not null
);

show create table T;

insert into T(name) values('홍길동');

-- select * from Emp;
select * from EmpBackup;

create table EmpBackup AS select * from Emp;

truncate table Emp;

insert into Emp select * from EmpBackup;

drop table EmpBackup;

desc Emp;

alter table Emp add column auth tinyint(1) unsigned not null default 9
	comment '0:sysadmin, 1: superuser,...'
    after dept;

alter table Emp add column auth2 enum('sysadmin');

