  SELECT e1.ename "Chef Name", e1.job "Chef Job", e1.sal "Chef Sal",
         e2.ename "Name", e2.job "Job", e2.sal "Sal"
    FROM emp e1, emp e2
   WHERE e1.job = 'MANAGER'
     AND e1.deptno = e2.deptno
     AND e1.empno = e2.mgr
     AND e1.sal < ANY (e2.sal)
ORDER BY e1.ename;
