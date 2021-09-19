
function ContinentalPingMap_OnEvent(self, event)
    if (event == "WORLD_MAP_UPDATE" and WorldMapFrame:IsVisible()) then
        Printd("visible");
        activeContinentalPings:Release();
        local zone = GetMapInfo();
        if (zone == "Azeroth") then
            displayContinentalPings(self, easternKingdoms);
        elseif (zone == "Kalimdor") then
            displayContinentalPings(self, kalimdor);
        end
    else
        Printd("not visible")
    end
end

function ContinentalPingMap_OnLoad(self)
    self:RegisterEvent("WORLD_MAP_UPDATE");
end

function displayContinentalPings(self, continent)
    local characters = Characters:GetAll();
    local zoneNames = {};
    local playerCharacter = Player:ToCharacter();
    for i = 1, table.getn(characters) do
        local character = characters[i];
        if (playerCharacter:compareFaction(character) == 1) then
            local zoneName = character.zoneGeo.name;
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
            local continentalPing = ContinentalPing:new();
            continentalPing:setContinentalZone(continentalZone);
            continentalPing:getFrame():Show();
            activeContinentalPings:Insert(continentalPing);
        end
    end
end