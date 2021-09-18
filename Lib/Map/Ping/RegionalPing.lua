RegionalPing = Ping:new(100);
RegionalPing.__index = RegionalPing;

function RegionalPing:setCharacter(character)
    self.character = character;
end

function RegionalPing:setPoint()
    self.frame:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", self.character.zoneGeo.x * WorldMapDetailFrame:GetWidth(), -self.character.zoneGeo.y * WorldMapDetailFrame:GetHeight());
end

function RegionalPing:onEnter()
    self:createText();
end

function RegionalPing:onLeave()
    self:destroyText();
end

function RegionalPing:createText()
    self.levelText = LevelText:new(self.character.name, self.character.level, self.frame);
    self.levelText:getFrame():Show();
end

function RegionalPing:destroyText()
    if (self.levelText == nil) then
        return
    end
    self.levelText:getFrame():Hide();
    self.levelText:getFrame().text:Hide();
    levelTextFramePool:release(self.levelText:getFrame());
    self.levelText = nil;
end

function RegionalPing:setTexture()
    local levelComparison = Player:ToCharacter():compareLevelRange(self.character);
    self.frame.texture = self.frame:CreateTexture()
    self.frame.texture:SetTexture("Interface\\MINIMAP\\OBJECTICONS.blp");
    self.frame.texture:SetTexCoord(0, 0.25, 0, 0.25);
    self.frame.texture:SetAllPoints();

    -- We set different colors depending on if the player is in your level range
    if (levelComparison == -1) then
        self.frame.texture:SetTexCoord(0.5, 0.75, 0, 0.25);
    elseif (levelComparison == 1) then
        self.frame.texture:SetTexCoord(0.25, 0.5, 0, 0.25);
    else
        self.frame.texture:SetTexCoord(0, 0.25, 0, 0.25);
    end
end
