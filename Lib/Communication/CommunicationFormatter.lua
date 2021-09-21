function isMessageFormatted(message)
    tokens = {};
    -- gfind doesnt return a table. i returns a 'function value' or something. pain in the ass
    for token in string.gfind(message, "[^,]+") do
        table.insert(tokens, token)
    end

    if (table.getn(tokens) ~= 6) then
        return false
    end

    local characterName = tokens[1];
    local level = tokens[2];
    local faction = tokens[3];
    local zone = tokens[4];
    local x = tokens[5];
    local y = tokens[6];
    local isNameValid = verifyOnlyLetters(characterName)
    local isLevelValid = verifyLevel(level)
    local isFactionValid = verifyFaction(faction)
    local isZoneValid = verifyZone(zone)
    local isXValid = verifyCoord(x)
    local isYValid = verifyCoord(y)
    local isStringValid = isNameValid and isLevelValid and isFactionValid and isZoneValid and isXValid and isYValid;

    return isStringValid;
end

--Believe it or not 1.12.1 doesn't support string matching!!!!!!! :)
function verifyOnlyLetters(name)
    for character in string.gfind(name, ".") do
        if (string.find(character, "%a") ~= 1) then
            return false
        end
    end
    return true
end

function verifyLevel(level)
    local numericLevel = tonumber(level);
    if (numericLevel == nil) then
        return false;
    end
    flooredLevel = math.floor(numericLevel);
    return numericLevel == flooredLevel and numericLevel >= 1 and numericLevel <= 60;
end


function verifyZone(zone)
    if (not verifyOnlyLetters(zone)) then
        return false
    end

    BannedZones = {}
    BannedZones["Kalimdor"] = true;
    BannedZones["Azeroth"] = true;
    BannedZones["unknown"] = true;

    if (BannedZones[zone] ~= nil) then
        return false
    end

    return true
end

function verifyCoord(coord)
    local numericLevel = tonumber(coord);
    if (numericLevel == nil) then
        return false;
    end
    return numericLevel >= 0 and numericLevel <= 1;
end

function verifyFaction(faction)
    local numericLevel = tonumber(faction);
    if (numericLevel == nil) then
        return false;
    end

    return numericLevel == 0 or numericLevel == 1
end