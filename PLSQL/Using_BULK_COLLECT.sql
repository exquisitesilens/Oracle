CREATE TYPE empno_lt IS TABLE OF NUMBER;
/

CREATE TYPE ename_lt IS TABLE OF VARCHAR2(10);
/

DECLARE
  empno_l empno_lt;
  ename_l ename_lt;
  bulk_qry_str VARCHAR2(2000);
BEGIN
  bulk_qry_str := 'SELECT empno, ename'
              || ' BULK COLLECT INTO :empno_l, :ename_l'
              || ' FROM emp WHERE sal > 1000';
  EXECUTE IMMEDIATE 'BEGIN ' || bulk_qry_str || '; END;'
    USING OUT empno_l, OUT ename_l;
END;
/
