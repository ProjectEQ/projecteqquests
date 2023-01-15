-- Quest for Raskena Djor in erudnint - Wizards first assignment 
-- items: 10307, 13250, 15373, 15054, 15205, 15288, 15372, 15374

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. What brings you to Raskena? Did Ghanlin send you?"); 
	elseif(e.message:findi("ghanlin")) then
      e.self:Say("Then let us begin your first task. I require some components for an experiment I have been meaning to conduct. If you could [gather] them for me, I will make sure that you are rewarded."); 
	elseif(e.message:findi("gather")) then
      e.self:Say("In Toxxulia Forest you should be able to find some fire beetles. I require two fire beetle legs and two fire beetle eyes. Once you have collected them, bring them to me for your reward."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10307,item2 = 10307,item3 = 13250,item4 = 13250})) then -- random level 1 spell and experience 
		e.other:SummonItem(eq.ChooseRandom(15373, 15054, 15205, 15288, 15372, 15374)); -- Item(s): Spell: Sphere of Light (15373)
		e.self:Say("You have passed your first task. Nice work. Take this spell as your payment."); 
		e.other:Ding();
		e.other:AddEXP(150);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:23041 -- Raskena_Djor