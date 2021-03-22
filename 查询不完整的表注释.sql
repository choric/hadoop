select * from 
 (select 
 b.nspname||'.'||c.relname,f.description comment,a.attnum,a.attname, d.description from 
 pg_class c
 join  pg_attribute a
 on 1=1
 and a.attrelid=c.oid  and  a.attnum >0
 left join 
  pg_namespace b
	on  c.relnamespace=b.oid
 left join pg_description d 
 on 1=1
 and a.attrelid=d.objoid
 and a.attnum=d.objsubid
 left join 
 pg_description f on c.oid=f.objoid and f.objsubid=0
 where 
 b.nspname||'.'||c.relname = ''
 ) a
 where comment is not null  or description is null
 order by 1,3 