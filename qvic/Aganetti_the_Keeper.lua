-- Aganetti_the_Keeper (295065)
-- Request NPC for Inktu`Ta



---
-- @param NPC#event_say e
function event_say(e)
	local instance_requests = require("instance_requests");
	local inktuta_globals = {
				{ "Ink_Kelekdrix", "Kelekdrix, Herald of Trushar" },
				{ "Ink_Mites", "Stonemite Event" },
				{ "Ink_Golems", "Inktu`Ta Golems" },
				{ "Ink_Callers", "Cursecaller Event" },
				{ "Ink_Noqufiel", "Noqufiel Event" }
			}

	if(e.message:findi("hail")) then
		e.self:Emote("gestures to the end of the cavernous hallway.");
		e.self:Say("Beyond that corner lies the entrance to the forgotten chapel of Inktu`Ta. The force of the blast from the portal's implosion tore a hole in the mountain, revealing the way to this place. Some things should remain unknown. Inktu'ta should have stayed buried forever. Believe me " .. e.other:GetName() .. " only a fool would disturb the halls of this cursed chapel. Will you [heed my warning] or do you wish to [" .. eq.say_link("continue",false,"continue") .. "]?");
		e.self:Say("Or would you like to know your [" .. eq.say_link("Lockouts",false,"Lockouts") .. "]?");
	elseif(e.message:findi("lockouts")) then
		instance_requests.DisplayLockouts(e.other, e.other, inktuta_globals);
	elseif(e.message:findi("continue")) then
		--if Cynosure is up do not proceed
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(295140) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(295149) == false) then
			local request = instance_requests.ValidateRequest('raid', "inktuta", 0, 6, 54, 65, nil, e.other, inktuta_globals);
			if (request.valid) then
				local instance_id = eq.create_instance("inktuta", 0, 21600);
				eq.set_global(instance_id.."_inktuta_bit",tostring(request.flags),7,"H6");
				eq.assign_raid_to_instance(instance_id);
				e.self:Say("Very well! If you will not heed my warning, then you have chosen to suffer the consequences. I grant you entrance to Inktu`Ta.");
			end
		else
			--need live text for when cynosure is up
			e.other:Message(13, "The power of the Muramites is blocking the entrance to the temple.");
		end
	end
end