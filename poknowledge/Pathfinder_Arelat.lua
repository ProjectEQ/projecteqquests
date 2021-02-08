-- items: 62839, 62840, 62841
function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to New Tanaan, friend, and know us as neither friend nor foe. We are your allies in knowledge and shall guide you wherever we are able. Each citizen of New Tanaan, be them a child of the gods or a creature of the natural wilds, has come forward in these times to offer their wisdom and guidance unto you in any way possible. I traveled Norrath once as a pathfinder of Karana, but my fate would eventually call me here where I progressed beyond my mortal limits. Though you have some time left in you before such possibilities are open to you, perhaps the spells I have penned from memory of my service to Norrath will come to be of some use.");
	elseif(qglobals["druid_epic"] == "2" and e.message:findi("Corruption of the Night")) then
		e.self:Emote("raises an eyebrow. 'Now where did you hear that name?' He looks intently at you for a moment. 'You've been talking to Beddia. She's been trying to get a copy of that text for a long time. I've been careful not to let her get one, if only for the principle of the thing. It's obvious that she sent you here, or one of her minions. Why would I want to give it to you? More importantly, why would a druid want to give it to her?' Arelat raises a hand, 'No, you don't have to tell me. If I can't trust you, " .. e.other:GetName() .. ", then I suppose I can't even trust myself. Just tell me that it's worth it.");
	elseif(qglobals["druid_epic"] == "2" and e.message:findi("worth it")) then
		e.self:Say("Then here it is. This is a copy of an ancient text that we have preserved and copied for many long years. The author died generations ago. You should read it before you give it to that witch. Good luck to you, friend.");
		e.other:SummonItem(62839); --Fresh Awakenings vol. 1
		e.other:SummonItem(62840); --Fresh Awakenings vol. 2
		e.other:SummonItem(62841); --Fresh Awakenings vol. 3	
	end
end

function event_trade(e)
	local item_lib = require("items");

	item_lib.return_items(e.self, e.other, e.trade)
end