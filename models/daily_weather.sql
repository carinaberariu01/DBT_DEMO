WITH daily_weather AS
(
    SELECT

    DATE(TIME) AS DAILY_WEATHERTABLE,
    WEATHER,
    TEMP,
    PRESSURE,
    HUMIDITY,
    CLOUDS
    FROM {{ source('demo', 'weather') }}
    LIMIT 10
),

daily_weathertable_agg as (


select 
daily_weathertable,
weather,
round(avg(TEMP),2) as avg_temp,
round(avg(PRESSURE),2) as avg_pressure,
round(avg(HUMIDITY),2) as avg_humidity,
round(avg(CLOUDS), 2) as avg_clouds

from daily_weather

group by daily_weathertable, weather

qualify ROW_NUMBER() OVER (PARTITION BY daily_weathertable ORDER BY count(weather) desc) =1

)

SELECT *
FROM daily_weathertable_agg
ORDER BY daily_weathertable