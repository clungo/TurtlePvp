-- Eastern Kingdoms is called Azeroth in the API. Neat!
easternKingdoms = Continent:new("Azeroth");

kalimdor = Continent:new("Kalimdor");

function addAllEasternKingdomsZonesToContinent()
    for i = 1, table.getn(easternKingdomsContinentalZones) do
        local continentalZone = easternKingdomsContinentalZones[i];
        easternKingdoms:Insert(continentalZone);
    end
end

function addAllKalimdorZonesToContinent()
    for i = 1, table.getn(kalimdorZones) do
        local continentalZone = kalimdorZones[i];
        kalimdor:Insert(continentalZone);
    end
end

addAllEasternKingdomsZonesToContinent();
addAllKalimdorZonesToContinent();