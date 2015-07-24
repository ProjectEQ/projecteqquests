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
    self.top = top
    self.bottom = bottom
    self.right = right
    self.left = left
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

return box
