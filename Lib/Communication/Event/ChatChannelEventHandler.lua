channelInit = false;

function ChatChannel_OnLoad()
    if (not channelInit) then
        JoinChannelByName("Tpvpaddon");
        ChatFrame_RemoveChannel(DEFAULT_CHAT_FRAME, "Tpvpaddon");

        chatChannelName = GetChannelName("Tpvpaddon");
        channelInit = true;
    end
end