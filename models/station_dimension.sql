with BIKE as (

select 
distinct
STARTSTATIONID as station_id,
STARTSTATIONNAME as station_name,
STARTLATITUDE as station_lat,
STARTLONGITUDE as station_lng

from {{ref('stg_bike')}}

where RIDEID != 'ride_id'



)

select 
*
from BIKE 

