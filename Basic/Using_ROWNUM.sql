SELECT ename "Name", sal "Salary", hiredate "Hiredate"
  FROM (SELECT   ename, hiredate, sal
            FROM emp
        ORDER BY hiredate DESC)
 WHERE ROWNUM <= 3;