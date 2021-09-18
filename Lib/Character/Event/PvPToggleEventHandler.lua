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
    local playerCharacter = Player:ToCharacter();
    local x = playerCharacter.zoneGeo.x;
    local y = playerCharacter.zoneGeo.y;
    local characterCandidates = Characters:Get(playerCharacter.zoneGeo.name);

    for i = 1, table.getn(characterCandidates) do
        local character = characterCandidates[i];
        local candidateX = character.zoneGeo.x;
        local candidateY = character.zoneGeo.y;

        local distance = math.sqrt((candidateX - x)*(candidateX - x) + (candidateY - y)*(candidateY -y));
        if (distance <= 0.061 and playerCharacter:compareFaction(character) == 1 and playerCharacter:compareLevelRange(character) == 0) then
            return true;
        end
    end

    return false;
end