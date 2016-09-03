local box = require("aa_box")
-- this is slightly out of the room's geometry
local tether_box = box(160.5, 15.5, 751.5, 832.5)
function event_spawn(e)
    local special = math.random(0, 2)
    if special == 0 then
        e.self:SetSpecialAbility(SpecialAbility.flurry, 1)
    elseif special == 1 then
        e.self:SetSpecialAbility(SpecialAbility.rampage, 1)
    else
        e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1)
        e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 25)
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
