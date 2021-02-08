-- items: 13108, 12267, 13109, 9312
function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Beware!!..  Beware, the Teir'Dal walk the halls of Highkeep!!");
	elseif(e.message:findi("princess lenya thex")) then
		e.self:Say("The Princess Lenya Thex is the daughter of His Royal Majesty, King Tearis Thex of Felwithe. She was on her way to Qeynos when we believe she was kidnapped by Carson McCabe, the governor of this vile city. I await the paladin from Felwithe.");
	elseif(e.message:findi("all is not bright above the clouds")) then
		if(fac < 4) then
			e.self:Say("Taken from this place she has been.  Seek the Highpass hussy.  Ask of her.  Only she knows where.  Find the Princess.  Give her this.  Show your allegiance.  This and her key. Then return the room key to me with the prize from the princess.  Become a hero!!");
			e.other:Ding();
			e.other:SummonItem(13108); -- Item: Tearon's Bracer
		else
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12267,item2 = 13109})) then
		e.self:Say("Peace..  I can rest now.  You now hold my Silent Watch Shield.  Protect Felwithe..");
		e.other:SummonItem(9312); -- Item: Silent Watch Shield
		e.other:Ding();
		e.other:Faction(5001,10,0); -- Faction: Anti-mage
		e.other:Faction(226,10,0); -- Faction: Clerics of Tunare
		e.other:Faction(279,10,0); -- Faction: King Tearis Thex
		e.other:AddEXP(2000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
