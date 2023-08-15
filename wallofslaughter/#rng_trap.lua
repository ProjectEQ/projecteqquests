function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 75, e.self:GetX() + 75, e.self:GetY() - 75, e.self:GetY() + 75);
end

function event_enter(e)
	if(e.other:Class() == "Ranger") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["ranger_epic"] == "6" and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(300069) and e.other:HasItem(62628)) then
			e.other:Message(MT.Yellow,"Your Heated Loadstone gets warm for a moment.");
			eq.spawn2(300069, 0, 0, 234,-1196,-8.3,380); -- #a_mangled_muramite_captain
			eq.spawn2(300070, 0, 0, 248,-1176,-8.3,380); -- #aged_ukun
			eq.spawn2(300070, 0, 0, 234,-1216,-8.3,380); -- #aged_ukun
			eq.depop_with_timer();
		end
	end
end
