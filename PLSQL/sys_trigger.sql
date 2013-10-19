DROP TABLE error_log;

CREATE TABLE error_log (  no NUMBER
			, msg VARCHAR2(2000)
			, params VARCHAR2(2000));
		
CREATE OR REPLACE
TRIGGER on_servererror
AFTER SERVERERROR
ON SCHEMA
DECLARE
	sep VARCHAR2(2);
	params error_log.params%TYPE;
BEGIN
	FOR err IN 1 .. ora_server_error_depth
	LOOP
		params := NULL;
		sep := NULL;
		FOR prm IN 1 .. ora_server_error_num_params (err)
		LOOP
			params := params || sep || ora_server_error_param (err, prm);
			sep := ',';
		END LOOP;
		INSERT INTO error_log VALUES (ora_server_error(err)
                                             , ora_server_error_msg(err)
                                             , params);
	END LOOP;
END;
/

DROP TRIGGER on_servererror;
DROP TABLE error_log;