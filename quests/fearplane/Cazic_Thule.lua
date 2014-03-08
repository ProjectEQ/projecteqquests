-- Call All mobs to aid Cazic Thule if they're still alive

function event_spawn(e)
	eq.set_timer("Shout",60000);
	eq.spawn_condition("fearplane",0,1,0);
	eq.spawn_condition("fearplane",0,1,1);
end

function event_say(e)
	if(e.message:findi("gandan has failed in his task")) then
		e.self:Emote("'s thoughts begin to pervade your own, they creep into your mind with great force. You feel pressure as if your head will explode. You see his thoughts becoming your own. You see in these visions a tome bound in flesh dropped to the ground. You then open your eyes to see that same book, and take it knowing that it was meant for you.");
		e.other:SummonItem(18898);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 8226, item2 = 18898, item3 = 18899})) then
		e.self:Emote("seems pleased with the amount of pain that you have been able to inflict. Cazic Thule then grabs your hands and begins to infuse them with his power. Your hands burn like they were placed in lava for a moment, then feel cool as ice. You can feel the sheer power flowing through your new weapons of pain.");
		e.other:SummonItem(7836);
		e.other:AddEXP(100000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if (e.joined) then
		-- call all mobs to assist
		e.self:Shout("Denizens of Fear, your master commands you to come forth to his aid!!");
		call_zone_to_assist(e.other);
	else
		call_off_assist(e.other);
	end
end

function call_zone_to_assist(e)
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- call the zone to me.
	local exclude_npc_list = Set {72078,72074,72012}; 
	-- leave out broken golem, The Tempest Reaver, and Irak_Altil
	local npc_list = entity_list:GetNPCList();

	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			
			if (exclude_npc_list[npc:GetNPCTypeID()] == nil) then
				if (npc.valid) then
					eq.signal(npc:GetNPCTypeID(),2);
				end
			end
		end
	end
end

function call_off_assist(e)
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- call the zone to me.
	local exclude_npc_list = Set {72078,72074,72012}; 
	-- leave out broken golem, The Tempest Reaver, and Irak_Altil
	local npc_list = entity_list:GetNPCList();

	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			
			if (exclude_npc_list[npc:GetNPCTypeID()] == nil) then
				if (npc.valid) then
					eq.signal(npc:GetNPCTypeID(),3);
				end
			end
		end
	end
end

function event_timer(e)
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- call the zone to me.
	local exclude_npc_list = Set {72078,72074,72012}; 
	-- leave out broken golem, The Tempest Reaver, and Irak_Altil
	local npc_list = entity_list:GetNPCList();	
		
	if(e.timer == "Shout") then
		e.self:Shout("Beware all infidels who dare to taint my plane, for I shall rend your minds with fright, dread, and terror!");
		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if (exclude_npc_list[npc:GetNPCTypeID()] == nil) then
					if (npc.valid) then
						eq.signal(npc:GetNPCTypeID(),1);
					end
				end
			end
		end
	end
end

-- Set function example from Programming In Lua
-- http://www.lua.org/pil/11.5.html
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end
