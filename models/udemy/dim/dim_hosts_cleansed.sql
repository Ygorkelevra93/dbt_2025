WITH 
    src_hosts AS (
        SELECT * FROM  {{ ref('src_hosts') }}
    )
SELECT
HOST_ID
,NVL(HOST_NAME,'Anonymous') as host_name
,IS_SUPERHOST
,CREATED_AT
,UPDATED_AT
FROM
 src_hosts