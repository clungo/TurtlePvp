local HelloWorld

LevelText = {};
LevelText.__index = LevelText;

levelTextFramePool = FramePool:new(worldMapeDetailsFrameCreateFrame, "levelTextFramePool")

function LevelText:new(name, level, frame)
    local self = {};
    self.name = name;
    self.level = level;
    self.parentFrame = frame;
    self.frame = nil;
    setmetatable(self, LevelText);
    return self;
end

function LevelText:getFrame()
    if (self.frame == nil) then
        self:createFrame();
    end
    return self.frame
end

-- Because we're constantly creating FontStrings, which are frames, there's a possibility of memory leakage over time if people hover enough. Unlikely but possible. Frames dont get GC'd
function LevelText:createFrame()
    self.frame = levelTextFramePool:acquire();
    self.frame:SetWidth(100);
    self.frame:SetHeight(100);
    self.frame.texture = self.frame:CreateTexture(nil, "BACKGROUND")
    self.frame.texture:SetAllPoints(true)
    --self.frame:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", 0 * WorldMapDetailFrame:GetWidth(), -0 * WorldMapDetailFrame:GetHeight());
    self.frame.text = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    self.frame.text:SetPoint("BOTTOM", self.parentFrame, "TOP", 0.5, -0.5);
    self.frame.text:SetText(self.name .. ", " .. self.level);
    Printd("level text frame created");
end
