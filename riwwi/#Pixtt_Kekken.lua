local TM_minimum_players = 18; --changed to 6 much later (2017)


function event_say(e)
	if(e.message:findi("hail")) then
			e.self:Say("It's a good thing Taskmistress Krisz doesn't know what we're up to.  Wow, does she have a temper, and enough skill with a blade to back it up.  No one would [" .. eq.say_link("dare") .. "] cross her.");
	elseif(e.message:findi("dare")) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(282115) == true and eq.get_entity_list():IsMobSpawnedByNpcTypeID(282105) == false) then
			if (e.other:GetRaidMemberCountInZone() >= TM_minimum_players) then
			-- if TM trigger is up and TM is not currently spawned and 18 or more in raid, spawn TM
				e.self:Emote("laughs, 'Think you could teach that old goat a lesson!?");
				eq.unique_spawn(282105,21,0,-1117,-408,33,502); -- #Taskmistress_Krisz
			else
				e.self:Say("There's a reason no one stands up to her, " .. e.other:GetCleanName() .. ".");
				e.other:Message(15,"You must assemble at least three groups to attract the attention of Taskmistress Krisz.");
			end
		else
			e.self:Say("She hasn't been around much lately, but I'm sure she'll be back.");
		end
	end
end

--need to add random emotes
