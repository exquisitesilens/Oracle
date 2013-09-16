select  deptno
       ,sum(sal)
       ,avg(sal)
       ,max(sal)
       ,min(sal)
       ,count(*)
  from emp
 group by deptno
 having ( avg (sal) > 1500) and (count(*) > 5 ); 