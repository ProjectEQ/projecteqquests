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

function Warrior_Spawn(e)
eq.set_timer("emotes", 5 * 1000);
eq.set_timer("animation", math.random(2,3) * 1000);
end

function Minion_Spawn(e)
eq.set_timer("animation", math.random(2,3) * 1000);
end

function Warrior_Timer(e)
	if(e.timer == "emotes") then
		eq.stop_timer("emotes");
			local rand = math.random(1,100);
			if (rand <= 33) then
				eq.get_entity_list():MessageClose(e.self, false, 100, 0, "Warrior of Gukta shouts, 'Have at thee you demon spawn, I shall not fall so easily.");
			elseif (rand <= 66 and rand > 33) then
				eq.get_entity_list():MessageClose(e.self, false, 100, 0, "Warrior of Gukta shouts, 'Ha ha did you think a flesh wound would stop a Guktan Warrior.  You will have to do better then that.");
			elseif (rand > 66) then
				eq.get_entity_list():MessageClose(e.self, false, 100, 0, "Warrior of Gukta shouts, 'Back you spawn of evil, the warriors of Gukta shall always prevail.");
			end
		eq.set_timer("emotes", math.random(30,45) * 1000);
	elseif(e.timer == "animation") then
		e.self:DoAnim(8); -- mainhand slash
	end
end

function Warrior_Signal(e)
  if (e.signal == 1) then
 	eq.start(1); -- start the grid (one way depop)
	eq.stop_timer("emotes");
	eq.stop_timer("animation");
	e.self:SetRunning(true);
  end
end

function Evoker_Signal(e)
  if (e.signal == 1) then
 	eq.start(2); -- start the grid (one way depop)
	e.self:SetRunning(true);
  end
end

function Prophet_Signal(e)
  if (e.signal == 1) then
 	eq.start(4); -- start the grid (one way depop)
	e.self:SetRunning(true);
  end
end

function Flavor_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"Master Evoker of Gukta says, 'You must hurry, I thought we could handle this with just the four of us so we told the others to go on ahead but the ritual has taken so much out of me that we are barely managing to contain that creature in the room.  We need your help, if you can distract it my apprentices may be able to complete the ritual which will cut off its source of dark power.");
		eq.depop_with_timer();
	end
end

function Text1_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"You hear the sound of chanting coming from deeper within the dungeon, an invisible force seems to be pulling you east.");
		eq.depop_with_timer();
	end
end

function Text2_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"You hear chanting coming from below you to the north.");
		eq.depop_with_timer();
	end
end

function Text3_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"Whispers of several voices can be heard from straight ahead.");
		eq.depop_with_timer();
	end
end

function Text4_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"The sound of chanting echoes from the left.");
		eq.depop_with_timer();
	end
end

function Text5_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"An evil aura calls to you from the left.");
		eq.depop_with_timer();
	end
end

function Text6_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"An evil aura calls to you from the right.");
		eq.depop_with_timer();
	end
end

function Spawn_Creeper()
  eq.spawn2(259129, 0, 0, -97, 328, -23, 260); -- NPC: #The_Cavern_Creeper
end

function Pop_Creeper(e)
eq.set_next_hp_event(85);
end

function Creeper_Hp(e)
	if (e.hp_event == 85) then -- is anything supposed to change?
		eq.zone_emote(15,"A mystical energy surrounds the Evokers as they chant. The Cavern Creeper begins to writhe as its link to the dark properties of the area begins to wane. The Master Evoker of Gukta says, 'It worked, we have managed to surround the vile beast in a weak shield of magic which slows down the flow of evil energy which empowers him. We will need more time to strengthen the shield and cut off the energy fully.");
		eq.set_next_hp_event(75);
	elseif (e.hp_event == 75) then -- is anything supposed to change?
		eq.zone_emote(15,"A mystical energy surrounds the Evokers as they chant. The Cavern Creeper begins to writhe as its link to the dark properties of the area begins to wane. The Master Evoker of Gukta says, 'It worked, we have managed to surround the vile beast in a weak shield of magic which slows down the flow of evil energy which empowers him. We will need more time to strengthen the shield and cut off the energy fully.");
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then -- is anything supposed to change?
		eq.zone_emote(15,"A mystical energy surrounds the Evokers as they chant. The Cavern Creeper begins to writhe as its link to the dark properties of the area is severed completely. The Master Evoker of Gukta says, 'Excellent, we were able to complete the spell, he should no longer be able to draw on the evil energy within the area. Kill him quickly we can only keep this up for so long.");
	end
end

function Leklos_Death(e)
  eq.signal(259159, 259047); -- NPC: zone_status
  Spawn_Creeper();
  e.self:Emote(" falls to the ground a lifeless pile of bones.");
  eq.zone_emote(15,"A Warrior of Gukta says, 'Thank you for the help adventurers, but you must hurry deeper into the cavern. Some of our resident Evokers are trying to take care of a cursed creature that ambushed some of us on the way down. I am sure they could use your help. Please listen for chanting and you should find them easily. We shall make our way back to Gukta and report to the others what is going on.");
  eq.signal(259040,1); --signal npcs to path to zi and depop
  eq.signal(259039,1); --signal npcs to path to zi and depop
  eq.spawn2(259126, 0, 0, 364, -70, -3, 272); -- NPC: Text1 (259126)
  eq.spawn2(259127, 0, 0, -50, 28, 4, 272); -- NPC: Text2 (259127)
end

function Spawn_Spore()
  eq.spawn2(259135, 0, 0, -160, 1034, -97, 272); -- NPC: #The_Cursed_Spore
end

function Pop_Cursed(e)
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
  eq.zone_emote(15,"One of the Evoker's shakes his head once and then says, 'Thank you for your assistance my friends. Some of our Shamans have made their way to the north in an effort to contain another of the Keeper's evil minions. Please head to the north and listen for voices this should help you find them.  We will head back to Gukta and report on your progress. The Master Evoker will stay and help when he can.");
  eq.zone_emote(15,"Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
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
  eq.spawn2(259130, 0, 0, -153, 754, -60, 272); -- NPC: Text3 (259130)
  Spawn_Spore();
end

function Spawn_Gragna()
  eq.spawn2(259151, 0, 0, -339, 497, -2, 0); -- NPC: #Gragna_the_Cursed
end

function Gragna_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		eq.set_timer("heal", 65 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
		eq.stop_timer("heal");
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
	elseif (e.timer == "heal") then
		eq.zone_emote(15,"The four healers begin to glow increasing the power of the Paladin. Knight of Gukta says, 'Oh great Mithaniel please bless these great fighters with your healing touch.");
		e.self:CastedSpellFinished(4458, e.self:GetHateTop()); -- Spell: Mithaniel's Blessing
	end
end

function Spore_Death(e)
  eq.signal(259159, 259135); -- NPC: zone_status
  eq.zone_emote(15,"Prophet of Gukta says, 'Your assistance has helped turn the tide of battle, but it is not over yet.  The Cursed Keeper knows you are here and he has sent more minions to hinder your progress.  You must continue on as time is running short. Four of our clerics and a paladin have run ahead to take care of the kidnapper Gragna but they will need your help. Listen for his voice and you should be able to find him. We will return to Gukta and make a report on your progress.");
  eq.zone_emote(15,"You hear a voice from the south. Knight of Gukta shouts, 'Please noble adventurers hurry to me, our time is running short.");
  eq.signal(259134,1); --signal npcs to path to zi and depop
  eq.spawn2(259075, 0, 0, -193, 699, -61, 17); -- a_blighted_Jin_master (259075)
  eq.spawn2(259104, 0, 0, -179, 699, -61, 17); -- a_cackling_Dar_assassin (259104)
  eq.spawn2(259107, 0, 0, -169, 699, -61, 17); -- a_cursed_recluse (259107)
  eq.spawn2(259119, 0, 0, -147, 699, -61, 17); -- a_doomed_Yunta_witchdoctor (259119)
  eq.spawn2(259119, 0, 0, -132, 699, -61, 17); -- a_doomed_Yunta_witchdoctor (259119)
  eq.spawn2(259131, 0, 0, -134, 442, -21, 272); -- NPC: Text4 (259131)
  eq.spawn2(259131, 0, 0, -456, 450, -39, 272); -- NPC: Text4 (259131)
  Spawn_Gragna();
end

function Spawn_Keeper()
  eq.spawn2(259154, 0, 0, -723, 766, -27, 114); -- NPC: #The_Cursed_Keeper
end

function Pop_Keeper(e)
eq.set_next_hp_event(50);
end


function Keeper_Hp(e)
	if (e.hp_event == 50) then
		e.self:SetSpecialAbility(5, 0);
		e.self:SetSpecialAbility(4, 1);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		e.self:SetSpecialAbility(4, 0);
		eq.set_next_inc_hp_event(22); --to reset on event failure
	elseif (e.inc_hp_event == 22) then
		e.self:SetSpecialAbility(4, 1);
		eq.set_next_inc_hp_event(52); --to reset on event failure
	elseif (e.inc_hp_event == 52) then
		e.self:SetSpecialAbility(5, 1);
		e.self:SetSpecialAbility(4, 0);
		eq.set_next_hp_event(50);
	end
end

function Gragna_Death(e)
  eq.signal(259159, 259151); -- NPC: zone_status
  eq.signal(259149,1); --signal npcs to path to zi and depop
  eq.signal(259150,1); --signal npcs to path to zi and depop
  eq.zone_emote(15,"Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
  eq.zone_emote(13,"As the final blow is struck an angry voice fills the halls. The Cursed Keeper says, 'You meddlesome fools, you have ruined my plans, but I shall have my retribution. Come to me if you dare and I will show you the glory of everlasting pain.");
  eq.zone_emote(5,"You hear the voice of the master evoker in your mind, 'Your efforts have paid off, we have stopped him from accomplishing his plans and now we must ask that you destroy him while he is weak. Please make haste to the back of the dungeon and rescue our brethren.");
  eq.spawn2(259132, 0, 0, -454, 578, -23, 272); -- NPC: Text5 (259132)
  eq.spawn2(259133, 0, 0, -462, 738, -26, 272); -- NPC: Text6 (259133)
  Spawn_Keeper();
end

function Knight_Signal(e)
  if (e.signal == 1) then
 	eq.start(3); -- start the grid (one way depop)
	e.self:SetRunning(true);
  end
end

function Bidip_Signal(e)
	e.self:SetAppearance(0); --standing
end

function Keeper_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
	end
end


function Keeper_Timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() > -640) then
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 6 * 1000);
			end
	end
end

function Keeper_Death(e)
  eq.signal(259159, 259154); -- NPC: zone_status
  eq.signal(259124,1); --signal Bidip stand up
	
  eq.zone_emote(15,"Your victory has shattered the shroud of magic surrounding the dungeon's treasure.");
  eq.zone_emote(15,"Bidip Moktu stands up and shakes his head in an effort to regain his senses. Realizing that he has been saved he cheers looks at you all and salutes. Bidip Moktu says, 'Thank you so much for saving me. Please take this chest as a token of my gratitude.");

  -- Bidip`s Ornate Chest
  eq.spawn2(259158, 0, 0, -725, 786, -27, 114); -- NPC: #Bidip`s_Ornate_Chest

  -- Cursed Keepers` Slimy Chest
  eq.spawn2(259155, 0, 0, -722, 756, -27, 114); -- NPC: #Cursed_Keepers`_Slimy_Chest

  -- Gragna`s Worn Chest
  eq.spawn2(259156, 0, 0, -689, 734, -27, 473); -- NPC: #Gragna`s_Worn_Chest

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
  
  eq.register_npc_event('gukg', Event.hp, 259154, Keeper_Hp);
  eq.register_npc_event('gukg', Event.spawn, 259154, Pop_Keeper);
  eq.register_npc_event('gukg', Event.hp, 259129, Creeper_Hp);
  eq.register_npc_event('gukg', Event.spawn, 259129, Pop_Creeper);
  eq.register_npc_event('gukg', Event.spawn, 259039, Minion_Spawn);
  eq.register_npc_event('gukg', Event.spawn, 259040, Warrior_Spawn);
  eq.register_npc_event('gukg', Event.timer, 259040, Warrior_Timer);
  eq.register_npc_event('gukg', Event.timer, 259039, Warrior_Timer);
  eq.register_npc_event('gukg', Event.signal, 259149, Knight_Signal);
  eq.register_npc_event('gukg', Event.signal, 259134, Prophet_Signal);
  eq.register_npc_event('gukg', Event.signal, 259150, Knight_Signal);
  eq.register_npc_event('gukg', Event.signal, 259124, Bidip_Signal);
  eq.register_npc_event('gukg', Event.signal, 259128, Evoker_Signal);
  eq.register_npc_event('gukg', Event.signal, 259039, Warrior_Signal);
  eq.register_npc_event('gukg', Event.signal, 259040, Warrior_Signal);
  eq.register_npc_event('gukg', Event.hp, 259135, Cursed_Hp);
  eq.register_npc_event('gukg', Event.spawn, 259135, Pop_Cursed);
  eq.register_npc_event('gukg', Event.combat,         259054, Flavor_Combat);
  eq.register_npc_event('gukg', Event.combat,         259126, Text1_Combat);
  eq.register_npc_event('gukg', Event.combat,         259127, Text2_Combat);
  eq.register_npc_event('gukg', Event.combat,         259130, Text3_Combat);
  eq.register_npc_event('gukg', Event.combat,         259131, Text4_Combat);
  eq.register_npc_event('gukg', Event.combat,         259132, Text5_Combat);
  eq.register_npc_event('gukg', Event.combat,         259133, Text6_Combat);
  eq.register_npc_event('gukg', Event.combat,         259151, Gragna_Combat);
  eq.register_npc_event('gukg', Event.timer,         259151, Gragna_Timer);
  eq.register_npc_event('gukg', Event.combat,         259154, Keeper_Combat);
  eq.register_npc_event('gukg', Event.timer,         259154, Keeper_Timer);
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
