-- "_" invisible npc at blue crystal
function event_signal(e)
  if e.signal == 1 then
    e.self:CastSpell(4583, e.self:GetID()) -- AngstilchSP
  end
end
