CREATE OR REPLACE
PROCEDURE dbms_visum (in_table_name IN VARCHAR2
                       , in_rowid IN ROWID
                       , io_modified_by IN OUT VARCHAR2
                       , io_modified_at IN OUT DATE) IS
  cur_h INTEGER := DBMS_SQL.open_cursor();
  dummy INTEGER;
BEGIN
  DBMS_SQL.parse (cur_h,'SELECT modified_by, '||
                         '       modified_at  '||
                         '  FROM ' || in_table_name ||
                         ' WHERE rowid = :rowid',
                 DBMS_SQL.native);

  DBMS_SQL.bind_variable (cur_h,'rowid',in_rowid);

  DBMS_SQL.define_column(cur_h,1,io_modified_by,30);
  DBMS_SQL.define_column(cur_h,2,io_modified_at);

  dummy := DBMS_SQL.execute (cur_h);

  IF (DBMS_SQL.fetch_rows(cur_h) > 0) THEN
    DBMS_SQL.column_value(cur_h,1,io_modified_by);
    DBMS_SQL.column_value(cur_h,2,io_modified_at);
  END IF;
  DBMS_SQL.close_cursor (cur_h);
END dbms_visum;
/