break on deptno skip 2 on report

COL deptno FORMAT 99999999999999999999 HEADING 'Departement'
COL ename FORMAT A20 HEADING 'Angestellter'
COL sal FORMAT 999,990.00 HEADING 'Salary'

compute sum LABEL 'Summe' - 
        avg LABEL 'Durchschnitt' - 
        max LABEL 'Höchste Gehalt' -
of sal - 
on deptno 

select deptno, ename, sal
from emp 
order by deptno, sal desc, ename;