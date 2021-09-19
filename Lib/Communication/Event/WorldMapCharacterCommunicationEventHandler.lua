worldMapCommunicationUpdateTime = 0;
chatLoadTimePeriod = 10;
communicationTimePeriod = 15;
isCommsQueued = false;

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

    if (isCommsQueued and not WorldMapFrame:IsVisible()) then
        updateLocation();
        isCommsQueued = false;
    elseif (worldMapCommunicationUpdateTime + elapsedTime >= communicationTimePeriod) then
        if (WorldMapFrame:IsVisible()) then
            -- eventually change this so it pulls the last location right when the map became visible, so that we can still send updates when map is open
            isCommsQueued = true;
        else
            updateLocation();
        end
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


function updateLocation()
    SetMapToCurrentZone();

    --It would be annoying for people to see you in a zone that you're just flying over
    if (not Player:IsFlying()) then
        playerCharacter = Player:ToCharacter();
        SendCharacter(playerCharacter)
    end
    worldMapCommunicationUpdateTime = 0;
    Characters:CullCharacters();
end