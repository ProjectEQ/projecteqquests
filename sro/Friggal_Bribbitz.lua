local gukg_info = { "Deepest Guk: Ritualist of Hate", 6, 54 }
local gukg_dz = { "gukg", 50, eq.seconds("3h") }
gukg_dz.zonein = { 151, -260, 51.125, 0 }
gukg_dz.compass = { "innothule", 1194, 1322, -12 }
gukg_dz.safereturn = { "innothule", 1181, 1163, -12, 0 } -- made up, live uses innothuleb
-- gukg_dz.compass = { "innothuleb", 572.351, 934.646, 19.018 }
-- gukg_dz.safereturn = { "innothuleb", 540, 961, 15.125, 0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Friggal Bribbitz says, 'With the help of the Wayfarer's Brotherhood and adventurers like you, we hope to stop the Witnesses of Hate from completing their dark rituals and cursing all those who have entered Deepest Guk.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Friggal Bribbitz says, 'We have been hearing reports that the Witnesses of Hate are amassing sacrifices for a dark ritual.  Lich Rtrangi appears to be behind the sacrifices with the intent to afflict the living Frogloks with a disfiguring curse.  We have a scout who can assist you in Deepest Guk with infiltrating Rtangi's domain and putting a stop to his plans.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Friggal Bribbitz says, 'The scout will meet you inside Deepest Guk.  Be safe, %s.'"):format(e.other:GetCleanName()))
    e.other:CreateExpedition(gukg_dz, gukg_info)
  end
end
