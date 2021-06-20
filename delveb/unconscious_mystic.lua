function event_spawn(e)
eq.set_timer("reset", 120 * 1000);
eq.set_timer("liedown", 1 * 1000);
e.self:SetAppearance(3);
end

function event_timer(e)
if (e.timer == "reset") then
eq.stop_timer("reset");
eq.depop_all(342060);
eq.spawn2(342053,0,0,23,2025,2,401); -- NPC: #Mystic_Braggle
eq.spawn2(342054,0,0,-161,2064,-11,149); -- NPC: #Mystic_Shiflor
eq.spawn2(342055,0,0,-85,1961,-.23,35); -- NPC: #Mystic_Griknok
eq.signal(342052,2); --emoush goes back to sleep
elseif (e.timer == "liedown") then
e.self:SetAppearance(3);
eq.stop_timer("liedown");
end

function event_signal(e)
  if(e.signal == 1) then
    eq.stop_timer("reset");
    eq.depop_all(342060);
  end
end
