
function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Hello there. There seems to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [" .. eq.say_link("travel to freeport") .. "] or [" .. eq.say_link("travel to Butcherblock") .. "] in the meantime, I can transport you to my companion there.")
        return
    end

    if e.message:findi("travel to freeport") then
        e.self:Say("Off you go!")
        if eq.is_prophecy_of_ro_enabled() then
            e.other:MovePC(Zone.freeporteast, -1006.66, -14.65, -53.47, 64)
            return
        end
        e.other:MovePC(Zone.freporte, -1006.66, -14.65, -53.47, 64)
        return
    end

    if e.message:findi("travel to butcherblock") then
        e.self:Say("Off you go!")
        eq.SelfCast(2280)
        return
    end
end
