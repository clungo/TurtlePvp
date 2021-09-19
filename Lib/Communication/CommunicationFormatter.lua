function isMessageFormatted(message)
    tokens = {};
    -- gfind doesnt return a table. i returns a 'function value' or something. pain in the ass
    for token in string.gfind(message, "[^,]+") do
        table.insert(tokens, token)
    end

    if (table.getn(tokens) ~= 6) then
        return false
    end

    characterName = tokens[1];
    level = tokens[2];
    faction = tokens[3];
    zone = tokens[4];
    x = tokens[5];
    y = tokens[6];
    isNameValid = verifyOnlyLetters(characterName)
    isLevelValid = verifyLevel(level)
    isFactionValid = verifyFaction(faction)
    isZoneValid = verifyZone(zone)
    isXValid = verifyCoord(x)
    isYValid = verifyCoord(y)
    isStringValid = isNameValid and isLevelValid and isFactionValid and isZoneValid and isXValid and isYValid;

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
    numericLevel = tonumber(level);
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
    numericValue = tonumber(coord);
    if (numericLevel == nil) then
        return false;
    end
    return numericValue >= 0 and numericValue <= 1;
end

function verifyFaction(faction)
    numericValue = tonumber(faction);
    if (numericLevel == nil) then
        return false;
    end

    return numericValue == 0 or numericValue == 1
end