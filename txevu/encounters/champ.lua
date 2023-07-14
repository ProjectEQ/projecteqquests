--immune arena mobs a_mastruq_gladiator (297038) a_noc_brawler (297033) a_ra`tuk_bruiser (297036)

-- killable arena mobs: aggro radius ~ 10 a_mastruq_gladiator (297040) a_noc_brawler (297035) a_ra`tuk_bruiser (297037)
-- Champ_Event (297001)

local event_triggered = 0;

function ChampEvent_Spawn(e)
	event_triggered = 0;
 	eq.set_timer("spawnevent", 3 * 1000);
	eq.spawn_condition("txevu", 0, 6, 0); --off arena trash
end

function ChampEvent_Timer(e)
  if (e.timer == "spawnevent") then
    event_triggered = 0;
    eq.stop_timer("spawnevent");
    local ex = e.self:GetX();
    local ey = e.self:GetY();
    local ez = e.self:GetZ();
    eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 1, ez + 20);
-- immune arena mobs
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -37, 10, -437, 258);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -69, -97, -433, 112);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -57, -95, -434, 392);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 22, -51, -434, 14);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 22, -39, -434, 258);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 21, 49, -434, 374);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 10, 48, -435, 120);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 54, -98, -434, 30);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 58, -90, -434, 266);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 4, -112, -434, 330);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -3, -120, -434, 76);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 52, 137, -434, 162);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, 62, 133, -434, 404);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -20, 111, -434, 444);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -28, 119, -434, 190);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -84, 145, -434, 297);
    eq.spawn2(eq.ChooseRandom(297038,297033,297036), 0, 0, -92, 133, -434, 76);
    eq.unique_spawn(297034, 0, 0, -39, -8, -434, 64); --#Mastruq_Champion (297034)
  end
end

function ChampEvent_Enter(e)
  if (event_triggered == 0) then
    event_triggered = 1;
    eq.signal(297034,1); --signal mastruq champion to begin emoting
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 200,"As you step into the room, all combat stops and every eye turns to you. The champion in the center finishes his opponent and yells 'HOLD!' stopping the Muramites before they can charge.");
  end
end

function ChampEvent_Signal(e)
	if (e.signal == 1) then
		eq.set_timer("spawnevent", 1800 * 1000); -- 30 minutes to respawn the event
	elseif (e.signal == 2) then
		eq.set_timer("spawnevent", 60 * 1000); -- 1 minutes to respawn the event from runt failure
	end
end

function MastruqChampion_Signal(e)
  if (e.signal == 1) then
    e.self:MoveTo(0, 0, -430, 130,true);
    eq.set_timer("emote1", 3 * 1000);
  elseif (e.signal == 2) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(25, 0);
    e.self:SetSpecialAbility(35, 0);
  elseif (e.signal == 3) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(25, 0);
    e.self:SetSpecialAbility(35, 0);
    e.self:Say("I told ya we don't take kindly to cheaters! Boys, kill these fools starting with the one who broke the rules!");
  end
end

function MastruqChampion_Timer(e)
  if (e.timer == "emote1") then
    eq.stop_timer("emote1");
    e.self:Say("Look what we have here, boys? One of them softies found its way into our pit. What is it that we do with softies again?");
    eq.set_timer("emote2", 3 * 1000);
  elseif (e.timer == "emote2") then
    eq.stop_timer("emote2")
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The cry goes up from the crowd, 'KILL THEM!");
    eq.set_timer("emote3", 3 * 1000);
  elseif (e.timer == "emote3") then
    eq.stop_timer("emote3");
    e.self:Say("Yeah! We kill them! But, this here's a combat pit and I've been thinkin...");
    eq.set_timer("emote4", 3 * 1000);
  elseif (e.timer == "emote4") then
    eq.stop_timer("emote4");
    e.self:Say("Them softies always travel in big packs, but I bet they're real weak by themselves.");
    eq.set_timer("emote5", 3 * 1000);
  elseif (e.timer == "emote5") then
    eq.stop_timer("emote5");
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"A mix of cheers and laughter comes out of the gathering crowd.");
    eq.set_timer("emote6", 3 * 1000);
  elseif (e.timer == "emote6") then
    eq.stop_timer("emote6");
    e.self:Say("They probably crumble like a rag doll the first time they go toe-to-toe with a real warrior.");
    eq.set_timer("emote7", 3 * 1000);
  elseif (e.timer == "emote7") then
    eq.stop_timer("emote7");
    e.self:Say("I bet this one here can't even take the runt!");
    eq.set_timer("emote8", 3 * 1000);
  elseif (e.timer == "emote8") then
    eq.stop_timer("emote8");
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The crowd bursts into jeers as a wretched creature pulls itself out of the pond and cowers before the champion.");
    eq.unique_spawn(297209,0,0,-50,0,-438,132); -- The Runt
    eq.set_timer("emote9", 3 * 1000);
  elseif (e.timer == "emote9") then
    eq.stop_timer("emote9");
    e.self:Say("Go on, show us what you're made of! Just you and the runt. No pets, no friends, no healing, no nuttin! You win and you can walk away with your head still on your shoulder. But I warn you, we don't take kindly to cheaters.");
  elseif(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetX() > 96 or e.self:GetX() < -120 or e.self:GetY() < -190 or e.self:GetY() > 190) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(8, 0, -436, 254);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
  end
end

function IxtHsek_Combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(90);
		eq.set_timer("OOBcheck", 6 * 1000);
			if(not eq.is_paused_timer("depop")) then
				eq.pause_timer("depop");
			end
	else
		eq.stop_timer("OOBcheck");
		eq.resume_timer("depop");
	end
end

function IxtHsek_HP(e)
local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 297035 or npc:GetNPCTypeID() == 297037 or npc:GetNPCTypeID() == 297040)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
      			e.self:Say("Don't just stand there you fools! Come help me kill them!");
     	 		end
end
end

function MastruqChampion_Combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(20);
		eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end

function MastruqChampion_HP(e)
local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 297211)) then
			npc:AddToHateList(e.self:GetHateTop(),1);
			e.self:Say("Ugh. These fools are stronger than they look. Hsek, come help me with them!");
-- add #Ixt_Hsek_Syat (297211) to hate list
--should he emote?
      end
  end
end

--mastruq mods

function MastruqChampion_Spawn(e)
e.self:ModSkillDmgTaken(0, -25); -- 1h blunt
e.self:ModSkillDmgTaken(2, -25); -- 2h blunt
e.self:ModSkillDmgTaken(1, 25); -- 1h slashing
e.self:ModSkillDmgTaken(3, 25); -- 2h slashing
e.self:ModSkillDmgTaken(7, 25); -- archery
end

function TheRunt_Spawn(e)
-- mods enthralled destroyer/noc bloodluster
e.self:ModSkillDmgTaken(0, 25); -- 1h blunt
e.self:ModSkillDmgTaken(2, 25); -- 2h blunt
e.self:ModSkillDmgTaken(1, -25); -- 1h slashing
e.self:ModSkillDmgTaken(3, -25); -- 2h slashing
e.self:ModSkillDmgTaken(7, -25); -- archery
	
  e.self:MoveTo(25, 0, -437, 130,true);
  eq.set_timer("depop", 600 * 1000); -- 10 min reset if runt isnt killed
  local hate_list;
end

function TheRunt_Combat(e)
  if (e.joined == true) then
    eq.set_timer("checklist", 1 * 1000);
    eq.set_timer("OOBcheck", 6 * 1000);
  else
    eq.stop_timer("checklist");
    eq.stop_timer("OOBcheck");
  end
end

function TheRunt_Timer(e)
if (e.timer == "checklist") then
 hate_list = e.self:CountHateList();
    if (hate_list ~= nil and tonumber(hate_list) > 1) then
		eq.stop_timer("checklist");
		-- wake up arena mobs
		eq.signal(297038,1);
		eq.signal(297033,1);
		eq.signal(297036,1);
		-- champion also wakes up and attacks
		eq.signal(297034,3); -- signal #Mastruq_Champion (297034) to remove immunities
		-- add arena mobs to hate list 
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 297038 or npc:GetNPCTypeID() == 297033 or npc:GetNPCTypeID() == 297036 or npc:GetNPCTypeID() == 297034)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
	end
elseif(e.timer=="OOBcheck") then
	eq.stop_timer("OOBcheck");
		if (e.self:GetX() > 96 or e.self:GetX() < -120 or e.self:GetY() < -190 or e.self:GetY() > 190) then
			e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
			e.self:GMMove(8, 0, -436, 254);
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
elseif(e.timer=="depop") then
		eq.depop(297211); -- hsek
		eq.depop(297034); -- champ
		eq.depop_all(297038); -- arena mob
		eq.depop_all(297036); -- arena mob
		eq.depop_all(297033); -- arena mob
		eq.depop_all(297035); -- arena mob
		eq.depop_all(297037); -- arena mob
		eq.depop_all(297040); -- arena mob
		eq.signal(297001,2); --signal champ_event to begin timer to respawn event
		eq.depop_all(297209); -- the runt
end
end

function TheRunt_Death(e)
	-- signal arena mobs to path out
	eq.signal(297038,2);
	eq.signal(297033,2);
	eq.signal(297036,2);
	eq.unique_spawn(297211,0,0,-93,121,-435,194); -- #Ixt_Hsek_Syat
	eq.signal(297034,2); -- signal #Mastruq_Champion (297034) to remove immunities
	eq.spawn2(eq.ChooseRandom(297040,297035,297037), 0, 0, -37, 10, -437, 258);
        eq.spawn2(eq.ChooseRandom(297040,297035,297037), 0, 0, -69, -97, -433, 112);
        eq.spawn2(eq.ChooseRandom(297040,297035,297037), 0, 0, -57, -95, -434, 392);
end

function ArenaMobs_Signal(e)
  if (e.signal == 1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(25, 0);
    e.self:SetSpecialAbility(35, 0);
    eq.stop_timer("animation");
  elseif (e.signal == 2) then
    eq.start(77); -- start the grid (one way depop)
  end
end

function ArenaMobs_Spawn(e)
  eq.set_timer("animation", 10 * 1000);
end

function ArenaMobs_Timer(e)
if (e.timer == "animation") then
e.self:DoAnim(eq.ChooseRandom(1,2,5,6,8,84,85));
elseif(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() > 96 or e.self:GetX() < -120 or e.self:GetY() < -190 or e.self:GetY() > 190) then
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GMMove(8, 0, -436, 254);
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end

function KillableArena_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end


function KillableArena_Timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() > 96 or e.self:GetX() < -120 or e.self:GetY() < -190 or e.self:GetY() > 190) then
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GMMove(8, 0, -436, 254);
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end

function IxtHsek_Timer(e)
	if(e.timer=="OOBcheck") then
	eq.stop_timer("OOBcheck");
		if (e.self:GetX() > 96 or e.self:GetX() < -120 or e.self:GetY() < -190 or e.self:GetY() > 190) then
			e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
			e.self:GMMove(8, 0, -436, 254);
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
	elseif(e.timer=="depop") then
		eq.depop(297211); -- hsek
		eq.depop(297034); -- champ
		eq.depop_all(297038); -- arena mob
		eq.depop_all(297036); -- arena mob
		eq.depop_all(297033); -- arena mob
		eq.depop_all(297035); -- arena mob
		eq.depop_all(297037); -- arena mob
		eq.depop_all(297040); -- arena mob
		eq.signal(297001,1); --signal champ_event to begin timer to respawn event
	end
end

function IxtHsek_Spawn(e)
eq.set_timer("depop", 1800 * 1000);
e.self:MoveTo(25, 0, -437, 195,true);
end

function IxtHsek_Death(e)
	--ixt death controls respawn of event
 	eq.depop_with_timer(297001); -- event is successful, initiate respawn
	eq.unique_spawn(297041,0,0,-108, -30, -439,385); --arena (297041) will turn on arena spawn condition in 1 hour
end


function event_encounter_load(e)
    eq.register_npc_event('champ', Event.spawn, 297001, ChampEvent_Spawn);
    eq.register_npc_event('champ', Event.enter, 297001, ChampEvent_Enter);
    eq.register_npc_event('champ', Event.timer, 297001, ChampEvent_Timer);
    eq.register_npc_event('champ', Event.signal, 297001, ChampEvent_Signal);

    eq.register_npc_event('champ', Event.timer, 297034, MastruqChampion_Timer);
    eq.register_npc_event('champ', Event.combat, 297034, MastruqChampion_Combat);
    eq.register_npc_event('champ', Event.signal, 297034, MastruqChampion_Signal);
    eq.register_npc_event('champ', Event.hp, 297034, MastruqChampion_HP);
   eq.register_npc_event('champ', Event.death_complete, 297034, MastruqChampion_Death);
eq.register_npc_event('champ', Event.spawn, 297034, MastruqChampion_Spawn);

    eq.register_npc_event('champ', Event.hp, 297211, IxtHsek_HP);
    eq.register_npc_event('champ', Event.combat, 297211, IxtHsek_Combat);
    eq.register_npc_event('champ', Event.timer, 297211, IxtHsek_Timer);
    eq.register_npc_event('champ', Event.spawn, 297211, IxtHsek_Spawn);
    eq.register_npc_event('champ', Event.death_complete, 297211, IxtHsek_Death);

    eq.register_npc_event('champ', Event.combat, 297209, TheRunt_Combat);
    eq.register_npc_event('champ', Event.spawn, 297209, TheRunt_Spawn);
    eq.register_npc_event('champ', Event.timer, 297209, TheRunt_Timer);
    eq.register_npc_event('champ', Event.death_complete, 297209, TheRunt_Death);

    eq.register_npc_event('champ', Event.spawn, 297038, ArenaMobs_Spawn);
    eq.register_npc_event('champ', Event.timer, 297038, ArenaMobs_Timer);
    eq.register_npc_event('champ', Event.signal, 297038, ArenaMobs_Signal);
    eq.register_npc_event('champ', Event.spawn, 297033, ArenaMobs_Spawn);
    eq.register_npc_event('champ', Event.timer, 297033, ArenaMobs_Timer);
    eq.register_npc_event('champ', Event.signal, 297033, ArenaMobs_Signal);
    eq.register_npc_event('champ', Event.spawn, 297036, ArenaMobs_Spawn);
    eq.register_npc_event('champ', Event.timer, 297036, ArenaMobs_Timer);
    eq.register_npc_event('champ', Event.signal, 297036, ArenaMobs_Signal);

    eq.register_npc_event('champ', Event.combat, 297038, KillableArena_Combat);
    eq.register_npc_event('champ', Event.combat, 297033, KillableArena_Combat);
    eq.register_npc_event('champ', Event.combat, 297036, KillableArena_Combat);
    eq.register_npc_event('champ', Event.combat, 297035, KillableArena_Combat);
    eq.register_npc_event('champ', Event.timer, 297035, KillableArena_Timer);
    eq.register_npc_event('champ', Event.combat, 297037, KillableArena_Combat);
    eq.register_npc_event('champ', Event.timer, 297037, KillableArena_Timer);
    eq.register_npc_event('champ', Event.combat, 297040, KillableArena_Combat);
    eq.register_npc_event('champ', Event.timer, 297040, KillableArena_Timer);
end
