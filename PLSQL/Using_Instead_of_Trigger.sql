-- alter tables
ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (empno);
ALTER TABLE dept ADD CONSTRAINT pk_dept PRIMARY KEY (deptno);
ALTER TABLE dept ADD CONSTRAINT fk_emp_dept	FOREIGN KEY (deptno) REFERENCES dept(deptno);

-- create view
CREATE OR REPLACE
VIEW emp_dept_v
AS
SELECT	d.deptno
	,	d.dname
	,	d.loc
	,	e.empno
	,	e.ename
	,	e.job
	,	e.deptno	emp_deptno
FROM	dept d,	emp e
WHERE	d.deptno = e.deptno;

UPDATE emp_dept_v SET dname = 'RESEARCH' WHERE ename = 'ALLEN';

SELECT	column_name, insertable, updatable, deletable 
FROM	user_updatable_columns 
WHERE	table_name = 'EMP_DEPT_V';

-- create instead of trigger
CREATE OR REPLACE
TRIGGER emp_dept_v_trg
INSTEAD OF UPDATE ON emp_dept_v
BEGIN
	UPDATE	emp
	SET	ename = :NEW.ename
	,	job = :NEW.job
	,	deptno = :NEW.emp_deptno
	WHERE	empno = :OLD.empno;

	UPDATE	dept
	SET	dname = :NEW.dname
	,	loc = :NEW.loc
	WHERE	deptno = :OLD.deptno;
END emp_dept_v_trg;
/


SELECT	column_name, insertable, updatable, deletable 
FROM	user_updatable_columns 
WHERE	table_name = 'EMP_DEPT_V';

UPDATE emp_dept_v SET dname = 'RESEARCH' WHERE ename = 'ALLEN';

DROP VIEW emp_dept_v;