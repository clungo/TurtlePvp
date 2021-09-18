Continent = {}
Continent.__index = Continent;

function Continent:new(name)
    local self = {};
    self.name = name;
    setmetatable(self, Continent);
    return self;
 end

 function Continent:Insert(continentalZone)
    self[continentalZone.name] = continentalZone;
 end

 function Continent:isPresent(continentalZone)
    return self[continentalZone.name] ~= nil;
 end