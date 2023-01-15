-- beginning of the main portion of the enchanter epic quest - staff of the serpent
-- items: 57918, 52960, 10603, 10604, 10639, 10650, 54267, 52959, 54286, 52966, 52952, 52947, 52945

function event_say(e)
  local qglobals = eq.get_qglobals(e.other);  
  if(e.message:findi("hail") and (e.other:HasItem(10650) or qglobals["EnchPre"] == "2")) then --has 1.0 or prequest
    e.self:Say("Much time has passed since the creation of the Staff of the Serpent. The power of discord is seeping into our fair world, and only the most powerful of us shall stand to force it back. The time has come for a new tool, and a new breed of enchanter. [" .. eq.say_link("Are you prepared") .. "] to meet this challenge?");
    if(qglobals["ench_epic"] == nil) then
      eq.set_global("ench_epic","1",5,"F"); --Flagged to start epic
    end
  elseif(e.message:findi("prepared") and qglobals["ench_epic"] ~= nil and qglobals["ench_epic"] >= "1") then  
    e.self:Say("I have recently received this ancient tome; it contains knowledge that may prove invaluable to the construction of a new staff. Unfortunately, time has had its way with it. I need you to find the missing pages so we can get to work. There should be ten, unless they have been destroyed by time and decay.");
    e.other:SummonItem(57918); -- Item: Tattered Illegible Tome
  elseif(e.message:findi("chest") and qglobals["ench_epic"] ~= nil and qglobals["ench_epic"] >= "3") then  
    e.other:SummonItem(52960); --Ornate Staff Chest            
  elseif(e.message:findi("are you jeb lumsed")) then
    e.self:Say("Yes, I am. Use your most enlightened magic to seek the truth of what is around you. When that is done, you will know what you seek.");
  elseif(e.message:findi("serpent")) then
    e.self:Say("The first truly powerful enchanter, Krilan Pedin, crafted the Serpent years ago. He trained his students to carry on the trade in a five-step process. Each student then became a master and chose one of their own students to pass the legacy on to. Four others and I, myself, are current practitioners of the crafting.");
  elseif(e.message:findi("masters")) then
    e.self:Say("The masters are enchanters who have reached the plateau of understanding. Their names are Modani Qu'Loni, Mizzle Gepple, Nadia Starfeast, and Polzin Mrid. All are master crafters in their own right.");
  elseif(e.message:findi("modani")) then
    e.self:Say("Modani is a master of illusions. You should seek him out first. Keep a careful eye out for him - he is never in his true form. The last time I spoke to him, he seemed very excited about his voyage to the elven outpost. You may or may not find more clues about his location there.");
  elseif(e.message:findi("mizzle")) then
    e.self:Say("Mizzle is a gnome who has mastered the use of enlightened magic. Go to him once you have spoken to Modani. Mizzle is not one to travel, so you should not have to look far from his home to find him.");
  elseif(e.message:findi("nadia")) then
    e.self:Say("The mistress of charm, Nadia is very beautiful. She, too, traveled with her relatives to the new land. I just recently received a letter from her. She says more and more pilgrims and explorers are arriving every day, and that the outpost is well defended now.");
  elseif(e.message:findi("polzin")) then
    e.self:Say("Master of the Phantasms - he is the last one you will seek out. Hmm...Polzin is native to Erudin, however, after the incident near Paineel, no one has heard from him. I hope that he is well.");
  --elseif(e.message:findi("i need a sack")) then
    --e.self:Say("Take this sack and combine the items I requested in it. Then return it to me.");

  elseif(e.message:findi("purify") and e.other:HasItem(52952)) then
    e.self:Say("The purification is not something that I alone have the power to complete. There was once a crystal that held the power to purify something of this magnitude, however it was shattered long ago. You will need to speak to the masters that remain of dwindling races.");
  elseif(e.message:findi("races") and e.other:HasItem(52952)) then
    e.self:Say("The masters are of races that walked Norrath before you or I. I do not know their current whereabouts. Alaurin and Vohnkare were the eldest of the four. There was a noble . . Ah, yes and Feyana. I do hope you find them.");
  end
end

function event_trade(e)
  local item_lib = require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 10603})) then
    e.self:Say("I see that you have what I was waiting for. Stofo does do excellent work. It seems that you are to start on a long journey. Take this seal and it will guide you on your next step. Seek out the masters of enchantment. In time we will craft the Serpent for you. When you have collected the four parts of the staff, you must combine them in a bundle and return them to me.");
    e.other:SummonItem(10604); -- Item: Jeb's Seal
    e.self:Say("Take this seal. You will need to show my seal to the other masters so that they may grant you the tools to complete your next tasks. When you have collected the four parts of the staff, you must combine them in a bundle for me. The other masters can provide the means to bundle them. Good luck and safe travels.");
    e.other:AddEXP(5000);
  elseif(item_lib.check_turn_in(e.trade, {item1 = 10639})) then
    e.self:Say("The path you trod was long and hard. Now you are worthy to bear the Serpent. Use it well.");
    e.other:Faction(404,30); -- Faction: Truespirit
    e.other:AddEXP(1500000);
    e.other:SummonItem(10650); -- Item: Staff of the Serpent
  elseif(item_lib.check_turn_in(e.trade, {item1 = 54267})) then
    e.self:Say("As I suspected, this is something extraordinary. You must go speak to Maelin at once. It has been many moons since I have entered the Plane of Knowledge. He may well have some new information for me. Go at once and tell him I sent you.");
    eq.set_global("ench_epic","2",5,"F");
  elseif(item_lib.check_turn_in(e.trade, {item1 = 52959})) then
    e.self:Say("Interesting indeed. I see that I was not wrong in my instinct to begin this as quickly as possible. I have created a list of the items that you will need to begin the construction of this tool. Mind you, it will not be a simple thing. When you have gathered them all return to me. Would you like a [" .. eq.say_link("chest") .. "] to carry them in?");
    e.other:SummonItem(54286); --Assembling the Staff
    eq.set_global("ench_epic","3",5,"F");
  elseif(item_lib.check_turn_in(e.trade, {item1 = 52966})) then
    e.self:Say("You have done well, my student. The staff is now complete. In order to stand up to the true fury of discord, it will need purifying, but even in this state it shall protect you well.");
    e.other:SummonItem(52952); --Oculus 1.5
    e.other:AddAAPoints(5);
    e.other:Ding();
    e.other:Message(15,'You have gained 5 ability points!');
    eq.set_global("ench_epic","7",5,"F");
  elseif (item_lib.check_turn_in(e.trade, {item1 = 52947, item2 = 52945})) then
    e.self:Say("How very interesting. This could prove to be invaluable to my work. I have long been researching a new and most powerful tool to help our kind. It is necessary in these most dangerous of times. Unfortunately, it appears as though time has taken its toll on this tome. It is incomplete. Seek the missing pages so that I may study it in depth. There should be ten, unless they have been destroyed by time and decay.");
    e.other:SummonItem(57918); -- Item: Tattered Illegible Tome
    eq.set_global("EnchPre","2",5,"F");
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
