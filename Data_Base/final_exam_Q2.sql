--question a,b
DELIMITER $
DROP PROCEDURE IF EXISTS  GET_TABLE_NAME$

CREATE PROCEDURE GET_TABLE_NAME$(In in_table_name varchar(50)
                             ,OUT status_msg	VARCHAR(100)
                             ,OUT  status_code		INT
                             ,OUT output_table varchar(50))

BEGIN
DECLARE l_table_name VARCHAR(50);
DECLARE l_status_code DEFAULT 0;
DECLARE l_sql_stmt VARCHAR(1000);
DECLARE l_output_table VARCHAR(50);


DECLARE COL_CUR CURSOR FOR
	SELECT in_table_name
	FROM 
	INFORMATION_SCHEMA.tables
	WHERE TABLE_SCHEMA='HR'
	;
	BEGIN
  
	DECLARE EXIT HANDLER FOR NOT FOUND SET l_status_code=1;
	DECLARE EXIT HANDLER FOR 1060 SET  status_code =-1,status_msg='Failed';

			OPEN COL_CUR;
				col_loop:LOOP
					FETCH col_cur INTO l_table_name; 
						
						IF l_status_code = 1 THEN
							leave col_loop;
						END IF;
			

				END LOOP;
			CLOSE COL_CUR;
      
  SET l_status_code:=0;
	SET status_msg:='Success';
  
  select output_table
  return l_output_table
	END;
  
  
END;
END$
DELIMITER ;

--question C
DELIMITER $
CREATE OR REPLACE PROCEDURE GET_NUMBERS(in_Deptno 	INT)
AUTHID CURRENT_USER

AS

BEGIN

DECLARE
l_DEPARTMENT_ID INT;
l_max_sal 	INT;
l_MIN_SALARY	INT;
l_AVG_SALARY INT;

BEGIN
		SELECT DEPARTMENT_ID INTO l_DEPARTMENT_ID 
		FROM HR_USER.EMPLOYEES
		;
			
		SELECT  l_DEPARTMENT_ID;

	END;

BEGIN

	SELECT MAX(SALARY)  INTO l_max_sal 
	FROM HR_USER.EMPLOYEES
	WHERE DEPARTMENT_ID=IN_DEPTNO
	;

	DBMS_OUTPUT.PUT_LINE('MAX SALARY IS: ' || l_max_sal);
END;


BEGIN

	SELECT MIN(SALARY)  INTO l_MIN_SALARY
	FROM HR_USER.EMPLOYEES
	WHERE DEPARTMENT_ID=IN_DEPTNO
	;

	DBMS_OUTPUT.PUT_LINE('MIN SALARY IS: ' || l_MIN_SALARY);
END;


BEGIN

	SELECT AVG(SALARY)  INTO l_AVG_SALARY
	FROM HR_USER.EMPLOYEES
	WHERE DEPARTMENT_ID=IN_DEPTNO
	;

	DBMS_OUTPUT.PUT_LINE('AVG SALARY IS: ' || l_AVG_SALARY);
END;
END;
/
DELIMITER ;

--question d
CREATE TABLE newTable(
                      l_DEPARTMENT_ID int
                     ,l_MAX_SALARY int
                     ,l_MIN_SALARY int
                     ,l_AVG_SALARY int)
                     ;
 

INSERT INTO newTable(l_DEPARTMENT_ID) EXEC DEPARTMENT_ID;
INSERT INTO newTable(l_MAX_SALARY) EXEC l_MAX_SALARY;
INSERT INTO newTable(l_MIN_SALARY) EXEC MIN_SALARY;
INSERT INTO newTable(l_AVG_SALARY) EXEC AVG_SALARY;
 

--question e

exec GET_TABLE_NAME('EMPLOYEES');
