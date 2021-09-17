function getPlayerLevel()
    return UnitLevel("player")
end

function getPlayerPoint()
    local x, y = GetPlayerMapPosition("player"); 
    local zone = GetMapInfo();
    if (zone == nil) then
        zone = "Unknown";
    end
    --Printd("" .. zone .. ", " .. x .. ", " .. y);

    return zone, x, y;
end

function getPlayerFaction()
    local playerFaction = UnitFactionGroup("player")

    if (playerFaction == "Alliance") then
        return 1;
    end

    return 0;
end

function getPlayerName()
    return UnitName("player")
end

function getPlayerCharacter()
    local name = getPlayerName();
    local level = getPlayerLevel();
    local faction = getPlayerFaction();
    local zone = GetMapInfo();
    if (zone == nil) then
        zone = "Unknown"
    end
    local x, y = GetPlayerMapPosition("player"); 

    local zoneGeo = ZoneGeo:new(zone, x, y);
    return Character:new(name, level, faction, zoneGeo);
end

function isPlayerFlying()
    return UnitOnTaxi("player");
end


--/1 random,15,0,Elwynn,0.2,0.3