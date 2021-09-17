local HelloWorld

ContinentalPing = {}
ContinentalPing.__index = ContinentalPing;
function ContinentalPing:new(continentalZone)
    local self = {};
    self.continentalZone = continentalZone;
    self.texture = nil;
    self.frame = nil;
    setmetatable(self, ContinentalPing);
    return self;
 end

 function ContinentalPing:getFrame()
    if (self.frame == nil) then
        self:createFrame();
    end
    return self.frame
 end

 function ContinentalPing:createFrame()
    self.frame = pingFramePool:acquire();
    self.frame:SetWidth(30);
    self.frame:SetHeight(30);
    self:setTexture();

    self.frame:SetFrameStrata("TOOLTIP");
    self.frame:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 1);
    self.frame:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", self.continentalZone.continentalX * WorldMapDetailFrame:GetWidth(), -self.continentalZone.continentalY * WorldMapDetailFrame:GetHeight());
    self.frame:SetAlpha(0.7);
 end

 function ContinentalPing:setTexture()
    self.frame.texture = self.frame:CreateTexture()
    self.frame.texture:SetTexture("Interface\\MINIMAP\\OBJECTICONS.blp");
    self.frame.texture:SetTexCoord(0, 0.25, 0, 0.25);
    self.frame.texture:SetAllPoints();
end
