DECLARE
   v_max_comm      emp.comm%TYPE;
   rich_salesman   emp.ename%TYPE;
   v_deptno        emp.deptno%TYPE;
   ander_deptno    VARCHAR2 (10);
   n               NUMBER            := 0;

   CURSOR c_manager
   IS
      SELECT deptno
        FROM emp
       WHERE job = 'MANAGER';
BEGIN
   SELECT MAX (comm)
     INTO v_max_comm
     FROM emp
    WHERE job = 'SALESMAN';

   SELECT ename, deptno
     INTO rich_salesman, v_deptno
     FROM emp
    WHERE comm = v_max_comm;

   DBMS_OUTPUT.put_line (   'Max. Komission von Salesman '
                         || rich_salesman
                         || ' ist '
                         || v_max_comm
                         || ' mit deptno = '
                         || v_deptno
                        );

-- update commission
   FOR cr IN c_manager
   LOOP
      IF (cr.deptno = v_deptno)
      THEN
         UPDATE emp
            SET comm = v_max_comm
          WHERE (job = 'MANAGER') AND (deptno = v_deptno);

         DBMS_OUTPUT.put_line (   SQL%ROWCOUNT
                               || ' Manager hat volle Kommission.'
                              );
      ELSE                                                   -- other managers
         UPDATE emp
            SET comm = ROUND (v_max_comm / 2, -1)
          WHERE (job = 'MANAGER') AND (deptno <> v_deptno);

         ander_deptno := ander_deptno || ' ' || cr.deptno;
         n := SQL%ROWCOUNT;
      END IF;
   END LOOP;

   DBMS_OUTPUT.put_line (   n
                         || ' Manager ( '
                         || ander_deptno
                         || ' ) hat neue (0.5) Kommission.'
                        );
-- exception
-- when others then null;
END;
/
