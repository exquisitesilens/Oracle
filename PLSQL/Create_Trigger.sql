CREATE OR REPLACE TRIGGER emp_ar_u
   BEFORE UPDATE
   ON emp
   FOR EACH ROW
BEGIN
   IF (:NEW.sal > :OLD.sal * 1.10)
   THEN
       -- :NEW.sal := 1;
      -- :NEW.sal will not be acceptabled.
      raise_application_error (-20000,
                                  'The new salary = '
                               || :NEW.sal
                               || ' ref. old salary of '
                               || :OLD.sal
                               || ' too high! (>110%)'
                              );
   END IF;
END;
/
