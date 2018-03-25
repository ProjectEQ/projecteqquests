-- simple Axis Aligned Bounding Box can be used for rectangular leashing/tethering
local box = {}
box.__index = box

setmetatable(box, {
    __call = function (cls, ...)
        return cls.new(...)
    end,
})

function box.new(top, bottom, right, left)
    local self = setmetatable({}, box)
    self.top = top or -99999
    self.bottom = bottom or 99999
    self.right = right or 99999
    self.left = left or -99999
    return self
end

-- the box contains this point
function box:contains(x, y)
    if x <= self.left and x >= self.right and y <= self.top and y >= self.bottom then
        return true
    else
        return false
    end
end

-- expands the box to contain provided x/y (used to auto calculate)
function box:add(x, y)
    if x < self.right then
        self.right = x
    end
    if x > self.left then
        self.left = x
    end
    if y < self.bottom then
        self.bottom = y
    end
    if y > self.top then
        self.top = y
    end
end

return box
