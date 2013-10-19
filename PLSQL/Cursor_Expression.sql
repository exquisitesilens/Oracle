-- Example for ref cursor
DECLARE
   ref_cursor   sys_refcursor;
   auf_row      auftraege%ROWTYPE;
BEGIN
   OPEN ref_cursor FOR
      -- select statement
      SELECT *
        FROM auftraege
       WHERE aid LIKE '399%';

   LOOP
      FETCH ref_cursor
       INTO auf_row;

      EXIT WHEN ref_cursor%NOTFOUND;
      DBMS_OUTPUT.put_line ('AID : ' || auf_row.aid);
   END LOOP;

   CLOSE ref_cursor;
END;
/

/* OUTPUTs
AID : 39928
AID : 39929
AID : 39930
AID : 39931
AID : 39935
AID : 39936
AID : 39942
AID : 39968
AID : 39970
AID : 39983
AID : 39984
AID : 39985
AID : 39990
AID : 39997
AID : 39914
AID : 39921
*/
