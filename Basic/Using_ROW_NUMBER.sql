SELECT deptno,
       ROW_NUMBER () OVER (PARTITION BY deptno ORDER BY hiredate ASC) AS SEQUENCE,
       ename, 
	   hiredate,
       hiredate - LAG (hiredate) OVER (ORDER BY hiredate ASC) AS days
  FROM emp;
  
