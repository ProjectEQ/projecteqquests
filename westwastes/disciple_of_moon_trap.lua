function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 40, e.self:GetX() + 40, e.self:GetY() - 40, e.self:GetY() + 40);
end

--proximity_say is broken at time of writing, just spawn it 
function event_enter(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local el = eq.get_entity_list();
	if(qglobals["monk_epic"] == "5" and el:IsMobSpawnedByNpcTypeID(120138) == false) then
		eq.spawn2(120138,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),205); -- NPC: Disciple_of_Moon
		e_other:Message(4,"You hear a faint voice in your mind, 'The Moon guides us as we are in darkness. If the Sun is bright and bold, the Moon will be the reasoning. If you seek to [" .. eq.say_link("prove yourself") .. "] to the Order speak it now.'"); 
		eq.depop_with_timer();
	end		
end
