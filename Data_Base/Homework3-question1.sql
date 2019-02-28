
/*Question 1*/
DELIMITER $
drop function if exists maxscore$
create function maxscore(start_student_id  int, end_student_id int) returns int
reads sql data
begin
declare selectmax int;


begin
      SELECT MAX(MAX_SCORE)into selectmax

            FROM (SELECT MAX(SCORE) MAX_SCORE, ST.STUDENT_ID

                        FROM STUDENT ST, SCORE S

                        WHERE ST.STUDENT_ID = S.STUDENT_ID

                        AND ST.STUDENT_ID BETWEEN start_student_id AND end_student_id 
                        GROUP BY ST.STUDENT_ID

                 ) T;
		return selectmax;
                 
     
END;
END$
DELIMITER ; 

select maxscore(2,5);

/*Question2*/
CREATE OR REPLACE PROCEDURE questionTwo(in_student_id  int, in_event_id int)
AS
BEGIN
DECLARE
sql_stmt	VARCHAR(1000);
l_category INT;


/* This is a comment */

	BEGIN
		sql_stmt:=' SELECT grade_event.category'
        ||' FROM score'
				||' inner JOIN student on score.student_id = student.student_id'
        ||' inner JOIN  grade_event on score.event_id = grade_event.event_id'
				||' where score.student_id = in_student_id'
				||' and score.event_id = in_event_id'
				;
		dbms_output.put_line(sql_stmt);
		EXECUTE IMMEDIATE sql_stmt into l_category using in_student_id and in_event_id;


		dbms_output.put_line(l_category);
	END;

END;
/

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
