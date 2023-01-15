-- items: 12102
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great!! I have fifty acres to seed and now I have visitors stopping by to waste my time!!");
	elseif(e.message:findi("follower of Karana")) then
		e.self:Say("Yes. I am a follower of Karana, the Rainkeeper. It is He who keeps the plains fertile.");
	elseif(e.message:findi("blanket")) then
		e.self:Say(string.format("With the frequent rains, I find my only need is a blanket to keep me warm during the long cold nights. Thank Karana the temple has begun to send young %s to deliver extra blankets.",e.other:Class()));
	elseif(e.message:findi("karana bandits")) then
		e.self:Say("The Karana bandits are rogues who operate in the plains. I have heard there are bounties for the bandits. Within the Temple of Thunder in Qeynos, Cleric Gehna offers one for bandit spectacles and Paladin Chesgard offers one for bandit sashes.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12102})) then
		e.self:Say("Thank you, protector of Karana. This will be handy when the cold rushes into the valley. Allow me to offer you some provisions for your journey. And, might I add, the [Karana bandits] have begun to operate much closer to Qeynos.");
		e.other:Ding();
		e.other:Faction(345,1,0); -- Faction: Karana Residents
		e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(341,1,0); -- Faction: Priests of Life
		e.other:Faction(280,1,0); -- Faction: Knights of Thunder
		e.other:AddEXP(0);
		e.other:GiveCash(12,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
