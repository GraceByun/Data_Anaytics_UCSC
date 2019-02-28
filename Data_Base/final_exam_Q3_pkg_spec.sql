CREATE OR REPLACE PACKAGE QUESTIONTHREE
AS

PROCEDURE CREATE_COLUMN(OUT  rc	 INT
                              ,OUT status_msg	VARCHAR(100));

PROCEDURE TABLENAME_VIEW(OUT  rc	INT
                              ,OUT status_msg2	VARCHAR(100));
PROCEDURE TABLENAME_SEQ(OUT  rc		INT
                              ,OUT status_msg3	VARCHAR(100));

END;
/
