-- Completes the sewer flags for GoD progression. Also will remove players from instance.
-- Scribe_Gurru NPCID:283052
function event_say(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.other,e.self);
	
	if(e.message:findi("hail")) then
		if (qglobals["temp_sewers"] ~= nil) then
			-- if the player is working on sewer instance, update appropriately.
			if (tonumber(qglobals["temp_sewers"]) == 1 and (qglobals["sewers"] == nil or tonumber(qglobals["sewers"]) < 2)) then
				e.self:Say("Nice work, speak to the High Priest to continue.");
				eq.set_global("sewers","2",5,"F");
				e.other:Message(4,"You receive a character flag!");
			elseif (tonumber(qglobals["temp_sewers"]) == 2 and tonumber(qglobals["sewers"]) == 2) then
				e.self:Say("Nice work, speak to the High Priest to continue.");
				eq.set_global("sewers","3",5,"F");
				e.other:Message(4,"You receive a character flag!");
			elseif (tonumber(qglobals["temp_sewers"]) == 3 and tonumber(qglobals["sewers"]) == 3) then
				e.self:Say("Nice work, speak to the High Priest to continue.");
				eq.set_global("sewers","4",5,"F");
				e.other:Message(4,"You receive a character flag!");
			elseif (tonumber(qglobals["temp_sewers"]) == 4 and (tonumber(qglobals["sewers"]) == 4 or tonumber(qglobals["sewers"]) == 5)) then
				e.self:Say("Nice work, the path to Vxed is open, speak with Apprentice Udranda.");
				eq.set_global("god_vxed_access","1",5,"F");
				e.other:Message(4,"You receive a character flag!");
			elseif (tonumber(qglobals["temp_sewers"]) == 3 and tonumber(qglobals["sewers"]) == 2) then
				e.self:Say("Thank you for assisting in the Lair, please visit the Crematory to advance.");
			elseif (tonumber(qglobals["temp_sewers"]) == 4) then
				e.self:Say("Thank you for assisting in the Pool, please visit the Plant to advance.");
			elseif (tonumber(qglobals["temp_sewers"]) == 4 and tonumber(qglobals["sewers"]) == 2) then
				e.self:Say("Thank you for assisting in the Pool, please visit the Crematory to advance.");
			elseif (tonumber(qglobals["temp_sewers"]) == 4 and tonumber(qglobals["sewers"]) == 3) then
				e.self:Say("Thank you for assisting in the Pool, please visit the Crematory to advance.");
			elseif (tonumber(qglobals["sewers"]) == 2) then
				e.self:Say("Thank you for assisting in the Crematory, please visit the Plant to advance.");
			elseif (tonumber(qglobals["sewers"]) == 3) then
				e.self:Say("Thank you for assisting in the Lair, please visit the Plant to advance.");
			end
		else
			e.self:Say("Please speak with the High Priest if you desire to assist");
		end
		-- this is a hack/work around until the expedition system is implemented.
		e.self:Say("Do you need to leave an [" .. eq.say_link("expedition",false,"expedition") .. "]?");
	elseif(e.message:findi("expedition")) then
		-- determine which instances the player is in already
		-- Lua table contains zone short name and instance version as the key/pair values initially
		local instance_id_list = {["snpool"] = 0, ["snlair"] = 0, ["snplant"] = 1, ["sncrematory"] = 0, ["vxed"] = 0, ["tipt"] = 0};
		-- go through the table and update the values to the instance ID returned
		for k,v in pairs(instance_id_list) do
			instance_id_list[k] = eq.get_instance_id(k,v);
		end
		-- go through the table create a message to ask the player which instances to leave
		local in_an_instance = false;
		for k,v in pairs(instance_id_list) do
			if (v > 0) then
				if (in_an_instance == false) then
					-- note that we are in at least one instance
					in_an_instance = true;
				end
				e.other:Message(0,"Click the link if you wish to leave: " .. eq.say_link("leave " .. v,false,k));
			end
		end
		if (in_an_instance == false) then
			e.self:Say("You are not a member of an expedition!");
		end
	elseif(e.message:findi("leave")) then
		for i in string.gmatch(e.message, "%S+") do
			if (tonumber(i)) then
				eq.remove_all_from_instance(tonumber(i));
			end
		end
	end
end
