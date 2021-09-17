
function ContinentalPingMap_OnEvent(self, event)
    Printd("Starting continental");
    if (event == "WORLD_MAP_UPDATE") then
        activeContinentalPings:Release();
        local zone = GetMapInfo();
        if (zone == "Azeroth") then
            displayContinentalPings(self, easternKingdoms);
        elseif (zone == "Kalimdor") then
            displayContinentalPings(self, kalimdor);
        end
    end
    Printd("stopping continental");
end

function ContinentalPingMap_OnLoad(self)
    self:RegisterEvent("WORLD_MAP_UPDATE");
end

function displayContinentalPings(self, continent)
    local characters = Characters:GetAll();
    local zoneNames = {};
    local playerFaction = getPlayerFaction();
    for i = 1, table.getn(characters) do
        local character = characters[i];
        if (character.faction ~= playerFaction) then
            local zoneName = character.zoneGeo.zone;
            if (zoneNames[zoneName] == nil) then
                zoneNames[zoneName] = true;
            end
        end
    end
    for zoneName in pairs(zoneNames) do
        local continentalZone = ContinentalZones:Get(zoneName);
        if (continentalZone == nil) then
            return;
        end
        if (continent:isPresent(continentalZone)) then
            Printd("Showing continentalZone: " .. continentalZone.name);
            local continentalPing = ContinentalPing:new(continentalZone);
            continentalPing:getFrame():Show();
            activeContinentalPings:Insert(continentalPing);
        end
    end
end