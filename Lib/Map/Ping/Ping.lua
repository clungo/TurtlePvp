Ping = {}
Ping.__index = Ping;

--Hypothetically this frame pool could continuously grow. It's functioanlly upper bounded by current number of users online at once, unless there's a bug in the code
pingFramePool = FramePool:new(worldMapeDetailsFrameCreateFrame, "pingFramePool")

-- This is an abstract class, abstract methods that need to be implemented have return 1 / 0 in them
function Ping:new(dimensions)
    local ping = {};
    ping.texture = nil;
    ping.frame = nil;
    -- When we create new child classes, self.dimensions will be populated then
    ping.dimensions = self.dimensions or dimensions;
    setmetatable(ping, self);
    return ping;
 end

 function Ping:getFrame()
    if (self.frame == nil) then
        self:createFrame();
    end
    return self.frame
 end

 function Ping:createFrame()
    self.frame = pingFramePool:acquire();
    self.frame:SetWidth(self.dimensions);
    self.frame:SetHeight(self.dimensions);
    self.frame:EnableMouse(true);
    self.frame:SetScript("OnEnter", function() self:onEnter() end)
    self.frame:SetScript("OnLeave", function() self:onLeave() end)
    self:setTexture();

    self.frame:SetFrameStrata("TOOLTIP");
    self.frame:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 1);
    self:setPoint();
    --self.frame:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", self.character.zoneGeo.x * WorldMapDetailFrame:GetWidth(), -self.character.zoneGeo.y * WorldMapDetailFrame:GetHeight());
    self:setAlpha(0.4);
 end

 function Ping:setAlpha()
   self.frame:SetAlpha(0.4);
 end

 -- These setter methods primarily exist at the moment because of a lack of knowledge on calling super methods in lua
 function Ping:setPoint()
    return 1 / 0;
 end

 function Ping:onEnter()
    return 1 / 0;
 end

 function Ping:onLeave()
    return 1 / 0;
 end

 function Ping:setTexture()
    return 1 / 0;
end
