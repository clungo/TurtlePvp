local HelloWorld

ActivePings = {};
ActivePings.__index = ActivePings;

function ActivePings:new()
    local self = {};
    setmetatable(self, ActivePings);
    return self;
end

function ActivePings:Insert(ping)
    table.insert(self, ping);
end

function ActivePings:Release()
    for i = 1, table.getn(self) do
        local ping = table.remove(self);
        if (ping == nil and table.getn(self) ~= 0) then
            Printd("Something very wrong has occured");
        end
        Printd("Releasing");
        ping:getFrame():SetScript("OnEnter", function() end);
        ping:getFrame():SetScript("OnLeave", function() end);
        ping:getFrame():Hide();
        ping:getFrame():SetAlpha(0);
        ping:getFrame().texture:Hide();
        ping:getFrame().texture:Hide();
        ping:getFrame().texture:SetTexture(nil);
        pingFramePool:release(ping:getFrame());
    end
end

activePings = ActivePings:new();
activeContinentalPings = ActivePings:new();