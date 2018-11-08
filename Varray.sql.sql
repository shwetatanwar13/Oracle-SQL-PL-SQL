create type object_t as object
(name_t varchar(100) ,
age number,
sex varchar2(2),
address varchar2(500)
);

set serveroutput on;
declare
type food_t is varray(10) of number;
food_var food_t;
begin
--food_var:=food_t(1,2,3);
food_var:=food_t();
food_var.extend(7);
food_var(1):=1;
food_var(food_var.last):=3;
food_var.delete(4);
for i in food_var.first..food_var.last loop
--dbms_output.put_line(food_var.last);
dbms_output.put_line(food_var(i));
end loop;
end;