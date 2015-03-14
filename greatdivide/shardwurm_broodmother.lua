function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 30272})) then -- Harness of Control
		e.self:Emote("reels in pain as the harness snaps around its neck tightly. A strange gleam enters its eyes as it slowly begins to shamble towards the exit and the giants fortress.");
		e.other:Ding();
		e.other:AddEXP(20000);
		-- start gridid 57
		eq.start(57);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	-- waypoint number from gridid 57
	if(e.wp == 15) then
		-- set proximity to make sure the player is following close by.
		eq.set_proximity(e.self:GetX()-45,e.self:GetX()+45,e.self:GetY()-45,e.self:GetY()+45,e.self:GetZ()-25,e.self:GetZ()+25);
	elseif(e.wp == 19) then
		-- clear proximity and if the giants spawned then attack Gralk Dwarfkiller and send signal for Fergul Frostsky to run away.
		eq.clear_proximity();
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118208)) then
			eq.attack_npc_type(118208);
			eq.signal(118207,1);
		end
	end
end

-- if Player enter the proximity then spawns the 2 giants and clear proximity.
function event_enter(e)
	eq.spawn2(118207,0,0,-2397,-2615,294,0);
	eq.spawn2(118208,0,0,-2391,-2569,299,0);
	eq.clear_proximity();
end

function event_signal(e)
	-- signal to depop from Fergul Frostsky once he either reached the end of his path (waypoint 6) or on death
	if(e.signal == 1) then
		eq.depop_with_timer();
	end
end
