DROP TABLE test_t;

CREATE TABLE test_t (id NUMBER PRIMARY KEY);

CREATE OR REPLACE TRIGGER test_trg
   BEFORE INSERT
   ON test_t
   FOR EACH ROW
DECLARE
   lock_id   NUMBER;
BEGIN
   lock_id := DBMS_UTILITY.get_hash_value (TO_CHAR (:NEW.ID), 0, 1024);

   IF (DBMS_LOCK.request (ID                     => lock_id,
                          lockmode               => DBMS_LOCK.x_mode,
                          TIMEOUT                => 0,
                          release_on_commit      => TRUE
                         ) = 1
      )
   THEN
      raise_application_error
                       (-20001,
                        'Row with same id, not yet commited, already exists!'
                       );
   END IF;
END;
/


INSERT INTO test_t
     VALUES (1);

SELECT SID, TYPE, id1, lmode
  FROM v$lock
 WHERE SID = (SELECT SID
                FROM v$mystat
               WHERE ROWNUM = 1);


DROP TABLE test_t;
