function event_combat(e)
	if(e.joined) then
		call_zone_to_assist(e.self,e.other);
		eq.set_timer("come",300000);
	else
		eq.stop_timer("come");
	end
end

function event_timer(e)
	if(e.timer == "come") then
		e.self:Shout("Sylvan protectors, the glades call for your aid!");
		call_zone_to_assist(e.self,e.other);
	end
end

function call_zone_to_assist(e_self,e_other)
	-- set to true to enable debug messages
	local show_debug = false;
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- move the mobs to the location that is calling to.
	local include_npc_list = Set {127053,127061,127056,127055,127054}; -- a sylvan protector
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (include_npc_list[npc:GetNPCTypeID()] ~= nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():MoveTo(e_self:GetX(),e_self:GetY(),e_self:GetZ(),0,false);
					if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is valid, adding hate on " .. npc:GetName() .. "."); end
				else
					if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is invalid, unable to add hate on " .. npc:GetName() .. "."); end
				end
			else
				if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is excluded, not adding hate on " .. npc:GetName() .. "."); end
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

function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(127098);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
	elseif(e.signal == 2) then
		eq.stop_follow();
	end
end
