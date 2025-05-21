CREATE DEFINER=`tester`@`%` PROCEDURE `sp_deptinfo`(_dname varchar(31))
BEGIN
  
  SELECT 
    d.id,
    d.dname,
    IFNULL(e.ename, '공석') captainName,
    (SELECT 
            format(AVG(salary)*10000, 0)
        FROM
            Emp
        WHERE
            dept = d.id) avgsal
FROM
    Dept d
        LEFT OUTER JOIN
    Emp e ON d.id = e.dept AND d.captain = e.id
   where d.dname like concat(_dname, '%');
END