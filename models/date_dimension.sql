WITH CTE AS (

select 

TO_TIMESTAMP(STARTEDAT) AS STARTEDAT,
DATE(TO_TIMESTAMP(STARTEDAT)) AS DATE_STARTEDAT,
HOUR(TO_TIMESTAMP(STARTEDAT)) AS HOUR_STARTEDAT,


{{day_type('STARTEDAT')}} AS DAY_TYPE,

{{get_season('STARTEDAT')}} AS STATION_OF_YEAR


from 
{{source('demo', 'bike') }}

)

select 
*
from CTE


