ZoneGeo = {}
ZoneGeo.__index = ZoneGeo;

function ZoneGeo:new(zoneName, x, y)
    local zoneGeo = {};
    setmetatable(zoneGeo, self);
    if (zoneName ~= nil) then
        zoneGeo.name = zoneName;
        zoneGeo.x = x;
        zoneGeo.y = y;
    end
    return zoneGeo;
 end
