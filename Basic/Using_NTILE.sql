SELECT empno, ename, sal,
       DECODE (NTILE (3) OVER (ORDER BY sal DESC),
               1, 'Gut',
               2, 'Mittel',
               3, 'Schlecht'
              ) AS verdienst
  FROM emp;