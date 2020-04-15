function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 100, e.self:GetX() + 100, e.self:GetY() - 100, e.self:GetY() + 100);
end

function event_enter(e)
	if(e.other:Class() == "Magician") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["mage_epic"] == "10" and qglobals["mage_epic_ferubi"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(284105) == false ) then	
			if(e.self:GetY()==-810) then					
				e.other:Message(15,"The ground shakes as the manifestation of Body appears before you.");	
				eq.set_global("mage_epic_ferubi","1",3,"H2");
				eq.set_timer("mage_epic_depop",30*60*1000);
				eq.spawn2(284105, 0, 0, 595.4,-810.5,1.2,0); -- NPC: #Body_Elemental
			else				
				e.other:Message(15,"The yellow gem on your staff glows.")
			end
		end
	end
end

function event_timer(e)
	if (e.timer=="mage_epic_depop") then
		eq.stop_timer("mage_epic_depop");
		eq.depop_all(284105); 
	end
end