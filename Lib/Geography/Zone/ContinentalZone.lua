ContinentalZone = ZoneGeo:new();

--[[
-- ContinentalX/Y are basically roughly where the centre of the ContinentalZone appears on a continent
function ContinentalZone:new(name, continentalX, continentalY)
    local self = {};
    self.name = name;
    self.continentalX = continentalX;
    self.continentalY = continentalY;
    setmetatable(self, ContinentalZone);
    return self;
 end
 ]]--
