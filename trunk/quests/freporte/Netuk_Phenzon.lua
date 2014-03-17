function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome " .. e.other:GetName() .. ". Let us fill your heart with hate. May you carry that hate unto your fellow citizens. Innoruuk has need of your services. We have A [mission] for you.");
	elseif(e.message:findi("mission")) then
		e.self:Say("There is a man called Groflah Steadirt. He frequents a bar here in Freeport during the early evening hours. Our sources tell us he was given a piece of parchment taken from one of our allies. Who that is, is none of your business. We only require you to recover the parchment, which he no doubt has on him. End his life and return the note to me. Do not let me see your miserable face again until you have the parchment.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18818})) then -- Tattered Flier
		e.self:Say("It is about time you returned! Innoruuk would be proud of the red you have spread upon the land.");
		e.other:SummonItem(15343); -- Spell: Siphon Strengh
		e.other:Ding();
		e.other:Faction(86,1,0); -- Dismal Rage
		e.other:Faction(184,-5,0); -- Knights of Truth
		e.other:Faction(235,1,0); -- Opal Dark Briar
		e.other:AddEXP(500);
		e.other:GiveCash(0,12,6,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10101 -- Netuk_Phenzon