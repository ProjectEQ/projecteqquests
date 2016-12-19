-- bard 2.0 mob
function event_combat(e)
    if e.joined == true then
        eq.set_timer("ae", 12000)
    end
end

function event_timer(e)
    if e.timer == "ae" then
        local tar = e.self:GetTarget()
        if tar.valid then
            e.self:CastSpell(5975, tar:GetID()) -- Tendrils of Oshiruk
        else
            eq.stop_timer("ae")
        end
    end
end
