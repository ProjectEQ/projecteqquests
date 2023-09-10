local construct = 0;
local golems_spawn = false;

function PRT_Spawn(e)
	e.self:ModSkillDmgTaken(1, -30); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -30); -- 2h slashing
	e.self:ModSkillDmgTaken(7, -25); -- archery
	--spawn the two starting golems
	eq.unique_spawn(298002, 0, 0, 229.0, -572.0, -3.25, 384):SetAppearance(3); -- NPC: a_corrupted_construct (ramp)
	eq.unique_spawn(298026, 0, 0, 225.0, -600.0, -3.25, 410):SetAppearance(3); -- NPC: a_corrupted_construct (flurry)

	eq.set_next_hp_event(90)
	golems_spawn = false;
	construct = 0;
end

function PRT_Combat(e)
	if e.joined then
		e.self:Say("You shall regret trespassing into my chambers. Rise my minions and show them how well I have learned to use the power of this land's creatures. Destroy them all. Leave only enough to feed the hounds")
		eq.stop_timer('wipecheck');
		
		eq.signal(298002,1); --a_corrupted_construct remove immunities
		eq.signal(298026,1); --a_corrupted_construct remove immunities
		
		if golems_spawn then
			eq.set_timer("SpawnGolem", 6 * 1000);
		end
	else
		-- Wipe stuff
	
		eq.signal(298002,2); --a_corrupted_construct add immunities
		eq.signal(298026,2); --a_corrupted_construct add immunities
		
		eq.set_timer('wipecheck', 30 * 1000);
		eq.stop_timer("SpawnGolem");
		eq.stop_timer('VenomAE');
		eq.stop_timer('Delusional');
	end
end

function PRT_HP(e)
	if (e.hp_event == 90) then
		--lock door behind her
		eq.signal(298223,1); -- Lock Doors
		eq.set_next_hp_event(50)
		eq.set_timer("check", 1 * 1000); -- start checking for clients outside room
		eq.zone_emote(MT.White,"Riel raises her hands to the sky and laughs as the door behind you seals itself.");
	elseif (e.hp_event == 50) then
		--add flurry, reduce atk delay
		e.self:ModifyNPCStat("attack_delay","12");
		e.self:SetSpecialAbility(SpecialAbility.flurry, 1)
		eq.set_timer("Delusional", 30 * 1000)
		e.self:Say("So it seems you are not so easily defeated after all. I am through toying with you fools. Prepare for the reality of death.' Riel's body begins to speed up as her attacks become increasingly vicious")
		eq.set_next_hp_event(30)
	elseif (e.hp_event == 30) then
		--start golem waves, first spawn is 4, next are based on hp (4 <=30%, 8 <=20%, 12 <=10%)
		eq.set_timer("SpawnGolem", 6 * 1000)
		e.self:Say("You and your friends are starting to annoy me.  Come forth my little experiments.  Choose one of these fools and show them the surprise you have waiting.");
		--spawn 4 mini golems
		--an_unstable_construct (298045)
		eq.set_next_hp_event(25)
		golems_spawn = true;
	elseif (e.hp_event == 25) then
		--add Ikaav's Venom AE
		eq.set_timer("VenomAE", 30000)
		e.self:CastSpell(751,e.self:GetID())
		eq.set_next_hp_event(10)
	elseif (e.hp_event == 10) then
		-- At approximately 10% health, she increases her attack speed and begins flurrying much more (every round)
		e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100)
		e.self:Say("That's it!  You have past the point of being bothersome. I grow weary of this encounter. It is time for it to end.")
	end
end

function PRT_Timer(e)
	if (e.timer == "Delusional") then
		--Delusional Vision single target DD/Drunk whole fight
		e.self:SpellFinished(889, e.self:GetHateTop()) --CastToClient? --no need unless using client-based methods
	elseif (e.timer == "VenomAE") then
		--Ikaav's Venom 751
		e.self:CastSpell(751,e.self:GetID())
	elseif(e.timer=="SpawnGolem") then
		local construct_locs = { 
			[1] = { 189.61, -586.55, -8.55,128}, 
			[2] = { 180.10, -569.03, -8.55,380},
			[3] = { 180.10, -609.61, -8.55,128}, 
			[4] = { 107.81, -586.55, -8.55,128}
		};
		--eq.stop_timer("SpawnGolem");
		if (e.self:GetHPRatio() >= 20) then
			if ( construct < 12 ) then	
				local rng = math.random(4, 4);
				local spawned = 0;

				for i = construct+1, 12 do
					local ran = math.random(1,4);
					eq.spawn2(298045, 0, 0, unpack(construct_locs[ran]));
					spawned = spawned + 1;
					if ( spawned == rng ) then
						break;
					end
				end
				construct = construct + spawned;
			end
		elseif (e.self:GetHPRatio() > 10 and e.self:GetHPRatio() < 20) then
			if ( construct < 12 ) then	
				local rng = math.random(8, 8);
				local spawned = 0;
	
				for i = construct+1, 12 do
					local ran = math.random(1,4);
					eq.spawn2(298045, 0, 0, unpack(construct_locs[ran]));
					spawned = spawned + 1;
					if ( spawned == rng ) then
						break;
					end
				end
				construct = construct + spawned;
			end
			eq.set_timer("SpawnGolem", 4 * 1000) --speed up timer
		elseif (e.self:GetHPRatio() < 10) then
			if ( construct < 12 ) then		
				local rng = math.random(12, 12);
				local spawned = 0;
	
				for i = construct+1, 12 do
					local ran = math.random(1,4);
					eq.spawn2(298045, 0, 0, unpack(construct_locs[ran]));
					spawned = spawned + 1;
					if ( spawned == rng ) then
						break;
					end
				end
				construct = construct + spawned;
			end
			eq.set_timer("SpawnGolem", 2 * 1000) --speed up timer
		end
	elseif (e.timer == 'wipecheck') then
		--eq.depop_all(298045);
		--eq.depop_all(298002);
		--eq.depop();
		--eq.spawn2(298032, 0, 0, 202.0, -586.0, -4.125, 380); -- NPC: Pixtt_Riel_Tavas
		eq.stop_timer('wipecheck');
		e.self:SetHP(e.self:GetMaxHP())
		eq.unique_spawn(298002, 0, 0, 229.0, -572.0, -3.25, 384):SetAppearance(3); -- NPC: a_corrupted_construct (ramp)
		eq.unique_spawn(298026, 0, 0, 225.0, -600.0, -3.25, 410):SetAppearance(3); -- NPC: a_corrupted_construct (flurry)
		eq.depop_all(298045);
		eq.set_next_hp_event(90)
		golems_spawn = false;
		construct = 0;		
		eq.signal(298223,2); -- Unlock Doors
	elseif (e.timer == "check") then
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				if(ent:IsClient() and ent:GetX() < 100 or ent:GetX() > 244 or ent:GetY() > -535 or ent:GetY() < -636) then
					local currclient=ent:CastToClient();
					--e.self:Shout("You will not evade me " .. currclient:GetName())
					currclient:MovePCInstance(298,instance_id, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- Zone: tacvi
					currclient:Message(MT.Magenta,"Pixtt Riel Tavas says, 'You dare enter my chambers and then try to leave? Your punishment will be quite severe.");
				end
			end
		);
	end
end

function PRT_Death(e)
	e.self:Emote("'s body falls to the stone floor in a puddle of blackened blood. You step back as she slashes one last time, connecting with nothing but the stale air of the room. 'This is not over. My commander will destroy you for this and when he does I hope it is my power he is weilding'")
	eq.zone_emote(MT.Yellow, "With the death of the great beast, the seals on the doors fade away. Your path is now clear.")

	-- Open doors
	eq.signal(298223, 298032); -- NPC: zone_status
	eq.signal(298223,2,1000); -- Unlock Doors
end

function PRT_Signal(e)
	if (e.signal == 1) then
		construct = construct - 1; --add dead or mez death
	end
end

-- a_corrupted_construct (298002)
-- Big golem at beginning of Pixtt_Riel_Tavas fight
function Corrupt_Spawn(e)
	e.self:SetAppearance(3)
	e.self:ModSkillDmgTaken(1, -25); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -25); -- 2h slashing
	e.self:ModSkillDmgTaken(0, 10); -- 1h blunt
	e.self:ModSkillDmgTaken(2, 10); -- 2h blunt
	e.self:ModSkillDmgTaken(7, -25); -- archery
end

function Corrupt_Death(e)
	e.self:Emote("The ground trembles as the massive construct falls.")
end

function Corrupt_Signal(e)
	if (e.signal == 1) then
		e.self:SetSpecialAbility(35, 0); --turn off immunity
		e.self:SetSpecialAbility(24, 0); --turn off anti aggro
	elseif (e.signal == 2) then
		e.self:SetSpecialAbility(35, 1); --turn on immunity
		e.self:SetSpecialAbility(24, 1); --turn on anti aggro
		e.self:WipeHateList();
	end
end

-- an_unstable_construct (298045)
-- add during Pixtt_Riel_Tavas fight
-- mini golems that cast a AE DD when they die
function Unstable_Death(e)
	eq.signal(298032,1); --Pixtt_Riel_Tavas (298032) signal to reduce add count	
	e.self:CastSpell(4661, e.self:GetID()); -- Spell: Cataclysm of Stone
end

function Unstable_Spawn(e)
	eq.set_timer("mez_check", 1 * 1000); -- 1s check
end

function Unstable_Timer(e)
	if e.timer == "mez_check" then
		if e.self:IsMezzed() then
			eq.stop_timer("mez_check");
			eq.set_timer("depop", 30 * 1000); -- depop in 30s
		end
	elseif e.timer == "depop" then
		eq.stop_timer("depop");
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(298032) then -- only depops if PRT is alive
			eq.signal(298032,1); --Pixtt_Riel_Tavas (298032) signal to reduce add count
			e.self:Emote("ceases its struggles as the energy that brought it to life fades away.");			
			eq.depop();
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event('prt', Event.spawn,           298032, PRT_Spawn);
	eq.register_npc_event('prt', Event.combat,          298032, PRT_Combat);
	eq.register_npc_event('prt', Event.hp,              298032, PRT_HP);
	eq.register_npc_event('prt', Event.timer,           298032, PRT_Timer);
	eq.register_npc_event('prt', Event.death_complete,  298032, PRT_Death);
	eq.register_npc_event('prt', Event.signal,           298032, PRT_Signal);

	eq.register_npc_event('prt', Event.spawn,           298002, Corrupt_Spawn);
	eq.register_npc_event('prt', Event.death_complete,  298002, Corrupt_Death);
	eq.register_npc_event('prt', Event.spawn,           298026, Corrupt_Spawn);
	eq.register_npc_event('prt', Event.death_complete,  298026, Corrupt_Death);
	eq.register_npc_event('prt', Event.signal,           298002, Corrupt_Signal);
	eq.register_npc_event('prt', Event.signal,           298026, Corrupt_Signal);
	
	eq.register_npc_event('prt', Event.death,           298045, Unstable_Death);
	eq.register_npc_event('prt', Event.spawn,           298045, Unstable_Spawn);
	eq.register_npc_event('prt', Event.timer,           298045, Unstable_Timer);
end
