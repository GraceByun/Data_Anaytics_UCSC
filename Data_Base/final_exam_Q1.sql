-- Exception Handling [Please use Mysql database]

use studentdb;

delimiter $

drop procedure if exists exception_handling$

create procedure exception_handling(in input_student_id  int)

begin
declare l_student_id  int;
declare out_msg int default 0;

        begin
					declare continue handler for 1062 set out_msg =1;
                    insert into student(student_id
										,name
										,gender
									   )values
                                       (input_student_id
                                       ,'xyz'
                                       ,'m'
                                       );
		end;
        
        if out_msg = 1 then
                select concat('Student ID:', input_student_id, ' You are trying to insert already existed student_ id') Warining;
        end if;
        

        

end$

DELIMITER ;

call exception_handling(1);    
insert into student(student_id, gender, name) values(1,'m','xyz');	






delimiter $

drop procedure if exists exception_handling2$

create procedure exception_handling2(in input_name  varchar(20))

begin
declare l_name varchar(20);
declare duplicated_error int default 0;
          begin
					declare continue handler for 1110 set duplicated_error =1;
                    insert into student(student_id
										,name
										,name
									   )values
                                       (300
                                       ,input_name
                                       ,input_name
                                       );
		end;
        
        if duplicated_error = 1 then
                select concat('name: ', input_name, ' You are trying to insert name twice') Warining;
        end if;
        

	                                  

end$

DELIMITER ;


call exception_handling2('yyy');    
insert into student(student_id, name, name) values(1,'yyy','xyz');	

