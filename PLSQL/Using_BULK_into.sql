CREATE OR REPLACE
PROCEDURE emps_orderd (in_attribute_list IN VARCHAR2) IS
  TYPE cur_t IS REF CURSOR;	-- must use weak declaration
  cur_v cur_t;
  qry_str VARCHAR2(1000);

  TYPE sal_lt IS TABLE OF emp.sal%TYPE;
  TYPE ename_lt IS TABLE OF emp.ename%TYPE;
  sal_l sal_lt;
  ename_l ename_lt;
BEGIN
  qry_str := 'SELECT ename,sal ' ||
             'FROM   emp       ' ||
             'ORDER BY ' || in_attribute_list;
  OPEN cur_v FOR qry_str;
  FETCH cur_v BULK COLLECT INTO ename_l, sal_l;

  FOR i IN ename_l.FIRST() .. ename_l.LAST()
  LOOP
	DBMS_OUTPUT.put_line (ename_l(i) || CHR(9) || sal_l(i));
  END LOOP;
END emps_orderd;
/


BEGIN
  emps_orderd ('sal DESC');
END;
/

BEGIN
  emps_orderd ('ename ASC');
END;
/