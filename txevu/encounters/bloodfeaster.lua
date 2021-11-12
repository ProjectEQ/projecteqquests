--bloodfeaster event by Huffin
--an_ukun_mauler (297200)
--a_decaying_corpse (297073)
--#Ukun_Bloodfeaster (297082)
--#a_stonemite_corpseburrower (297207)


local event_started = 0;
local adds = 0;

function Bloodfeaster_Spawn(e)
  eq.spawn_condition("txevu", 0, 2, 1); --turn decaying corpse and ukun maulers on
  event_started = 0;
  adds = 0;
end

function Bloodfeaster_Signal(e)
  if (e.signal == 1) then
    if event_started == 0 then
    eq.signal(297200,1); --remove immunities ukun mauler and move to main room
    eq.signal(297073,1); --remove immunities decaying corpse
    eq.signal(297082,2); --signal self to remove immunities and move to main room
    
    eq.set_timer("reset", 45 * 60 * 1000); --45 min til event resets
    eq.set_timer("adds", 30 * 1000); --30 sec between add waves
    eq.start(78); --start grid
    event_started = 1;
    end
  elseif (e.signal == 2) then
    e.self:SetSpecialAbility(35, 0); --turn off immunity
    e.self:SetSpecialAbility(24, 0); --turn off anti aggro
  elseif (e.signal == 3) then
    adds = adds + 1;
	eq.debug("stonemite adds spawned: " ..  adds);
  elseif (e.signal == 4) then
    adds = adds - 1;
	eq.debug("stonemite adds spawned: " ..  adds);
  end
end

function Corpse_Signal(e)
  if (e.signal == 1) then
    e.self:SetSpecialAbility(35, 0); --turn off immunity
  elseif (e.signal == 2) then
    eq.spawn2(297207, 78, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
    eq.spawn2(297207, 78, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());

  elseif (e.signal == 3) then
    e.self:SetSpecialAbility(35, 1); --turn on immunity
  end
end

function Mauler_Combat(e)
  if(e.joined) then
    eq.set_timer("OOBcheck", 3 * 1000);
  else
    eq.stop_timer("OOBcheck");
  end
end

function Mauler_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 242 or e.self:GetX() < 110 or e.self:GetX() > 340) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(239, 316, -420, 0);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 3 * 1000);
  	  end
end
end

function Mauler_Signal(e)
  if (e.signal == 1) then
    e.self:SetSpecialAbility(24, 0); --turn off anti aggro
    e.self:SetSpecialAbility(35, 0); --turn off immunity
    eq.start(78); --start grid
  elseif (e.signal == 3) then
    eq.stop(); --stop grid
    e.self:SetSpecialAbility(24, 1); --turn on anti aggro
    e.self:SetSpecialAbility(35, 1); --turn on immunity
  end
end

function Stonemite_Combat(e)
  if(e.joined) then
    eq.set_timer("OOBcheck", 3 * 1000);
  else
    eq.stop_timer("OOBcheck");
  end
end

function Stonemite_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 242 or e.self:GetX() < 110 or e.self:GetX() > 340) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(239, 316, -420, 0);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 3 * 1000);
  	  end
end
end

function Stonemite_Spawn(e)
eq.signal(297082,3); -- signal BF add to add counter
end

function Stonemite_Death(e)
eq.signal(297082,4); -- signal BF subtract from add counter
end

function Bloodfeaster_Combat(e)
	if(e.joined) then
		eq.set_timer("OOBcheck", 3 * 1000);
		if(not eq.is_paused_timer("reset")) then
			eq.pause_timer("reset");
		end
	else
		eq.resume_timer("reset");
		eq.stop_timer("OOBcheck");
	end
end

function Bloodfeaster_Death(e)
	eq.spawn2(297042, 0, 0, 209, 456,  -420,  0); --feaster (297042) will flip spawn condition off and depop adds
end

function Controller_Spawn(e)
	eq.set_timer("condition", 60 * 45 * 1000); --45 min til spawn condition turns off and adds depop
end

function Controller_Timer(e)
	eq.spawn_condition("txevu", 0, 2, 0); --turn off decaying corpse and ukun maulers
	eq.depop_all(297207); --#a_stonemite_corpseburrower (297207)
	eq.stop_timer("condition");
end

function Bloodfeaster_Timer(e)
  if (e.timer == "reset") then
    e.self:SetSpecialAbility(24, 1); --turn on anti aggro
    e.self:SetSpecialAbility(35, 1); --turn on immunity
    eq.signal(297200,3); --event resetting add immunities
    eq.signal(297073,3); --event resetting add immunities
    eq.depop_all(297207); --depop stonemites
		
		eq.stop_timer("reset");
		eq.stop_timer("adds");
		
    eq.stop(); --stop grid
    adds = 0;
    event_started = 0;
  elseif (e.timer == "adds") then
    if ( adds < 36 ) then
      eq.signal(297073,2); --signal decaying corpse spawn adds
    end
  elseif(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 242 or e.self:GetX() < 110 or e.self:GetX() > 340) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(239, 316, -420, 0);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 3 * 1000);
  	  end
end
end

function event_encounter_load(e)
eq.register_npc_event('bloodfeaster', Event.spawn, 297082, Bloodfeaster_Spawn);
eq.register_npc_event('bloodfeaster', Event.timer, 297082, Bloodfeaster_Timer);
eq.register_npc_event('bloodfeaster', Event.signal, 297082, Bloodfeaster_Signal);
eq.register_npc_event('bloodfeaster', Event.combat, 297082, Bloodfeaster_Combat);
eq.register_npc_event('bloodfeaster', Event.death_complete, 297082, Bloodfeaster_Death);

eq.register_npc_event('bloodfeaster', Event.timer, 297200, Mauler_Timer);
eq.register_npc_event('bloodfeaster', Event.signal, 297200, Mauler_Signal);
eq.register_npc_event('bloodfeaster', Event.combat, 297200, Mauler_Combat);

eq.register_npc_event('bloodfeaster', Event.timer, 297207, Stonemite_Timer);
eq.register_npc_event('bloodfeaster', Event.combat, 297207, Stonemite_Combat);
eq.register_npc_event('bloodfeaster', Event.spawn, 297207, Stonemite_Spawn);
eq.register_npc_event('bloodfeaster', Event.death_complete, 297207, Stonemite_Death);

eq.register_npc_event('bloodfeaster', Event.signal, 297073, Corpse_Signal);
	
eq.register_npc_event('bloodfeaster', Event.spawn, 297042, Controller_Spawn);
eq.register_npc_event('bloodfeaster', Event.timer, 297042, Controller_Timer);
end
