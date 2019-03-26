function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("turn the corner, you catch glimse of a beast beyond, mangled and twisted by decades of decay.");
    eq.spawn2(128097, 0, 0, 1294, -1840, -124, 257); -- NPC: Furious_Phantasm
    eq.depop_with_timer();
  end
end
