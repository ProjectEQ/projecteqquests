function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 500, e.self:GetX() + 500, e.self:GetY() - 500, e.self:GetY() + 500);
end

function event_enter(e)
	if(e.other:Class() == "Magician") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["mage_epic"] == "10" and qglobals["mage_epic_dl"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(86174) == false ) then	
			if(e.self:GetY()==635) then					
				e.other:Message(15,"You see the burning manifestation of Chaos appear before you.");	
				eq.set_global("mage_epic_dl","1",3,"H2");
				eq.set_timer("mage_epic_depop",30*60*1000);
				eq.spawn2(86174, 0, 0, 8877,363.5,1158,0); -- NPC: #Chaos_Elemental
			else				
				e.other:Message(15,"The red gem on your staff glows.")
			end
		end
	end
end

function event_timer(e)
	if (e.timer=="mage_epic_depop") then
		eq.stop_timer("mage_epic_depop");
		eq.depop_all(86174); 
	end
end