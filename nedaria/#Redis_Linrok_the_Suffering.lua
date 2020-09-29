local paladin_dz = { "dranikcatacombsa", 1, eq.seconds("2h") }
paladin_dz.compass = { "dranik", -292.35, 1049.05, -82.54 }
paladin_dz.safereturn = { "dranik", -291.375, 1027.125, -76.25, 0.0 }
paladin_dz.zonein = { 0, 0, -8.5, 0 }

function event_say(e)
  local qglobals = eq.get_qglobals(e.self, e.other)

  if (qglobals["paladin_epic"] >= "6") then
    e.self:Say(("Auuugh...%s...the...catacombs...is where...my essence...is..."):format(e.other:GetCleanName()))
    e.other:Message(MT.Emote, "A flash of light occurs as Redis disappears. An entrance to an unfamiliar place has been opened for you. Perhaps you should investigate there.")
    e.other:CreateExpedition(paladin_dz, { "Catacombs of Dranik", 2, 6 })
    eq.depop_with_timer();
  end
end
