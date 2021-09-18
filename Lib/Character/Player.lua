Player = {};
Player.__index = Player;

function Player:GetLevel()
    return UnitLevel("player")
end

function Player:GetZoneGeo()
    local x, y = GetPlayerMapPosition("player"); 
    local zone = GetMapInfo();
    if (zone == nil) then
        zone = "Unknown";
    end
    --Printd("" .. zone .. ", " .. x .. ", " .. y);

    return RegionalZone:new(zone, x, y);
end

function Player:GetFaction()
    local playerFaction = UnitFactionGroup("player")

    if (playerFaction == "Alliance") then
        return 1;
    end

    return 0;
end

function Player:GetName()
    return UnitName("player")
end

function Player:isFlying()
    return UnitOnTaxi("player");
end

function Player:ToCharacter()
    local name = self:GetName();
    local level = self:GetLevel();
    local faction = self:GetFaction();
    local zoneGeo = self:GetZoneGeo();
    return Character:new(name, level, faction, zoneGeo);
end

--/1 random,15,0,Elwynn,0.2,0.3