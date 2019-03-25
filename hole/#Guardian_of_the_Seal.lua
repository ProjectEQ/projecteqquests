function event_combat(e)
  if (e.joined == true) then
    eq.set_next_hp_event(30);
  else
    eq.stop_timer("blow");
    eq.stop_timer("shrapnel");
  end
end

function event_hp(e)
  if (e.hp_event == 30) then
    e.self:CastSpell(4187, e.self:GetTarget():GetID()); -- Spell: Shockwave of Shrapnel
    eq.set_timer("blow", 3 * 1000);
    eq.set_timer("shrapnel", 5 * 1000);
  end
end

function event_timer(e)
  if (e.timer == "blow") then
    eq.stop_timer("blow");
    e.self:CastSpell(4186, e.self:GetTarget():GetID()); -- Spell: Crumbling Blow
    eq.set_timer("blow", 20 * 1000);
  elseif (e.timer == "shrapnel") then
    eq.stop_timer("shrapnel");
    e.self:CastSpell(4189, e.self:GetTarget():GetID()); -- Spell: Earthen Shrapnel
    eq.set_timer("shrapnel", 20 * 1000);
  end
end
