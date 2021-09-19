Characters = {}
Characters.__index = Characters;

characterCullTime = 60;

function Characters:Insert(character)
    -- Remove so that same character doesnt have two points if a bug happens
    self:Remove(character);
    table.insert(self, character);
end

--[[
function Characters:Release()
    for i = 1, table.getn(self) do
        local ping = table.remove(self);
        ping:getFrame():Hide();
        pingFramePool:release(self.levelText:getFrame());
    end
end
]]--

function Characters:Remove(character)
    for i = 1, table.getn(self) do
        local candidate = self[i]
        if (candidate.name == character.name) then
            table.remove(self, i);
            return;
        end
    end
end

function Characters:Get(zone)
    local locationCharacters = {}
    for i = 1, table.getn(self) do
        local candidate = self[i]
        if (candidate.zoneGeo.name == zone) then
            table.insert(locationCharacters, candidate);
        end
    end

    return locationCharacters;
end

--Get all characters without mutating the Characters table, basically a shallow copy
function Characters:GetAll()
    local allCharacters = {}
    for i = 1, table.getn(self) do
        table.insert(allCharacters, self[i]);
    end

    return allCharacters
end

function Characters:CullCharacters()
    local time = GetTime()
    for i = 1, table.getn(self) do
        local candidate = self[i]
        --ToDo: Investigate why candidate can be nil
        if (--[[candidate ~= nil and]] time >= candidate.time + characterCullTime) then
            --Printd("Removing outdated character: " .. candidate.name)
            table.remove(self, i);
        end
    end
end

function generateTestCharacters()
    zoneGeo1 = RegionalZone:new("UngoroCrater", 0.35, 0.3);
    character1 = Character:new("Chumbabilly", 12, 1, zoneGeo1);
    zoneGeo2 = RegionalZone:new("Tanaris", 0.4, 0.5);
    character2 = Character:new("Fredge", 32, 1, zoneGeo2);

    Characters:Insert(character1);
    Characters:Insert(character2);
end
