-- items: 18923, 13158
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey, hello there, " .. e.other:GetName() .. ". It's been so busy around here lately! Barely time to eat and sleep, let alone have any fun. Oh well, it keeps me employed. But, I really could use someone to [help] me out around here.");
	elseif(e.message:findi("help")) then
		e.self:Say("Yea and if you can help me out with A few things that'd be great. Geez and where do we Start? I need someone to run over to [Janam and Rebby's]? Can you do that for me?");
	elseif(e.message:findi("janam and rebby")) then
		e.self:Say("Janam and Rebby are A couple of merchants working the area around the Theater of the Tranquil and the Ashen Order, in West Freeport. It's part of my job to keep tabs on those two rascals. I need someone to take this note to Rebby for me. Don't worry, your efforts won't go unnoticed " .. e.other:GetName() .. ".");
		e.other:SummonItem(18923); -- Message to Rebby
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13158})) then -- Rebby's Rat Whiskers
		e.self:Say("Thank you " .. e.other:GetName() .. ", You have done well.");
		e.other:Ding();
		e.other:Faction(336,10,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(229,10,0); -- Faction: Coalition of Tradefolk
		e.other:Faction(329,1,0); -- Faction: Carson McCabe
		e.other:Faction(230,1,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(330,1,0); -- Faction: The Freeport Militia
		e.other:AddEXP(62);
		e.other:GiveCash(7,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10105 -- Nestral_TGaza
