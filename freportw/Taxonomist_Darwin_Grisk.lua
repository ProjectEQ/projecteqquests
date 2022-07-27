-- items: 17590, 17591, 63009, 63010, 63015, 63050, 63051
function event_say(e)
	local qglobals = eq.get_qglobals();
	
	if(e.message:findi("hail")) then
		e.self:Say("Have you come to [help]? If not, be gone! I will not have my time wasted.");
	elseif(e.message:findi("help")) then
		e.self:Say("Recently rumors have surfaced that a new race, the Luggalds, walks the land. I suspect that some evil force is involved in their appearance. Are you [willing] to risk unknown dangers to help me find out?");
	elseif(e.message:findi("willing")) then
		e.self:Say("Good. I have not been able to confirm the existence of these beings. I will need definite proof if the rest of the members of the Academy are to believe me. Take this Warded Satchel and retrieve three examples of Luggald Flesh.");
		e.other:SummonItem(17590); -- Warded Satchel
	elseif(e.message:findi("aid")) then
		e.self:Say("Travel to the Crypt of Nadox and slay as many of the Luggalds there as you can. This will slow their plans, but to truly damage their efforts I will need more information. Bring me three more samples of their fecund flesh so that I can compare them with the other examples. Combine them in this Warded Chest.");
		e.other:SummonItem(17591); -- Warded Chest
	elseif(e.message:findi("hail") and qglobals["grisk"] == "1") then
		e.self:Say("Thank the gods, you have returned safely! We had heard tell of your battle. Did you by chance find anything of informational value?");
		eq.delete_global("grisk");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 63009})) then
		e.self:Say("Very good. This will no doubt convince the others. However, we don't have time to wait for their consensus. Deep in the uncovered Crypt of Nadox the Luggalds seem to be at work. This can mean nothing good for the mortal world. You must provide further [aid].");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 63010})) then
		e.self:Say("Alas, it all becomes clear! The Luggalds seek to spread their vile race. I had received word of a dark elf performing arcane rites on the shores of Toxxulia Forest. Now I know she must be attempting to summon other Luggalds. She is expecting an agent of the enemy. Talk with her. Then deal with her and any evil she creates.");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 63015})) then
		e.self:Say("Well done. I can only imagine the evil you averted. Here. Take this a token of my personal thanks. May we all continue to benefit from your valor.");
		if((e.other:Class() == "bard") or (e.other:Class() == "beastlord") or (e.other:Class() == "paladin") or (e.other:Class() == "ranger") or (e.other:Class() == "rogue") or (e.other:Class() == "shadowknight") or (e.other:Class() == "warrior")) then
			e.other:SummonItem(63050); -- Item: Bonebite
			e.other:Ding();
			e.other:AddEXP(5000);
		else
			e.other:SummonItem(63051); -- Item: Signet of Grisk
			e.other:Ding();
			e.other:AddEXP(5000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:freportw -- Taxonomist_Darwin_Grisk