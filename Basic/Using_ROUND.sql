SELECT   ename, hiredate, sal,
         ROUND
            (AVG (sal) OVER (ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING),
             2
            ) "Avg before",
         ROUND (AVG (sal) OVER (ORDER BY hiredate), 2) "Avg after",
         ROUND
            (  sal
             / (SUM (sal) OVER (ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
               )
             * 100,
             2
            ) "% hired",
         ROUND (ratio_to_report (sal) OVER () * 100, 2) "% Current"
    FROM emp
ORDER BY hiredate;
