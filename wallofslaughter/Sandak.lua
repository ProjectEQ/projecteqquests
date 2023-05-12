--Makyah's Statue need live parse of faction turn in reward

function event_say(e)
  if (e.other:GetFaction(e.self) <= 2) then -- require warmly
    if (e.message:findi("hail")) then
      e.self:Say("Greetings stranger, I have heard of your efforts on behalf of my people. It has been long since anyone, dragorn included, has stood against the Muramites. I once was a great warrior myself. I fought in the battles with the Legions of Mata Muram as the flooded into Kuua. I lost many [friends] in those battles, and have since seen [mementos] of my childhood destroyed and left in ruins.");
    elseif (e.message:findi("mementos")) then
      e.self:Say("In my younger days I sought out stories of the great dragorn heroes like they were precious gems. Oh, the stories I could tell you about Jayruk the Hunter and his triumphs over the bazu and about Makyah the Fierce and his glorious defiance of Mata Muram and his legion. It was Makyah that served as my inspiration in the trying times that accompanied the Muramite invasion. I made a [statue] and had it in a cave where I was sent to live to serve as a reminder to all of his ideals and sacrifice.");
    elseif (e.message:findi("statue")) then
      e.self:Say("It was a great carved stone statue of Makyah in his full battle armor. In all modesty, I have to say it was a sight to behold, terrifying and inspiring all at once. The Muramites apparently did not appreciate a monument to someone such as that in the city and the destroyed it right in front of me. They dragged the pieces off to some unknown ditch, I'm sure. If only I could gather the pieces again and reassemble the statue I could find some peace in the memories of that great hero.");
    elseif (e.message:findi("final disagreement")) then
      e.self:Say("With the coming of the Legion of Mata Muram, Zakariv fell in with a group of dragorn who saw the legion as a chance to achieve greater glory and power. He urged me to join them and drew his sword when I refused his offer. Rather than fight my friend I turned my back and walked away. That was the last I saw of him until that fateful day at the [portal].");
    elseif (e.message:findi("portal")) then
      e.self:Say("I believe it was a portal into your world, stranger. We had made an agreement with the riftseekers to close that portal in an attempt to defy and weaken the Muramites. I had joined with Rurof the Negotiator and his army. We marched to the portal and took the Muramites by surprise. I fought for several hours before becoming grievously wounded by a kyv arrow. As I stumbled out of the battle to tend my wound, I glimpsed Zakariv for just a moment in a thick cluster of fighting seeming to just be struggling to stay alive. I was only able to see him for a moment before the bloody mobs swept him from my view. Shortly after I had left the site of the battle there was a horrendous [explosion].");
    elseif (e.message:findi("explosion")) then
      e.self:Say("The explosion came from the portal and was caused by the traitorous riftseekers. It ripped through the battlefield without discrimination, destroying much of Rurof's forces along with a great many Muramites. Still, the price was too high. I have not had the strength to fight the legion since then, though I mourn the loss of my friend and deeply regret that I was unable to make amends before his death. Perhaps if I were able to retrieve his [sword] I could do proper honor to his memory.");
    elseif (e.message:findi("sword")) then
      e.self:Say("Zakariv's sword was a work of art, not only beautiful to see, but deadly in battle. I've heard of shattered relics from that battle turning up where scavengers have left them. If you could search for Zakariv's sword or at least the pieces of it and return them to me I'm sure I could find some way to reward you.");
    elseif (e.message:findi("friends")) then
      e.self:Say("While I lost many comrades-in-arms, there was one in particular that I regret losing most. His name was Zakariv. We were very close from the first days of our training through the time of The Darkening. It was then, when the dragorn people began turning upon each other that Zakariv and I began to argue. The arguments were small differences in opinion at first, fights over which direction the feran we were tracking went or where to camp the night. All too quickly these arguments degenerated into brawls between the two of us. It wasn't long before we had our [final disagreement].");
    end
  else
    e.self:Emote("hisses as you approach but does not attack.");
  end
end

function event_trade(e)
  local class = e.other:Class();
  local item_lib = require("items");

  if (e.other:GetFaction(e.self) <= 2 and (class == "Warrior" or class == "Paladin" or class == "Shadowknight" or class == "Bard" or class == "Monk" or class == "Beastlord" or class == "Berserker" or class == "Ranger" or class == "Rogue")) then -- require warmly and melee
    if (item_lib.check_turn_in(e.trade, {item1 = 36504, item2 = 36505, item3 = 36506, item4 = 36507})) then -- Makyahs Statue quest
      e.self:Say("Can it be? You've found it! I shall have this pieced together where no Muramite can find it again. It will be an inspiration for the coming generations and a beacon of hope in these times of darkness. Here take this mask. May it help you always to see the light and protect you from the trials of darkness.");
      e.other:QuestReward(e.self, 0, 0, 0, 0, 71135, 100000); -- (71135); #Glowing Enameled Visor
      e.other:Faction(1016, 5) --Dranik Loyalists +5
      e.other:Faction(1013, -1) -- Overlord Mata Muram -1
    elseif (item_lib.check_turn_in(e.trade, {item1 = 36500, item2 = 36501, item3 = 36502, item4 = 36503})) then -- Zakarivs Shattered Sword quest
      e.self:Say("This... this is amazing. I never thought to have anything to remember Zakariv by. Thank you for returning these pieces to me. I will have them reforged and once again this weapon will be amazing to behold! Here, take this cloak as a reward. It was one that I wore in my days as a warrior. Perhaps some of the enchantments on it will still prove useful.");
      e.other:QuestReward(e.self, 0, 0, 0, 0, 71151, 100000); -- (71151); #Cloak of the Dragorn Militia
      e.other:Faction(1016, 5) --Dranik Loyalists +5
      e.other:Faction(1013, -1) -- Overlord Mata Muram -1
    end
  elseif (e.other:GetFaction(e.self) <= 2 and (class == "Magician" or class == "Wizard" or class == "Enchanter" or class == "Cleric" or class == "Druid" or class == "Shaman" or class == "Necromancer")) then -- require warmly and caster
    if (item_lib.check_turn_in(e.trade, {item1 = 36504, item2 = 36505, item3 = 36506, item4 = 36507})) then -- Makyahs Statue quest
      e.self:Say("Can it be? You've found it! I shall have this pieced together where no Muramite can find it again. It will be an inspiration for the coming generations and a beacon of hope in these times of darkness. Here take this mask. May it help you always to see the light and protect you from the trials of darkness.");
      e.other:QuestReward(e.self, 0, 0, 0, 0, 71136, 100000); -- (71136); #Veil of Woven Light
      e.other:Faction(1016, 5) --Dranik Loyalists +5
      e.other:Faction(1013, -1) -- Overlord Mata Muram -1
    elseif (item_lib.check_turn_in(e.trade, {item1 = 36500, item2 = 36501, item3 = 36502, item4 = 36503})) then -- Zakarivs Shattered Sword quest
      e.self:Say("This... this is amazing. I never thought to have anything to remember Zakariv by. Thank you for returning these pieces to me. I will have them reforged and once again this weapon will be amazing to behold! Here, take this cloak as a reward. It was one that I wore in my days as a warrior. Perhaps some of the enchantments on it will still prove useful.");
      e.other:QuestReward(e.self, 0, 0, 0, 0, 71152, 100000); -- (71152); #Woven Cape of the Militia
      e.other:Faction(1016, 5) --Dranik Loyalists +5
      e.other:Faction(1013, -1) -- Overlord Mata Muram -1
    end
  end
  item_lib.return_items(e.self, e.other, e.trade)
 end
