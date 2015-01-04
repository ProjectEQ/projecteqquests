--lakeofillomen/#Spirit_Sentinel.lua NPCID 85228
--Shaman Epic Prequest
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shaman_pre"] == "1") then
		e.self:Say("Ah so the Elder Spirit of Enlightenment has sent you to me. I do have a task for you if you wish to help the cause of the spirits across the lands. I have been charged with making an elixer that will aid the spirits for a time. Are you [interested] in aiding us?");
	elseif(e.message:findi("interested") and qglobals["shaman_pre"] == "1") then
		e.self:Say("Very well then. First you must do what you can to prove yourself to our kind. There are some tests you must perform in order to gain our trust. At the end of this path, we may consider you one of the Heyokah -- the most trusted of those align themselves with shaman everywhere. You will be required to take on the tests of Patience, Wisdom, and Might. Bring me the Black fur Boots you receive to me.");
	elseif(e.message:findi("ingredients") and qglobals["shaman_pre"] == "2") then
		e.self:Say("I will need some unique blood from a crystal-like spider from a valorous plane, a special leaf that an insect of the diseased hordes eats whole and antennae from a skittering bug in Taelosia. I will also need you to make your way into the deserts of Ro and find a lonely merchant who sells a unique vial I require. Return all of these to me and you will find yourself able to walk a greater path.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 1678}) and qglobals["shaman_pre"] == "1") then --hand in Black Fur Boots (Received early in the 1.0 epic line)
		e.self:Say("You can now be called a heyokah, but there is much you may still do. I do require several [ingredients] for the potion I am required to make and should you assist me, there is a spirit with even greater tasks that will give you audience.");
		eq.set_global("shaman_pre","2",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57988, item2 = 57989, item3 = 57990, item4 = 57991}) and qglobals["shaman_pre"] == "2") then --hand in Crystallized Blood (drops from A Crystalline Arachnae in the Plane of Valor), Mellian Leaf (drops from a malarian crysalis in the Plane of Disease), Stonemite Antennae (drops from a shore stonemite in Natimbi), and Clouded Glass Vial (get from Bratoq Jiplup in SRO for 2000 plat)
		e.self:Say("You have served us well and now I may get to work. You are indeed ready and should seek out the Elder Spirit of Enlightenment as soon as you are able. Should he deem you worthy and wise enough, he will have much work for you to do to preserve the way of the shaman.");
		eq.set_global("shaman_pre","3",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	