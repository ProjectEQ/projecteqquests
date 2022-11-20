-- Zebeker,_a_necromancer`s_pet
-- Origins of the Curse mission

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Zebeker, a necromancer`s pet says, ''Yeah? What do you want? Were you sent by my [master] to give me a good savaging? C'mon then. Make it fast.''")
  elseif e.message:findi("master") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Zebeker, a necromancer`s pet says, ''What master? Don't tell me you wandered down here on your own?... I'm talking about the necromancer that unleashed the curse on this place. I used to be his summoned pet, you know? I was a good pet too--always fetching things and spying on people for him--then one day he takes me on a [mission] into this crazy dragons' nest and I accidentally dropped one little potion. Like that--,' Zebeker snaps his fingers, '--my master flies into a rage and commands me to stay here for all time. I've been stuck here ever since, watching my bones grow brittle and the walls gather dust. I don't even have anything to read!''")
  elseif e.message:findi("mission") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Zebeker, a necromancer`s pet says, ''No, sorry. I can't tell you what that still-hearted maggot pie of a necromancer was up to. I'm his summoned pet after all and I can't betray him even though he deserves it a thousand times over. I'm bound by his magic, you see, and until I get my [bone chips] back, I'll forever be his servant, forced to obey his blasted, ill-conceived commands. By the gods, how I hate that necromancer!''")
  elseif e.message:findi("bone(.*)chip") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Zebeker, a necromancer`s pet says, ''The bone chips that he used to summon me. Only if I have those can I be free of his contestable control. After I dropped the potion, he crushed my bone chips into four shards and threw them into... into... Aaagh! His magical control over me is preventing me from saying, but if you can find my crushed bone fragments, I can be free again. Then I can I can tell you everything I know about this accursed nest we're both stuck in.''")
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
