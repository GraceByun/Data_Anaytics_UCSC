/*question3*/
DELIMITER $

DROP PROCEDURE IF EXISTS CREATE_COLUMN$

CREATE PROCEDURE CREATE_COLUMN(OUT  rc		INT
			       ,OUT status_msg	VARCHAR(100))

BEGIN
DECLARE l_table_name VARCHAR(50);
DECLARE iam_done INT DEFAULT 0;
DECLARE l_sql_stmt VARCHAR(1000);
DECLARE COL_CUR CURSOR FOR
	SELECT TABLE_NAME
	FROM 
	INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='STUDENTDB'
	;
	BEGIN


	DECLARE EXIT HANDLER FOR NOT FOUND SET iam_done=1;
	DECLARE EXIT HANDLER FOR 1060 SET rc=-1,status_msg='Failed';

			OPEN COL_CUR;
				col_loop:LOOP
					FETCH col_cur INTO l_table_name; 
						
						IF iam_done = 1 THEN
							leave col_loop;
						END IF;


					SET @l_sql_stmt:=CONCAT(
								'ALTER TABLE '
								,l_table_name
								,' DROP (CREATE_DATE, HISTORY_DATE)'
								);
					SELECT @l_sql_stmt;
					PREPARE stmt FROM @l_sql_stmt;
					EXECUTE stmt;


					SET @l_sql_stmt:=CONCAT(
								'ALTER TABLE '
								,l_table_name
								,' ADD (CREATE_DATE, HISTORY_DATE DATE)'
								);
					SELECT @l_sql_stmt;
					PREPARE stmt FROM @l_sql_stmt;
					EXECUTE stmt;

				END LOOP;
			CLOSE COL_CUR;

	select 'Done';	
	SET rc:=0;
	SET status_msg:='Success';

	END;
END$
DELIMITER ;
