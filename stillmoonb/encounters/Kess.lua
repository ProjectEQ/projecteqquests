local kess_heal				= true;
local kess_hp				= 100;
local times_healed			= 0;
local eighty				= 80;
local sixty					= 60;
local forty					= 40;
local twenty				= 20;
local depleted				= 10;
local depleted_killed		= 0;
local depleted_spawn		= false;
local depleted_spawntwo		= false;
local depleted_spawnthree	= false;
local depleted_spawnfour	= false;
local depleted_spawnfive	= false;
local depleted_spawnsix		= false;
local kessphasetwo_hp		= 80;
local kessphasetwo_hptwo	= 60;
local kessphasetwo_hpthree	= 40;
local kessphasetwo_hpfour	= 20;
local unlockone				= false;
local unlocktwo				= false;
local unlockthree			= false;
local unlockfour			= false;
local correct_kills			= 0;

local protector_order = math.random(1,4);
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
		eq.set_timer("Kess", 3 * 1000);
		eq.set_timer("Charm", 90 * 1000);
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Kessdona the Enlightened says, 'You did not venture to this place for reflection and understanding, did you?'")
	else
		eq.set_timer("Fail",30 * 1000); -- set a 30s fail condition if I am not in combat.
		eq.set_timer("Respawn",40 * 1000);
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
	unlockone				= false;
	unlocktwo				= false;
	unlockthree				= false;
	unlockfour				= false;
	depleted_spawn			= false;
	depleted_spawntwo		= false;
	depleted_spawnthree		= false;
	depleted_spawnfour		= false;
	depleted_spawnfive		= false;
	depleted_spawnsix		= false;
	kess_heal				= true;
	times_healed			= 0;
	correct_kills			= 0;
	depleted_killed			= 0;
end

function spawn_protectors(e)
	eq.spawn2(protector_table[protector_order][1],unpack(protector_locs[1]));
	eq.spawn2(protector_table[protector_order][2],unpack(protector_locs[2]));
	eq.spawn2(protector_table[protector_order][2],unpack(protector_locs[3]));
	eq.spawn2(protector_table[protector_order][4],unpack(protector_locs[4]));
	eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Kessdona the Enlightened draws on strength from her protectors and regenerates.  One of the four protectors must be the focus.  Perhaps someone attuned to nature could isolate which?")
end

function Kess_HP(e)
	if e.hp_event == 90 and kess_heal and depleted_killed < 6 then				-- If my hp is 90, and I am allowed to heal, and my enemies have killed less than 6 depleted guardians
		e.self:ModifyNPCStat("max_hp", tostring(e.self:GetMaxHP() + 50000));	-- Add 50,000HP to my  max HP.
		e.self:SetHP(e.self:GetMaxHP() * (kess_hp / 100.0));					-- Set my HP to 100
		e.self:CastSpell(6546, e.self:GetID());									-- Cast <Recreation>
		times_healed = times_healed + 1;										-- Count how many times I healed.
		eq.signal(339109,1);													-- Signal to the active manashard that I have healed.
		eq.set_next_hp_event(90);												-- Set this to happen again at 90%.
	elseif e.hp_event == 80 and not unlockone then					-- If my HP is 80% and I have not locked my HP yet.
		eq.set_timer("Lock",3 * 1000);							-- Lock my  HP at this value.
		spawn_protectors(e);
	elseif e.hp_event == 60 and not unlocktwo then					-- If my HP is 60% and I have not locked my HP yet.
		eq.set_timer("Lock",3 * 1000);							-- Lock my HP here
		spawn_protectors(e);
	elseif e.hp_event == 40 and not unlockthree then -- If my HP is 40% and I have not locked my HP yet.
		eq.set_timer("Lock",3000); -- Lock my HP here
		spawn_protectors(e);
	elseif e.hp_event == 20 and not unlockfour then -- If my HP is 20% and I have not locked my HP yet.
		eq.set_timer("Lock",3000); -- Lock my HP here
		spawn_protectors(e);
	end
end

function Fake_Death(e)
	eq.signal(339110,2);	-- If I died - Signal Kessdona that I was the wrong one to kill.
	eq.depop_all(339111);	-- Depop all of myself
	eq.depop_all(339115);	-- Depop the correct target.
end

function Correct_Death(e)				-- If I died.
	correct_kills = correct_kills + 1;  -- Count how many times I've correctly died.
	eq.depop_all(339111);				-- Depop all incorrect targets
	eq.depop_all(339115);				-- Depop all of myself (Probably not needed, since only 1 of me)
	eq.signal(339110,3);				-- Let Kessdona know I was the correct one to be killed.
end

function Kess_Signal(e)
	if e.signal == 1 then -- Let Kessdona know that 6 depleted guardians have died, and to set the next HP event to 80%.
		eq.set_next_hp_event(80);
	elseif e.signal == 2 and correct_kills == 0 then -- If the incorrect guardian was killed and I have no correct kills on record.. Unlock my Hp, Heal to Full, and restart the event at 80%.
		e.self:SetHP(e.self:GetMaxHP() * (kess_hp / 100.0));
		eq.stop_timer('Lock');
		eq.set_next_hp_event(80);
	elseif e.signal == 2 and correct_kills == 1 then -- If the incorrect guardian was killed and I have one correct kill on record.. Unlock my Hp, Heal to Full, and restart the event at 60%.
		e.self:SetHP(e.self:GetMaxHP() * (kess_hp / 100.0));
		eq.stop_timer('Lock');
		eq.set_next_hp_event(60);
	elseif e.signal == 2 and correct_kills == 2 then -- If the incorrect guardian was killed and I have two correct kills on record.. Unlock my Hp, Heal to Full, and restart the event at 40%.
		e.self:SetHP(e.self:GetMaxHP() * (kess_hp / 100.0));
		eq.stop_timer('Lock');
		eq.set_next_hp_event(40);
	elseif e.signal == 2 and correct_kills == 3 then -- If the incorrect guardian was killed and I have two correct kills on record.. Unlock my Hp, Heal to Full, and restart the event at 20%.
		e.self:SetHP(e.self:GetMaxHP() * (kess_hp / 100.0));
		eq.stop_timer('Lock');
		eq.set_next_hp_event(20);
	elseif e.signal == 3 and correct_kills == 1 then -- If I have killed the correct guy and there is now 1 correct kill. Unlock my  HP, and advance to the next HP event of 60%.
		unlockone = true; -- Set this to true so we do not repeat any events we have passed if any fails happen.
		eq.stop_timer('Lock');
		eq.set_next_hp_event(60);
	elseif e.signal == 3 and correct_kills == 2 then -- If I have killed the correct guy and there is now 2 correct kills. Unlock my  HP, and advance to the next HP event of 40%.
		eq.stop_timer('Lock');
		unlocktwo = true; -- Set this to true so we do not repeat any events we have passed if any fails happen.
		eq.set_next_hp_event(40);
	elseif e.signal == 3 and correct_kills == 3 then -- If I have killed the correct guy and there is now 3 correct kills. Unlock my  HP, and advance to the next HP event of 20%.
		eq.stop_timer('Lock');
		unlockthree = true; -- Set this to true so we do not repeat any events we have passed if any fails happen.
		eq.set_next_hp_event(20);
	elseif e.signal == 3 and correct_kills == 4 then -- If I have killed the correct guy and there is now 2 correct kills. Unlock my  HP, and let the player kill me.
		eq.stop_timer('Lock');
		unlockfour = true; -- Set this to true so we do not repeat any events we have passed if any fails happen.
	end
end


function Kess_Timer(e)
	if e.timer == "kess" and not Kess:contains(e.self:GetX(), e.self:GetY()) then -- If I am not inside this box - respawn me back at spawn point.
		e.self:GotoBind();
		e.self:WipeHateList();
	end

	if e.timer == "Lock" and correct_kills == 0 then -- If my lock HP timer happens and I have 0 kills on record.
		e.self:SetHP(e.self:GetMaxHP() * (kessphasetwo_hp / 100.0)); -- Lock my HP at 80%
	elseif e.timer == "Lock" and correct_kills == 1 then -- If my lock HP timer happens and I have 1 kill on record.
		e.self:SetHP(e.self:GetMaxHP() * (kessphasetwo_hptwo / 100.0)); -- Lock my HP at 60%
	elseif e.timer == "Lock" and correct_kills == 2 then -- If my lock HP timer happens and I have 2 kills on record.
		e.self:SetHP(e.self:GetMaxHP() * (kessphasetwo_hpthree / 100.0)); -- Lock my  HP at 40%
	elseif e.timer == "Lock" and correct_kills == 3 then -- If my lock HP timer happens and I have 3 kills on record.
		e.self:SetHP(e.self:GetMaxHP() * (kessphasetwo_hpfour / 100.0)); -- Lock my HP at 20%
	elseif e.timer == "Fail" then -- If I am not in combat after 30 seconds.
		eq.stop_timer('Fail'); -- Stop the timer from repeating.
		eq.depop(339109);
		eq.depop(339108);
		eq.depop(339118); -- Depop any inactive manashard guardians, any Protector of Kessdona, any depleted manashard guardians, any active manashard guardians.
		eq.depop(339119);
		eq.depop(339120);
		eq.depop(339121);
		eq.depop(339111);
		eq.depop(339115);
		eq.depop(339116);
	elseif e.timer == "Respawn" then
		eq.depop(339110);
		eq.spawn2(339110,0,0,1227,6338.75,744.19,73.0); -- Respawn myself
		eq.stop_timer('Respawn');
	elseif (e.timer == "Charm") then
	local cl = eq.get_entity_list():GetShuffledClientList();
	local count = 0;
		for client in cl.entries do
			if client.valid then
				e.self:CastedSpellFinished(6544, client);
				count = count + 1;
			end

			if (count == 3) then -- or 6, w/e
				break;
			end
		end
	end
end

function Active_Signal(e)
	if e.signal == 1 and times_healed == 1 then -- If I am an active guardian and Ive been told something happened and Kessdona has healed one time. 
		e.self:SetHP(e.self:GetMaxHP() * (eighty / 100.0)); -- Remove 20% of my HP. I now have 80% HP.
	elseif e.signal == 1 and times_healed == 2 then -- If I am an active guardian and Ive been told something happened and Kessdona has healed two times. 
		e.self:SetHP(e.self:GetMaxHP() * (sixty / 100.0)); -- Remove 20% of my HP. I now have 60% HP.
	elseif e.signal == 1 and times_healed == 3 then  -- If I am an active guardian and Ive been told something happened and Kessdona has healed three times. 
		e.self:SetHP(e.self:GetMaxHP() * (forty / 100.0)); -- Remove 20% of my HP. I now have 40% HP.
	elseif e.signal == 1 and times_healed == 4 then -- If I am an active guardian and Ive been told something happened and Kessdona has healed four times. 
		e.self:SetHP(e.self:GetMaxHP() * (twenty / 100.0)); -- Remove 20% of my HP. I now have 20% HP.
	elseif e.signal == 1 and times_healed == 5 and depleted_killed == 0 and not depleted_spawn then -- If I'm signaled and Kess has healed five times, and no depleted is spawned.
		eq.depop(339109); -- depop current active manashard guardian.
		eq.depop(339108); -- depop inactive manashard guardian next in line.
		eq.spawn2(339116,0,0,1257.17,6330.92,747.16,462.3):AddToHateList(e.self:GetTarget(),1); -- Spawn depleted manashard guardian with 10% HP
		eq.spawn2(339109,0,0,1158.62,6328.01,745.01,28.5); -- spawn active manashard guardian in next location.
		times_healed = 0; -- tell Kessdona to reset her healing counter back to 0.
		depleted_spawn = true; -- Tell Kessdona that I've spawned and not to spawn me again!
	elseif e.signal == 1 and times_healed == 5 and depleted_killed == 1 and not depleted_spawntwo then -- If I'm signaled and Kess has healed five times, and no depleted is spawned.
		eq.depop(339109);  -- depop current active manashard guardian.
		eq.depop(339118);  -- depop inactive manashard guardian next in line.
		eq.spawn2(339116,0,0,1158.62,6328.01,745.01,28.5):AddToHateList(e.self:GetTarget(),1); -- Spawn depleted manashard guardian with 10% HP
		eq.spawn2(339109,0,0,1128.33,6414.53,744.35,129.5); -- spawn active manashard guardian in next location.
		times_healed = 0; -- tell Kessdona to reset her healing counter back to 0.
		depleted_spawntwo = true; -- Tell Kessdona that I've spawned and not to spawn me again!
	elseif e.signal == 1 and times_healed == 5 and depleted_killed == 2 and not depleted_spawnthree then -- If I'm signaled and Kess has healed five times, and no depleted is spawned.
		eq.depop(339109);  -- depop current active manashard guardian.
		eq.depop(339119);  -- depop inactive manashard guardian next in line.
		eq.spawn2(339116,0,0,1128.33,6414.53,744.35,129.5):AddToHateList(e.self:GetTarget(),1); -- Spawn depleted manashard guardian with 10% HP
		eq.spawn2(339109,0,0,1156.67,6486.17,745.00,196.3); -- spawn active manashard guardian in next location.
		times_healed = 0; -- tell Kessdona to reset her healing counter back to 0.
		depleted_spawnthree = true; -- Tell Kessdona that I've spawned and not to spawn me again!
	elseif e.signal == 1 and times_healed == 5 and depleted_killed == 3 and not depleted_spawnfour then -- If I'm signaled and Kess has healed five times, and no depleted is spawned.
		eq.depop(339109);  -- depop current active manashard guardian.
		eq.depop(339120);  -- depop inactive manashard guardian next in line.
		eq.spawn2(339116,0,0,1156.67,6486.17,745.00,196.3):AddToHateList(e.self:GetTarget(),1);  -- Spawn depleted manashard guardian with 10% HP
		eq.spawn2(339109,0,0,1229.06,6507.49,754.67,235.3); -- spawn active manashard guardian in next location.
		times_healed = 0; -- tell Kessdona to reset her healing counter back to 0.
		depleted_spawnfour = true; -- Tell Kessdona that I've spawned and not to spawn me again!
	elseif e.signal == 1 and times_healed == 5 and depleted_killed == 4 and not depleted_spawnfive then -- If I'm signaled and Kess has healed five times, and no depleted is spawned.
		eq.depop(339109); -- depop current active manashard guardian.
		eq.depop(339121); -- depop inactive manashard guardian next in line.
		eq.spawn2(339116,0,0,1229.06,6507.49,754.67,235.3):AddToHateList(e.self:GetTarget(),1); -- Spawn depleted manashard guardian with 10% HP
		eq.spawn2(339109,0,0,1305.75,6458.83,752.10,329.0); -- spawn active manashard guardian in next location.
		times_healed = 0; -- tell Kessdona to reset her healing counter back to 0.
		depleted_spawnfive = true; -- Tell Kessdona that I've spawned and not to spawn me again!
	elseif e.signal == 1 and times_healed == 5 and depleted_killed == 5 and not depleted_spawnsix then -- If I'm signaled and Kess has healed five times, and no depleted is spawned.
		eq.depop(339109); -- depop current active manashard guardian.
		eq.spawn2(339116,0,0,1305.75,6458.83,752.10,329.0); -- NPC: depleted_manashard_guardian
		times_healed = 0; -- tell Kessdona to reset her healing counter back to 0.
		depleted_spawnsix = true; -- Tell Kessdona that I've spawned and not to spawn me again!
	elseif e.signal == 1 and times_healed == 5 then
		times_healed = 0;
	end
end
	
function Depleted_Spawn(e)
	e.self:SetHP(e.self:GetMaxHP() * (depleted / 100.0)); -- If I spawn. Set my HP to 10%
	eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "The animated guardian charges forth to attack, having depleted its mana reserves.")
end

function Depleted_Death(e)
	depleted_killed = depleted_killed + 1;	-- Count how many times Ive died.

	if depleted_killed == 6 then	--  If 6 of me have died
		eq.signal(339110,1);		-- let Kessdona know so she can begin phase 2.
		times_healed	= 0;		-- tell Kessdona to set her healing stacks back to 0.
		kess_heal		= false;	-- tell Kessdona to stop healing.
	end
end

function Kess_Death(e)
	eq.spawn2(339117,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawn a chest with loot at my location upon death.

end

function Kess_BeginCast(e)
	if e.spell:ID() == 6543 then
		eq.zone_emote(MT.Yellow, "Kessdona rears back and fills her lungs, preparing to exhale a cone of disintegrating flame.");
	end
end

function event_encounter_load(e)
	eq.register_npc_event('Kess', Event.spawn,			339110, Kess_Spawn);
	eq.register_npc_event('Kess', Event.cast_begin,		339110, Kess_BeginCast);
	eq.register_npc_event('Kess', Event.hp,				339110,	Kess_HP);
	eq.register_npc_event('Kess', Event.combat,			339110, Kess_Combat);
	eq.register_npc_event('Kess', Event.timer,			339110, Kess_Timer);
	eq.register_npc_event('Kess', Event.death_complete,	339110, Kess_Death);
	eq.register_npc_event('Kess', Event.signal,			339109, Active_Signal);
	eq.register_npc_event('Kess', Event.spawn,			339116, Depleted_Spawn);
	eq.register_npc_event('Kess', Event.death_complete,	339116, Depleted_Death);
	eq.register_npc_event('Kess', Event.signal,			339110, Kess_Signal);
	eq.register_npc_event('Kess', Event.death_complete,	339111, Fake_Death);
	eq.register_npc_event('Kess', Event.death_complete,	339115, Correct_Death);
end
