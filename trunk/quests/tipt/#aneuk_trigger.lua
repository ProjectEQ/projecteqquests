-- NPCID: 289047 #aneuk_trigger
function event_signal(e)
	-- this signal comes from the an_aneuk_ebonspirit (289002) when killed
	if (e.signal == 1) then
		-- grab the entity list so we make sure the aneuk's are all dead
		local entity_list = eq.get_entity_list();
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and npc:GetNPCTypeID() == 289002) then
				return;
			end
		end
		-- we only get here if there were no NPC's found, spawn the an_aneuk_fleshweaver
		eq.spawn2(289038,0,0,-804,1583,538,121); -- an_aneuk_fleshweaver
		-- get the zone instance id
		local instance_id = eq.get_zone_instance_id();
		-- set the global that the an_aneuk_fleshweaver should be spawned
		eq.set_global(instance_id.."_tipt_status","7",7,"H6");
		eq.depop();
	end
end
