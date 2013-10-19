set serveroutput on
DECLARE
  i INTEGER := 1;
  bi BINARY_INTEGER := 1; 
  pi POSITIVE := 1;
  plsi PLS_INTEGER := 1;

  c_nof CONSTANT INTEGER := 1000000;
BEGIN
  timer_pck.start_it();
  FOR idx IN 1 .. c_nof
  LOOP
    i := i + 1;
  END LOOP;
  timer_pck.show_elapsed('adding INTEGER :');

  timer_pck.start_it();
  FOR idx IN 1 .. c_nof
  LOOP
    bi := bi + 1;
  END LOOP;
  timer_pck.show_elapsed('adding BINARY_INTEGER :');

  timer_pck.start_it();
  FOR idx IN 1 .. c_nof
  LOOP
    pi := pi + 1;
  END LOOP;
  timer_pck.show_elapsed('adding POSITIVE :');

  timer_pck.start_it();
  FOR idx IN 1 .. c_nof
  LOOP
    plsi := plsi + 1;
  END LOOP;
  timer_pck.show_elapsed('adding PLS_INTEGER :');
END;
/
