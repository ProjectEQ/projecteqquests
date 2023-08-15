--[[


## Written by Drogerin ##

-1581.94,-575.48,-168.68,495.5

--]]

local min_hit = 717;
local max_hit = 2541;

local newmin_hit = 895;
local newmax_hit = 3175;

local add = 0;



function event_combat(e)
	if e.joined then
		eq.set_timer("aggro", 1000);
		eq.set_timer("check",2000);
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 343362 or npc:GetNPCTypeID() == 343363 or npc:GetNPCTypeID() == 343360 or npc:GetNPCTypeID() == 343361 or npc:GetNPCTypeID() == 343359)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end
			
	end			
end


function event_signal(e)
	if (e.signal == 1) then
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		add = add + 1;
		eq.debug("adds: " .. add);
	elseif (e.signal == 2) then
		e.self:ModifyNPCStat("mr", "1000");
		e.self:ModifyNPCStat("fr", "1000");
		e.self:ModifyNPCStat("cr", "1000");
		e.self:ModifyNPCStat("pr", "1000");
		e.self:ModifyNPCStat("dr", "1000");
		add = add + 1;
		eq.debug("adds: " .. add);
	elseif (e.signal == 3) then
		e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
		add = add + 1;
	elseif (e.signal == 4) then
		e.self:ModifyNPCStat("min_hit", tostring(newmin_hit));
		e.self:ModifyNPCStat("max_hit", tostring(newmax_hit));
		eq.debug("TShara new min hit is: " .. newmin_hit);
		eq.debug("Tshara new max hit is : " .. newmax_hit);
		add = add + 1;
	elseif (e.signal == 5) then
		e.self:ModifyNPCStat("AC", "650");
		add = add + 1;
	elseif (e.signal == 6) then
		eq.set_timer("magic", 150000);
		e.self:ModifyNPCStat("mr", "75");
		e.self:ModifyNPCStat("fr", "75");
		e.self:ModifyNPCStat("cr", "75");
		e.self:ModifyNPCStat("pr", "75");
		e.self:ModifyNPCStat("dr", "75");
		e.self:Emote(" reabsorbs her weakness to magic.");
		add = add - 1;
		eq.debug("adds: " .. add);
	elseif (e.signal == 7) then
		eq.set_timer("protection", 150000);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:Emote(" loses her divine barrier.");
		add = add - 1;
		eq.debug("adds: " .. add);
	elseif (e.signal == 8) then
		eq.set_timer("combat", 150000);
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
		e.self:Emote(" loses her grace in combat.");
		add = add - 1;
	elseif (e.signal == 9) then
		eq.set_timer("power", 150000);
		e.self:ModifyNPCStat("min_hit", tostring(min_hit));
		e.self:ModifyNPCStat("max_hit", tostring(max_hit));
		eq.debug("My new min hit is: " .. min_hit);
		eq.debug("My new max hit is : " .. max_hit);
		e.self:Emote(" loses the power of her fury.");
		add = add -1;
	elseif (e.signal == 10) then
		eq.set_timer("armor", 150000);
		e.self:ModifyNPCStat("AC", "550");
		e.self:Emote(" seems to look vulnerable.");
		add = add -1;	
	end
end
	

function event_timer(e)
	local el = eq.get_entity_list();
	if (e.timer == "magic") then
		eq.spawn2(343359,0,0,-1539.36,-368.39,-176.32,393.5); -- NPC: Aspect_of_Magic
		eq.signal(343359,2); -- NPC: Aspect_of_Magic
		eq.stop_timer("magic");
	elseif (e.timer == "protection") then
		eq.spawn2(343360,0,0,-1595.10,-497.14,-177.46,505.3); -- NPC: Aspect_of_Protection
		eq.signal(343360,2); -- NPC: Aspect_of_Protection
		eq.stop_timer("protection");
	elseif (e.timer == "combat") then
		eq.spawn2(343363,0,0,-1482.40,-670.43,-176.52,463.0); -- NPC: Aspect_of_Combat
		eq.signal(343363,2); -- NPC: Aspect_of_Combat
		eq.stop_timer("combat");
	elseif (e.timer == "power") then
		eq.spawn2(343362,0,0,-1694.66,-551.08,-178.08,57.0); -- NPC: Aspect_of_Power
		eq.signal(343362,2); -- NPC: Aspect_of_Power
		eq.stop_timer("power");
	elseif (e.timer == "armor") then
		eq.spawn2(343361,0,0,-1711.16,-421.83,-176.46,121.5); -- NPC: Aspect_of_Armor
		eq.signal(343361,2); -- NPC: Aspect_of_Armor
		eq.stop_timer("armor");
	elseif (e.timer == "check") and add == 0 then
		e.self:Emote(" focuses for a moment and imbues a new Aspect of Protection.");
		eq.spawn2(343360,0,0,-1595.10,-497.14,-177.46,505.3); -- NPC: Aspect_of_Protection
		eq.signal(343360,2); -- NPC: Aspect_of_Protection
		eq.stop_timer("protection");
	elseif (e.timer == "aggro") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 343362 or npc:GetNPCTypeID() == 343363 or npc:GetNPCTypeID() == 343360 or npc:GetNPCTypeID() == 343361 or npc:GetNPCTypeID() == 343359)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
		end
		end	
	end
end

function event_spawn(e)
	eq.depop(343362);
	eq.depop(343363);
	eq.depop(343360);
	eq.depop(343361);
	eq.depop(343359);
	add=0;
	eq.spawn2(343362,0,0,-1694.66,-551.08,-178.08,57.0); -- NPC: Aspect_of_Power
	eq.signal(343362,2); -- NPC: Aspect_of_Power
	eq.spawn2(343363,0,0,-1482.40,-670.43,-176.52,463.0); -- NPC: Aspect_of_Combat
	eq.signal(343363,2); -- NPC: Aspect_of_Combat
	eq.spawn2(343360,0,0,-1595.10,-497.14,-177.46,505.3); -- NPC: Aspect_of_Protection
	eq.signal(343360,2); -- NPC: Aspect_of_Protection
	eq.spawn2(343361,0,0,-1711.16,-421.83,-176.46,121.5); -- NPC: Aspect_of_Armor
	eq.signal(343361,2); -- NPC: Aspect_of_Armor
	eq.spawn2(343359,0,0,-1539.36,-368.39,-176.32,393.5); -- NPC: Aspect_of_Magic
	eq.signal(343359,2); -- NPC: Aspect_of_Magic
end

function event_death_complete(e)
	eq.signal(343362,1); -- NPC: Aspect_of_Power
	eq.signal(343361,1); -- NPC: Aspect_of_Armor
	eq.signal(343359,1); -- NPC: Aspect_of_Magic
	eq.signal(343363,1); -- NPC: Aspect_of_Combat
	eq.signal(343360,1); -- NPC: Aspect_of_Protection
end
