with BIKE as (


select

RideID,  
REPLACE(StartedAt,'"', '') as STARTEDAT,
REPLACE(EndedAt,'"','') as ENDEDAT,
StartStationName, 
StartStationID, 
EndStationName, 
EndStationID, 
StartLatitude, 
StartLongitude, 
EndLatitude, 
EndLongitude, 
MemberCasualRide  

from {{source ('demo','bike')}}

)

select *
from BIKE 