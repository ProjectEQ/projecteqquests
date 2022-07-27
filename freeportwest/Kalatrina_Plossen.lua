-- items: 18817, 18818
function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say("Hail!  Welcome to the Hall of Truth.  We. the Knights of Truth. are all the hope this city has of loosening the grip of Lucan D'lere and his militia.  I seek a young knight to [serve the will of the Truthbringer].");
	elseif(e.message:findi("what serve the will of the truthbringer")) then
		e.self:Say("Shame on you.  To set foot into the Hall of Truth and not know for whom it was built.  Still. it is never too late to see the light.  Mithaniel Marr is our deity.  He is the Truthbringer.  By living our lives in valor and crushing all those who suppress His beliefs. We serve Him.");
	elseif(e.message:findi("i serve the will of the truthbringer") or e.message:findi("will serve the will of the truthbringer")) then
		if(fac < 5) then
			e.self:Say("Stand tall then, knight! We have need of your services. We have sent a man to infiltrate the militia. We fear he may soon be found out. Take him this note of warning. Say the words, 'Truth is good,' and you shall find him. Be careful, young knight. The militia does not take prisoners.");
			e.other:SummonItem(18817); -- A Sealed Letter (To Alayle)
		else
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		end
	elseif(e.message:findi("zimel's blades")) then
		if(fac < 5) then
			e.self:Say("Why would Lucan visit a condemned building? He must be searching for something. When I last visited the local forge, I heard rumors of Lucan searching for a sword named Soulfire. If this is true, you must find it first! No more power should go his way. Seek this sword out!");
		else
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18818})) then -- A Tattered Flier
		e.self:Say("Zimel's Blades?! Hmmmmm. It doesn't ring a bell and the remainder of the writing is too hard to make out. It kind of looks like a list of prices. You know, down at the Office of the People they might be able to tell us if this place exists. Go speak with Rashinda. She knows all about Freeport. If [Zimel's Blades] existed, you must report back to me what happened to it.");
		e.other:Ding();
		e.other:Faction(330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(311,1,0); -- Faction: Steel Warriors
		e.other:Faction(281,1,0); -- Faction: Knights of Truth
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
