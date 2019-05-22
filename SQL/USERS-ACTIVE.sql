SELECT username FROM v$session
WHERE username IS NOT NULL
ORDER BY username ASC;

select osuser, count(*) as active_conn_count
from v$session
group by osuser
order by active_conn_count desc;

