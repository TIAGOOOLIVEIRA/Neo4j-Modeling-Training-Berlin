
neo4j.conf
	dbms.security.allow_csv_import_from_file_urls=true

LOAD CSV FROM "file:////home/tiagoooliveira/Documents/BOSCH_BERLIN_iot-logistics-hackers/dataset/locations/Maac_Club_List.csv" AS line
CREATE (:Location { long: toFloat(line[1]), lat: toFloat(line[2]), name: line[1], description:'' , address:'' })


CREATE (:Location { id: 1, name: 'CLUB 4752 #777', lat: 47.49479, long:-52.76726, description:'Test' , address:'' })
CREATE (:Location { id: 2, name: 'LES AILES DU MADAWASKA #616', lat: 47.34437, long:68.21607, description:'Test' , address:'' })
CREATE (:Location { id: 3, name: 'CARC TROIS RIVIERES INC #101', lat: 46.46061, long:72.52071, description:'Test' , address:'' })
CREATE (:Location { id: 4, name: 'FOREST CITY FLYERS INC #139', lat: 42.83739, long:81.24881, description:'Test' , address:'' })
CREATE (:Location { id: 5, name: 'SOUTH WEST FLYERS #418', lat: 43.82852, long:66.08551, description:'Test' , address:'' })
CREATE (:Location { id: 6, name: 'APPLE VALLEY FLYERS #166', lat: 45.04511, long:64.78732, description:'Test' , address:'' })
CREATE (:Location { id: 7, name: 'CRASH(CLUB RADIO AERONAUTIQUE SPECIALISE EN HELICOPTER) #21', lat: 45.63861, long:73.92989, description:'Test' , address:'' })
CREATE (:Location { id: 8, name: 'R/C FLYING CLUB OF TORONTO (RCFCT) #9', lat: 43.83289, long: 79.24031, description:'Test' , address:'' })
CREATE (:Location { id: 9, name: 'MISSISSAUGA MODEL FLYING CLUB #124', lat: 43.60817, long:79.77372, description:'Test' , address:'' })
CREATE (:Location { id: 10, name: 'KINCARDINE CLOUDBUSTERS #142', lat: 44.20442, long:81.59582, description:'Test' , address:'' })
CREATE (:Location { id: 11, name: 'MOFFA - MOSTLY OLD FLOAT FLYERS ASSOC. #680', lat: 54.13551, long:114.476856726, description:'Test' , address:'' })
CREATE (:Location { id: 12, name: '100 MILE MODEL FLYERS #448', lat: 51.61681, long:121.29008, description:'Test' , address:'' })
CREATE (:Location { id: 13, name: 'DIDSBURY R/C FUN FLYERS CLUB, #363', lat: 51.67871, long: 114.15536, description:'Test' , address:'' })
CREATE (:DistributionCenter { id: 14, name: 'DC Central Region ##JMDT Flumina', lat: 41.96826, long:56.88567, description:'##JMDT Flumina' , address:'Central Region#777' })
CREATE (:DeliveryBase { id: 15, name: 'DB Main Location #123', lat: 42.0019, long:66.3333, description:'DB 123' , address:'DB Ocean Dream, 778' })
CREATE (:TargetArea { id: 16, name: 'TA Region #654 ', lat: 43.7019, long:64.9333, description:'TA #654' , address:'Target Area Region #654' })
CREATE (:TargetArea { id: 17, name: 'TA Region #471', lat: 43.5019, long:78.9333, description:'TA Region #471' , address:'Target Area Region #471' })
CREATE (:TargetArea { id: 19, name: 'TA Region #111 ', lat: 51.7019, long:10.9333, description:'TA #111' , address:'Target Area Region #111' })
CREATE (:DistributionCenter { id: 18, name: 'DC Central Region ##TDJM Flumina', lat: 45.96826, long:80.88567, description:'##JMDT Flumina' , address:'Central Region#999' })

MATCH (a:Location),(b:Location)
WHERE a.id = 10 AND b.id = 8
CREATE (a)-[r:Route { type:'flight', cost:9, historical_score:4, avg_time:360, distance:220 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 10 AND b.id = 2
CREATE (a)-[r:Route { type:'train', cost:16, historical_score:10, avg_time:570, distance:420 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 4 AND b.id = 8
CREATE (a)-[r:Route { type:'Truck', cost:4, historical_score:4, avg_time:120, distance:100 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 9 AND b.id = 10
CREATE (a)-[r:Route { type:'Pipelines', cost:17, historical_score:13, avg_time:150, distance:100 }]->(b)
RETURN r


MATCH (a:Location),(b:Location)
WHERE a.id = 8 AND b.id = 4
CREATE (a)-[r:Route { type:'barge', cost:5, historical_score:10, avg_time:640, distance:40 }]->(b)
RETURN r


MATCH (a:Location),(b:Location)
WHERE a.id = 11 AND b.id = 5
CREATE (a)-[r:Route { type:'train', cost:20, historical_score:10, avg_time:520, distance:700 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 5 AND b.id = 11
CREATE (b)-[r:Route { type:'train', cost:15, historical_score:12, avg_time:220, distance:300 }]->(a)
RETURN r


MATCH (a:Location),(b:Location)
WHERE a.id = 5 AND b.id = 11
CREATE (a)-[r:Route { type:'train', cost:10, historical_score:12, avg_time:220, distance:300 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 3 AND b.id = 5
CREATE (a)-[r:Route { type:'train', cost:17, historical_score:15, avg_time:170, distance:210 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 6 AND b.id = 3
CREATE (a)-[r:Route { type:'truck', cost:17, historical_score:4, avg_time:470, distance:310 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 6 AND b.id = 1
CREATE (a)-[r:Route { type:'barge', cost:20, historical_score:13, avg_time:90, distance:110 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 6 AND b.id = 3
CREATE (a)-[r:Route { type:'truck', cost:17, historical_score:4, avg_time:470, distance:310 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 4 AND b.id = 12
CREATE (a)-[r:Route { type:'truck', cost:7, historical_score:4, avg_time:190, distance:240 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 4 AND b.id = 7
CREATE (a)-[r:Route { type:'truck', cost:3, historical_score:6, avg_time:160, distance:300 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 7 AND b.id = 6
CREATE (a)-[r:Route { type:'Pipelines', cost:27, historical_score:28, avg_time:110, distance:300 }]->(b)
RETURN r

MATCH (a:Location),(b:Location)
WHERE a.id = 7 AND b.id = 13
CREATE (a)-[r:Route { type:'Pipelines', cost:22, historical_score:13, avg_time:270, distance:500 }]->(b)
RETURN r

MATCH (a:Location),(b:DistributionCenter)
WHERE a.id = 7 AND b.id = 14
CREATE (b)-[r:BackboneNetwork { type:'Pipelines', cost:10, historical_score:20, avg_time:220, distance:430 }]->(a)
RETURN r

MATCH (a:Location),(b:DistributionCenter)
WHERE a.id = 10 AND b.id = 14
CREATE (b)-[r:BackboneNetwork { type:'trail', cost:13, historical_score:20, avg_time:380, distance:700 }]->(a)
RETURN r

MATCH (a:DeliveryBase),(b:DistributionCenter)
WHERE a.id = 15 AND b.id = 14
CREATE (b)-[r:BackboneNetwork { type:'truck', cost:10, historical_score:14, avg_time:70, distance:90 }]->(a)
RETURN r

MATCH (a:Location),(b:TargetArea)
WHERE a.id = 9 AND b.id = 17
CREATE (b)-[r:Route { type:'uber', cost:7, historical_score:11, avg_time:12, distance:25 }]->(a)
RETURN r

MATCH (a:Location),(b:TargetArea)
WHERE a.id = 9 AND b.id = 17
CREATE (a)-[r:Route { type:'uber', cost:7, historical_score:11, avg_time:12, distance:25 }]->(b)
RETURN r

MATCH (a:Location),(b:TargetArea)
WHERE a.id = 9 AND b.id = 17
CREATE (a)-[r:Route { type:'taxi', cost:6, historical_score:5, avg_time:12, distance:25 }]->(b)
RETURN r

MATCH (a:Location),(b:TargetArea)
WHERE a.id = 13 AND b.id = 19
CREATE (a)-[r:Route { type:'truck', cost:10, historical_score:9, avg_time:90, distance:70 }]->(b)
RETURN r

MATCH (a:Location),(b:DistributionCenter)
WHERE a.id = 9 AND b.id = 18
CREATE (b)-[r:BackboneNetwork { type:'truck', cost:17, historical_score:11, avg_time:270, distance:300 }]->(a)
RETURN r

MATCH (a:Location),(b:DistributionCenter)
WHERE a.id = 6 AND b.id = 18
CREATE (b)-[r:BackboneNetwork { type:'truck', cost:8, historical_score:10, avg_time:170, distance:310 }]->(a)
RETURN r
