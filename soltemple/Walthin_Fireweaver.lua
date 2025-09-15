-- Quests for Bard Lambent Armor
-- ToDo: Script page summon for Bard epic
-- items: 2318, 10119, 10561, 2319, 10117, 4114, 4115, 10128, 4116

function event_say(e)
  local qglobals = eq.get_qglobals(e.other)
  if e.message:findi("hail") then
    if e.other:HasItem(77618) and e.other:HasItem(77619) and e.other:HasItem(77620) and e.other:HasItem(77621) and e.other:HasItem(77622) and e.other:HasItem(77623) and e.other:HasItem(77624) and e.other:HasItem(77625) then
      e.self:Say(e.other:GetName() .. "! Thank Veeshan you're here!  I discovered how to create the draconic prism!  The secret has been here all along.  One of the ancient crests of the temple was the key!  It seems we are not the first bards to undertake the quest for the draconic prism.  I'll explain later, but you must hurry, the crest has been stolen!  Not a day ago it was here, so the thief can't have gotten far.  You must find the thief and recover the crest " .. e.other:GetName() .. "!")
      if qglobals["bard15"] == "4" then
        eq.set_global("bard15", "5", 5, "F") -- lets you trigger the cloaked figure
      end
    else
      e.self:Say("Good day to you!  I am Walthin Fireweaver of the League of Antonican Bards.  My friend Cryssia and I are here while we deal in [" .. eq.say_link("lambent stones") .. "] with the followers of Solusek Ro.  If you are interested, Cryssia and I also deal in [" .. eq.say_link("lambent armor") .. "], the perfect armor for a bard of standing.  I also dabble in some research from time to time.  I'm a bit of a historian.  I study the history of [" .. eq.say_link("dragons") .. "].")
    end
  elseif e.message:findi("dragons") then
    if qglobals["bard15"] ~= nil and qglobals["bard15"] >= "4" then
      e.self:Say("Dragons are a fascinating species.  I'm currently researching some rare breeds of dragons.  I've only found vague references to something the dragons refer to as 'the outsiders'.  Unfortunately the texts aren't any more specific then that, and I haven't been able to translate much of the text I've found.  One particular [" .. eq.say_link("note") .. "] has me very puzzled.")
    else
      e.self:Say("I'm utterly fascinated by all things draconic.  There are many tomes in the temple's libraries that catalog much of their species' history.  Some day I'll have to travel to the frozen land of Velious and see what other secrets I can learn there.")
    end
  elseif e.message:findi("lambent stones") then
    e.self:Say("Lambent stones are gemstones of great power.  They are midnight blue in color - if you want more information on them you should ask Genni.")
  elseif e.message:findi("lambent armor") then
    e.self:Say("Lambent armor is custom-crafted armor, made especially for bards. It is forged by the MeadowGreen brothers and then enchanted by the followers of Solusek Ro. If you are interested, I can tell you about [" .. eq.say_link("lambent gauntlets") .. "], [" .. eq.say_link("lambent greaves") .. "] and [" .. eq.say_link("lambent boots") .. "]. Cryssia can tell you about other lambent armor.")
  elseif e.message:findi("lambent gauntlets") then
    e.self:Say("Lambent gauntlets are exceptionally well made gauntlets.  If you are interested, I will give you a pair, but you will have to bring me the following items that I need for a trade with the followers of Solusek Ro.  I need shin gauntlets from a froglok knight and black silk gloves from Castle Mistmoore.  You will also need to talk to Genni about getting me a lambent star ruby.  Bring me these items and you will earn lambent gauntlets.")
  elseif e.message:findi("lambent greaves") then
    e.self:Say("There are no finer leggings for a bard than lambent greaves.  Collect for me two pairs of lesser greaves and I will give you some.  Bring me icy greaves from the caverns of Permafrost and shin greaves from a ghoul knight, as well as a lambent fire opal and I will bestow a pair of lambent greaves upon you .")
  elseif e.message:findi("lambent boots") then
    e.self:Say("Lambent boots are the boots of choice for most bards.  If you can bring me firewalker boots from a Solusek Mage and the middle portion of the rune of the One Eye from Froon then I ill give you a pair of lambent boots.  Oh, I almost forgot! I will need a lambent sapphire as well.")
  elseif qglobals["bard15"] ~= nil and qglobals["bard15"] >= "4" and e.message:findi("note") then
    e.self:Say("TODO: This part is not implemented, please report if you know how it should work.")
  end
end

function event_trade(e)
  if (eq.handin({[2318] = 1, [10119] = 1, [10561] = 1})) then -- Items: Firewalker Boots, Lambent Sapphire, Rune of the One Eye
    e.self:Say("Excellent. Here are your Lambent Boots.");
    e.other:Faction(415,5); -- Faction: Temple of Solusek Ro
    e.other:Faction(416,-5); -- Faction: Shadow Men
    e.other:QuestReward(e.self,0,0,0,0,4159,1000); -- Item: Lambent Boots
  elseif (eq.handin({[2319] = 1, [10117] = 1, [4114] = 1})) then -- Items: Black Silk Gloves, Lambent Star Ruby, Shin Gauntlets
    e.self:Say("Excellent. Here are your Lambent Gauntlets.");
    e.other:Faction(415,5); -- Faction: Temple of Solusek Ro
    e.other:Faction(416,-5); -- Faction: Shadow Men
    e.other:QuestReward(e.self,0,0,0,0,4157,1000); -- Item: Lambent Gauntlets
  elseif (eq.handin({[4115] = 1, [10128] = 1, [4116] = 1})) then -- Items: Icy Greaves, Lambent Fire Opal, Shin Greaves
    e.self:Say("Excellent. Here are your Lambent Greaves.");
    e.other:Faction(415,5); -- Faction: Temple of Solusek Ro
    e.other:Faction(416,-5); -- Faction: Shadow Men
    e.other:QuestReward(e.self,0,0,0,0,4158,1000); -- Item: Lambent Greaves
  end
end