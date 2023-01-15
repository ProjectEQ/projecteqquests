local gukg = {
  expedition = { name="Deepest Guk: Ritualist of Hate", min_players=6, max_players=54 },
  instance   = { zone="gukg", version=50, duration=eq.seconds("3h") },
  zonein     = { x=151, y=-260, z=51.125, h=0 },
  compass    = { zone="innothule", x=1194, y=1322, z=-12 },
  safereturn = { zone="innothule", x=1181, y=1363, z=-12, h=0 } -- made up, live uses innothuleb
  -- compass    = { zone="innothuleb", x=572.351, y=934.646, z=19.018 },
  -- safereturn = { zone="innothuleb", x=540, y=961, z=15.125, h=0 }
}

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Friggal Bribbitz says, 'With the help of the Wayfarer's Brotherhood and adventurers like you, we hope to stop the Witnesses of Hate from completing their dark rituals and cursing all those who have entered Deepest Guk.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Friggal Bribbitz says, 'We have been hearing reports that the Witnesses of Hate are amassing sacrifices for a dark ritual.  Lich Rtrangi appears to be behind the sacrifices with the intent to afflict the living Frogloks with a disfiguring curse.  We have a scout who can assist you in Deepest Guk with infiltrating Rtangi's domain and putting a stop to his plans.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Friggal Bribbitz says, 'The scout will meet you inside Deepest Guk.  Be safe, %s.'"):format(e.other:GetCleanName()))
    e.other:CreateExpedition(gukg)
  end
end
