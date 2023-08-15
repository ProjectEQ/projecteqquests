local extra_loot = false;
local researchers = 0;
local swarm_number = 0;

-- Steelslave Researcher (not from final encounter)
function Researcher_Death(e)

  local el = eq.get_entity_list();
  if not el:IsMobSpawnedByNpcTypeID(260061) then
     eq.zone_emote(MT.Yellow,"Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
     eq.zone_emote(MT.Yellow,"Our master be warned, the Wayfarers are on their way!");
    -- Flawed Mutation
    eq.spawn2(260062, 0, 0, 1382, -128, 140, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1406, -119, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1419, -117, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1398, -104, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1354, -17, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1359, -26, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1367, -31, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1363, -27, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1372, -10, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1377, -18, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1375, -31, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1383, -24, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1393, -12, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1403, -7, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1381, -18, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1375, -2, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation

    -- Flawless Experimental Battlelord
    eq.spawn2(260069, 0, 0, 1538, -61, 146, 376); -- NPC: Flawless_Experimental_Battlelord

    -- Steeslave Researcher
    eq.spawn2(260070, 0, 0, 1541, -80, 144, 504); -- NPC: Steelslave_Researcher_
    eq.spawn2(260070, 0, 0, 1534, -44, 143, 242); -- NPC: Steelslave_Researcher_

    -- Flawless Experimental Brute
    eq.spawn2(eq.ChooseRandom(260063,260072), 0, 0, 1344, -71, 143, 368); -- NPC: Flawless_Experimental_Brute war or rog
    eq.spawn2(eq.ChooseRandom(260063,260072), 0, 0, 1422, -35, 143, 340); -- NPC: Flawless_Experimental_Brute war or rog
    eq.spawn2(eq.ChooseRandom(260063,260072), 0, 0, 1427, -84, 143, 392); -- NPC: Flawless_Experimental_Brute war or rog
	
    --a barrel
    eq.spawn2(260015, 0, 0, 1453.42, -41.34, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1444.42, -1.33, 145.11, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1451.88, -11.19, 144.53, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1451.35, -25.59, 143.57, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1450.98, -35.55, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1440.05, -17.74, 144.07, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1439.32, -10.40, 145.11, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1422.83, 4.03, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1353.75, -3.58, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1344.28, -19.37, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1360.22, -9.19, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1370.50, -133.16, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1365.93, -122.87, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1422.14, -186.57, 147.88, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1491.39, -192.75, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1502.46, -193.21, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1510.66, -186.56, 143.77, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1506.50, -179.12, 143.38, 242); -- a_barrel
    eq.spawn2(260015, 0, 0, 1540.89, -169.25, 143.38, 242); -- a_barrel
  end
end

-- Violent Research Subject
function Subject_Death(e)
	
if (e.self:GetNPCTypeID() == 260060) then --goblin
eq.signal(260019,4); --Steelslave_Research_Assistant (260019)
end

if (e.self:GetNPCTypeID() == 260044) then --bear
eq.signal(260019,3); --Steelslave_Research_Assistant (260019)
end

if (e.self:GetNPCTypeID() == 260021) then --boar
eq.signal(260019,2); --Steelslave_Research_Assistant (260019)
end

if (e.self:GetNPCTypeID() == 260038) then --wolf
eq.signal(260019,1); --Steelslave_Research_Assistant (260019)
end
	
  eq.zone_emote(MT.Yellow, "The sounds of crumbling stone, digging miners, and the bellows of slave masters don't mask the cries of tortured slaves and beasts.  The orcs take great pleasure in causing as much pain to these creatures as possible.  Be careful, or you shall become a victim of their sadistic games.");

  local el = eq.get_entity_list();
  if not el:IsMobSpawnedByNpcTypeID(260021) and not el:IsMobSpawnedByNpcTypeID(260038) and not el:IsMobSpawnedByNpcTypeID(260044) and not el:IsMobSpawnedByNpcTypeID(260060) then
    -- Steelslave Researcher
    eq.spawn2(260061, 0, 0, 14, 334, 138, 370); -- NPC: Steelslave_Researcher
    eq.spawn2(260061, 0, 0, -41, 326, 140, 124); -- NPC: Steelslave_Researcher
    eq.spawn2(260061, 0, 0, -20, 340, 141, 163); -- NPC: Steelslave_Researcher
  end
end

-- Steelslave_Researcher_ (final encounter)
function Researcher_Combat(e)
  if e.joined then
    eq.set_timer("aggrolink", 3 * 1000);
  else
    eq.stop_timer("aggrolink");
  end
end

function Researcher_Timer(e)
  if (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 260069)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add Flawless_Experimental_Battlelord (260069) to aggro list if alive
		end
		end
  end
end

function Researchers_Death(e)
	researchers = researchers + 1;
		local el = eq.get_entity_list();
  		if researchers == 2 and el:IsMobSpawnedByNpcTypeID(260069) then --check if boss is alive still when 2 researchers die , give bonus loot
    			eq.zone_emote(MT.Yellow, "Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
			extra_loot = true;
  		end
end

-- Flawless Experimental Battlelord
function Battlelord_Combat(e)
  if e.joined then
    eq.set_timer("swarm", 120 * 1000);
    eq.set_timer("throw", 60 * 1000);
    eq.set_timer("aggrolink", 3 * 1000);
    eq.stop_timer("resetadds");
  else
    eq.stop_timer("swarm");
    eq.stop_timer("throw");
    eq.stop_timer("aggrolink");
		eq.set_timer("resetadds", 30 * 1000);
  end
end

function Battlelord_Timer(e)
  if (e.timer == "swarm") then
    e.self:Emote("roars as his muscles bulge to gargantuan proportions!");
    eq.modify_npc_stat("min_hit", "1500");
    eq.modify_npc_stat("max_hit", "5000");
    e.self:ChangeSize(23);
    if (swarm_number == 0) then
				swarm_number = swarm_number +1;
				eq.signal(260062,1); --signal first set of flawed mutation to wake up
				--add flawed mutations to hate list
			elseif (swarm_number == 1) then
				swarm_number = swarm_number +1;
				eq.signal(260091,1); --signal second set of flawed mutation to wake up
				--add flawed mutations to hate list
			elseif (swarm_number == 2) then
				swarm_number = swarm_number +1;
				eq.signal(260092,1); --signal second set of flawed mutation to wake up
				--add flawed mutations to hate list
			end
    eq.set_timer("weaken", 6 * 1000);
		eq.set_timer("linkmutation", 1 * 1000);
  elseif (e.timer == "weaken") then
    e.self:Emote("calms down slightly");
    e.self:ChangeSize(22);
    eq.modify_npc_stat("min_hit", "1400");
    eq.modify_npc_stat("max_hit", "4800");
    eq.stop_timer("weaken");
    eq.set_timer("weakentwo", 6 * 1000);
  elseif (e.timer == "weakentwo") then
    e.self:Emote("calms down slightly");
    e.self:ChangeSize(21);
    eq.modify_npc_stat("min_hit", "1300");
    eq.modify_npc_stat("max_hit", "4600");
    eq.stop_timer("weakentwo");
    eq.set_timer("weakenthree", 6 * 1000);
  elseif (e.timer == "weakenthree") then
    e.self:Emote("calms down slightly");
    e.self:ChangeSize(20);
    eq.modify_npc_stat("min_hit", "1150");
    eq.modify_npc_stat("max_hit", "4000");
    eq.stop_timer("weakenthree");
  elseif (e.timer == "throw") then
	hate_list = e.self:CountHateList();
    		if (hate_list ~= nil and tonumber(hate_list) == 1) then
			e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
		elseif (hate_list ~= nil and tonumber(hate_list) == 2) then
			e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			local target = e.self:GetHateTop()
      			if target.valid then
        			eq.get_entity_list():RemoveFromHateLists(target)
			end
		elseif (hate_list ~= nil and tonumber(hate_list) == 3) then
			e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			local target = e.self:GetHateTop()
      			if target.valid then
        			eq.get_entity_list():RemoveFromHateLists(target)
			end
		elseif (hate_list ~= nil and tonumber(hate_list) == 4) then
			e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			local target = e.self:GetHateTop()
      			if target.valid then
        			eq.get_entity_list():RemoveFromHateLists(target)
			end
		elseif (hate_list ~= nil and tonumber(hate_list) == 5) then
			e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			local target = e.self:GetHateTop()
      			if target.valid then
        			eq.get_entity_list():RemoveFromHateLists(target)
			end
		elseif (hate_list ~= nil and tonumber(hate_list) >= 6) then
			e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			local target = e.self:GetHateTop()
      			if target.valid then
        			eq.get_entity_list():RemoveFromHateLists(target)
			end
		end
  elseif (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 260070)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add Steelslave_Researcher_ to aggro list if alive
		end
		end
	elseif (e.timer == "resetadds") then
		eq.stop_timer("resetadds");
		
		eq.depop_all(260091); -- NPC: Flawed_Mutation
		eq.depop_all(260092); -- NPC: Flawed_Mutation
		eq.depop_all(260062); -- NPC: Flawed_Mutation
		
		eq.spawn2(260062, 0, 0, 1382, -128, 140, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1406, -119, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1419, -117, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1398, -104, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1354, -17, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1359, -26, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1367, -31, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1363, -27, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1372, -10, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260091, 0, 0, 1377, -18, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1375, -31, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1383, -24, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1393, -12, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1403, -7, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1381, -18, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260092, 0, 0, 1375, -2, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
		
		swarm_number = 0;
	elseif (e.timer == "linkmutation") then
		eq.stop_timer("linkmutation");
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 260062 or npc:GetNPCTypeID() == 260091 or npc:GetNPCTypeID() == 260092)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add Flawed Mutations to aggro list if alive
		end
		end
  end
end

-- Flawless Experimental Battlelord
function Battlelord_Death(e)
  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("4d12h"))
  end

  -- Flawed Mutations
  eq.depop_all(260062);
	eq.depop_all(260092);
	eq.depop_all(260091);
  eq.zone_emote(MT.Yellow,"You have put a stop to an imminent danger to Norrath. The orc responsible for the creation of these gargantuan beasts has fled to continue his plots of orcish superiority. You have helped the Wayfarer's Brotherhood to eliminate a threat the the world was not yet ready for.");
  eq.zone_emote(MT.Yellow,"Your victory has shattered the shroud of magic cloaking the dungeon's treasure.");

  -- Event Loot
  -- #Researcher`s Box of Supplies
  eq.spawn2(260066, 0, 0, 1499, -168, 140, 0); -- NPC: #Researcher`s_Box_of_Supplies
  -- #The Bloody Barrel
  eq.spawn2(260064, 0, 0, 1497, -185, 145, 0); -- NPC: #The_Bloody_Barrel
	  if extra_loot then
  		-- #The Splintering Barrel
  		eq.spawn2(260065, 0, 0, 1496, -179, 145, 0); -- NPC: #The_Splintering_Barrel
	  end
end

function Text1_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The halls ahead bustle with activity.  The sounds of weapons clanging against racks and the low rumble of dozens of armored creatures suggest that the Wayfarers Brotherhood didn't know half as much as they thought about the treasure you're after.  This is not the same quiet place Crispen and Nevlen scouted just a few days ago.");
eq.depop_with_timer();
end
end

function Text2_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"It would seem that war provisions are being readied and weapons are stacked neatly.  The low hum of distant murmurs catches your ears, and though you can't make out what they say, there is an urgency in the tone.");
eq.depop_with_timer();
end
end

function Text3_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"A disturbing howl, trembling with what sounds like panic, comes at you from the halls to the east.  The callous grunts and squeals of workaday orcs and their tortured servants taint the air from the west.  In either direction, there are creatures that must be dealt with.");
eq.depop_with_timer();
end
end

function Text4_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The wails of anger and agony rise to a fever pitch.  The stench of panic, fear, and hate creeps down the cavern.  Is this a beast you want to rescue from whatever foul fate has befallen it?");
eq.depop_with_timer();
end
end

function Text5_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The relative silence is shattered by enraged howls and the sound of frenzied clawing against stone.  Somewhere, a captor continues its torment of a creature.  Chances are that one of the beasts you need to destroy to stop the serum from being completed is close by.");
eq.depop_with_timer();
end
end

function Text6_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The sounds of crumbling stone, digging miners, and the bellows of slave masters don't mask the cries of tortured slaves and beasts.  The orcs take great pleasure in causing as much pain to these creatures as possible.  Be careful, or you shall become a victim of their sadistic games.");
eq.depop_with_timer();
end
end

function Text7_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The orcs stare prophetically into the fire. One of them sees you out of the corner of its eye and doesn't move.  It's as if they are focused on luring you to them.  Over the roar of the fire, the fierce squeals of a tortured beast bite at the air, seemingly begging for death.");
eq.depop_with_timer();
end
end

function Text8_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The fire dances across the bleeding wounds of an odd-looking boar that is being tortured.  The boar's torturer ignores your presence and methodically goes about the business of removing a sample from the boar's trembling body.  This must be one of the beasts you need to destroy to stop the serum from being completed.");
eq.depop_with_timer();
end
end

function Text9_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"This area was alive with activity before the experiments began.  But all is not quiet.  To the east you hear louder, deeper, and more discontented beastly cries than you've heard so far.  From the north you hear a fainter whining of a tortured beast.  And to the west, there is the perceptible roar of rushing water and noticeably fresher air that is... very alluring.");
eq.depop_with_timer();
end
end

function Text10_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"Back in the days of Rujark and since then, this twisting cavern was used to ambush the unsuspecting. Today, the orcs will likely use it in the same way to prevent you from stopping the sample collection.");
eq.depop_with_timer();
end
end

function Text11_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The animal cries become deafening.  Near the fire, another orc tortures a large bear, its fur matted with blood.  Ending the bear's life is not only compassionate, but will also serve to slow down those that are creating the serum that requires samples from living creatures.");
eq.depop_with_timer();
end
end

function Text12_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"The boxes in the area are newly made.  Strange.  To the west, the whining of an animal has gotten more intense.  Whatever is making that sound is begging for your empathy.  To the east, there is an eerie stillness.  A deceptive silence.");
eq.depop_with_timer();
end
end

function Text13_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"A goblin howls with an unusual cry of agony.  It is a strange aberration that is a product of the serum and needs to be destroyed quickly.  At the opposite end of the tunnel there is a low rumble.  Something dangerous lurks there.");
eq.depop_with_timer();
end
end

function Text14_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"This is clearly not a typical lair for mad research scientists, especially orcish ones.  It is far too insipid a place for such foul experiments.  Perhaps these aren't the primary researchers after all.  You'll have to confront them to find out for sure.");
eq.depop_with_timer();
end
end

function Text15_Combat(e)
if e.joined then
eq.zone_emote(MT.Yellow,"Light pours down from above into this serene setting.  This is where Crispen and Nevlen first found the treasure, but now all you see is death and mayhem.  You must put a stop to this nefarious research once and for all!");
eq.depop_with_timer();
end
end

function Trap_Combat(e)
if e.joined then
e.self:CastSpell(3927,e.other:GetID(),0,0); -- Spell:Dark Infection
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 70,"A claw trap springs forth");
eq.depop_with_timer();
end
end

function Trap2_Combat(e)
if e.joined then
e.self:CastSpell(3943,e.other:GetID(),0,0); -- Spell:Blade Arc
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 70,"A claw trap springs forth");
eq.depop_with_timer();
end
end

function Trap3_Combat(e)
if e.joined then
e.self:CastSpell(3933,e.other:GetID(),0,0); -- Spell:Savage Jaws
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 70,"A claw trap springs forth");
eq.depop_with_timer();
end
end

function Assistant_Signal(e)
	if (e.signal == 1) then
		if(e.self:GetSp2() == 103707) then 
			eq.start(67); -- start the grid (one way depop)
			e.self:SetRunning(true);
			e.self:Emote("Blast! No matter, I've already gotten one sample for the serum! The researchers will be most pleased to have this back in their possession! Fools!");
		end
	elseif (e.signal == 2) then
		if(e.self:GetSp2() == 103593) then 
			eq.start(67); -- start the grid (one way depop)
			e.self:SetRunning(true);
			e.self:Emote("Blast! No matter, I've already gotten one sample for the serum! The researchers will be most pleased to have this back in their possession! Fools!");
		end
	elseif (e.signal == 3) then
		if(e.self:GetSp2() == 103791) then 
			eq.start(67); -- start the grid (one way depop)
			e.self:SetRunning(true);
			e.self:Emote("Blast! No matter, I've already gotten one sample for the serum! The researchers will be most pleased to have this back in their possession! Fools!");
		end
	elseif (e.signal == 4) then
		if(e.self:GetSp2() == 103930) then 
			eq.start(67); -- start the grid (one way depop)
			e.self:SetRunning(true);
			e.self:Emote("Blast! No matter, I've already gotten one sample for the serum! The researchers will be most pleased to have this back in their possession! Fools!");
		end
	end
end

function Mutation_Signal(e)
	e.self:SetSpecialAbility(24, 0);
	e.self:SetSpecialAbility(35, 0);
	
	e.self:SetAppearance(0);
end

function event_encounter_load(e)
	eq.register_npc_event('rujg', Event.signal,         260062, Mutation_Signal);
	eq.register_npc_event('rujg', Event.signal,         260091, Mutation_Signal);
	eq.register_npc_event('rujg', Event.signal,         260092, Mutation_Signal);
	
  eq.register_npc_event('rujg', Event.signal,         260019, Assistant_Signal);
  eq.register_npc_event('rujg', Event.combat,         260090, Trap3_Combat);
  eq.register_npc_event('rujg', Event.combat,         260089, Trap2_Combat);
  eq.register_npc_event('rujg', Event.combat,         260088, Trap_Combat);
  eq.register_npc_event('rujg', Event.combat,         260073, Text1_Combat);
  eq.register_npc_event('rujg', Event.combat,         260074, Text2_Combat);
  eq.register_npc_event('rujg', Event.combat,         260075, Text3_Combat);
  eq.register_npc_event('rujg', Event.combat,         260076, Text4_Combat);
  eq.register_npc_event('rujg', Event.combat,         260077, Text5_Combat);
  eq.register_npc_event('rujg', Event.combat,         260078, Text6_Combat);
  eq.register_npc_event('rujg', Event.combat,         260079, Text7_Combat);
  eq.register_npc_event('rujg', Event.combat,         260080, Text8_Combat);
  eq.register_npc_event('rujg', Event.combat,         260081, Text9_Combat);
  eq.register_npc_event('rujg', Event.combat,         260082, Text10_Combat);
  eq.register_npc_event('rujg', Event.combat,         260083, Text11_Combat);
  eq.register_npc_event('rujg', Event.combat,         260084, Text12_Combat);
  eq.register_npc_event('rujg', Event.combat,         260085, Text13_Combat);
  eq.register_npc_event('rujg', Event.combat,         260086, Text14_Combat);
  eq.register_npc_event('rujg', Event.combat,         260087, Text15_Combat);
  
  eq.register_npc_event('rujg', Event.death_complete, 260061, Researcher_Death);
			
  eq.register_npc_event('rujg', Event.combat,         260070, Researcher_Combat);
  eq.register_npc_event('rujg', Event.timer,          260070, Researcher_Timer);
  eq.register_npc_event('rujg', Event.death_complete, 260070, Researchers_Death);

  eq.register_npc_event('rujg', Event.death_complete, 260038, Subject_Death);
  eq.register_npc_event('rujg', Event.death_complete, 260044, Subject_Death);
  eq.register_npc_event('rujg', Event.death_complete, 260060, Subject_Death);
  eq.register_npc_event('rujg', Event.death_complete, 260021, Subject_Death);

  eq.register_npc_event('rujg', Event.death_complete, 260069, Battlelord_Death);
  eq.register_npc_event('rujg', Event.combat,         260069, Battlelord_Combat);
  eq.register_npc_event('rujg', Event.timer,          260069, Battlelord_Timer);

end
