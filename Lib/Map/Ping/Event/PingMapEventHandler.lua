
function PingMap_OnEvent(self, event, ...)
    Printd("Starting");
    if (event == "WORLD_MAP_UPDATE") then
        activePings:Release();
        local zone = getPlayerPoint();
        local characters = Characters:Get(zone);
        for i = 1, table.getn(characters) do
            local character = characters[i];
            if (character.faction ~= getPlayerFaction()) then
                Printd("We are making a ping");
                local ping = Ping:new(character);
                ping:getFrame():Show();
                activePings:Insert(ping);
            end
        end
    end
    Printd("Stopping");
end

function PingMap_OnLoad(self)
    self:RegisterEvent("WORLD_MAP_UPDATE");
end