
alter session set current_schema =sys;

grant EXECUTE_CATALOG_ROLE to system;

GRANT EXECUTE ON DBMS_LOCK TO PUBLIC;

alter system flush buffer_cache;
/
alter system flush shared_pool;
/

select * from v$option where parameter = 'Partitioning';

SELECT * From DBA_DATA_FILES;

alter tablespace
   SYSTEM
add tempfile
'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\temo04.DBF'  size 10M autoextend on next 10M maxsize 2000M; 





select 
   srt.tablespace, 
   srt.segfile#, 
   srt.segblk#, 
   srt.blocks, 
   a.sid, 
   a.serial#, 
   a.username, 
   a.osuser, 
   a.status 
from 
  
   v$session    a,
   v$sort_usage srt 
where 
   a.saddr = srt.session_addr 
order by 
   srt.tablespace, srt.segfile#, srt.segblk#, 
   srt.blocks;
   
   select value from v$parameter where name = 'db_block_size';
   
   select bytes/1024/1024 as mb_size,
       maxbytes/1024/1024 as maxsize_set,
       x.*
from   dba_data_files x;

alter database datafile 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSTEM.DBF' autoextend on maxsize unlimited;

   select  sum(free_blocks)
from 
   gv$sort_segment
where 
   tablespace_name = 'TEMP'
   
   
   select 
   inst_id, 
   tablespace_name, 
   total_blocks, 
   used_blocks, 
   free_blocks
from 
   gv$sort_segment;