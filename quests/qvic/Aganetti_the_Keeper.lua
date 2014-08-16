-- Aganetti_the_Keeper (295065)
-- Request NPC for Inktu`ta

function event_say(e)
	local player_list = nil;
	local player_list_count = nil;
	local raid = e.other:GetRaid();
	local HasLockout = 0;
	if(e.message:findi("hail")) then
		e.other:Emote("gestures to the end of the cavernous hallway.");
		e.other:Say("Beyond that corner lies the entrance to the forgotten chapel of Inktu'ta. The force of the blast from the portal's implosion tore a hole in the mountain, revealing the way to this place. Some things should remain unknown. Inktu'ta should have stayed buried forever. Believe me " .. e.other:GetName() .. " only a fool would disturb the halls of this cursed chapel. Will you [heed my warning] or do you wish to [" .. eq.say_link("continue",false,"continue") .. "]?");
	elseif(e.message:findi("continue")) then
		--if Cynosure is up do not proceed
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(295140) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(295149) == false) then
			if (raid.valid or e.other:Admin() > 80) then
				-- determine if the player is in an instance already
				local instance_id = eq.get_instance_id("inktuta",0);
				-- should never be nil, but just in case.
				if (instance_id == nil or instance_id == 0) then
					e.other:Say("Very well! If you will not heed my warning, then you have chosen to suffer the consequences. I grant you entrance to Inktu'ta.");
					-- check for lockout qglobal on whole raid.
					player_list = raid;
					player_list_count = raid:RaidCount();
					if (player_list ~= nil) then
						if(raid:RaidCount() <= 54) then
							-- cycle through raid and check lockouts
							for i = 0, player_list_count - 1, 1 do
								local client_v = player_list:GetMember(i):CastToClient();
								if (client_v.valid) then
									qglobals = eq.get_qglobals(client_v);
									if (e.other:Admin() <= 80 and qglobals["lockout_inktuta"] ~= nil) then
										e.other:Message(13, client_v:GetCleanName().." has a lockout");
										HasLockout = HasLockout + 1;
									end
								end
							end	
						else 
							e.other:Message(13, "You have "..player_list_count.." players in raid.  Only 54 allowed");
							return;
						end
					end
					--Anyone in raid had a lockout
					if (HasLockout > 0) then
						e.other:Message(13, "There are "..HasLockout.." players in your raid with a lockout");
						return;
					end
					--No lockouts, create instance
					-- the instance is only good for 6 hours (21600 seconds).
					instance_id = eq.create_instance("inktuta", 0, 21600);
					if (raid.valid) then
						eq.assign_raid_to_instance(instance_id);
					end
				else 
					e.other:Message(13, "You are already in an instance.");
				end
			else
				e.other:Message(13, "You are not in a raid.");
			end
		else
			--need live text for when cynosure is up
			e.other:Message(13, "The power of the Muramites is blocking the entrance to the temple.");
		end
	end
end
		