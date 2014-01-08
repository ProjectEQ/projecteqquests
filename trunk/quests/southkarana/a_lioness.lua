-- #Quillmane spawn
-- #npc - #a_lioness - randomly spawns 1 of 3 Quilmane locs around the zone)
-- #zone - SouthKarana
-- #Angelox
-- # Updated by Kilelen
-- # 2nd Updated and converted to Lua by robregen

function event_death_complete(e)
	local random_result = math.random(100);
	local quillmane = 14139;
	local qglobals = eq.get_qglobals(e.self);
	
	if(qglobals.quill == "2") then
		if(random_result < 4) then
			eq.spawn2(quillmane,101,0,3210,-6821.6,38.3,193.3);
			eq.set_global("quill","3",3,"F");
		elseif(random_result >= 4 and random_result < 8) then
			eq.spawn2(quillmane,102,0,-2761.8,-6076,0.7,4.0);
			eq.set_global("quill","3",3,"F");
		elseif(random_result >= 8 and random_result < 12) then
			eq.spawn2(quillmane,103,0,-2333.8,1296.5,38.7,247.3);
			eq.set_global("quill","3",3,"F");
		end
	end
end
