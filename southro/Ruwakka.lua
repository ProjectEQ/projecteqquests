local guke_info = { "Deepest Guk: The Curse Reborn", 6, 54 }
local guke_dz = { "guke", 50, eq.seconds("3h") }
guke_dz.zonein = { 680, -1031, 59.125, 0 }
guke_dz.compass = { "innothule", 1186, 1352, -12 }
guke_dz.safereturn = { "innothule", 1181, 1163, -12, 0 } -- made up, live uses innothuleb
-- guke_dz.compass = { "innothuleb", 572.351, 934.646, 19.018 }
-- guke_dz.safereturn = { "innothuleb", 540, 961, 15.125, 0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Ruwakka says, 'Me helping de adventurers of de Wayfarers Brotherhood.  Me in charge of recruiting brave fighters for de strange stuff going on in de land of de froggies.  If you rally de call of your friends we needs help wit dis serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Ruwakka says, 'We  learned from de scouts that de First Witness of de Cauldron of Hate found a way to harness de foul curse in Deepest Guk.  De First Witness is de strongest of them all. He amassing a group of followers large enough to make him deity!  We needs you to stop de First Witness 'fore he unleash fury on us all.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Ruwakka smashes his left fist into his right palm, for effect. 'Crush de First Witness and all of dem followers!'")
    e.other:CreateExpedition(guke_dz, guke_info)
  end
end
