SELECT 
		PRIOR ename "Chef of James"
	  , LEVEL
  FROM emp
 WHERE ename = 'JAMES'
START WITH job = 'MANAGER'
CONNECT BY PRIOR empno = mgr;