/* Hyunjung Byun
Homework 2*/

/* Question1*/

use studentdb;



SELECT  student.student_id,
		grade_event.event_id,
		grade_event.category,
		sum(score) as sum_score, 
		avg(score) as ave_score, 
		min(score) as min_score, 
		max(score) as max_score
 FROM score 
 inner JOIN student on score.student_id = student.student_id
 inner JOIN grade_event on score.event_id = grade_event.event_id 
 group by student.student_id;
 
 
 /* Question2*/
 
DELIMITER $

DROP PROCEDURE IF EXISTS questionTwo$


CREATE PROCEDURE questionTwo(in_student_id int, in_event_id int) 
BEGIN

DECLARE l_student_id INT;
DECLARE l_event_id INT;
DECLARE l_score INT;
DECLARE l_category INT;

BEGIN
	
	SELECT 
    score.student_id, score.event_id, score.score, grade_event.category
    INTO l_student_id, l_event_id, l_score, l_category 
    FROM score 
    inner JOIN grade_event on score.event_id = grade_event.event_id 
    where score.student_id = in_student_id and score.event_id = in_event_id
	;
    
     select l_student_id, l_event_id, l_score, l_category;	

END;

END$

DELIMITER ;

call questionTwo(2,2);

