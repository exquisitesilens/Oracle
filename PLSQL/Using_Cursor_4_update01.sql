DECLARE
   v_deptno   NUMBER := 20;

   CURSOR c_deptno
   IS
      SELECT deptno
        FROM dept;
BEGIN
   
   -- update all employees
   FOR cr IN c_deptno
   LOOP
      p_aa_insert (cr.deptno);
   END LOOP;
   
END;
/
