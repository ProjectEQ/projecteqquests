function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Haawwwl. Whasnsuud grurffnunnnsuuuss.");
  end
end

function event_signal(e)
  e.self:Say("Yes, sir!");
end
