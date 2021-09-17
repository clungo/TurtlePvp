local HelloWorld

Ping = {}
Ping.__index = Ping;

--Hypothetically this frame pool could continuously grow. It's functioanlly upper bounded by current number of users online at once, unless there's a bug in the code
pingFramePool = FramePool:new(worldMapeDetailsFrameCreateFrame, "pingFramePool")

function Ping:new(character)
    local self = {};
    self.character = character;
    self.texture = nil;
    self.frame = nil;
    setmetatable(self, Ping);
    return self;
 end

 function Ping:getFrame()
    if (self.frame == nil) then
        self:createFrame();
    end
    return self.frame
 end

 function Ping:createFrame()
    Printd("We are creating a ping frame");
    self.frame = pingFramePool:acquire();
    self.frame:SetWidth(100);
    self.frame:SetHeight(100);
    self.frame:EnableMouse(true);
    self.frame:SetScript("OnEnter", function() self:createText() end) -- this routine you need to write
    self.frame:SetScript("OnLeave", function() self:destroyText() end) -- this routine you need to write
    self:setTexture();

    self.frame:SetFrameStrata("TOOLTIP");
    self.frame:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 1);
    self.frame:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", self.character.zoneGeo.x * WorldMapDetailFrame:GetWidth(), -self.character.zoneGeo.y * WorldMapDetailFrame:GetHeight());
    self.frame:SetAlpha(0.4);
 end

 function Ping:createText()
    self.levelText = LevelText:new(self.character.name, self.character.level, self.frame);
    self.levelText:getFrame():Show();
 end

 function Ping:destroyText()
    if (self.levelText == nil) then
        return
    end
    self.levelText:getFrame():Hide();
    self.levelText:getFrame().text:Hide();
    levelTextFramePool:release(self.levelText:getFrame());
    self.levelText = nil;
 end

 function Ping:setTexture()
    local playerLevel = getPlayerLevel();
    local pingLevel = self.character.level;
    self.frame.texture = self.frame:CreateTexture()
    self.frame.texture:SetTexture("Interface\\MINIMAP\\OBJECTICONS.blp");
    self.frame.texture:SetTexCoord(0, 0.25, 0, 0.25);
    self.frame.texture:SetAllPoints();

    -- We set different colors depending on if the player is in your level range
    if (playerLevel > pingLevel + 4) then
        self.frame.texture:SetTexCoord(0.5, 0.75, 0, 0.25);
    elseif (playerLevel + 4 < pingLevel) then
        self.frame.texture:SetTexCoord(0.25, 0.5, 0, 0.25);
    else
        self.frame.texture:SetTexCoord(0, 0.25, 0, 0.25);
    end
end
