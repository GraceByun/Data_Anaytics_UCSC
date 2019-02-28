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
