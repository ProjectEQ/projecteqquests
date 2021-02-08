-- items: 13071
function event_say(e)
	if(e.message:findi("hail")) then --Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
		e.self:Say(string.format("Hi there %s. Think you could help me out a bit? I was hired to get rid of all these pesky rodents running around town but there seems to be no end to them! They are ruining the jumjum field and worse yet, if I dont get rid of them all, my boss wont give me the muffins he promised me! Think you could hunt some of the rodents down and bring me back four rat whiskers? I would pay you of course!", e.other:GetCleanName()));
	end
end

function event_trade(e)
local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13071, item2 = 13071, item3 = 13071, item4 = 13071})) then --End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
		e.self:Say('Nice work! Take these coins. Oh no, there are still more rodents! I better get to work. Farewell, friend!');
		e.other:Faction(263,10); -- Faction: Guardians of the Vale
		e.other:Faction(286,10); -- Faction: Mayor Gubbin
		e.other:Faction(355,10); -- Faction: Storm Reapers
		e.other:Faction(292,10); -- Faction: Merchants of Rivervale
		e.other:Faction(334,-10); -- Faction: Dreadguard Outer
		e.other:AddEXP(5);
		e.other:GiveCash(1,1,1,0);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end


