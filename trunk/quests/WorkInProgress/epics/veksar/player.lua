--veksar/player.lua  
--Warrior Epic 1.5 subquest. When a warrior on this part of the quest zones
--in, Decaying Lord Galuk Drek will spawn with a 1 hour lockout
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if(qglobals["warrior_epic_veksar"] == "1") then
		if(qglobals["warrior_epic_gulak"] == "1") then	
			e.self:Message(15,"You have less than one hour left before you will see the Decaying Lord Galuk Drek again.");
		else
			e.self:Message(15,"Decaying Lord Galuk Drek has sensed your presence. He's waiting for you... ");
			eq.set_global("warrior_epic_gulak","1",3,"H1");
			--eq.spawn2( ,0,0,-437,291,-22.9,178); --Decaying Lord Galuk Drek, not be in db yet
		end
	end
end