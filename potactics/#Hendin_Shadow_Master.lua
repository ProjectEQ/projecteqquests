--[[

Drogerin

NPC:214086 Hendin_Shadow_Master Rallos Zek the Warlord script.

--]]


function event_signal(e)
  if e.signal == 1 then
    eq.set_timer("depop", 10 * 60 * 1000); -- 10 min depop
  end
end


function event_timer(e)
  if e.timer == "depop" then
    eq.depop_all(214086);
  end
end
