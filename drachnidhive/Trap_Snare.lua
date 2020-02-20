function event_combat(e)
if (e.joined == true) then
e.self:CastSpell(7740,0); --confining web
end
end

function event_cast(e)
eq.depop_with_timer(); -- add this function because spell has casting time
end
