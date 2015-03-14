--everfrost/Kimber_Whitefoot.lua NPCID 30104
--Warrior Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["warrior_epic"] >= "4") then
		e.self:Say("Yes, yes, you again. I had a chance to examine the vial you gave me. Quite an interesting substance, I must say. Scary though. Where did you say you found it? Never mind, it's not important. I made a potion out of the vial, but I can feel an evil presence within. I want to be rid of it, so you can have it back. Please don't come to me with anything like that again. I'm really not into dealing with spirits of such heinous design. Good luck.");
		e.other:SummonItem(60306); --Potion of Blackfall Spirit
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 60305}) and qglobals["warrior_epic"] >= "3") then --Sealed Vial of Blackfall Blood (from korbuk)
		e.self:Say("Great, wait out here for a while. I've got to make a trip into the frozen mountain of Permafrost, but I'll be out some time this evening. I should have enough time on my trek to examine the vial. I'll be back soon!");
		if(qglobals["warrior_epic"] < "4") then
			eq.set_global("warrior_epic","4",5,"F");
		end
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	