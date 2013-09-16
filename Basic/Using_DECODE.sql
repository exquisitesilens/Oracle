select ename, 
	   DECODE(deptno, '20', 'zwei dep.'
			 , '30', 'drei dep.'
			 , deptno) "New Department"
from emp;

select                                         
         DECODE (job,
                 'MANAGER', 'MANAGERMENT',
                 'PRESIDENT', 'MANAGERMENT',
                 'STAFF'
                ) "Funktion",
         sum (sal + NVL (comm, 0)) "Total Einkommen"
from emp
group by DECODE (job,
                 'MANAGER', 'MANAGERMENT',
                 'PRESIDENT', 'MANAGERMENT',
                 'STAFF'
                );

select sum (DECODE (job, 'PRESIDENT', sal)) "Salary-President",
       sum (DECODE (job, 'MANAGER', sal)) "Salary-Manager",
       sum (DECODE (job, 'SALESMAN', sal)) "Salary-Salesman",
       sum (DECODE (job, 'ANALYST', sal)) "Salary-Analyst",
       sum (DECODE (job, 'CLERK', sal)) "Salary-Clerk"
from emp;