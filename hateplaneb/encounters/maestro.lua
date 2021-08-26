--Event_Control_Maestro (186196)
--#an_accompanist (186191)
--#Maestro_of_Rancor (186111)
--#a_moaning_banshee (186193)
--#a_screeching_banshee (186192)
--#a_wailing_banshee (186194)
--#a_silent_banshee (186197)
--Huffin rewrite

function Control_Spawn(e)
  eq.set_timer("popmaestro", 60 * 1000);
end

function Control_Signal(e)
  eq.set_timer("popmaestro", 60 * 1000);
end

function Control_Timer(e)
  if(e.timer=="popmaestro") then
    eq.stop_timer("popmaestro");
    eq.unique_spawn(186111,0,0,-130,-480,31,128); -- #Maestro_of_Rancor (186111)
  end
end

function Maestro_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		eq.stop_timer("resetevent");
	else
		eq.stop_timer("OOBcheck");
		eq.set_timer("resetevent", 60 * 1000);
	end
end


function Maestro_Timer(e)
if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetY() < -560 or e.self:GetY() > -358 or e.self:GetX() > -94 or e.self:GetX() < -351) then
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
elseif(e.timer=="resetevent") then
		eq.stop_timer("resetevent");
		eq.signal(186196,1); -- Event_Control_Maestro (186196)
		eq.depop_all(186191);
		eq.depop_all(186193);
		eq.depop_all(186192);
		eq.depop_all(186194);
		eq.depop_all(186197);
		eq.depop();
end
end

function Maestro_Spawn(e)
    eq.set_next_hp_event(95);
end

function Maestro_Hp(e)
    if(e.hp_event == 95) then
        eq.spawn2(186197,0,0,-293,-409,23,254); -- #a_silent_banshee (186197)
        eq.spawn2(186197,0,0,-283,-557,23,3); -- #a_silent_banshee (186197)
        eq.spawn2(186197,0,0,-349,-480,23,127); -- #a_silent_banshee (186197)
        eq.set_next_hp_event(75);
    elseif(e.hp_event == 75) then
        eq.spawn2(186191,0,0,-117.37,-477,35.88,129.2); -- NPC: #an_accompanist
        eq.spawn2(186191,0,0,-117.37,-483,35.88,129.2); -- NPC: #an_accompanist
        e.self:ModifyNPCStat("hp_regen", "10000");
        eq.set_next_hp_event(40);
        eq.zone_emote(0, "A haunting tune floats through the music hall.  Someone or SOMETHING has begun playing the pipe organ.");
        eq.zone_emote(0, "Maestro of Rancor chortles, 'This song is sweet to my senses. Keep up with the dance mortals... IF YOU CAN!");
    elseif (e.hp_event == 40) then
        eq.depop_all(186197); -- #a_silent_banshee (186197)
        eq.spawn2(186192,0,0,-291,-421,23.23,256); -- NPC: #a_screeching_banshee
        eq.spawn2(186193,0,0,-333,-480,23.23,129.2); -- NPC: #a_moaning_banshee
        eq.spawn2(186194,0,0,-293,-541,23.23,2); -- NPC: #a_wailing_banshee
    end
end

function Maestro_Signal(e)
    if (e.signal == 1) then
        e.self:ModifyNPCStat("hp_regen", "100");
    elseif (e.signal == 2) then
        eq.spawn2(eq.ChooseRandom(186193,186192,186194),0,0,-291,-421,23.23,256); -- choose random banshee
        eq.spawn2(eq.ChooseRandom(186193,186192,186194),0,0,-333,-480,23.23,129.2); -- choose random banshee
        e.self:Say("You would deign to bring an end to such magnificent music? Perhaps a duet would better suit your tastes.' Maestro raises a clenched fists, and two of the banshees uncrumple and resume their singing.");
    end
end

function Maestro_Death(e)
	eq.depop_with_timer(186196);
end

function Accompanist_Death(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(186191) == false) then
    eq.signal(186111,1); -- NPC: #Maestro_of_Rancor
-- signal maestro to reduce HP regen since hands are dead
  end
end

function Banshee_Death(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(186192) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(186193) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(186194) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(186111) == true) then
    eq.signal(186111,2); -- NPC: #Maestro_of_Rancor
    -- signal maestro to spawn 2 more banshees since all banshees are dead and maestro is still alive
  end
end

function Moaning_Combat(e)
    if (e.joined == true) then
        eq.set_timer("nuke", math.random(2,5) * 1000);
    else
        eq.stop_timer("nuke");
    end
end

function Moaning_Timer(e)
    if(e.timer=="nuke") then
        eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"You seem to recognize one banshees music as a fire resist song.");
        local rand = math.random(1,2);
          if (rand ==1) then
            e.self:CastedSpellFinished(943, e.self:GetHateTop()); -- Mana Drain (943)
          elseif (rand == 2) then
            e.self:CastedSpellFinished(2817, e.self:GetHateTop()); -- Thought Vortex (2817)
          end
     end
end

function event_encounter_load(e)
    eq.register_npc_event('maestro', Event.spawn, 186196, Control_Spawn);
    eq.register_npc_event('maestro', Event.signal, 186196, Control_Signal);
    eq.register_npc_event('maestro', Event.timer, 186196, Control_Timer);
    
    eq.register_npc_event('maestro', Event.combat, 186111, Maestro_Combat);
    eq.register_npc_event('maestro', Event.timer, 186111, Maestro_Timer);
    eq.register_npc_event('maestro', Event.signal, 186111, Maestro_Signal);
    eq.register_npc_event('maestro', Event.hp, 186111, Maestro_Hp);
    eq.register_npc_event('maestro', Event.spawn, 186111, Maestro_Spawn);
    eq.register_npc_event('maestro', Event.death_complete, 186111, Maestro_Death);
    
    eq.register_npc_event('maestro', Event.death_complete, 186191, Accompanist_Death);
    
    eq.register_npc_event('maestro', Event.death_complete, 186192, Banshee_Death);
    eq.register_npc_event('maestro', Event.death_complete, 186193, Banshee_Death);
    eq.register_npc_event('maestro', Event.death_complete, 186194, Banshee_Death);
    
    eq.register_npc_event('maestro', Event.combat, 186193, Moaning_Combat);
    eq.register_npc_event('maestro', Event.timer, 186193, Moaning_Timer);
end
