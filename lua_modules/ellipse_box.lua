-- check if something is in the ellipse
-- we need to define a center point, semi-major axis, and semi-minor axis
local ellipse = {}
ellipse.__index = ellipse

setmetatable(ellipse, {
    __call = function(cls, ...)
        return cls.new(...)
    end,
})

function ellipse.new(center_x, center_y, major, minor)
    local self = setmetatable({}, ellipse)
    self.center_x = center_x
    self.center_y = center_y
    self.major2 = major * major
    self.minor2 = minor * minor
    return self
end

function ellipse:contains(x, y)
    local x_diff = x - self.center_x
    local y_diff = y - self.center_y
    x_diff = x_diff * x_diff
    y_diff = y_diff * y_diff
    local p = (x_diff / self.major2) + (y_diff / self.minor2)
    return p <= 1
end

return ellipse
