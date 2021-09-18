ContinentalZones = {}
ContinentalZones.__index = ContinentalZones;

function ContinentalZones:Get(zoneName)
    return self[zoneName];
end

function ContinentalZones:Insert(zone)
    self[zone.name] = zone;
end

easternKingdomsContinentalZones = {
    ContinentalZone:new("EasternPlaguelands", 0.567, 0.22),
    ContinentalZone:new("WesternPlaugelands", 0.505, 0.21),
    ContinentalZone:new("Tirisfal", 0.445, 0.22),
    ContinentalZone:new("Silverpine", 0.41, 0.3),
    ContinentalZone:new("Alterac", 0.465, 0.30),
    ContinentalZone:new("Hilsbrad", 0.48, 0.35),
    ContinentalZone:new("Hinterlands", 0.54, 0.32),
    ContinentalZone:new("Arathi", 0.535, 0.375),
    ContinentalZone:new("Wetlands", 0.533, 0.48),
    ContinentalZone:new("LochModan", 0.55, 0.545),

    ContinentalZone:new("DunMorogh", 0.463, 0.70),
    ContinentalZone:new("SearingGorge", 0.463, 0.70),
    ContinentalZone:new("Badlands", 0.463, 0.70),
    ContinentalZone:new("BurningSteppes", 0.463, 0.70),
    ContinentalZone:new("Elwynn", 0.463, 0.70),
    ContinentalZone:new("Redridge", 0.54, 0.71),
    ContinentalZone:new("Westfall", 0.54, 0.71),
    ContinentalZone:new("DeadwindPass", 0.54, 0.71),
    ContinentalZone:new("SwampOfSorrows", 0.54, 0.71),
    ContinentalZone:new("BlastedLands", 0.54, 0.71),
    ContinentalZone:new("Stranglethorn", 0.54, 0.71)
};

kalimdorZones = {
    ContinentalZone:new("Teldrassil", 0.585, 0.50),
    ContinentalZone:new("Moonglade", 0.585, 0.50),
    ContinentalZone:new("Darkshore", 0.585, 0.50),
    ContinentalZone:new("Winterspring", 0.585, 0.50),
    ContinentalZone:new("Felwood", 0.585, 0.50),
    ContinentalZone:new("Ashenvale", 0.585, 0.50),
    ContinentalZone:new("Aszhara", 0.585, 0.50),
    ContinentalZone:new("Durotar", 0.585, 0.50),
    ContinentalZone:new("StonetalonMountains", 0.585, 0.50),
    ContinentalZone:new("Barrens", 0.585, 0.50),
    ContinentalZone:new("Descolace", 0.585, 0.50),
    ContinentalZone:new("Mulgore", 0.585, 0.50),
    ContinentalZone:new("Dustwallow", 0.585, 0.50),
    ContinentalZone:new("Feralas", 0.585, 0.50),
    ContinentalZone:new("ThousandNeedles", 0.585, 0.50),
    ContinentalZone:new("Silithus", 0.585, 0.50),
    ContinentalZone:new("UngoroCrater", 0.585, 0.50),
    ContinentalZone:new("Tanaris", 0.585, 0.50)
};


function addAllEasternKingdomsZones()
    for i = 1, table.getn(easternKingdomsContinentalZones) do
        local continentalZone = easternKingdomsContinentalZones[i];
        ContinentalZones:Insert(continentalZone);
    end
end

function addAllKalimdorZones()
    for i = 1, table.getn(kalimdorZones) do
        local continentalZone = kalimdorZones[i];
        ContinentalZones:Insert(continentalZone);
    end
end

addAllEasternKingdomsZones();
addAllKalimdorZones();
