-- items: 13241, 13245, 2012, 17001, 10004, 10017, 1038, 10016, 13877, 2135, 7007, 8008, 10009, 13007, 5014, 13003
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail, mighty " .. e.other:GetName() .. "! I assume ye must be a [warrior o' the Wolves]. Why else would ye approach a trainer such as meself, then?");
	end
	if(e.message:findi("the wolves")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Aye, 'tis as I thought. I'm glad t' see we've warriors such as yerself amongst the Wolves o' the North. Lately, Kylan's been allowing too many scrawny warriors in, methinks. Nor have they fared well in Everfrrost. Many frreeze to death, ye know... Will ye assist me and [deliver an elixir to young warriors] in Everfrost?");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
		else
			e.self:Say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		end
	end
	if(e.message:findi("young warrior") and e.other:GetFaction(e.self) < 5) then
		e.self:Say("Ach, 'tis good o' ye! Take this bottle of elixir to Everfrost Peaks. Find Talin O'Donal. He'll take the first sip, and then instruct ye on who else ye need to find. Do that, and I'll give ye a fine reward when ye return the empty elixir bottle. Good luck, then. Don't die.");
		e.other:SummonItem(13241); -- Item: Full Bottle of Elixir
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13245})) then
		e.self:Say("Ye've proven yerself to be a cut above the rest and aided yer fellow warriors, no matter how worthless they were. Ye may take this. It was found in the snow by one of our foraging parties. I hope it can be of use to a warrior like yerself.");
		e.other:Ding();
		e.other:AddEXP(125);
		e.other:GiveCash(3,0,0,0);
		e.other:SummonItem(eq.ChooseRandom(2012,17001,10004,10017,1038,10016,13877,2135,7007,8008,10009,13007,5014,13003)); -- random low level items
		e.other:Faction(328,10); -- 328 : Faction Merchant's of Halas
		e.other:Faction(327,10); -- 327 : Faction Shaman of Justice
		e.other:Faction(311,10); -- 311 : Faction Steel Warriors
		e.other:Faction(320,10); -- 320 : Faction Wolves of the North
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

