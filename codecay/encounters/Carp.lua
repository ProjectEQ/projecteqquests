--[[  Carprin Event by ##Drogerin

Event Details:
Carprin agro spawns 3 adds
Abroan Drian
Breddan Rutyl
Fran Prisoal
Carprin Invulnerable @90% if adds up once adds are down, Carprin Repops with 0 adds, no invulnerability state. Kill to spawn 2nd NPC
Avhi Escron spawns with 4 skeleton adds, if these or Avhi kill any PC player, then spawn 4 more ( no limit ) depop all adds upon Avhi death or despawn from fail timer.
Bishop Spawn - Changed his spawn point from where he is currently ( it is wrong ), upon death
Raex Pwodill & Vindor Mawnil spawn & Untargetable version of High Priest spawn
High Priest becomes active after killing Raex & Vindor.
Hail Tarkil for Flag.


1 Hour limit on EACH mob excluding Carprin.  Once Carprin is dead the 1 hour state begins for EACH mob once they spawn. ( Not total time to complete)
--]]


local carp_add=0;
local carp_fake=false;




function Carp_Combat(e)
	if (e.joined == true) and carp_fake == false then
	eq.spawn2(200037,0,0,385.41, -127.15, -60.25, 384.3):AddToHateList(e.self:GetHateRandom(),1); -- Spawn Breddan_Rutyl
	eq.spawn2(200036,0,0,393.25, -107.67, -60.25, 391.3):AddToHateList(e.self:GetHateRandom(),1); -- Spawn Fran Prisoal
	eq.spawn2(200038,0,0,385.17, -98.43, -60.25, 384.8):AddToHateList(e.self:GetHateRandom(),1); -- Spawn Abroan Drian
	eq.set_next_hp_event(90); -- Go Invulnerable to Melee/Magic @ 90%.
	carp_fake=true;
	end
end

function Carp_HP(e)
	if (e.hp_event == 90) then
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1); -- Go Invulnerable
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1); -- Go Invulnerable
	end
end

function Add_Death(e)
	local el = eq.get_entity_list();
	carp_add=carp_add+1
	eq.debug("Trash Dead: " .. carp_add);
	if carp_add == 3 and carp_fake == true and ( el:IsMobSpawnedByNpcTypeID(200007) == true) then
	eq.depop_all(200007);  -- Depop myself
	eq.spawn2(200007,0,0,384.00,-113.00,-53.78,386.0):AddToHateList(e.self:GetHateRandom(),1); -- Pop my true self // No adds this time // No Invulnerable State  // Auto Agro Myself
	end
	if carp_add == 5 then
	eq.depop_all(200067); --Depop fake HP
	eq.spawn2(200032,0,0,306.97,314.78,-70.25,259.0); -- Respawn Real HP
	carp_add=0; -- Set add kill back to 0 for future spawns.
	end
end

function Carp_Death(e)
	eq.spawn2(200035,0,0,402.43,141.60,-60.25,259.8); -- Spawn Avhi
	eq.spawn2(200066,0,0,401.79,125.19,-60.25,259.8):AddToHateList(e.self:GetHateRandom(),1); -- spawn 4 initial skeletons with Avhi
	eq.spawn2(200066,0,0,413.41,142.57,-60.25,259.0):AddToHateList(e.self:GetHateRandom(),1); -- Reanimated_Reaver x4.
	eq.spawn2(200066,0,0,403.46,157.51,-60.25,260.5):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Reanimated_Reaver
	eq.spawn2(200066,0,0,392.19,142.16,-60.25,260.5):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Reanimated_Reaver
end

function Avhi_Slay(e)
	eq.spawn2(200066,0,0,401.79,125.19,-60.25,259.8):AddToHateList(e.self:GetHateRandom(),1); -- if Avhi kills any player
	eq.spawn2(200066,0,0,413.41,142.57,-60.25,259.0):AddToHateList(e.self:GetHateRandom(),1); -- spawn 4 more skeletons
	eq.spawn2(200066,0,0,403.46,157.51,-60.25,260.5):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Reanimated_Reaver
	eq.spawn2(200066,0,0,392.19,142.16,-60.25,260.5):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Reanimated_Reaver
end

function Add_Slay(e)
	eq.spawn2(200066,0,0,401.79,125.19,-60.25,259.8):AddToHateList(e.self:GetHateRandom(),1); -- if any adds kill a player character
	eq.spawn2(200066,0,0,413.41,142.57,-60.25,259.0):AddToHateList(e.self:GetHateRandom(),1); -- spawn 4 more skeletons
	eq.spawn2(200066,0,0,403.46,157.51,-60.25,260.5):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Reanimated_Reaver
	eq.spawn2(200066,0,0,392.19,142.16,-60.25,260.5):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Reanimated_Reaver
end

function Avhi_Spawn(e)
	eq.set_timer("Avhi", 3600000);  -- set despawn timer of 1 hour
end

function Bishop_Spawn(e)
	eq.set_timer("Bishop", 3600000); -- set despawn timer of 1 hour
end

function Bishop_Timer(e)
	if e.timer == "Bishop" then  -- Despawn myself if 1 hour is up.
	eq.stop_timer('Bishop');
	eq.depop_all(200039);
	end
end

function Vindor_Spawn(e)
	eq.set_timer("Vindor", 3600000);  -- set despawn timer of 1 hour
end

function Vindor_Timer(e)
	if e.timer == "Vindor" then -- Despawn myself if 1 hour is up.
	eq.stop_timer('Vindor');
	eq.depop_all(200034);
	end
end

function Raex_Spawn(e)
	eq.set_timer("Raex", 3600000);  -- set despawn timer of 1 hour
end

function Raex_Timer(e)
	if e.timer == "Raex" then  -- Despawn myself if 1 hour is up
	eq.stop_timer('Raex');
	eq.depop_all(200033);
	end
end

function HP_Spawn(e)
	eq.set_timer("HP", 3600000); -- set despawn timer of 1 hour upon REAL Spawn of HP, not fake.
end

function HP_Timer(e)
	if e.timer == "HP" then -- Despawn myself if 1 hour is up
	eq.stop_timer('HP');
	eq.depop_all(200032);
	end
end

function Avhi_Timer(e)
	if e.timer == "Avhi" then
	eq.stop_timer('Avhi');
	eq.depop_all(200035); -- Depop myself
	eq.depop_all(200066); -- Depop any adds that were activated by event.
	end
end

function Avhi_Death(e)
	eq.spawn2(200039,0,0,261.54,82.12,-70.25,4.5);  -- Spawn Bishop
	eq.depop_all(200066); -- Depop any adds that were activated by event.
end


function Bishop_Death(e)
	eq.spawn2(200067,0,0,306.97,314.78,-70.25,259.0); -- Spawn Untargetable Version of High Priest.
	eq.spawn2(200034,33,0,325,325,-71.5,277.2); -- Spawn Vindor on their grid.
	eq.spawn2(200033,34,0,290,325,-71.5,277.2); -- Spawn Raex on their grid.
end

function HP_Death(e)
	eq.spawn2(200040,0,0,309.17,332.99,-70.25,265.5); -- Spawn Tarkil for  flag to lower codecay.
end


function event_encounter_load(e)
	eq.register_npc_event('Carp', Event.combat, 			200007, Carp_Combat);
	eq.register_npc_event('Carp', Event.spawn,				200007, Carp_Summon);
	eq.register_npc_event('Carp', Event.hp,					200007, Carp_HP);
	eq.register_npc_event('Carp', Event.death_complete,		200007, Carp_Death);
	
	eq.register_npc_event('Carp', Event.death_complete, 	200032, HP_Death);
	eq.register_npc_event('Carp', Event.spawn,				200032, HP_Spawn);
	
	eq.register_npc_event('Carp', Event.spawn,				200035, Avhi_Spawn);
	eq.register_npc_event('Carp', Event.timer,				200035, Avhi_Timer);
	eq.register_npc_event('Carp', Event.death_complete, 	200035, Avhi_Death);
	
	eq.register_npc_event('Carp', Event.spawn,				200039, Bishop_Spawn);
	eq.register_npc_event('Carp', Event.timer,				200039, Bishop_Timer);
	eq.register_npc_event('Carp', Event.death_complete,     200039, Bishop_Death);
	
	eq.register_npc_event('Carp', Event.spawn,				200034, Vindor_Spawn);
	eq.register_npc_event('Carp', Event.timer,				200034, Vindor_Timer);
	eq.register_npc_event('Carp', Event.death_complete,		200034, Vindor_Death);
	
	
	eq.register_npc_event('Carp', Event.death_complete,		200033, Raex_Death);
	eq.register_npc_event('Carp', Event.spawn,				200033, Raex_Spawn);
	eq.register_npc_event('Carp', Event.timer,				200033, Raex_Timer);
	
	
	eq.register_npc_event('Carp', Event.slay,				200035, Avhi_Slay);
	eq.register_npc_event('Carp', Event.slay,				200066, Add_Slay);
	
	
	eq.register_npc_event('Carp', Event.death_complete, 200037, 			Add_Death);
	eq.register_npc_event('Carp', Event.death_complete, 200036, 			Add_Death);
	eq.register_npc_event('Carp', Event.death_complete, 200038, 			Add_Death);
	eq.register_npc_event('Carp', Event.death_complete, 200034,				Add_Death);
	eq.register_npc_event('Carp', Event.death_complete, 200033,				Add_Death);

end
