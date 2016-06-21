--veksar/player.lua  
--Warrior Epic 1.5 subquest. When a warrior on this part of the quest zones
--in, Decaying Lord Galuk Drek will spawn with a 1 hour lockout
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();

	if(qglobals["warrior_epic_veksar"] == "1") then
		if(qglobals["warrior_epic_gulak"] == "1") then	
			e.self:Message(15,"You have less than one hour left before you will see the Decaying Lord Galuk Drek again.");
		else
			e.self:Message(15,"Decaying Lord Galuk Drek has sensed your presence. He's waiting for you... ");
			eq.set_global("warrior_epic_gulak","1",3,"H1");
			eq.spawn2(109906 ,0,0,-437,291,-22.9,178); --Decaying Lord Galuk Drek, not be in db yet
		end
	end
	
	if(qglobals["ranger_epic"] == "1" and qglobals["ranger_epic_veks"] == nil and el:IsMobSpawnedByNpcTypeID(109907) == false) then
		eq.unique_spawn(109907,0,0,-347.25,-549.5,-17.15,234); 	
		eq.set_global("ranger_epic_veks","1",2,"H2");		
	end
end