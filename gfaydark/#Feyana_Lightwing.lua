-- items: 57917, 52952, 119184, 52958
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and e.other:Class()=="Enchanter") then 
		e.self:Say("Greetings. It is not often that your kind has reason to speak to us. You must be seeking something.");
	elseif(e.message:findi("crystal")) then	
		e.self:Say("To even be aware of the crystal's existence you must be of some power. I can only assume that if you are repairing it that you have good reason. It is yours if you can do me one small favor.");
	elseif(e.message:findi("favor")) then	
		e.self:Say("There is a Dryad that has something that belongs to me. There is no rift between our kind, however you could say this is more of a personal conflict. You see, I was once given a necklace from their people in return for a service provided long ago. It was the most beautiful Dryad necklace I have ever seen, and it was stolen. I believe the culprit's name is Firwyn. Travel to the Jaggedpine Forest and seek out Chef Brargus, he should know where to find her. If you can bring me back the necklace the fragment is yours.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 57917}) and e.other:HasItem(52952) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(119184) == false) then
		e.self:Say("Even lovelier than I remembered. Thank you ever so much.");
		e.other:AddEXP(10000);
		e.other:SummonItem(52958); -- Item: Purifying Crystal Fragment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
