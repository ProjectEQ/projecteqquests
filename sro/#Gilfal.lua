-- items: 69901, 69902, 69911, 69912
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	
	if e.message:findi("hail") then
		e.self:QuestSay(e.other, "Hello " .. e.other:GetName() .. ", I have been stationed here by the elders of Gukta to patrol and protect our mighty city.")
	elseif qglobals["pre_pal"] == "1" and e.message:findi("I am willing to help you rebuild Couragebringer") then
		e.self:QuestSay(e.other, "Yes? You know of my sword? Show me proof that you are capable of rebuilding my holy blade.");
	end
end


function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
		if qglobals["pre_pal"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 69901}) then -- Solvent
			e.self:QuestSay(e.other, "Amazing, "..e.other:GetRace()..", you must have visited the Plane of Valor and spoke to Master Baltron. You will need to gather the four pieces of the sword to be able to reconstruct it. I only have the whereabouts of one of the four pieces, but I imagine that piece can lead you to the others. Go to the Plane of Storms and investigate there, I have a feeling you may find the first piece there. Here is the sword's scabbard to place the solvent and the four sword pieces in.");
			eq.set_global("pre_pal","2",5,"F");
			e.other:SummonItem(69902); -- scabbard
		elseif qglobals["pre_pal"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 69911}) then
			e.self:QuestSay(e.other, "Thank you for returning my sword " .. e.other:GetName() .. ", however this sword is incomplete. While it appears whole, the blessing of Rathalzor is missing. Please go back to Master Baltron in Plane of Valor and give him this fractured blade. Perhaps he can restore it to its original power. Go now and return this sword back to its true strength, friend!");
			e.other:SummonItem(69912); -- sword back but diff ID for turn-in.
			eq.set_global("pre_pal","4",5,"F");
		end		
	item_lib.return_items(e.self, e.other, e.trade);
end
