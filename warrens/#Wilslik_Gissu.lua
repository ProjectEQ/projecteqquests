--warrems/Wilslik_Gissu.lua NPCID 101133
--Shaman Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("elder spirit sent me") and qglobals["shaman_epic"] == "1") then
		e.self:Say("Greetingsss fair sage. It would seem that you have come to aid the spirit who fades like each breath we let pass through our lips. There is not [much time] to dawdle. We must get to work right away. As an alchemist yourself, I will tell you what you must do. You must first make some separate combinations. Do not attempt to do this if you are not a master. You will most certainly fail. Ready for instruction?");
	elseif(e.message:findi("much time") and qglobals["shaman_epic"] == "1") then
		e.self:Say("How shall I put this in termsss you will understand? Two of the rare items of nature's bounty will join because they live in darkness. The others will join because they share love of light. You must use the medicine bag given to you by my old friend -- and entrepreneur -- Wunshi. When you've successfully worked with those, tell me you have completed the first step.");
	elseif(e.message:findi("first step") and qglobals["shaman_epic"] == "1" and e.other:HasItem(57369) and e.other:HasItem(57550)) then
		e.self:Say("Nicely done, friend. You have done good work. Now, give me both of those pieces and I will fashion what you need to return to the spirit.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(qglobals["shaman_epic"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 57550, item2 = 57369})) then -- hand in Shadowed Pulp and Brittle Twigs (both are result of combines of quest items gathered up to this point, recipes probably need to be added to db)
		e.self:Say("Take these and return to the spirit!");
		e.other:SummonItem(52921); --Distilled Potion of Endurance
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end