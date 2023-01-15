-- items: 54313, 52947
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:Class() == "Enchanter") then 
		if(e.message:findi("are you aida") and qglobals["EnchPre"] == "1") then
			e.self:Say("'How do you know my name?");
		elseif(e.message:findi("bloodgill mimic") and qglobals["EnchPre"] == "1") then
			e.self:Say(" 'Then he has sent you has he... I wish that I had fared better in these years of study. It is true that I have learned many things, but there is one tome most closely guarded that I have yet to see.'");
		elseif(e.message:findi("what tome") and qglobals["EnchPre"] == "1") then
			e.self:Say(" 'I believe it contains the very knowledge our master seeks. In fact, I am sure of it. You must obtain it, I have tried and tried and failed at every juncture.' ");
		elseif(e.message:findi("where") and qglobals["EnchPre"] == "1") then
			e.self:Say("'It is held by a Shissar here in the temple. I believe he wanders in order to think, that would be the best time to retrieve it' ");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["EnchPre"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 54313})) then -- crumbling tomb
		e.self:Say(" 'It is remarkable that you have found it! Unfortunately, it appears to be written in some language so archaic I cannot even begin to decipher it. Please, you must see Rilgor about a translating device. I will stay here and see if I can find anything further that would be of use.' ");
		e.other:SummonItem(52947); -- Item: Illegible Tome
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
