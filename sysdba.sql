grant execute on dbms_lock to xe_shweta;

GRANT EXECUTE ON DBMS_LOCK TO PUBLIC;

select * from all_tab_privs
where table_name = 'DBMS_LOCK';

grant sys.EXECUTE_CATALOG_ROLE to xe_shweta;