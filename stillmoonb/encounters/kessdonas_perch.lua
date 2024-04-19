-- Kessdona the Enlightened

local dz_task_id							= 0
local all_manashards_dead					= false;
local active_manashard_hp					= 100;
local number_of_correct_protector_kills		= 0;
local kess_hp_lock_percent					= 80;
local protector_order						= math.random(1,4);

local protector_table = {
	[1] = {339115,339111,339111,339111},
	[2] = {339111,339115,339111,339111},
	[3] = {339111,339111,339115,339111},
	[4] = {339111,339111,339111,339115}
};

local protector_locs = {
	[1] = {0,0,1287.83,6356.93,754.18,407.5},
	[2] = {0,0,1299.33,6423.52,755.13,433.3},
	[3] = {0,0,1202.17,6478.35,754.83,222.0},
	[4] = {0,0,1126.67,6409.48,753.60,189.5}
};

local box = require("aa_box")

local Kess = box();
Kess:add(1554.17, 6653.29);
Kess:add(1115.40, 6631.73);
Kess:add(1107.08, 6266.73);
Kess:add(1486.47, 6230.15);

function Kess_Combat(e) -- Set all variables back to default if party wipes and I am not in combat.
	if e.joined then -- Keep track of my location every 3 seconds. If I am not in my box, put me there.
		eq.stop_timer("fail");
		eq.stop_timer("respawn");
		eq.set_timer("oobcheck", 3 * 1000);
		eq.set_timer("charm", 90 * 1000);
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Kessdona the Enlightened says, 'You did not venture to this place for reflection and understanding, did you?'")
	else
		eq.set_timer("fail", 30 * 1000); -- set a 30s fail condition if I am not in combat.
		eq.set_timer("respawn", 40 * 1000);
	end
end

function Kess_Spawn(e)
	reset_event(e);
end

function reset_event(e)
	eq.spawn2(339109,0,0,1257.17,6330.92,747.16,462.3);	-- Spawn 1 active manashard guardian.
	eq.spawn2(339108,0,0,1158.62,6328.01,745.01,28.5);	-- NPC: inactive_manashard_guardian
	eq.spawn2(339118,0,0,1128.33,6414.53,744.35,129.5);	-- NPC: inactive_manashard_guardian
	eq.spawn2(339119,0,0,1156.67,6486.17,745.00,196.3);	-- NPC: inactive_manashard_guardian
	eq.spawn2(339120,0,0,1229.06,6507.49,754.67,235.3);	-- NPC: inactive_manashard_guardian
	eq.spawn2(339121,0,0,1305.75,6458.83,752.10,329.0);	-- NPC: inactive_manashard_guardian

	eq.set_next_hp_event(90); -- Set something to happen at 90%.


	-- New Variables

	all_manashards_dead					= false;
	active_manashard_hp					= 100;
	number_of_correct_protector_kills	= 0;
	kess_hp_lock_percent				= 80;
end

function spawn_protectors(e)
	protector_order = math.random(1,4);
	eq.spawn2(protector_table[protector_order][1],unpack(protector_locs[1]));
	eq.spawn2(protector_table[protector_order][2],unpack(protector_locs[2]));
	eq.spawn2(protector_table[protector_order][3],unpack(protector_locs[3]));
	eq.spawn2(protector_table[protector_order][4],unpack(protector_locs[4]));
	eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Kessdona the Enlightened draws on strength from her protectors and regenerates.  One of the four protectors must be the focus.  Perhaps someone attuned to nature could isolate which?")
end

function Kess_HP(e)
	if e.hp_event == 90 and not all_manashards_dead then	-- If I hit 90% and not all manashards are dead then process heal routine.
		e.self:SetHP(e.self:GetMaxHP() * 0.96);				-- Set HP to 96 % - This is what we saw on live
		e.self:SendBeginCast(6546,0);						-- Spell Cast Appearance (This will prevent cheesing the event similar to Fear Golems)
		active_manashard_hp = active_manashard_hp - 20;		-- Drop Active Manashard HP by 20%
		eq.signal(339109,1);								-- Signal to the active manashard that I have healed.
		eq.set_next_hp_event(90);							-- Set this to happen again at 90%.
	elseif e.hp_event == 80 and number_of_correct_protector_kills == 0 then					-- If my HP is 80% and I have not locked my HP yet.
		eq.set_timer("Lock",1000);							-- Lock my  HP at this value.
		spawn_protectors(e);
	elseif e.hp_event == 60 and number_of_correct_protector_kills == 1 then					-- If my HP is 60% and I have not locked my HP yet.
		eq.set_timer("Lock",1000);							-- Lock my HP here
		spawn_protectors(e);
	elseif e.hp_event == 40 and number_of_correct_protector_kills == 2 then -- If my HP is 40% and I have not locked my HP yet.
		eq.set_timer("Lock",1000); -- Lock my HP here
		spawn_protectors(e);
	elseif e.hp_event == 20 and number_of_correct_protector_kills == 3 then -- If my HP is 20% and I have not locked my HP yet.
		eq.set_timer("Lock",1000); -- Lock my HP here
		spawn_protectors(e);
	end
end

function Fake_Death(e)
	eq.signal(339110,2);	-- Let Kessdona know I was the incorrect one to be killed.
	eq.depop_all(339111);	-- Depop all of myself
	eq.depop_all(339115);	-- Depop the correct target.
end

function Correct_Death(e)				-- If I died.
	number_of_correct_protector_kills = number_of_correct_protector_kills + 1;
	if kess_hp_lock_percent >= 40 then
		kess_hp_lock_percent = kess_hp_lock_percent - 20;
	end
	eq.depop_all(339111);				-- Depop all incorrect targets
	eq.depop_all(339115);				-- Depop all of myself (Probably not needed, since only 1 of me)
	eq.signal(339110,3);				-- Let Kessdona know I was the correct one to be killed.
end

function Kess_Signal(e)
	if e.signal == 1 then -- Let Kessdona know that 6 depleted guardians have died, and to set the next HP event to 80%.
		eq.set_next_hp_event(80);


	elseif e.signal == 2 then -- Incorrect Protector Killed -- Reset Phase
		if number_of_correct_protector_kills == 0 then
			e.self:SetHP(e.self:GetMaxHP());
			eq.stop_timer('Lock');
			eq.set_next_hp_event(80);
		elseif number_of_correct_protector_kills == 1 then
			e.self:SetHP(e.self:GetMaxHP());
			eq.stop_timer('Lock');
			eq.set_next_hp_event(60);
		elseif number_of_correct_protector_kills == 2 then
			e.self:SetHP(e.self:GetMaxHP());
			eq.stop_timer('Lock');
			eq.set_next_hp_event(40);
		elseif number_of_correct_protector_kills == 3 then
			e.self:SetHP(e.self:GetMaxHP());
			eq.stop_timer('Lock');
			eq.set_next_hp_event(20);
		end
	elseif e.signal == 3 then -- Correct Protector Killed - Next Phase
		if number_of_correct_protector_kills == 1 then
			eq.stop_timer('Lock');
			eq.set_next_hp_event(60);
		elseif number_of_correct_protector_kills == 2 then
			eq.stop_timer('Lock');
			eq.set_next_hp_event(40);
		elseif number_of_correct_protector_kills == 3 then
			eq.stop_timer('Lock');
			eq.set_next_hp_event(20);
		elseif number_of_correct_protector_kills == 4 then
			eq.stop_timer('Lock');
			all_protectors_killed = true;
		end
	end
end


function Kess_Timer(e)
	if e.timer == "oobcheck" and not Kess:contains(e.self:GetX(), e.self:GetY()) then -- If I am not inside this box - respawn me back at spawn point.
		e.self:GotoBind();
		e.self:WipeHateList();
	elseif e.timer == "Lock" then -- HP Lock Routine
		if number_of_correct_protector_kills == 0 then
			e.self:SetHP(e.self:GetMaxHP() * 0.80); -- Lock my HP at 80%
		elseif number_of_correct_protector_kills >= 1 then
			if kess_hp_lock_percent >= 20 then
				e.self:SetHP(e.self:GetMaxHP() * (kess_hp_lock_percent / 100.0)); -- Lock at hp multiples based on correct protector kills
			end
		end
	elseif e.timer == "fail" then -- If I am not in combat after 30 seconds.
		eq.stop_timer('fail'); -- Stop the timer from repeating.
		eq.depop(339109);
		eq.depop(339108);
		eq.depop(339118);
		eq.depop(339119);
		eq.depop(339120);
		eq.depop(339121);
		eq.depop(339111);
		eq.depop(339115);
		eq.depop(339116);
	elseif e.timer == "respawn" then
		eq.depop(339110);
		eq.spawn2(339110,0,0,1227,6338.75,744.19,73.0); -- Respawn myself
		eq.stop_timer('respawn');
	elseif e.timer == "charm" then
		local cl = eq.get_entity_list():GetShuffledClientList();
		local count = 0;
		for client in cl.entries do
			if client.valid then
				e.self:CastedSpellFinished(6544, client);
				count = count + 1;
			end

			if count == 3 then
				break;
			end
		end
	end
end

function Active_Manashard_Signal(e)
	if e.signal == 1 then
		if active_manashard_hp == 0 then -- All healing phases completed
			e.self:SetHP(e.self:GetMaxHP() * (5 / 100.0)); -- Set my HP to 5% and activate all other golems
			make_attackable(e.self, true);
			eq.depop(339108);
			eq.depop(339118);
			eq.depop(339119);
			eq.depop(339120);
			eq.depop(339121);

			-- Spawn depleted manashard guardian with 5% HP
			eq.spawn2(339116,0,0,1257.17,6330.92,747.16,462.3):AddToHateList(eq.get_entity_list():GetRandomClient(),1);
			eq.spawn2(339116,0,0,1158.62,6328.01,745.01,28.5):AddToHateList(eq.get_entity_list():GetRandomClient(),1);
			eq.spawn2(339116,0,0,1128.33,6414.53,744.35,129.5):AddToHateList(eq.get_entity_list():GetRandomClient(),1);
			eq.spawn2(339116,0,0,1156.67,6486.17,745.00,196.3):AddToHateList(eq.get_entity_list():GetRandomClient(),1);
			eq.spawn2(339116,0,0,1229.06,6507.49,754.67,235.3):AddToHateList(eq.get_entity_list():GetRandomClient(),1);
		else
			e.self:SetHP(e.self:GetMaxHP() * (active_manashard_hp / 100.0)); -- Remove 20% of my HP
		end
	end
end
	
function Depleted_Manashard_Spawn(e)
	e.self:SetHP(e.self:GetMaxHP() * 0.05);
	eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "The animated guardian charges forth to attack, having depleted its mana reserves.")
end

function Depleted_Manashard_Death(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(339116) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(339109) then
		all_manashards_dead = true
		eq.signal(339110,1);	-- let Kessdona know so she can begin phase 2.
	end
end

function Kess_Death(e)
	eq.spawn2(339117,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawn a chest with loot at my location upon death.
	eq.update_task_activity(dz_task_id, 2, 1);
end

function Kess_BeginCast(e)
	if e.spell:ID() == 6543 then
		eq.zone_emote(MT.Yellow, "Kessdona rears back and fills her lungs, preparing to exhale a cone of disintegrating flame.");
	end
end

function make_attackable(mob, attackable)
	mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end

function event_encounter_load(e)
	dz_task_id = eq.get_dz_task_id();

	eq.register_npc_event(Event.spawn,			339110, Kess_Spawn);
	eq.register_npc_event(Event.cast_begin,		339110, Kess_BeginCast);
	eq.register_npc_event(Event.hp,				339110,	Kess_HP);
	eq.register_npc_event(Event.combat,			339110, Kess_Combat);
	eq.register_npc_event(Event.timer,			339110, Kess_Timer);
	eq.register_npc_event(Event.death_complete,	339110, Kess_Death);
	eq.register_npc_event(Event.signal,			339109, Active_Manashard_Signal);
	eq.register_npc_event(Event.spawn,			339116, Depleted_Manashard_Spawn);
	eq.register_npc_event(Event.death_complete,	339116, Depleted_Manashard_Death);
	eq.register_npc_event(Event.signal,			339110, Kess_Signal);
	eq.register_npc_event(Event.death_complete,	339111, Fake_Death);
	eq.register_npc_event(Event.death_complete,	339115, Correct_Death);
end
