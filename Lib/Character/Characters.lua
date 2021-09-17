Characters = {}
Characters.__index = Characters;

function Characters:Insert(character)
    -- Remove so that same character doesnt have two points if a bug happens
    self:Remove(character);
    table.insert(self, character);
end

function Characters:Release()
    for i = 1, table.getn(self) do
        local ping = table.remove(self);
        ping:getFrame():Hide();
        pingFramePool:release(self.levelText:getFrame());
    end
end

function Characters:Remove(character)
    for i = 1, table.getn(self) do
        local candidate = self[i]
        if (candidate.name == character.name) then
            table.remove(self, i);
            return;
        end
    end
end

function Characters:CullCharacters()
    local time = GetTime()
    for i = 1, table.getn(self) do
        local candidate = self[i]
        if (time >= candidate.time + 30) then
            --Printd("Removing outdated character: " .. candidate.name)
            --table.remove(self, i);
        end
    end
end


function Characters:Get(zone)
    local locationCharacters = {}
    for i = 1, table.getn(self) do
        local candidate = self[i]
        if (candidate.zoneGeo.zone == zone) then
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

zoneGeo1 = ZoneGeo:new("Elwynn", 0.41, 0.655);
character1 = Character:new("Chumbabilly", 19, 0, zoneGeo1);
zoneGeo2 = ZoneGeo:new("Redridge", 0.4, 0.5);
character2 = Character:new("Fredge", 32, 0, zoneGeo2);

Characters:Insert(character1);
Characters:Insert(character2);