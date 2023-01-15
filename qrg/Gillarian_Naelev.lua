-- items: 13813, 8803, 13825
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, friend. Welcome to Surefall Glade. I need not remind you about [poaching], I hope");
	elseif(e.message:findi("poaching")) then
		e.self:Say("Poaching is illegal. We here are the Protectors of the Pine, rangers sworn to protect our land and all its inhabitants. This includes the wildlife. We spend a lot of time hunting poachers. If you want to [join the hunt], just let me know.");
	elseif(e.message:findi("join the hunt")) then
		e.self:Say("Very good, friend. Be on the lookout for poachers in Surefall Glade or Qeynos Hills, especially in the nearby caves. The poachers are not always human. Often times we find ourselves a Blackburrow gnoll or two. Bring me back their heads. Let's see how they look mounted above the mantle! Be on your way, then.");
	elseif(e.message:findi("master poacher")) then
		e.self:Say("'The master poacher is Talym Shoontar. If you wish to collect the bounty on this vile man, be sure to speak with our leader, Hager Sureshot. No doubt you will find him practicing his skills at the archery range.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13813})) then
		e.self:Say("Fantastic work!! Hager will be pleased. Not only do we rid ourself of a poacher, but we rid the land of these destructive gnolls. Our fletchers crafted this for me... Please take it as thanks.");
		e.other:SummonItem(8803); -- Rough Elm Recurve Bow
		e.other:Ding();
		e.other:Faction(302,3,0); -- Protectors of Pine
		e.other:Faction(272,3,0); -- Jaggedpine Treefolk
		e.other:Faction(306,-3,0); -- Sabertooths of Blackburrow
		e.other:Faction(262,3,0); -- Guards of Qeynos
		e.other:AddEXP(6000);
		e.other:GiveCash(0,2,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13825})) then
		e.self:Say("Your deeds are great indeed. We shall cleanse our land of these poachers once and for all. A report has surfaced of a [master poacher].");
		e.other:Ding();
		e.other:Faction(302,3,0); -- Protectors of Pine
		e.other:Faction(272,3,0); -- Jaggedpine Treefolk
		e.other:Faction(306,-3,0); -- Sabertooths of Blackburrow
		e.other:Faction(262,3,0); -- Guards of Qeynos
		e.other:AddEXP(6000);
		e.other:GiveCash(0,2,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
