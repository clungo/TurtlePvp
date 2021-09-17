updateTime = 0;
function WorldMapCharacter_OnLoad(self)
    self:RegisterEvent("CHAT_MSG_CHANNEL");
end

function WorldMapCharacter_OnEvent(self, event, message, channelName)
    if (event == "CHAT_MSG_CHANNEL" and channelName == "Tpvpaddon") then
        if (isMessageFormatted(message)) then
            character = Character:fromString(message)
            Characters:Insert(character)
        end
    end
end

function WorldMapCharacter_OnUpdate(elapsedTime)
    if (updateTime + elapsedTime >= 300) then
        SetMapToCurrentZone();

        --It would be annoying for people to see you in a zone that you're just flying over
        if (not isPlayerFlying()) then
            playerCharacter = getPlayerCharacter();
            SendCharacter(playerCharacter)
        end
        updateTime = 0;
        Characters:CullCharacters();
    end
    updateTime = updateTime + elapsedTime;
end



