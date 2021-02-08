--343361 by ## Drogerin ##

local armor_min_hit = 250;
local armor_max_hit = 1200;

local tshara = false;

function event_spawn(e)
	eq.signal(343358,5); -- NPC: #T`Shara
	local armor_min_hit = 250;
	local armor_max_hit = 1200;
	e.self:ModifyNPCStat("min_hit", tostring(armor_min_hit));
	e.self:ModifyNPCStat("max_hit", tostring(armor_max_hit));
end


function event_timer(e)
	if (e.timer == "powerup") then
		armor_min_hit=math.ceil(armor_min_hit*1.1476);
		armor_max_hit=math.ceil(armor_max_hit*1.1476); 
		e.self:ModifyNPCStat("min_hit", tostring(armor_min_hit));
		e.self:ModifyNPCStat("max_hit", tostring(armor_max_hit));
		eq.debug("My new min hit is: " .. armor_min_hit);
		eq.debug("My new max hit is : " .. armor_max_hit);
		e.self:Emote(" is infused with energy from T`Shara.");
	end
end

function event_signal(e)
	if (e.signal == 1) then
		eq.stop_timer("powerup");
		tshara = false;
	elseif (e.signal == 2) then
		tshara = true;
	end
end


function event_combat(e)
	if (e.joined == false) then
		eq.stop_timer("powerup");
	elseif (e.joined == true) and tshara == true then
		eq.set_timer("powerup", 30000);
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 343363 or npc:GetNPCTypeID() == 343360 or npc:GetNPCTypeID() == 343358 or npc:GetNPCTypeID() == 343362 or npc:GetNPCTypeID() == 343359)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
	elseif (e.joined == true) and tshara == false then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 343363 or npc:GetNPCTypeID() == 343360 or npc:GetNPCTypeID() == 343358 or npc:GetNPCTypeID() == 343362 or npc:GetNPCTypeID() == 343359)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
	end
end

function event_death_complete(e)
	eq.signal(343358,10); -- NPC: #T`Shara
	eq.stop_timer("powerup");
end
