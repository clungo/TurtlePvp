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
    ContinentalZone:new("DunMorogh", 0.46, 0.545),
    ContinentalZone:new("SearingGorge", 0.49, 0.61),
    ContinentalZone:new("Badlands", 0.55, 0.61),
    ContinentalZone:new("BurningSteppes", 0.5, 0.66),
    ContinentalZone:new("Elwynn", 0.463, 0.70),
    ContinentalZone:new("Redridge", 0.54, 0.71),
    ContinentalZone:new("Duskwood", 0.469, 0.775),
    ContinentalZone:new("Westfall", 0.41, 0.775),
    ContinentalZone:new("DeadwindPass", 0.51, 0.778),
    ContinentalZone:new("SwampOfSorrows", 0.55, 0.765),
    ContinentalZone:new("BlastedLands", 0.54, 0.82),
    ContinentalZone:new("Stranglethorn", 0.49, 0.84)
};

kalimdorZones = {
    ContinentalZone:new("Teldrassil", 0.43, 0.12),
    ContinentalZone:new("Moonglade", 0.535, 0.2),
    ContinentalZone:new("Darkshore", 0.46, 0.26),
    ContinentalZone:new("Winterspring", 0.57, 0.25),
    ContinentalZone:new("Felwood", 0.484, 0.28),
    ContinentalZone:new("Ashenvale", 0.49, 0.42),
    ContinentalZone:new("Aszhara", 0.595, 0.40),
    ContinentalZone:new("Durotar", 0.585, 0.50),
    ContinentalZone:new("StonetalonMountains", 0.44, 0.48),
    ContinentalZone:new("Barrens", 0.52, 0.585),
    ContinentalZone:new("Descolace", 0.42, 0.58),
    ContinentalZone:new("Mulgore", 0.475, 0.6),
    ContinentalZone:new("Dustwallow", 0.55, 0.67),
    ContinentalZone:new("Feralas", 0.435, 0.7),
    ContinentalZone:new("ThousandNeedles", 0.52, 0.75),
    ContinentalZone:new("Silithus", 0.435, 0.85),
    ContinentalZone:new("UngoroCrater", 0.496, 0.835),
    ContinentalZone:new("Tanaris", 0.55, 0.86)
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
