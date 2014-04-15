function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahh salutations young adventurer. I'd love to chat, but I have much studying to do. Farewell.");
	elseif(e.message:findi("help")) then
		e.self:Say("Wonderful. The beast took my tool kit whilst I slept at camp. I awoke only to see him paddling frantically out into the ocean in a small boat. He couldn't have gone very far. If you stand at my [camp] and look towards the next closest head stone, you will be facing the direction in which the Kerran thief fled. Swim straight out from there and you should see his cunning little boat.");
	elseif(e.message:findi("camp")) then
		e.self:Say("My camp is next to the head stone on the eastern most portion of this island. The Kerran may have dropped some of my tools inot the ocean as it fled. Please return the complete tool kit and I'll make sure my brother rewards you");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18173})) then
		e.self:Say("Gans sent you to check on me did he? Well you can tell my dear brother that the surveying has been halted. One of those furballs has stolen my tools, making my job impossible. Kerrans, kobolds, gnolls, we're constantly under siege by these primitives. Anyway, perhaps you could [help me]?");
		e.other:Ding();
		e.other:AddEXP(150);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1768})) then
		e.self:Say("Thank you for recovering my tools, please take this to my brother for your reward.");
		e.other:SummonItem(1771);
		e.other:Ding();
		e.other:AddEXP(150);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EndFile: erudsxing\Yelesom_Paust