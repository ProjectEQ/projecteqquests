function event_spawn(e)
eq.set_timer("upgrade", 50 * 1000);
end

function event_timer(e)
if(e.timer=="upgrade") then
eq.spawn2(214134,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: an_Enchanted_War_Boar
eq.depop();
end
end

function event_death_complete(e)
local Glykus = eq.get_entity_list():GetMobByNpcTypeID(214053);
	if (Glykus.valid and Glykus:IsEngaged()) then
eq.spawn2(214040,0,0,1386,-926,-296,70); -- NPC: a_Fledgling_War_Boar
end
end
