CREATE OR REPLACE
FUNCTION nof_rows_nds (in_table_name IN VARCHAR2)
	RETURN INTEGER
	AUTHID CURRENT_USER
IS
	stmt_str VARCHAR2(256);
	return_val INTEGER;
BEGIN
	stmt_str := 'SELECT count(*) FROM ' || in_table_name;

	EXECUTE IMMEDIATE stmt_str INTO return_val;
	RETURN return_val;
END nof_rows_nds;
/
