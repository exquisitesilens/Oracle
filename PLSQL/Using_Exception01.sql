DECLARE
   CURSOR c_deptname
   IS
      SELECT   dname
          FROM dept
      ORDER BY dname;

   v_manager_name      emp.ename%TYPE;

BEGIN

   <<b1>>
   FOR cr IN c_deptname
   LOOP

      <<l1>>
      BEGIN

         <<b2>>
         SELECT ename
           INTO v_manager_name
           FROM emp JOIN dept USING (deptno)
          WHERE (dname = cr.dname) AND (job = 'MANAGER');

         DBMS_OUTPUT.put_line ('Department: ' || cr.dname);
         DBMS_OUTPUT.put_line (' * ' || INITCAP (v_manager_name));
		 
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            DBMS_OUTPUT.put_line (   'Department '
                                  || cr.dname
                                  || ' has none manager.'
                                 );
            DBMS_OUTPUT.put_line (' * --- ');
         WHEN TOO_MANY_ROWS
         THEN
            DBMS_OUTPUT.put_line (   'Department '
                                  || cr.dname
                                  || ' has more than one manager.'
                                 );
            DBMS_OUTPUT.put_line (' * --- ');
      END b2;
	  
   END LOOP l1;
   
END b1;
/
