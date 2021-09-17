channelInit = false;

pvpTimerTime = 0;

function PVPToggleEvent_OnUpdate(elapsedTime)
    if (pvpTimerTime + elapsedTime < 10) then
        pvpTimerTime = pvpTimerTime + elapsedTime;
        return;
    end
    pvpTimerTime = 0;
    if (characterIsNear()) then
        if (not UnitIsPVP("player")) then
            Printd("turning on pvp");
            TogglePVP();
            TogglePVP();
        end
    end;
end

function characterIsNear()
    local zone, x, y = getPlayerPoint();
    local characterCandidates = Characters:Get(zone);

    for i = 1, table.getn(characterCandidates) do
        local character = characterCandidates[i];
        local candidateX = character.zoneGeo.x;
        local candidateY = character.zoneGeo.y;

        local distance = math.sqrt((candidateX - x)*(candidateX - x) + (candidateY - y)*(candidateY -y));
        if (distance <= 0.061 and character.faction ~= getPlayerFaction() and characterNearPlayerLevel(character)) then
            return true;
        end
    end

    return false;
end

function characterNearPlayerLevel(character)
    local characterLevel = character.level;
    local playerLevel = getPlayerLevel();

    return characterLevel >= playerLevel - 4 and characterLevel <= playerLevel + 4;
end    