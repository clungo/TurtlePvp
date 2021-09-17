ZoneGeo = {}
ZoneGeo.__index = ZoneGeo;

function ZoneGeo:new(zone, x, y)
    local self = {};
    self.zone = zone;
    self.x = x;
    self.y = y;
    setmetatable(self, ZoneGeo);
    return self;
 end
