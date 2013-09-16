COL ename FORMAT A18 HEADING 'Name|Angestellter'
COL sal FORMAT 999,990.00 HEADING 'Gehalt'

accept job PROMPT 'Bitte geben Sie den gewünschten Beruf ein: ' DEFAULT MANAGER 

spool C:\oracle\admin\DBTest\Workshop\log_ang_3

select INITCAP(ename), 
       TO_CHAR(hiredate, 'DD.MM.YYYY') "Anst.", 
       sal,
       INITCAP(job) "JOB"
from emp
where job = UPPER('&job');

select INITCAP(ename)||', Beruf '||INITCAP(job) "Mitarbeit/Job", 
       TO_CHAR(sal, '999,990.00') "Gehalt"
from emp
where deptno = 20;

spool off


