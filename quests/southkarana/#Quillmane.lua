--#Quillmane spawn
--#npc - #Quillmane
--#zone - SouthKarana
--#Angelox
--#Updated by Kilelen
--#Converted to Lua by robregen

function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);

	if(qglobals.quill == "3") then
		eq.set_global("quill","2",3,"F");
	end
end
