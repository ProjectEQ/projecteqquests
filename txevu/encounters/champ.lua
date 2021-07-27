--immune arena mobs a_mastruq_gladiator (297038) a_noc_brawler (297033) a_ra`tuk_bruiser (297036)

-- killable arena mobs: aggro radius ~ 10 a_mastruq_gladiator (297040) a_noc_brawler (297035) a_ra`tuk_bruiser (297037)
-- Champ_Event (297001)

local event_triggered = 0;

function Champ_Event_Spawn(e)
  eq.set_timer("spawnevent", 3 * 1000);
	e.self:Say("Check");
end

function Champ_Event_Timer(e)
  if (e.timer == "spawnevent") then
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

function Champ_Event_Enter(e)
  if (event_triggered == 0) then
    event_triggered = 1;
    eq.signal(297034,1); --signal mastruq champion to begin emoting
  end
end

function Mastruq_Champion_Signal(e)
  if (e.signal == 1) then
    e.self:MoveTo(0, 0, -430, 130,true);
    eq.set_timer("emote1", 3 * 1000);
  elseif (e.signal == 2) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(25, 0);
    e.self:SetSpecialAbility(35, 0);
  end
end

function Mastruq_Champion_Timer(e)
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
	    if (e.self:GetX() > 96) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GotoBind();
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
  end
end

function Ixt_Hsek_Combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(90);
	end
end

function Ixt_Hsek_HP(e)
local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 297035 or npc:GetNPCTypeID() == 297037 or npc:GetNPCTypeID() == 297040)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
      e.self:Say("Don't just stand there you fools! Come help me kill them!");
      end
  end
end

function Mastruq_Champion_Combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(15);
		eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end

function Mastruq_Champion_HP(e)
local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 297211)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
-- add #Ixt_Hsek_Syat (297211) to hate list
--should he emote?
      end
  end
end

function The_Runt_Spawn(e)
  e.self:MoveTo(25, 0, -437, 130,true);
  local hate_list;
end

function The_Runt_Combat(e)
  if (e.joined == true) then
    eq.set_timer("checklist", 1 * 1000);
  else
    eq.stop_timer("checklist");
  end
end

function The_Runt_Timer(e)
if (e.timer == "checklist") then
 hate_list = e.self:CountHateList();
    if (hate_list ~= nil and tonumber(hate_list) > 1) then
		eq.stop_timer("checklist");
		-- wake up arena mobs
		eq.signal(297038,1);
		eq.signal(297033,1);
		eq.signal(297036,1);
		-- add arena mobs to hate list 
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 297038 or npc:GetNPCTypeID() == 297033 or npc:GetNPCTypeID() == 297036)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
	end
end
end

function The_Runt_Death(e)
		-- signal arena mobs to path out
		eq.signal(297038,2);
		eq.signal(297033,2);
		eq.signal(297036,2);
		eq.unique_spawn(297211,0,0,20,-2,-435,224); -- #Ixt_Hsek_Syat
		eq.signal(297034,2); -- signal #Mastruq_Champion (297034) to remove immunities
		eq.spawn2(eq.ChooseRandom(297040,297035,297037), 0, 0, -37, 10, -437, 258);
    eq.spawn2(eq.ChooseRandom(297040,297035,297037), 0, 0, -69, -97, -433, 112);
    eq.spawn2(eq.ChooseRandom(297040,297035,297037), 0, 0, -57, -95, -434, 392);
end

function Arena_Mobs_Signal(e)
  if (e.signal == 1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(25, 0);
    e.self:SetSpecialAbility(35, 0);
    eq.stop_timer("animation");
  elseif (e.signal == 2) then
    eq.start(77); -- start the grid (one way depop)
  end
end

function Arena_Mobs_Spawn(e)
  eq.set_timer("animation", 10 * 1000);
end

function Arena_Mobs_Timer(e)
if (e.timer == "animation") then
    local animations = { 1,2,5,6,8,84,85 }
    e.self:DoAnim(animations[math.random(#animations)])
end
end


function Killable_Arena_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end


function Killable_Arena_Timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() > 96) then
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end

function event_encounter_load(e)
    eq.register_npc_event("champ", Event.spawn, 297001, Champ_Event_Spawn)
    eq.register_npc_event("champ", Event.enter, 297001, Champ_Event_Enter)
    eq.register_npc_event("champ", Event.timer, 297001, Champ_Event_Timer)

    eq.register_npc_event("champ", Event.timer, 297034, Mastruq_Champion_Timer)
    eq.register_npc_event("champ", Event.combat, 297034, Mastruq_Champion_Combat)
    eq.register_npc_event("champ", Event.signal, 297034, Mastruq_Champion_Signal)
    eq.register_npc_event("champ", Event.hp, 297034, Mastruq_Champion_HP)

    eq.register_npc_event("champ", Event.hp, 297211, Ixt_Hsek_HP)
    eq.register_npc_event("champ", Event.combat, 297211, Ixt_Hsek_Combat)

    eq.register_npc_event("champ", Event.combat, 297209, The_Runt_Combat)
    eq.register_npc_event("champ", Event.spawn, 297209, The_Runt_Spawn)
    eq.register_npc_event("champ", Event.timer, 297209, The_Runt_Timer)
    eq.register_npc_event("champ", Event.death_complete, 297209, The_Runt_Death)

    eq.register_npc_event("champ", Event.spawn, 297038, Arena_Mobs_Spawn)
    eq.register_npc_event("champ", Event.timer, 297038, Arena_Mobs_Timer)
    eq.register_npc_event("champ", Event.signal, 297038, Arena_Mobs_Signal)
    eq.register_npc_event("champ", Event.spawn, 297033, Arena_Mobs_Spawn)
    eq.register_npc_event("champ", Event.timer, 297033, Arena_Mobs_Timer)
    eq.register_npc_event("champ", Event.signal, 297033, Arena_Mobs_Signal)
    eq.register_npc_event("champ", Event.spawn, 297036, Arena_Mobs_Spawn)
    eq.register_npc_event("champ", Event.timer, 297036, Arena_Mobs_Timer)
    eq.register_npc_event("champ", Event.signal, 297036, Arena_Mobs_Signal)

    eq.register_npc_event("champ", Event.combat, 297035, Killable_Arena_Combat)
    eq.register_npc_event("champ", Event.timer, 297035, Killable_Arena_Timer)
    eq.register_npc_event("champ", Event.combat, 297037, Killable_Arena_Combat)
    eq.register_npc_event("champ", Event.timer, 297037, Killable_Arena_Timer)
    eq.register_npc_event("champ", Event.combat, 297040, Killable_Arena_Combat)
    eq.register_npc_event("champ", Event.timer, 297040, Killable_Arena_Timer)

end
