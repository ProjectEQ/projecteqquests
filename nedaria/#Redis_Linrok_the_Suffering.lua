local paladin_dz = {
  expedition = { name="Catacombs of Dranik", min_players=2, max_players=6 },
  instance   = { zone="dranikcatacombsa", version=1, duration=eq.seconds("2h") },
  compass    = { zone="dranik", x=-292.35, y=1049.05, z=-82.54 },
  safereturn = { zone="dranik", x=-291.375, y=1027.125, z=-76.25, h=0.0 },
  zonein     = { x=0, y=0, z=-8.5, h=0 }
}

function event_say(e)
  local qglobals = eq.get_qglobals(e.self, e.other)

  if (qglobals["paladin_epic"] ~= nil and qglobals["paladin_epic"] >= "6") then
    e.self:Say(("Auuugh...%s...the...catacombs...is where...my essence...is..."):format(e.other:GetCleanName()))
    e.other:Message(MT.Emote, "A flash of light occurs as Redis disappears. An entrance to an unfamiliar place has been opened for you. Perhaps you should investigate there.")
    e.other:CreateExpedition(paladin_dz)
    eq.depop_with_timer();
  else 
    e.self:Say("I have nothing to say to you, be on about your business.");	
  end
end
