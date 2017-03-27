--[[
Stone Breath Targeted AE 200', Chromatic (-200) 
1: Stun(3.00 sec) 
2: Decrease Hitpoints by 500 
3: Cancel Magic(9) 

Swamp Breath Targeted AE 200', Poison (-300) 
1: Decrease HP when cast by 200 
2: Decrease Hitpoints by 300 per tick 
3: Increase Poison Counter by 18 

Thunder Breath Targeted AE 200', Magic (-250) 
1: Decrease Hitpoints by 1500 
2: Cancel Magic(9) 
3: Cancel Magic(9) 

Wanton Destruction PB AE 300', Magic (-300) 
1: Decrease HP when cast by 4000 
2: Decrease Mana Pool by 1000 
3: Decrease Hitpoints by 500 per tick 
4: Increase Curse Counter by 36 
5: Decrease ATK by 500 
6: Decrease AC by 60 
7: Decrease Mana by 100 per tick 
--]]

function Ture_Spawn(e)
  --eq.set_next_hp_event(90);
end

function Ture_Combat(e)
  if (e.joined == true) then
    e.self:Say("");
  else
    eq.set_timer("wipecheck", 1 * 1000);
  end
end

function Ture_Timer(e)
  if (e.timer == "wipecheck") then
    local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 8000);
    if (client:IsClient() == false) then
      -- Wipe Mechanics
      eq.spawn2(298023, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
      eq.depop();
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event('Ture', Event.spawn,          298023, Ture_Spawn); 
  eq.register_npc_event('Ture', Event.combat,         298023, Ture_Combat); 
  eq.register_npc_event('Ture', Event.timer,          298023, Ture_Timer); 
  eq.register_npc_event('Ture', Event.hp,             298023, Ture_Hp); 
  eq.register_npc_event('Ture', Event.death_complete, 298023, Ture_Death); 
end

function event_encounter_unload(e)
end