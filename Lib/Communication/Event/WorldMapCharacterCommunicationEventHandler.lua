worldMapCommunicationUpdateTime = 0;
chatLoadTimePeriod = 10;
communicationTimePeriod = 10;

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
    if (worldMapCommunicationUpdateTime + elapsedTime >= chatLoadTimePeriod) then
        ensureInChannel();
    end
    if (worldMapCommunicationUpdateTime + elapsedTime >= communicationTimePeriod) then
        SetMapToCurrentZone();

        --It would be annoying for people to see you in a zone that you're just flying over
        if (not Player:isFlying()) then
            playerCharacter = Player:ToCharacter();
            SendCharacter(playerCharacter)
        end
        worldMapCommunicationUpdateTime = 0;
        Characters:CullCharacters();
    end
    worldMapCommunicationUpdateTime = worldMapCommunicationUpdateTime + elapsedTime;
end

function ensureInChannel()
    if (channelInit) then
        return true
    end
    JoinChannelByName("Tpvpaddon");
    ChatFrame_RemoveChannel(DEFAULT_CHAT_FRAME, "Tpvpaddon");

    chatChannelName = GetChannelName("Tpvpaddon");
    channelInit = true;
end
