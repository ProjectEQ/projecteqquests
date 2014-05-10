function event_spawn(e)
	--checking Caridwi spawn
	eq.set_timer("1",60000);
end

function event_say(e)
	local player_list = nil;
	local player_list_count = nil;
	local raid = e.other:GetRaid();
	local HasLockout = 0;
	if(e.message:findi("hail")) then
		e.other:Say("Beware traveler for behind me lies the way to an ancient temple long since forgotten about. It is within this temple that the trusik have begun a ritual similar to the one that brought the menacing beings known as Muramites. While it may appear to be nothing what you see behind me is a complex illusion placed here by those inside to trick travelers like you. But after losing my life and that of the one I loved to the invading army I am bound here to help those who wish to stop the trusik from damning us again. If you are truly a brave adventurer then just tell me you are [" .. eq.say_link("ready",false,"ready") .. "] and I will tell you how to get through the facade behind me.");
	elseif(e.message:findi("ready")) then
		if (raid.valid or e.other:Admin() > 80) then
			local instance_id = eq.get_instance_id("uqua",0);
			-- should never be nil, but just in case.
			if (instance_id == nil or instance_id == 0) then
				-- check for lockout qglobal on whole raid.
				player_list = raid;
				player_list_count = raid:RaidCount();
				if (player_list ~= nil) then
					-- cycle through raid and check lockouts
					for i = 0, player_list_count - 1, 1 do
						local client_v = player_list:GetMember(i):CastToClient();
						if (client_v.valid) then
							qglobals = eq.get_qglobals(client_v);
							if (e.other:Admin() <= 80 and qglobals["uqualockout"] ~= nil) then
								e.other:Message(13, client_v:GetCleanName().." has a lockout");
								HasLockout = HasLockout + 1;
							end
						end
					end
				end
				--Anyone in raid had a lockout
				if (HasLockout > 0) then
					e.other:Message(13, "There are "..HasLockout.." players in your raid with a lockout");
					return;
				end
				--No lockouts, create instance
				-- the instance is only good for 6 hours (21600 seconds).
				instance_id = eq.create_instance("uqua",0,21600);
				if (raid.valid) then
					eq.assign_raid_to_instance(instance_id);
				end
			else
				e.other:Message(13, "You are already in an instance.");
			end
			e.other:Message(13, "You are not in a raid.");
		end
	end
end

function event_timer(e)
	if(e.timer == "1") then
		--check if we need to spawn Caridwi
		if (zone_time["zone_hour"] < 4 or zone_time["zone_hour"] > 5) then
			eq.depopall(291119);
			if (zone_time["zone_hour"] == 3) then
				eq.set_timer("1",60000);
			else
				eq.set_timer("1",600000);
			end
		else
			if (zone_time["zone_hour"] == 4 or (zone_time["zone_hour"] == 5)
				if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(29119) == false) then
					eq.spawn2(291119,0,0,-2115,-240,-567,96);
					eq.set_timer("1",600000);
				end
			end
		end
	end
end