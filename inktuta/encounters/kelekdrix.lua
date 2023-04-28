--[[
--	Kelekdrix raid event
--	NPCs involved:
--		#Kelekdrix,_Herald_of_Trushar (296024)
--		#Watcher_of_Kelekdrix (296025)
--		#Usher_of_Kelekdrix (296026)
--	http://everquest.allakhazam.com/db/quest.html?quest=4480 (Herald of Trushar section)
--]]

local kele			= nil
local kele_active	= true;
local event_started	= false;
local count			= 0;

local abilities_inactive	= "19,1^20,1^21,1^24,1^25,1^35,1^39,1";
local abilities_active		= "1,1^2,1^7,1^12,1^13,1^14,1^15,1^17,1^21,1^31,1^33,1,275";

local add_locs = {
	[1] = {280,-445,-1,0},
	[2] = {280,-545,-1,0},
	[3] = {355,-545,-1,0},
	[4] = {355,-445,-1,0}
}

function KeleSpawn(e)
	kele = e.self
	e.self:CastToNPC():MoveTo(510.0, -495.0, 6.0, -1.0, true)
end

function KeleCombat(e)
	if e.joined and not event_started then
		event_started = true;
		eq.signal(296024,1, 2 * 1000); -- Signal to start emote (First Adds)
	end
end

function KeleSignal(e)
	local mob_list = eq.get_entity_list();

	-- First Wave start
	if e.signal == 1 then
		eq.zone_emote(MT.Yellow, "Kelekdrix, Herald of Trushar laughs as her body is wrapped in a rocky protection, 'Bury them, my minions.  Offer a full demonstration of our geomantic magics.'")
		kele:ModifyNPCStat("special_abilities",abilities_inactive);
		kele:WipeHateList();
		eq.signal(296024,2,10 * 1000);
	elseif e.signal == 2 then -- Spawn 4 adds at once (First wave)
		eq.set_timer("adds", (90 + math.random(130)) * 1000); -- Observed 90s to 220s respawn timer
		count = 4;
		eq.spawn2(296025,0,0,280,-445,-1,0):AddToHateList(eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),500*500));
		eq.spawn2(296026,0,0,280,-545,-1,0):AddToHateList(eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),500*500));
		eq.spawn2(296084,0,0,355,-545,-1,0):AddToHateList(eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),500*500));
		eq.spawn2(296083,0,0,355,-445,-1,0):AddToHateList(eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),500*500));

	elseif e.signal == 111 then
			eq.spawn2(eq.ChooseRandom(296025,296026,296084,296083),0,0,unpack(add_locs[math.random(1,4)])):AddToHateList(eq.get_entity_list():GetRandomClient(kele:GetX(),kele:GetY(),kele:GetZ(),500*500));
			count = count + 1;

	-- Banish Signal (Make sure running timer as Kele)
	elseif e.signal == 200 then
		eq.set_timer("banish", 30 * 1000)
	elseif e.signal == 201 then
		eq.stop_timer("banish")
	end
end

function add_death(e)
	if count <= 0 then
		count = 0; -- cant go neg
	else
		count = count - 1;
	end
	check_active(e);
end

function check_active(e)
	local mob_list = eq.get_entity_list();

	if not mob_list:IsMobSpawnedByNpcTypeID(296025) and not mob_list:IsMobSpawnedByNpcTypeID(296026) and not mob_list:IsMobSpawnedByNpcTypeID(296084) and not mob_list:IsMobSpawnedByNpcTypeID(296083) then -- Activate Keld
		kele:ModifyNPCStat("special_abilities",abilities_active);
		eq.signal(296024,200);
	end
end

function KeleTimer(e)
	if e.timer == "banish" then
		local random_hate = kele:GetHateTop();
		if random_hate.valid and random_hate:IsClient() then
			local random_client = random_hate:CastToClient();
			if random_client.valid then
				kele:Say("I tire of these games. We shall see you in the afterlife.");
				eq.get_entity_list():RemoveFromHateLists(random_hate);
				random_client:MovePCInstance(296, eq.get_zone_instance_id(), 210, -500, -26, 490);
			end
		end
	elseif e.timer == "adds" then
		eq.stop_timer(e.timer);
		if count < 4 then
			eq.zone_emote(MT.Yellow, "Kelekdrix, Herald of Trushar laughs as her body is wrapped in a rocky protection, 'Bury them, my minions.  Offer a full demonstration of our geomantic magics.'")
			kele:ModifyNPCStat("special_abilities",abilities_inactive);
			kele:WipeHateList();
			eq.signal(296024,201);
			eq.signal(296024,111,10 * 1000);
		end
		eq.set_timer("adds", (90 + math.random(130)) * 1000); -- Observed 90s to 220s respawn timer
	end
end

function KeleDeath(e)
	eq.zone_emote(MT.Yellow, "Kelekdrix, Herald of Trushar's corpse cries out, her booming alto echoing with contempt, 'Your victory here is hollow. With my death, the way to the lower reaches is unsealed. The denizens below destroy everything they touch. You will suffer their wrath!'")
	eq.get_entity_list():FindDoor(41):SetLockPick(0);	-- unlock door
	eq.spawn2(296027, 0, 0, 90, -515, -27, 128);		-- NPC: #Mimezpo_the_Oracle
	eq.spawn2(296077, 0, 0, 526, -495, 7, 386);			-- NPC: #a_pile_of_bones__
	eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "2",tostring(eq.seconds("6h")));
	eq.depop_all(296025);
	eq.depop_all(296026);
	eq.depop_all(296084);
	eq.depop_all(296083);
	eq.signal(296070, 296024);	-- setting lockout
    eq.stop_all_timers();
end

function event_encounter_load(e)
	-- register our NPC event hooks
	eq.register_npc_event("kelekdrix", Event.timer, 296024, KeleTimer)
	eq.register_npc_event("kelekdrix", Event.combat, 296024, KeleCombat)
	eq.register_npc_event("kelekdrix", Event.spawn, 296024, KeleSpawn)
	eq.register_npc_event("kelekdrix", Event.death_complete, 296024, KeleDeath)
	eq.register_npc_event('kelekdrix', Event.signal, 296024, KeleSignal);

	-- Adds
	eq.register_npc_event("kelekdrix", Event.death_complete, 296025, add_death)
	eq.register_npc_event("kelekdrix", Event.death_complete, 296026, add_death)
	eq.register_npc_event("kelekdrix", Event.death_complete, 296084, add_death)
	eq.register_npc_event("kelekdrix", Event.death_complete, 296083, add_death)
	eq.register_npc_event("kelekdrix", Event.timer, 296025, KeleTimer)
	eq.register_npc_event("kelekdrix", Event.timer, 296026, KeleTimer)
	eq.register_npc_event("kelekdrix", Event.timer, 296084, KeleTimer)
	eq.register_npc_event("kelekdrix", Event.timer, 296083, KeleTimer)
end
