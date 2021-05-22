-- Encounter: LDoN Raid: Deepest Guk: Ritualist of Hate
-- Zone: gukg / 259
--
local instance_id;
local lockout_bit;
local lockouts;
local raid;
local qglobals;

function Zone_Spawn(e)
  lockouts = {
    [259047] = { 'GUKG_Leklos', 1, Spawn_Leklos },
    [259129] = { 'GUKG_Creeper', 2, Spawn_Creeper },
    [259135] = { 'GUKG_Spore', 4, Spawn_Spore },
    [259151] = { 'GUKG_Gragna', 8, Spawn_Gragna },
    [259154] = { 'GUKG_Keeper', 16, Spawn_Keeper }
  }

  qglobals = eq.get_qglobals();
  instance_id = eq.get_zone_instance_id();
  raid = eq.get_characters_in_instance(instance_id);
  lockout_bit = tonumber(qglobals[instance_id .. "_gukg_bit"]);
  if (lockout_bit == nil) then
    lockout_bit = 0 
    eq.set_global(instance_id .. "_gukg_bit", tostring(lockout_bit), 7, "H6");
  end

  if (bit.band(lockout_bit, 1) == 0 ) then
    Spawn_Leklos();
  elseif (bit.band(lockout_bit, 2) == 0 ) then  
    Spawn_Creeper();
  elseif (bit.band(lockout_bit, 4) == 0 ) then  
    Spawn_Spore();
  elseif (bit.band(lockout_bit, 8) == 0 ) then  
    Spawn_Gragna();
  elseif (bit.band(lockout_bit, 16) == 0 ) then  
    Spawn_Keeper();
  end
end

function Zone_Signal(e)
  if ( lockouts[e.signal] ~= nil ) then
    Update_Lockout( lockouts[ e.signal ] );
  end
end

function Update_Lockout(lockout)
  local qglobals = eq.get_qglobals();
  local name = lockout[1];
  local lockout_bit  = lockout[2];
  local current_bit = tonumber(qglobals[instance_id.."_gukg_bit"]);    
  local new_bit = tostring(bit.bor(current_bit,lockout_bit));

  eq.set_global(instance_id.."_gukg_bit", new_bit,7,"H6");
end

function Spawn_Leklos()
  eq.spawn2(259047, 0, 0, 583, -70, 2.13, 368); -- NPC: #Leklos_the_Bonekeeper
end

function Pop_Leklos()
eq.set_next_hp_event(25);
end

function Leklos_Hp(e)
	if (e.hp_event == 25) then
		e.self:SendIllusionPacket({race=349});
		eq.set_next_inc_hp_event(27); --to reset on event failure
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 150,"Chunks of decaying flesh pelt your armor as the decayed froglok reveals his skeletal innards.");
	elseif (e.inc_hp_event == 27) then
		e.self:SendIllusionPacket({race=350});
		eq.set_next_hp_event(25);
  	end
end

function Leklos_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
	end
end


function Mini_Timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 530) then
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 6 * 1000);
			end
	end
end

function Warrior_Signal(e)
  if (e.signal == 1) then
 	eq.start(1); -- start the grid (one way depop)
  end
end

function Evoker_Signal(e)
  if (e.signal == 1) then
 	eq.start(2); -- start the grid (one way depop)
  end
end


function Spawn_Creeper()
  eq.spawn2(259129, 0, 0, -97, 328, -23, 260); -- NPC: #The_Cavern_Creeper
end

function Leklos_Death(e)
  eq.signal(259159, 259047); -- NPC: zone_status
  Spawn_Creeper();
  e.self:Emote(" falls to the ground a lifeless pile of bones.");
  eq.zone_emote(10,"A Warrior of Gukta says, 'Thank you for the help adventurers, but you must hurry deeper into the cavern. Some of our resident Evokers are trying to take care of a cursed creature that ambushed some of us on the way down. I am sure they could use your help. Please listen for chanting and you should find them easily. We shall make our way back to Gukta and report to the others what is going on.");
  eq.signal(259040,1); --signal npcs to path to zi and depop
  eq.signal(259039,1); --signal npcs to path to zi and depop
end

function Spawn_Spore()
  eq.spawn2(259135, 0, 0, -160, 1034, -97, 272); -- NPC: #The_Cursed_Spore
end

function Pop_Cursed()
eq.set_next_hp_event(90);
end

function Cursed_Hp(e)
	if (e.hp_event == 90) then
		eq.set_next_hp_event(75);
		eq.zone_emote(15,"A blue light engulfs the Prophets as they summon forth the power of Mithaniel reducing the Cursed Spore's inherent resistance to changes in its attack speed. Prophet of Gukta says, 'The ritual has been a a slight success. We have broken through one of this cursed beings immunities. Try reducing its attack speed while we prepare for the next part of the ritual.");
		e.self:SetSpecialAbility(12, 0);
		eq.set_next_inc_hp_event(92); --to reset on event failure
	elseif (e.hp_event == 75) then
		eq.set_next_hp_event(50);
		eq.zone_emote(15,"A blue light engulfs the Prophets as they summon forth the power of Mithaniel reducing all of the Cursed Spore's inherent resistances slightly. Prophet of Gukta says, 'Keep it up everyone, because of the damage you have done we were able to force another weakness upon it. You should be able to cast a little more effectively now but we will need more time before we can increase your effectiveness.");
		e.self:ModifyNPCStat("mr", "400");
		e.self:ModifyNPCStat("fr", "400");
		e.self:ModifyNPCStat("cr", "400");
		e.self:ModifyNPCStat("pr", "400");
		e.self:ModifyNPCStat("dr", "400");
		eq.set_next_inc_hp_event(77); --to reset on event failure
	elseif (e.hp_event == 50) then
		eq.set_next_hp_event(25);
		eq.zone_emote(15,"A blue light engulfs the Prophets as they summon forth the power of Mithaniel significantly reducing all of the Cursed Spore's inherent resistances. Prophet of Gukta says, 'Excellent, we have reduced his resistance to all magical abilities even more, keep distracting him while we prepare for the final part of the ritual.");
		e.self:ModifyNPCStat("mr", "100");
		e.self:ModifyNPCStat("fr", "100");
		e.self:ModifyNPCStat("cr", "100");
		e.self:ModifyNPCStat("pr", "100");
		e.self:ModifyNPCStat("dr", "100");
		eq.set_next_inc_hp_event(52); --to reset on event failure
	elseif (e.hp_event == 25) then		
		eq.zone_emote(15,"A blue light engulfs the Prophets as they summon forth the power of Mithaniel completely removing all of the Cursed Spore's inherent resistances. Prophet of Gukta says, 'The ritual is complete and we have been very successful. His ability to resist your magic should be almost non-existent.");
		e.self:ModifyNPCStat("mr", "50");
		e.self:ModifyNPCStat("fr", "50");
		e.self:ModifyNPCStat("cr", "50");
		e.self:ModifyNPCStat("pr", "50");
		e.self:ModifyNPCStat("dr", "50");
		eq.set_next_inc_hp_event(27); --to reset on event failure
	elseif (e.inc_hp_event == 27) then
		e.self:ModifyNPCStat("mr", "100");
		e.self:ModifyNPCStat("fr", "100");
		e.self:ModifyNPCStat("cr", "100");
		e.self:ModifyNPCStat("pr", "100");
		e.self:ModifyNPCStat("dr", "100");
		eq.set_next_inc_hp_event(52); --to reset on event failure
	elseif (e.inc_hp_event == 52) then
		e.self:ModifyNPCStat("mr", "400");
		e.self:ModifyNPCStat("fr", "400");
		e.self:ModifyNPCStat("cr", "400");
		e.self:ModifyNPCStat("pr", "400");
		e.self:ModifyNPCStat("dr", "400");
		eq.set_next_inc_hp_event(77); --to reset on event failure
	elseif (e.inc_hp_event == 77) then
		e.self:ModifyNPCStat("mr", "500");
		e.self:ModifyNPCStat("fr", "500");
		e.self:ModifyNPCStat("cr", "500");
		e.self:ModifyNPCStat("pr", "500");
		e.self:ModifyNPCStat("dr", "500");
		eq.set_next_inc_hp_event(92); --to reset on event failure
	elseif (e.inc_hp_event == 92) then
		e.self:SetSpecialAbility(12, 1);
	end
end


function Creeper_Death(e)
  eq.signal(259159, 259129); -- NPC: zone_status
  eq.signal(259128,1); --signal npcs to path to zi and depop
  eq.spawn2(259136, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()+5, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()+10, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()+15, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()+20, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX(), e.self:GetY() + 5, e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()-5, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()-10, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()-15, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  eq.spawn2(259136, 0, 0, e.self:GetX()-20, e.self:GetY(), e.self:GetZ(), 0); -- NPC: a_cavern_crawler
  Spawn_Spore();
end

function Spawn_Gragna()
  eq.spawn2(259151, 0, 0, -339, 497, -2, 0); -- NPC: #Gragna_the_Cursed
end

function Gragna_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
	end
end


function Gragna_Timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < -380) then
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 6 * 1000);
			end
	end
end

function Spore_Death(e)
  eq.signal(259159, 259135); -- NPC: zone_status
  Spawn_Gragna();
end

function Spawn_Keeper()
  eq.spawn2(259154, 0, 0, -723, 766, -27, 114); -- NPC: #The_Cursed_Keeper
end

function Gragna_Death(e)
  eq.signal(259159, 259151); -- NPC: zone_status
  eq.signal(259149,1); --signal npcs to path to zi and depop
  eq.signal(259150,1); --signal npcs to path to zi and depop
  Spawn_Keeper();
end

function Knight_Signal(e)
  if (e.signal == 1) then
 	eq.start(3); -- start the grid (one way depop)
  end
end

function Keeper_Death(e)
  eq.signal(259159, 259154); -- NPC: zone_status

  -- Bidip`s Ornate Chest
  eq.spawn2(259158, 0, 0, -725, 786, -27, 114); -- NPC: #Bidip`s_Ornate_Chest

  -- Cursed Keepers` Slimy Chest
  eq.spawn2(259155, 0, 0, -722, 756, -27, 114); -- NPC: #Cursed_Keepers`_Slimy_Chest

  -- Gragna`s Worn Chest
  eq.spawn2(259156, 0, 0, -689, 734, -27, 114); -- NPC: #Gragna`s_Worn_Chest

  -- Leklos` Bonepile
  eq.spawn2(259157, 0, 0, -674, 814, -27, 328); -- NPC: #Leklos`_Bonepile

  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("4d12h"))
  end

end

function event_encounter_load(e)
  eq.register_npc_event('gukg', Event.spawn,  259159, Zone_Spawn);
  eq.register_npc_event('gukg', Event.signal, 259159, Zone_Signal);
  
  eq.register_npc_event('gukg', Event.signal, 259149, Knight_Signal);
  eq.register_npc_event('gukg', Event.signal, 259150, Knight_Signal);
  eq.register_npc_event('gukg', Event.signal, 259128, Evoker_Signal);
  eq.register_npc_event('gukg', Event.signal, 259039, Warrior_Signal);
  eq.register_npc_event('gukg', Event.signal, 259040, Warrior_Signal);
  eq.register_npc_event('gukg', Event.hp, 259135, Cursed_Hp);
  eq.register_npc_event('gukg', Event.spawn, 259135, Pop_Cursed);
  eq.register_npc_event('gukg', Event.combat,         259151, Gragna_Combat);
  eq.register_npc_event('gukg', Event.timer,         259151, Gragna_Timer);
  eq.register_npc_event('gukg', Event.combat,         259047, Leklos_Combat);
  eq.register_npc_event('gukg', Event.timer,         259047, Mini_Timer);
  eq.register_npc_event('gukg', Event.spawn, 259047, Pop_Leklos);
  eq.register_npc_event('gukg', Event.hp, 259047, Leklos_Hp);
  eq.register_npc_event('gukg', Event.death_complete, 259047, Leklos_Death);
  eq.register_npc_event('gukg', Event.death_complete, 259129, Creeper_Death);
  eq.register_npc_event('gukg', Event.death_complete, 259135, Spore_Death);
  eq.register_npc_event('gukg', Event.death_complete, 259151, Gragna_Death);
  eq.register_npc_event('gukg', Event.death_complete, 259154, Keeper_Death);
end
