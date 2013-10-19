SET SERVEROUTPUT ON

DROP TABLE emp2;
CREATE TABLE emp2 (empno NUMBER(12)
		, ename VARCHAR2(10) NOT NULL);

set serveroutput on
DECLARE
  TYPE empno_lt IS TABLE OF emp2.empno%TYPE;
  TYPE ename_lt IS TABLE OF VARCHAR2(20);
  empno_l empno_lt := empno_lt(1010, 1020, 1030, 1040);
  ename_l ename_lt := ename_lt('Thommen', 'Müller-Steffen'
                               , 'Rauch', NULL);
BEGIN
  FORALL i IN empno_l.FIRST() .. empno_l.LAST() 
  SAVE EXCEPTIONS
    INSERT INTO emp2 VALUES (empno_l(i), ename_l(i));

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line ('Number of Errors: ' || 
			   SQL%BULK_EXCEPTIONS.COUNT);
    FOR i IN 1..SQL%BULK_EXCEPTIONS.COUNT
    LOOP
      DBMS_OUTPUT.put_line ('Error ' || i || ' during ' ||
  			' iteration ' || SQL%BULK_EXCEPTIONS(i).ERROR_INDEX);
      DBMS_OUTPUT.put_line ('Oracle error is ' ||
                        SQLERRM (-SQL%BULK_EXCEPTIONS(i).ERROR_CODE));
    END LOOP;
END;
/
