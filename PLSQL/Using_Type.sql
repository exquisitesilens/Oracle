DECLARE
   TYPE t_pers_rec IS RECORD (
      pers_nr       emp.empno%TYPE      := 7698,                 
      pers_name     emp.ename%TYPE,
      job           emp.job%TYPE,
      entrydate     emp.hiredate%TYPE,
      departement   dept%ROWTYPE
   );

   l_pers_rec      t_pers_rec;
   l_manager_rec   t_pers_rec;
BEGIN
   SELECT empno, ename, job,
          hiredate, dname,
          loc, deptno
     INTO l_pers_rec.pers_nr, l_pers_rec.pers_name, l_pers_rec.job,
          l_pers_rec.entrydate, l_pers_rec.departement.dname,
          l_pers_rec.departement.loc, l_pers_rec.departement.deptno
     FROM emp LEFT OUTER JOIN dept USING (deptno)
    WHERE empno = 6666;

   IF l_pers_rec.job = 'MANAGER'
   THEN
      l_manager_rec := l_pers_rec;
      l_pers_rec := NULL;
   END IF;

   DBMS_OUTPUT.put_line (   'Person: '
                         || l_pers_rec.pers_name
                         || ', '
                         || l_pers_rec.departement.dname
                         || ', '
                         || l_pers_rec.job
                        );
   DBMS_OUTPUT.put_line (   'Manager: '
                         || l_manager_rec.pers_name
                         || ', '
                         || l_manager_rec.departement.dname
                         || ', '
                         || l_manager_rec.job
                        );
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line (SQLERRM);
END;
/
