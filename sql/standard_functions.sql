SELECT 
    SUM(salary)
FROM
    Emp;
SELECT CONV('FF', 16, 10), POWER(2, 3), RAND();
SELECT 
    '2024-04-25',
    CAST('2024-04-25' AS DATE),
    CONVERT( '2024-04-25' , DATE);
SELECT 
    CONVERT( - 1.567 , SIGNED INTEGER),
    CONVERT( ABS(- 1.567) , UNSIGNED INTEGER);
SELECT CAST(STR_TO_DATE('2018-02-03', '%Y-%d-%m') AS DATE);
SELECT DATE_FORMAT('2018-02-03', '%Y-%m-%d');

SELECT 
    dname, HEX(AES_ENCRYPT(dname, '암호키'))
FROM
    DeptSC_DECRYPT
select dname, AES_ENCRYPT(dname, '암호키') from Dept; -- AES_DECRYPT
select dname, AES_DECRYPT(UNHEX(HEX(AES_ENCRYPT(dname, '암호키'))), '암호키') from Dept; -- AES_DECRYPT

select sub.*, CAST(AES_DECRYPT(UNHEX(sub.enc), '암호키') as char)
from (select dname, HEX(AES_ENCRYPT(dname, '암호키')) enc from Dept) sub;

select dname, SHA2(dname, 256) from Dept;

select dept, group_concat(ename)
  from Emp group by dept;
  
SELECT 
    CONCAT('abc', ':', 'efg', ':', NULL, ':', 'hij'),
    CONCAT_WS(':', 'abc', 'efg', NULL, 'hij');
       
select ifnull(captain, '공석'), if(captain is null, '공석', captain),
       (case when captain is null then '공석' else captain end),
       (case captain when 30 then '3333' when 51 then '555' else '공석' end),
       NullIf(captain, 150)
  from Dept;
  
SELECT ASCII('A'), CHAR(65, 66), CAST(CHAR(65, 66) AS CHAR);
select length('AB한글'), char_length('AB한글'), bit_length('A'), sign(-2), sign(2);
SELECT 5 % 2, MOD(5, 2);
SELECT ELT(2, 'str1', 'str2', 'str3'), FIELD('s1', 's0', 's1');
SELECT SUBSTRING('abcdefg', 2, 3);
SELECT SUBSTRING_INDEX('a,b,c,d', ',', 2);
select substring_index(substring_index('a,b,c,d', ',', 2), ',', -1);
select substring_index(substring_index('a,b,c,d', ',', 3), ',', -1);
SELECT INSTR('str', 't'), LOCATE('s1', 's0s1s2');
SELECT INSERT('12345', 3, 2, '/');
select format(123456789, 0), format(78901.012356, 4), truncate(789.012356, 4);
select left('abc', 2), right('abc', 2), upper('abc'), lower('AB'), 
lpad('5', 2, '0'), rpad('15', 3, '0');
SELECT REVERSE('abc'), REPEAT('a', 3), CONCAT('A', SPACE(5), 'B');
SELECT REPLACE('abcdefg', 'cde', 'xxx');
SELECT TRIM(' AB '), TRIM(BOTH 's' FROM 'ssstrss');
SELECT 
    TRIM(LEADING 's' FROM 'ssstrss'),
    TRIM(TRAILING 's' FROM 'ssstrss');
SELECT 
    CONCAT('X', LTRIM(' AB '), 'X'),
    CONCAT('X', RTRIM(' AB '), 'X');
SELECT NOW(), SYSDATE(), CURDATE(), CURTIME();
select year(now()), month(now()), day(now()), month('2020-11-29'),
	   hour(now()), minute(now()), second(now()), quarter(now()), week(now());
       
select weekday('2024-11-17'), weekday('2024-11-18'), weekday('2024-11-19');   -- 월요일 0 ~
select dayofweek('2024-11-16'), dayofweek('2024-11-17'), dayofweek('2024-11-18'); -- 일요일 1 ~

select DATE(now()), TIME(now()), MAKEDATE(2024, 336), MAKETIME(19,3,50), TIME('19:03:50');
select time_to_sec('0:1:30'), period_add(202012, 12), period_diff(202103, 202011);
select datediff('2024-12-01', '2025-03-11'), timediff('12:20:33', '11:30:20');

select DATE_FORMAT(DATE_ADD(NOW(), INTERVAL -1 DAY), '%Y-%m-%d %H:%i:%s');

select '12' regexp '[a-z29]';
SELECT REGEXP_INSTR('dog cat dog', 'dog', 2);
SELECT REGEXP_INSTR('aa aaa aaaa', 'a{4}');
SELECT REGEXP_LIKE('abc', 'ABC', 'c');
SELECT REGEXP_REPLACE('abc def ghi', '[a-z]+', 'X', 2, 2);

