
function RegionalPingMap_OnEvent(self, event, ...)
    if (event == "WORLD_MAP_UPDATE") then
        activeRegionalPings:Release();
        local zone = GetMapInfo();
        local characters = Characters:Get(zone);
        local playerCharacter = Player:ToCharacter();
        for i = 1, table.getn(characters) do
            local character = characters[i];
            if (playerCharacter:compareFaction(character) == 1) then
                local ping = RegionalPing:new();
                ping:setCharacter(character);
                ping:getFrame():Show();
                activeRegionalPings:Insert(ping);
            end
        end
    end
end

function RegionalPingMap_OnLoad(self)
    self:RegisterEvent("WORLD_MAP_UPDATE");
end