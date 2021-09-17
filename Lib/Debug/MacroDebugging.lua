function genPlayerPoint()
    local  x,y = GetPlayerMapPosition("player"); 
    local zone = GetMapInfo()
    local zoneGeo1 = ZoneGeo:new(zone, x, y);
    localcharacter1 = Character:new("Kilby", 15, 1, zoneGeo1);
    Characters:Insert(localcharacter1);
end