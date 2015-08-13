local box = require("aa_box")
-- this is slightly out of the room's geometry
local tether_box = box(-15.5, -160.5, 751.5, 832.5)

function event_spawn(e)
    if math.random(0, 1) == 1 then
        e.self:SetSpecialAbility(SpecialAbility.flurry, 1)
    else
        e.self:SetSpecialAbility(SpecialAbility.rampage, 1)
    end
    eq.set_timer("tether", 6000) -- live has a fairly long timer
end

function event_timer(e)
    if not tether_box:contains(e.self:GetX(), e.self:GetY()) then
        e.self:GotoBind()
        e.self:SetHP(e.self:GetMaxHP())
        e.self:CastSpell(3791, e.self:GetID())
        e.self:WipeHateList()
    end
end
