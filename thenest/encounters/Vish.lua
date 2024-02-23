--[[

##Written by Drogerin##

--]]

local corrupted_spawn=true;
local corrupted_spawnone=true;
local corrupted_spawntwo=true;
local corrupted_spawnthree=true;
local which=0;
local incorporeal_count=0;
local lifedrain_min_hit=600; -- the starting db min_hit of lifedrain shadows
local lifedrain_max_hit=1950; -- the starting db max_hit of lifedrain shadows
local mourning_count=25;
local hp_lock=25;





function Vish_Spawn(e)
	eq.spawn2(343093,0,0,-4251.54,394.38,130.65,497.8); -- NPC: corrupted_drake
	eq.spawn2(343165,0,0,-4264.01,538.71,134.53,322.5); -- Control spawns of corrupted drakes upon my spawn.
	eq.spawn2(343166,0,0,-4320.05,564.41,130.61,335.0); -- NPC: corrupted_drake
	eq.spawn2(343167,0,0,-4337.70,225.69,130.82,506.3); -- NPC: corrupted_drake
	--eq.zone_emote(MT.Yellow,"Ive spawned!");	 -- Let the zone know something happened.
end


function Corrupted_Signal(e)
	if (e.signal == 1) then  --if vish signals me
		e.self:SetAppearance(0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); -- Set variables off immune agro, agro on, no harm, immune magic.
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Corrupted_OneSignal(e)
	if (e.signal == 1) then
		e.self:SetAppearance(0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); -- Set variables off immune agro, agro on, no harm, immune magic.
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Corrupted_TwoSignal(e)
	if (e.signal == 1) then
		e.self:SetAppearance(0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); -- Set variables off immune agro, agro on, no harm, immune magic.
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Corrupted_ThreeSignal(e)
	if (e.signal == 1) then
		e.self:SetAppearance(0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); -- Set variables  off immune agro, agro on, no harm, immune magic.
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	end
end


	
function Vish_Combat(e)
	if e.joined then
	eq.set_next_hp_event(98); -- Start event at 98.
	else
	eq.set_timer("Respawn", 20000); -- despawn stuff at 20 seconds.
	eq.set_timer("Pop",30000); -- respawn event at 30 seconds.
	end
end

function Incorporeal_Spawn(e)
	incorporeal_count=incorporeal_count+1; -- If I spawn, add one to my count.
	eq.debug("Incorporeal Mobs Alive: " .. incorporeal_count);
	if incorporeal_count == 4 then -- If im at 4 stop spawning myself.
	eq.stop_timer('Incorporeal');
	end
end

function Incorporeal_Death(e)
	incorporeal_count=incorporeal_count-1; -- If I die, lower one from my count.
	lifedrain_min_hit=lifedrain_min_hit+50; -- add 50 to min hit of lifedrain shadow
	lifedrain_max_hit=lifedrain_max_hit+50; -- add 50 to max hit of lifedrain shadow  (( This needs confirmed)) starting with these values first.
	eq.debug("Incorporeal Mobs Alive: " .. incorporeal_count);
	eq.spawn2(343160,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawn a lifedrain shadow.
	if incorporeal_count < 4 then
	eq.set_timer("Incorporeal",60000);  -- If less than 4 of me are spawned, set my timer to start spawning me.
	end
end

function Vish_Slay(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- If I kill anything. spawn a spirit wraith ( Does this check for pets?)
end

function Corrupted_Slay(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- If I kill anything. spawn a spirit wraith ( Does this check for pets?)
end

function Drakeling_Slay(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- If I kill anything. spawn a spirit wraith ( Does this check for pets?)
end

function Lifedrain_Slay(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- If I kill anything. spawn a spirit wraith ( Does this check for pets?)
end

function Lifedrain_Spawn(e)
	e.self:ModifyNPCStat("min_hit", tostring(lifedrain_min_hit)); -- Set my min_hit.
	e.self:ModifyNPCStat("max_hit", tostring(lifedrain_max_hit)); -- Set my max hit.
end


function Spirit_Wraith_Slay(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- If I kill anything. spawn a spirit wraith ( Does this check for pets?)
end

function Incorporeal_Slay(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- If I kill anything. spawn a spirit wraith ( Does this check for pets?)
end

function Cloud_Death(e)
	 e.self:CastSpell(6495, e.other:GetID()); -- Cast Spiritual Wake
end
	
function Vish_Hp(e)
	if (e.hp_event == 98) then 
		eq.set_timer("Eggs", 180000); -- 180000 3 minute timer original timer.
		eq.set_next_hp_event(75);
	elseif (e.hp_event == 75) then
		eq.spawn2(343162,66,0,-4573.35,137.25,132.04,36.3); -- add grids -- Spawn Cloud of Concentrated Chaos
		eq.spawn2(343159,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawn an incorpreal shadow at 75%.
		eq.set_timer("Incorporeal",60000); -- Start the shadows timers.
		eq.set_next_hp_event(50); -- Set something to start at 50.
	elseif (e.hp_event == 50) then
		eq.spawn2(343162,66,0,-4573.35,137.25,132.04,36.3);  -- add grids -- Spawn Cloud of Concentrated Chaos
		eq.signal(343093,1); -- NPC: corrupted_drake
		eq.signal(343165,1); -- Signal all 4 drakes to agro.
		eq.signal(343166,1); -- NPC: corrupted_drake
		eq.signal(343167,1); -- NPC: corrupted_drake
		eq.set_next_hp_event(25); -- Set something to happen at 25%
	elseif (e.hp_event == 25) then
		local cl = eq.get_entity_list():GetShuffledClientList(); -- Shuffle the client list and choose 4 targets.
		local count = 0;
			for client in cl.entries do
				if client.valid then -- If valid
				e.self:CastedSpellFinished(6646, client); -- Cast this.( Creeping Doom )
				count = count + 1; -- Add per client.
				end
				if (count == 4) then -- If 4.
				break -- Stop.
				end
			end
		eq.set_timer("AoE",40000); -- Creeping doom aoe timer
		eq.spawn2(343162,66,0,-4573.35,137.25,132.04,36.3);  -- Spawn Cloud of Concentrated Chaos
		eq.spawn2(343163,67,0,-4588.09,799.42,133.03,245.0); -- Spawn Mournful Spirits
		eq.spawn2(343163,68,0,-4446.01,720.14,133.24,236.0); -- NPC: #mournful_spirit
		eq.spawn2(343163,69,0,-4578.29,161.82,133.23,35.3); -- NPC: #mournful_spirit
		eq.spawn2(343163,70,0,-4457.00,139.62,133.22,461.8); -- NPC: #mournful_spirit
		eq.set_timer("Mourning_Respawn",30000); -- Respawn spirits in 30 seconds.
		eq.set_timer("Lock",1000); -- Lock my HP.
	elseif (e.hp_event == mourning_count) then
        hp_lock = mourning_count; -- Set mourning count to Hp lock to control my  HP value.
        eq.set_timer("Lock",1000); -- Lock my HP
	end
end

function Mourning_Say(e)
	if(e.message:findi("shoulder my burden")) then
		local cl = eq.get_entity_list():GetClientList();
		for client in cl.entries do
			if (client.valid and client:FindBuff(6646)) then
				e.other:BuffFadeBySpellID(6646); -- Remove creeping doom from player.
				e.other:Message(MT.Yellow,"The mournful spirit draws corruption from your body and absorbs it, destroying itself in the process."); -- Let them know I sacrificed myself.
				eq.depop(); -- Depop myself
				mourning_count=mourning_count-1; -- Let vish know my count went down.
				eq.debug("Shoulder my Burdens left to complete: " .. mourning_count);
				eq.signal(343094,5); -- Signal to him that I died so he can unlock his HP.
				eq.set_next_hp_event(mourning_count); -- set next event to mourning_count value now.
			end
		end
	end
end

function Vish_Signal(e)
	if (e.signal == 1) then
	eq.set_timer("Drakes",150000); -- Respawn Drakes
	elseif (e.signal == 2) then
	eq.set_timer("DrakesOne",150000);
	elseif (e.signal == 3) then
	eq.set_timer("DrakesTwo",150000);
	elseif (e.signal == 4) then
	eq.set_timer("DrakesThree",150000);
	elseif (e.signal == 5) then
	eq.stop_timer("Lock");
	eq.set_next_hp_event(mourning_count);
	elseif (e.signal == 6) then
	eq.stop_timer("Hatch"); -- If egg died - signal me to stop timer.
	end
end

function Vish_Timer(e)
	if (e.timer == "Lock") then
	e.self:SetHP(e.self:GetMaxHP() * (hp_lock / 100.0));
	elseif (e.timer == "Eggs") then
		eq.stop_timer("Eggs");
		--eq.zone_emote(MT.Yellow,"Eggs will spawn in 105s");
		eq.set_timer("Eggs_Spawn",105000); --105000
	elseif (e.timer == "Drakes") then		
			eq.spawn2(343093,0,0,-4300.29,453.26,130.87,386.0); -- If drakes timer is up - spawn them, and make them agro.
			eq.signal(343093,1); -- NPC: corrupted_drake
			eq.stop_timer("Drakes");
	elseif (e.timer == "DrakesOne") then		
			eq.spawn2(343165,0,0,-4264.01,538.71,134.53,322.5); -- NPC: corrupted_drake
			eq.signal(343165,1); -- NPC: corrupted_drake
			eq.stop_timer("DrakesOne");
	elseif (e.timer == "DrakesTwo") then		
			eq.spawn2(343166,0,0,-4320.05,564.41,130.61,335.0); -- NPC: corrupted_drake
			eq.signal(343166,1); -- NPC: corrupted_drake
			eq.stop_timer("DrakesTwo");
	elseif (e.timer == "DrakesThree") then		
			eq.spawn2(343167,0,0,-4337.70,225.69,130.82,506.3); -- NPC: corrupted_drake
			eq.signal(343167,1); -- NPC: corrupted_drake
			eq.stop_timer("DrakesThree");						
	elseif (e.timer == "AoE") then
		local cl = eq.get_entity_list():GetClientList(); -- Creeping doom timer after initial 25% one.
		local count = 0;
			for client in cl.entries do
				if client.valid then
				e.self:CastedSpellFinished(6646, client);
				count = count + 1;
				end
				if (count == 4) then
				break
				end
			end
	elseif (e.timer == "Mourning_Respawn") then
		eq.depop_all(343163); -- Despawn all current Mournful
		eq.spawn2(343163,67,0,-4588.09,799.42,133.03,245.0); -- Respawn them on grids.
		eq.spawn2(343163,68,0,-4446.01,720.14,133.24,236.0); -- NPC: #mournful_spirit
		eq.spawn2(343163,69,0,-4578.29,161.82,133.23,35.3); -- NPC: #mournful_spirit
		eq.spawn2(343163,70,0,-4457.00,139.62,133.22,461.8); -- NPC: #mournful_spirit
	elseif (e.timer == "Respawn") then -- respawn event.
		eq.depop_all(343163); -- mournful spirits
		eq.depop_all(343095); -- eggs
		eq.depop_all(343161); -- corrupted drakelings
		eq.depop(343093);
		eq.depop(343165);
		eq.depop(343166); -- corrupted drakes
		eq.depop(343167);
		eq.depop_all(343096); --spirit wraith
		eq.depop_all(343159); --incorporeal
		eq.depop_all(343162); -- cloud
		eq.depop_all(343160); -- lifedrain shadows
		corrupted_spawn=true;
		corrupted_spawnone=true; -- reset the drake variables so they set their abilities.
		corrupted_spawntwo=true;
		corrupted_spawnthree=true;
		which=0;
		mourning_count=25;
		incorporeal_count=0;
		lifedrain_min_hit=600; -- reset the min/max of the lifedrains
		lifedrain_max_hit=1950;
		hp_lock=25;
		eq.stop_timer("Respawn");
	elseif (e.timer == "Pop" ) then
		eq.depop(343094); --vish
		eq.spawn2(343094,65,0,-4550.12,583.67,129.61,244.00); -- NPC: Vishimtar_the_Fallen
		eq.stop_all_timers();
	elseif (e.timer == "Incorporeal") and incorporeal_count <  4 then -- if less than 4, keep spawning.
		eq.spawn2(343159,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #incorporeal_shadow
	elseif (e.timer == "Eggs_Spawn") then
		eq.zone_emote(MT.Yellow,"Vishimtar shouts, Your presence has caused the children to awaken. They will be . . . hungry."); -- let the player know something happened.
		eq.stop_timer("Eggs_Spawn");
		eq.set_timer("Hatch",60000);
		which = math.random(3);
		if  (which == 1) then
		eq.spawn2(343095,0,0,-4461.28,617.90,131.07,423.0); -- North Egg
		elseif (which == 2) then
		eq.spawn2(343095,0,0,-4513.24,275.87,123.27,467.3); -- South Egg
		elseif (which == 3) then
		eq.spawn2(343095,0,0,-4510.45,554.25,132.81,320.8); -- Middle Egg
		end
	elseif (e.timer == "Hatch") then
		eq.stop_timer("Hatch");
		eq.set_timer("Eggs",180000); -- reset timer.
		eq.depop_all(343095);
		if (which == 1) then
		eq.spawn2(343161,0,0,-4461.28,617.90,131.07,423.0):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4461.28,617.90,131.07,423.0):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4461.28,617.90,131.07,423.0):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4461.28,617.90,131.07,423.0):AddToHateList(e.self:GetTarget(),1); -- if failed summon drakelings/agro player.
		eq.spawn2(343161,0,0,-4461.28,617.90,131.07,423.0):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4461.28,617.90,131.07,423.0):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		elseif (which == 2) then
		eq.spawn2(343161,0,0,-4513.24,275.87,123.27,467.3):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4513.24,275.87,123.27,467.3):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4513.24,275.87,123.27,467.3):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4513.24,275.87,123.27,467.3):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4513.24,275.87,123.27,467.3):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4513.24,275.87,123.27,467.3):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		elseif (which == 3) then
		eq.spawn2(343161,0,0,-4510.45,554.25,132.81,320.8):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4510.45,554.25,132.81,320.8):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4510.45,554.25,132.81,320.8):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4510.45,554.25,132.81,320.8):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4510.45,554.25,132.81,320.8):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		eq.spawn2(343161,0,0,-4510.45,554.25,132.81,320.8):AddToHateList(e.self:GetTarget(),1); -- NPC: #a_corrupted_drakeling
		end
	end

end

function Egg_Death(e)
	eq.signal(343094,6); -- Signal vish that I died.
end

function Corrupted_Spawn(e)
	if corrupted_spawn then
	eq.set_timer("Abilities",1000); -- set my variables.
	corrupted_spawn=false; -- make sure this doesnt happen when I respawn during event.
	else
	e.self:SetAppearance(0);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); -- Set variables immune agro, agro on, no harm, immune magic.
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
	e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Corrupted_SpawnOne(e)
	if corrupted_spawnone then
	eq.set_timer("AbilitiesOne",1000);
	corrupted_spawnone=false;
	else
	e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Corrupted_SpawnTwo(e)
	if corrupted_spawntwo then
	eq.set_timer("AbilitiesTwo",1000);
	corrupted_spawntwo=false;
	else
	e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Corrupted_SpawnThree(e)
	if corrupted_spawnthree then
	eq.set_timer("AbilitiesThree",1000);
	corrupted_spawnthree=false;
	else
	e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Corrupted_Timer(e)
	if (e.timer == "Abilities") then -- If timer is up
	eq.stop_timer("Abilities");
	e.self:SetAppearance(3); -- Set FD
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1); -- Set variables immune agro, agro on, no harm, immune magic.
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
	end
end

function Corrupted_TimerOne(e)
	if (e.timer == "AbilitiesOne") then
	eq.stop_timer("AbilitiesOne");
	e.self:SetAppearance(3);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1); -- Set variables immune agro, agro on, no harm, immune magic.
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
	end
end

function Corrupted_TimerTwo(e)
	if (e.timer == "AbilitiesTwo") then
	eq.stop_timer("AbilitiesTwo");
	e.self:SetAppearance(3);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1); -- Set variables immune agro, agro on, no harm, immune magic.
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
	end
end

function Corrupted_TimerThree(e)
	if (e.timer == "AbilitiesThree") then
	eq.stop_timer("AbilitiesThree");
	e.self:SetAppearance(3);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1); -- Set variables immune agro, agro on, no harm, immune magic.
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
	end
end


function Corrupted_Death(e) -- Signal Vish that I died - and should be respawning soon.
	eq.signal(343094,1); -- NPC: Vishimtar_the_Fallen
	corrupted_spawn=false;
end

function Corrupted_Death_One(e)
	eq.signal(343094,2); -- NPC: Vishimtar_the_Fallen
	corrupted_spawn=false;
end

function Corrupted_Death_Two(e)
	eq.signal(343094,3); -- NPC: Vishimtar_the_Fallen
	corrupted_spawn=false;
end

function Corrupted_Death_Three(e)
	eq.signal(343094,4); -- NPC: Vishimtar_the_Fallen
	corrupted_spawn=false;
end


function Vish_Death(e)
	eq.spawn2(343164,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawn a chest at my location upon my death.
	eq.stop_all_timers();
end

function Egg_Spawn(e) -- Modify the damage I take.
	e.self:ModSkillDmgTaken(0, 300) -- 1h blunt
    e.self:ModSkillDmgTaken(1, -99) -- 1h slashing
    e.self:ModSkillDmgTaken(2, 300) -- 2h blunt
    e.self:ModSkillDmgTaken(3, -99) -- 2h slashing
    e.self:ModSkillDmgTaken(7, -99) -- archery
    e.self:ModSkillDmgTaken(8, -99) -- backstab
    e.self:ModSkillDmgTaken(10, -99) -- bash
    e.self:ModSkillDmgTaken(21, -99) -- dragon punch
    e.self:ModSkillDmgTaken(23, -99) -- eagle strike
    e.self:ModSkillDmgTaken(26, -99) -- flying kick
    e.self:ModSkillDmgTaken(28, -99) -- hand to hand
    e.self:ModSkillDmgTaken(30, -99) -- kick
    e.self:ModSkillDmgTaken(36, -99) -- piercing
    e.self:ModSkillDmgTaken(38, -99) -- round kick
    e.self:ModSkillDmgTaken(52, -99) -- tiger claw
    e.self:ModSkillDmgTaken(74, -99) -- frenzy
end


function event_encounter_load(e)
  eq.register_npc_event('Vish', Event.spawn,            343094, Vish_Spawn);
  eq.register_npc_event('Vish', Event.hp,				343094,	Vish_Hp);
  eq.register_npc_event('Vish', Event.combat,			343094, Vish_Combat);
  eq.register_npc_event('Vish', Event.timer,			343094,	Vish_Timer);
  eq.register_npc_event('Vish', Event.signal,			343094,	Vish_Signal);
  eq.register_npc_event('Vish', Event.death_complete,	343094,	Vish_Death);
 
  eq.register_npc_event('Vish', Event.spawn,			343093, Corrupted_Spawn);
  eq.register_npc_event('Vish', Event.spawn,			343165, Corrupted_SpawnOne);
  eq.register_npc_event('Vish', Event.spawn,			343166, Corrupted_SpawnTwo);
  eq.register_npc_event('Vish', Event.spawn,			343167, Corrupted_SpawnThree);
  
  eq.register_npc_event('Vish', Event.timer,			343093, Corrupted_Timer);
  eq.register_npc_event('Vish', Event.timer,			343165, Corrupted_TimerOne);
  eq.register_npc_event('Vish', Event.timer,			343166, Corrupted_TimerTwo);
  eq.register_npc_event('Vish', Event.timer,			343167, Corrupted_TimerThree);
  
  eq.register_npc_event('Vish', Event.spawn,			343095, Egg_Spawn);
  
  eq.register_npc_event('Vish', Event.signal,			343093, Corrupted_Signal);
  eq.register_npc_event('Vish', Event.signal,			343165, Corrupted_OneSignal);
  eq.register_npc_event('Vish', Event.signal,			343166, Corrupted_TwoSignal);
  eq.register_npc_event('Vish', Event.signal,			343167, Corrupted_ThreeSignal);
  
  eq.register_npc_event('Vish', Event.death_complete,	343093,	Corrupted_Death);
  eq.register_npc_event('Vish', Event.death_complete,	343165,	Corrupted_Death_One);
  eq.register_npc_event('Vish', Event.death_complete,	343166,	Corrupted_Death_Two);
  eq.register_npc_event('Vish', Event.death_complete,	343167,	Corrupted_Death_Three);
  
  eq.register_npc_event('Vish', Event.death_complete,	343095, Egg_Death); -- ldon object doesnt work with event.death_complete, needs event.death
  eq.register_npc_event('Vish', Event.spawn,			343159,	Incorporeal_Spawn);
  eq.register_npc_event('Vish', Event.death_complete,	343159, Incorporeal_Death);
  eq.register_npc_event('Vish', Event.say,				343163,	Mourning_Say);
  
  eq.register_npc_event('Vish', Event.slay,				343094, Vish_Slay);
  eq.register_npc_event('Vish', Event.slay,				343093, Corrupted_Slay);
  eq.register_npc_event('Vish', Event.slay,				343159, Incorporeal_Slay);
  eq.register_npc_event('Vish', Event.slay,				343161, Drakeling_Slay);
  eq.register_npc_event('Vish', Event.slay,				343160, Lifedrain_Slay);
  eq.register_npc_event('Vish', Event.spawn,			343160, Lifedrain_Spawn);
  eq.register_npc_event('Vish', Event.slay,				343096, Spirit_Wraith_Slay);
  eq.register_npc_event('Vish', Event.death_complete,	343162, Cloud_Death);
  
end
