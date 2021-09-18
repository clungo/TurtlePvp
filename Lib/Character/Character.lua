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

--Returns -1 if otherCharacter is too low a level, 0 if they're similar level, or 1 if they're too high a level
function Character:compareLevelRange(otherCharacter)
    local characterLevel = self.level;
    local otherCharacterLevel = otherCharacter.level;
    if (characterLevel > otherCharacterLevel + 4) then
        return -1;
    elseif (characterLevel + 4 < otherCharacterLevel) then
        return 1;
    else
        return 0;
    end
end

--Returns 1 if the factions differ, 0 if the factions are the same
function Character:compareFaction(otherCharacter)
    local characterFaction = self.faction;
    local otherCharacterFaction = otherCharacter.faction;

    if (characterFaction ~= otherCharacterFaction) then
        return 1
    end
    
    return 0;
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
    return self.name .. "," .. self.level .. "," .. self.faction .. "," .. self.zoneGeo.name .. "," .. self.zoneGeo.x .. "," .. self.zoneGeo.y;
end
