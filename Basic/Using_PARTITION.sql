SELECT deptno, ename, hiredate,
       COUNT (*) OVER (PARTITION BY deptno ORDER BY hiredate RANGE NUMTOYMINTERVAL
                                                                     (1,
                                                                      'year'
                                                                     ) PRECEDING)
                                                             AS "count hired"
  FROM emp;

SELECT deptno, ename, hiredate,
       FIRST_VALUE (ename) OVER (PARTITION BY (TRUNC (hiredate, 'year')
                                              ) ORDER BY hiredate)
                                                             AS first_hire
  FROM emp;															 