ContinentalPing = Ping:new(30);
ContinentalPing.__index = ContinentalPing;

function ContinentalPing:setContinentalZone(continentalZone)
   self.continentalZone = continentalZone;
end

function ContinentalPing:onEnter()
   return;
end

function ContinentalPing:onLeave()
   return;
end

function ContinentalPing:setAlpha()
   self.frame:SetAlpha(0.8);
 end

function ContinentalPing:setPoint()
   self.frame:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", self.continentalZone.x * WorldMapDetailFrame:GetWidth(), -self.continentalZone.y * WorldMapDetailFrame:GetHeight());
end

function ContinentalPing:setTexture()
    self.frame.texture = self.frame:CreateTexture()
    self.frame.texture:SetTexture("Interface\\MINIMAP\\OBJECTICONS.blp");
    self.frame.texture:SetTexCoord(0, 0.25, 0, 0.25);
    self.frame.texture:SetAllPoints();
end
