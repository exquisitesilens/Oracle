DECLARE
  TYPE dept_collt IS TABLE OF dept.dname%TYPE;
  dept_coll dept_collt := dept_collt('SALES', 'ACCOUNTING', 'RESARCH');
BEGIN
  -- deletes element 3
  dept_coll.DELETE (dept_coll.LAST());

  -- the count is now 2
  DBMS_OUTPUT.put_line ('count after DELETE: ' || dept_coll.COUNT());

  -- will execute TRIM(2), and will operate on the
  -- internal size of 3, element 2 and 3 will be removed
  dept_coll.TRIM (dept_coll.COUNT());

  -- the count is now 1 ...
  DBMS_OUTPUT.put_line ('count after TRIM(2): ' || dept_coll.COUNT());

  -- and element 1 is still there
  DBMS_OUTPUT.put_line (dept_coll(1));
END;
/