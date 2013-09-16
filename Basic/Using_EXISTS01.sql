SELECT d.*
  FROM dept d
 WHERE EXISTS (
          SELECT 'x'                                             --boss.deptno
            FROM emp boss
           WHERE boss.job = 'MANAGER'
             AND d.deptno = boss.deptno
             AND boss.sal < (SELECT AVG (e.sal)
                               FROM emp e
                              WHERE e.deptno = boss.deptno));
