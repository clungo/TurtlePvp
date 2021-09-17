Character = {}
Character.__index = Character;

function Character:new(name, level, faction, zoneGeo)
    local self = {};
    self.name = name;
    self.faction = faction;
    self.level = level;
    self.zoneGeo = zoneGeo;
    self.time = GetTime();
    setmetatable(self, Character);
    return self;
 end

 function Character:fromString(message)
    if (not isMessageFormatted(message)) then
        return nil
    end
    tokens = {};
    -- gfind doesnt return a table. i returns a 'function value' or something. pain in the ass
    for token in string.gfind(message, "[^,]+") do
        table.insert(tokens, token)
    end

    name = tokens[1];
    level = tonumber(tokens[2]);
    faction = tonumber(tokens[3]);
    zone = tokens[4];
    x = tonumber(tokens[5]);
    y = tonumber(tokens[6]);

    zoneGeo = ZoneGeo:new(zone, x, y);
    return Character:new(name, level, faction, zoneGeo);
end

function Character:toString()
    return self.name .. "," .. self.level .. "," .. self.faction .. "," .. self.zoneGeo.zone .. "," .. self.zoneGeo.x .. "," .. self.zoneGeo.y;
end
