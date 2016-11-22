--iceclad/Fazzle_Thumpkin.lua NPCID 
--Warrior Epic 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["warrior_epic"] == "17") then
		e.self:Say("Damnable interruptions! Can't you see I'm looking for my pestle?! I lost that blasted thing months ago and haven't been able to find it! What will I do without my pestle?! My poor, poor pestle. Where have you gone? I thought I'd lost it around here somewhere, but maybe I left it near one of those statues during my surveying of the islands. Drat and double drat! Where did I leave you? Woe...");
	elseif(e.message:findi("map") and qglobals["warrior_epic"] >= "18") then
		e.self:Say("I've had this map for a long time. I can't seem to remember who gave it to me. I may have even made it myself. I do remember that something special can be found by following where the map leads. It's a magical map and will only show you the way in the dead of night, and only in the eastern wastes of this dreadful ice-covered place. You have to hold onto it tightly for it to work, keep that in mind! Good luck, you may need it!");
		e.other:SummonItem(60324); --Fazzle's Map of East Wastes
	end	
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 60323}) and qglobals["warrior_epic"] == "17") then --Frozen Pestle, GS in Iceclad Ocean
		e.self:Say("You... you found it! My pestle! Hooray! I can get back to my work! I'm so grateful for this kind act, I've got to have something in my knapsack that you want! Here, how about some lint... wait, how did that get in there. You don't want lint! Hah! How about some cogs? No, what would you do with cogs? I know... you'll be able to make special use of this [map] I have.");
		eq.set_global("warrior_epic","18",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	