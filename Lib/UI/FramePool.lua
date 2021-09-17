local HelloWorld

FramePool = {};
FramePool.__index = FramePool;

-- TODO: Add name for debugging
function FramePool:new(createFrame, name)
    local self = {};
    self.name = name;
    self.createFrame = createFrame;
    setmetatable(self, FramePool);
    return self;
end

function FramePool:acquire()
    return table.remove(self) or self.createFrame();
end

function FramePool:release(frame)
    return table.insert(self, frame)
end

function worldMapeDetailsFrameCreateFrame()
    return CreateFrame("Frame", nil, WorldMapDetailFrame);
end
