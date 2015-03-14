-- a_lioness NPCID: 14003, 14039, 14045
-- #an_elephant_calf or #a_lioness or an_elephant_calf or a_lioness can potentially spawn Quillmane
function event_death_complete(e)
	--#Quillmane (14139)
	local quillmane = 14139;
	-- Do nothing unless Quillmane is not spawned
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(quillmane) == false) then
		-- percentile roll to determine if Quillmane will be spawned
		local random_result = math.random(100);
		-- He can spawn in 1 of 3 places.
		if(random_result < 4) then
			eq.spawn2(quillmane,101,0,3210,-6821.6,38.3,193.3);
		elseif(random_result >= 4 and random_result < 8) then
			eq.spawn2(quillmane,102,0,-2761.8,-6076,0.7,4.0);
		elseif(random_result >= 8 and random_result < 12) then
			eq.spawn2(quillmane,103,0,-2333.8,1296.5,38.7,247.3);
		end
	end
end
