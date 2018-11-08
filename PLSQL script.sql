create table t
as
select *
  from all_objects;
  
  create or replace procedure 
my_function
 as
  begin
      for x in
    (select /*+ result_cache */ owner, 
              object_type, 
               count(*) cnt
      from t
         group by owner, object_type
         order by owner, object_type )
   loop
        -- do_something
         null;
  end loop;
  end;
 /
 
 
 
 
 CONNECT hr/hr
CREATE DIRECTORY temp4 AS 'C:\Users\Sushma\Desktop\ooc\temp4'
/
GRANT WRITE ON DIRECTORY temp 
TO shweta;
/
CREATE OR REPLACE FUNCTION 
format_line (line_in IN VARCHAR2)
   RETURN VARCHAR2
IS
BEGIN
   RETURN UPPER (line_in);
END format_line;
/
 
 CREATE OR REPLACE PROCEDURE write_to_file (
   dir_in IN VARCHAR2
 , file_name_in IN VARCHAR2
 , lines_in IN DBMS_SQL.varchar2s
)
AUTHID CURRENT_USER
IS
    l_file   UTL_FILE.file_type;
BEGIN
    l_file :=
        UTL_FILE.fopen (LOCATION            => dir_in
                                , filename           => file_name_in
                                , open_mode       => 'W'
                                , max_linesize     => 32767
                                 );
    FOR indx IN 1 .. lines_in.COUNT
    LOOP
        UTL_FILE.put_line (l_file, format_line (lines_in (indx)));
    END LOOP;
    UTL_FILE.fclose (l_file);
END write_to_file;
/
GRANT EXECUTE ON write_to_file TO shweta;
/

SELECT * FROM all_tab_privs WHERE grantee = 'PUBLIC' AND table_name = 'UTL_FILE';

GRANT EXECUTE ON SYS.utl_file TO xe_shweta;