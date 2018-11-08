create user shweta identified by shweta13;

grant connect to shweta;

grant create table to shweta;

GRANT UNLIMITED TABLESPACE TO shweta;

create type x_test_table is table of x_test_type;

create or replace function get_test_wt_pp(p_rows in number) return x_test_table
as
x_test x_test_table:=x_test_table();
begin
for x in 1..p_rows loop
x_test.extend;
x_test(x):=x_test_type(x,'row no '||x);
dbms_lock.sleep(20);
end loop;
return x_test;
end;

create or replace function get_test_w_pp(p_rows in number) return x_test_table pipelined
as
begin
for i in 1..p_rows loop
PIPE ROW(x_test_type(i, 'Description for ' || i));
dbms_lock.sleep(5);
PIPE ROW(x_test_type(i+1, 'Description for ' || i));
end loop;
return;
end;

select * from table(get_test_wt_pp(5)) ;

select * from table(get_test_w_pp(5)) ;

connect sys as sysdba;


SELECT get_time() AS ts FROM DUAL;
grant execute on dbms_lock to xe_shweta;

GRANT EXECUTE ON DBMS_LOCK TO PUBLIC;

SELECT 
get_time() AS ts
FROM   TABLE(get_test_wt_pp(5));


SELECT 
get_time() AS ts
FROM   TABLE(get_test_w_pp(5));

select * from user_tab_privs
where table_name = 'DBMS_LOCK';


select * from user_tab_privs
where table_name like 'DBMS_LOCK%';

select * from user_role_privs; 
