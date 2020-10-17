local guke = {
  expedition = { name="Deepest Guk: The Curse Reborn", min_players=6, max_players=54 },
  instance   = { zone="guke", version=50, duration=eq.seconds("3h") },
  zonein     = { x=680, y=-1031, z=59.125, h=0 },
  compass    = { zone="innothule", x=1194, y=1322, z=-12 },
  safereturn = { zone="innothule", x=1181, y=1363, z=-12, h=0 } -- made up, live uses innothuleb
  -- compass    = { zone="innothuleb", x=572.351, y=934.646, z=19.018 },
  -- safereturn = { zone="innothuleb", x=540, y=961, z=15.125, h=0 }
}

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Ruwakka says, 'Me helping de adventurers of de Wayfarers Brotherhood.  Me in charge of recruiting brave fighters for de strange stuff going on in de land of de froggies.  If you rally de call of your friends we needs help wit dis serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Ruwakka says, 'We  learned from de scouts that de First Witness of de Cauldron of Hate found a way to harness de foul curse in Deepest Guk.  De First Witness is de strongest of them all. He amassing a group of followers large enough to make him deity!  We needs you to stop de First Witness 'fore he unleash fury on us all.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Ruwakka smashes his left fist into his right palm, for effect. 'Crush de First Witness and all of dem followers!'")
    e.other:CreateExpedition(guke)
  end
end
