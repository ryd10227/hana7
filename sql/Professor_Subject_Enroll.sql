CREATE TABLE Professor (
    id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '교수번호',
    name VARCHAR(31) NOT NULL COMMENT '교수명',
    likecnt INT NOT NULL DEFAULT 0
);

-- primary key는 alter 할 수 없음
-- alter table Prof modify column id smallint unsigned primary key not null comment '교수번호';
alter table Professor modify column id smallint unsigned not null comment '교수번호';

CREATE TABLE Subject (
    id SMALLINT UNSIGNED NOT NULL PRIMARY KEY,
    name VARCHAR(31) NOT NULL COMMENT '과목명',
    professor SMALLINT UNSIGNED NULL COMMENT '교수번호',
    FOREIGN KEY (professor)
        REFERENCES Professor (id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Enroll (
    id INT UNSIGNED NOT NULL PRIMARY KEY,
    subject SMALLINT UNSIGNED NOT NULL COMMENT '과목번호',
    student INT UNSIGNED NOT NULL COMMENT '학번',
    FOREIGN KEY (subject)
        REFERENCES Subject (id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (student)
        REFERENCES Student (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);