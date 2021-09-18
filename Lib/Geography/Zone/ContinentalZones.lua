ContinentalZones = {}
ContinentalZones.__index = ContinentalZones;

function ContinentalZones:Get(zoneName)
    return self[zoneName];
end

function ContinentalZones:Insert(zone)
    self[zone.name] = zone;
end


elwynnForest = ContinentalZone:new("Elwynn", 0.463, 0.70);
redridge = ContinentalZone:new("Redridge", 0.54, 0.71);
durotar = ContinentalZone:new("Durotar", 0.585, 0.50);
dunMorogh = ContinentalZone:new("DunMorogh", 0.585, 0.50);

ContinentalZones:Insert(elwynnForest);
ContinentalZones:Insert(dunMorogh);
ContinentalZones:Insert(redridge);
ContinentalZones:Insert(durotar);