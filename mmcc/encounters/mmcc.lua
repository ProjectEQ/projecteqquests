-- Event: LDoN Raid: Mistmoore Catacombs: Struggles within the Progeny
-- http://www.peqtgc.com/phpBB3/viewtopic.php?f=4&t=15491
-- http://everquest.allakhazam.com/db/quest.html?quest=4177
--
-- 243672 Valdoon Kel`Novar (real)
-- 243677 Valdoon Kel`Novar (fake)
-- 243636 Guardian of Kel`Novar
local valdoon_hp_5 = 30000;
local extra_loot = false;
local guardians = 0;
local instance_id;
local raid_list;

function Guardian_Death(e)
  eq.get_entity_list():MessageClose(e.self, true, 100, 15, "The massive stone beast shudders violently as it transforms into a lifeless statue. The power of its master wanes slightly by the loss of its soul-bound guardian.")
  local valdoon = eq.get_entity_list():GetMobByNpcTypeID(243672);
  local valdoon_hp = valdoon:GetHP() - valdoon_hp_5;
  valdoon:SetOOCRegen(0);
  valdoon:SetHP(valdoon_hp);
  guardians = guardians + 1;
  if ( guardians == 3 ) then
    eq.zone_emote(15, "Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
  end

end

function Fake_Spawn(e)
  extra_loot = false;
end

function Fake_Combat(e)
  if (e.joined) then
    eq.set_timer("OOBcheck", 6 * 1000);
  else 
    eq.stop_timer("OOBcheck");
  end
end

function Fake_Timer(e)
  if (e.timer == "OOBcheck") then
		if (e.self:GetY() < 870) then
			e.self:GotoBind(); --doesnt wipe hate list only returns to bind and stays on aggro
		end
  end
end

function Fake_Death(e)
  eq.zone_emote(15, "A mighty laugh echoes out into the night from the gargoyle aviary. The sound of Valdoon Kel'Novar's voice is clear, 'Did you fools really believe I would be so careless? You'll not live to regret the mistake of crossing the Trueborn!' ");
  eq.spawn2(243636, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Guardian_of_Kel`Novar
  extra_loot = true;
end

function Real_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  raid_list = eq.get_characters_in_instance(instance_id);
end

function Real_Death(e)
  eq.stop_timer('valdoon');
  eq.zone_emote(15, "Your victory has shattered the shroud of magic surrounding the dungeon's treasure.");
  eq.spawn2(243680, 0, 0, 1129, 560, 10.13, 372); -- NPC: Guardian`s_Stone_Chest
  eq.spawn2(243681, 0, 0, 1129, 477, 10.13, 372); -- NPC: Guardian`s_Granite_Chest
  if (extra_loot == true) then
    eq.spawn2(243679, 0, 0, 1241, 510, -3.90, 380); -- NPC: Valdoon`s_gilded_coffin
  end

  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("4d12h"))
  end
end


function Lookout_Combat(e)
	if (e.joined == true) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 120 * 1000);
	end
end

function Lookout_Spawn(e)
	eq.set_timer("depop", 120 * 1000);
end

function Lookout_Timer(e)
	eq.depop();
end

function Real_Combat(e)
  if (e.joined) then
    eq.set_timer("mez", math.random(90,120) * 1000);
    eq.set_timer("OOBcheck", 6 * 1000);
    eq.set_timer("choose", 5 * 1000);
  else 
    eq.stop_timer("mez");
    eq.stop_timer("OOBcheck");
    eq.stop_timer("choose");
  end
end

function Real_Timer(e)
  if (e.timer == "OOBcheck") then
		if (e.self:GetX() < 960) then
			e.self:GotoBind(); --doesnt wipe hate list only returns to bind and stays on aggro
		end
  elseif (e.timer == "mez") then
	e.self:Emote("calls out to the lost soldiers of his alluvium army.  His battle cry summons their essence and heals his battle wounds!");
	e.self:CastedSpellFinished(4134, e.self:GetHateTop()); -- Spell: Seneschal's Petrification.
  elseif (e.timer == "choose") then
	local rand = math.random(1,100);
		if (rand > 90) then
			eq.stop_timer("powerdown");
			e.self:Emote("lets loose a terrifying scream as he unleashes a maniacal inner power. His muscles bulge and he snarls as a newly found strength surges throughout his body.");
			eq.modify_npc_stat("min_hit", "1310");
			eq.modify_npc_stat("max_hit", "4160");
			eq.set_timer("powerdown", 30 * 1000);
		elseif (rand > 80) and (rand <= 90) then
			e.self:Emote("cries out in the stone tongue of battle to his soldiers to rush to his aid.  The ground rumbles with the creation of soldiers to add to the fray.");

			local rand = math.random(3,5);
				if (rand == 3) then
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
				elseif (rand == 4) then
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
				elseif (rand == 5) then
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
   					eq.spawn2(eq.ChooseRandom(243678,243000), 0, 0, 810, 396, 10, 10):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); -- NPC: Kel`Novar_Lookout clr or rog
				end
		elseif (rand <= 80) and (rand >= 60) then
			e.self:Emote("replenishes himself with the very life energy he siphons from you and your comrades!");
			e.self:CastedSpellFinished(4199, e.self:GetHateTop()); -- Spell: Curse of Kel'Novar
		elseif (rand < 60) and (rand >= 40) then
			e.self:Say("Your blood is forfeit!");
			e.self:CastedSpellFinished(4133, e.self:GetHateTop()); -- Spell: Claw of Kel'Novar
		end
   elseif (e.timer == "powerdown") then
	eq.modify_npc_stat("min_hit", "800");
	eq.modify_npc_stat("max_hit", "2800");
	eq.stop_timer("powerdown");
  end
end

function Agent_Hp(e)
	if (e.hp_event == 25) then
		eq.zone_emote(13,"A Trueborn night agent begins to jerk violently as a second pair of eyes grows from its head.");
		eq.set_timer("split", 6 * 1000);
	end
end

function Agent_Combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(25);
	end
end

function Agent_Timer(e)
	if (e.timer == "split") then
		eq.zone_emote(13,"A Trueborn night agent screams as it is torn in two!");
		eq.stop_timer("split");
		eq.spawn2(243622, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(243622, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
		eq.depop();
	end
end

function Text1_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"Your footsteps break the silence in the caverns. Your activity has alarmed nearby scouts looking to please their master with information of an intruder.  Perhaps it wasn't so wise of you to come here...");
		eq.depop_with_timer();
	end
end

function Text2_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"Something large and menacing claws at the rocks just ahead. The scrapes grind with the anticipation of the slaughter soon to come. Whatever beast lingers ahead knows that it is almost time to unleash its fury and serve the master that put it here.");
		eq.depop_with_timer();
	end
end

function Victim_Death(e)
		local rand = math.random(1,5); 
		if (rand == 1) then
			e.self:CastSpell(4173,e.self:GetID()); --mental renewal
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"This soul breaks free and grants you a gift as thanks.");
		elseif (rand == 2) then
			eq.spawn2(243684,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.spawn2(243684,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.spawn2(243684,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"You have disturbed a group of feeding spiders by touching this victim!");
		elseif (rand == 3) then
			e.self:CastSpell(4174,e.self:GetID()); --physical renewal
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"This soul breaks free and grants you a gift as thanks.");
		elseif (rand == 4) then
			e.self:CastSpell(4175,e.self:GetID()); --renewal
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"This soul breaks free and grants you a gift as thanks.");
		elseif (rand == 5) then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"You have set this poor soul free of its evil entrapment.");
		end
end

function event_encounter_load(e)
  eq.register_npc_event('mmcc', Event.timer,          243622, Agent_Timer);
  eq.register_npc_event('mmcc', Event.combat,         243622, Agent_Combat);
  eq.register_npc_event('mmcc', Event.hp,         243622, Agent_Hp);
  eq.register_npc_event('mmcc', Event.combat,         243682, Text1_Combat);
  eq.register_npc_event('mmcc', Event.combat,         243683, Text2_Combat);
  eq.register_npc_event('mmcc', Event.combat,         243678, Lookout_Combat);
  eq.register_npc_event('mmcc', Event.spawn,         243678, Lookout_Spawn);
  eq.register_npc_event('mmcc', Event.timer,         243678, Lookout_Timer);
  eq.register_npc_event('mmcc', Event.combat,         243000, Lookout_Combat);
  eq.register_npc_event('mmcc', Event.spawn,         243000, Lookout_Spawn);
  eq.register_npc_event('mmcc', Event.timer,         243000, Lookout_Timer);
  eq.register_npc_event('mmcc', Event.death, 243642, Victim_Death);
  eq.register_npc_event('mmcc', Event.death, 243648, Victim_Death);
  eq.register_npc_event('mmcc', Event.death, 243650, Victim_Death);
  eq.register_npc_event('mmcc', Event.death, 243657, Victim_Death);
  eq.register_npc_event('mmcc', Event.death, 243674, Victim_Death);
  
  eq.register_npc_event('mmcc', Event.death_complete, 243636, Guardian_Death);
  eq.register_npc_event('mmcc', Event.death_complete, 243677, Fake_Death);
  eq.register_npc_event('mmcc', Event.spawn,          243677, Fake_Spawn);
  eq.register_npc_event('mmcc', Event.timer,          243677, Fake_Timer);
  eq.register_npc_event('mmcc', Event.combat,         243677, Fake_Combat);

  eq.register_npc_event('mmcc', Event.death_complete, 243672, Real_Death);
  eq.register_npc_event('mmcc', Event.spawn,          243672, Real_Spawn);
  eq.register_npc_event('mmcc', Event.timer,          243672, Real_Timer);
  eq.register_npc_event('mmcc', Event.combat,         243672, Real_Combat);
end
