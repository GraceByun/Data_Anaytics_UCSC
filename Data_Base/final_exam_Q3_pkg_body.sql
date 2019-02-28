CREATE OR REPLACE PACKAGE BODY QUESTIONTHREE
AS

--===============================CREATE_COLUMN start================================
PROCEDURE CREATE_COLUMN(OUT  rc		INT
					   ,OUT status_msg	VARCHAR(100))


AS
  
BEGIN
DECLARE l_table_name VARCHAR(50);
DECLARE iam_done INT DEFAULT 0;
DECLARE l_sql_stmt VARCHAR(1000);
DECLARE COL_CUR CURSOR FOR
	SELECT TABLE_NAME
	FROM 
	INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='HR'
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
								,' ADD (CREATED_BY varchar(20))'
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

--======================================CREATE_COLUMN end==================================


--===============================TABLENAME_VIEW start=========================================

PROCEDURE TABLENAME_VIEW(OUT  rc		INT
						,OUT status_msg2	VARCHAR(100))
AS
BEGIN
DECLARE l_sql_stmt2 VARCHAR(1000);  
DECLARE l_TABLENAME_VIEW VARCHAR(50);  
DECLARE COL_CUR CURSOR FOR
SELECT TABLE_NAME
FROM 
information_schema.views
WHERE TABLE_SCHEMA='HR'
;
  BEGIN


	DECLARE EXIT HANDLER FOR NOT FOUND SET iam_done=1;
	DECLARE EXIT HANDLER FOR 1060 SET rc=-1,status_msg='Failed';

			OPEN COL_CUR;
				col_loop:LOOP
					FETCH col_cur INTO l_TABLENAME_VIEW ; 
						
						IF iam_done = 1 THEN
							leave col_loop;
						END IF;

					SET @l_sql_stmt2:=CONCAT(
								'CREATE VIEW '
								,l_TABLENAME_VIEW
								,' AS SELECT * FROM'
                ,l_table_name
								);
					SELECT @l_sql_stmt2;
					PREPARE stmt FROM @l_sql_stmt2;
					EXECUTE stmt;

				END LOOP;
			CLOSE COL_CUR;

	select 'Done';	
	SET rc:=0;
	SET status_msg:='Success';
  
  END;

--=================================TABLENAME_VIEW end=======================================


--===============================TABLENAME_SEQ start=========================================

PROCEDURE TABLENAME_SEQ(OUT  rc		INT
                              ,OUT status_msg	VARCHAR(100))

AS
BEGIN
DECLARE l_sql_stmt3 VARCHAR(1000);  
DECLARE l_TABLENAME_SEQ VARCHAR(50);  
DECLARE COL_CUR CURSOR FOR
SELECT TABLENAME_SEQ
FROM 
information_schema.tables
WHERE TABLE_SCHEMA='HR'
;
  BEGIN


	DECLARE EXIT HANDLER FOR NOT FOUND SET iam_done=1;
	DECLARE EXIT HANDLER FOR 1060 SET rc=-1,status_msg='Failed';

			OPEN COL_CUR;
				col_loop:LOOP
					FETCH col_cur INTO l_TABLENAME_SEQ  ; 
						
						IF iam_done = 1 THEN
							leave col_loop;
						END IF;

					SET @l_sql_stmt3:=CONCAT(
								'CREATE SEQUENCE'
								,l_TABLENAME_SEQ
								,'START with 1 INCREMENT by 10'
								);
					SELECT @l_sql_stmt3;
					PREPARE stmt FROM @l_sql_stmt3;
					EXECUTE stmt;

				END LOOP;
			CLOSE COL_CUR;

	select 'Done';	
	SET rc:=0;
	SET status_msg:='Success';
  
  END;
--=================================TABLENAME_SEQ end=======================================


END;
/
