--Ikkinz Raid #2: Chambers of Glorification
function event_signal(e)
  if (e.signal == 1) then
    e.self:CastedSpellFinished(2167, e.self);	-- Spell: Fling
  end
end
