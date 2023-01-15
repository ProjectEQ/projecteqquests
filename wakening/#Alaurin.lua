-- items: 54239, 52952, 119184, 52949, 52955
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and e.other:Class()=="Enchanter") then 
		e.self:Say("Hello, coercer. Why have you disturbed me?");
	elseif(e.message:findi("crystal")) then	
		e.self:Say("My crystal, you say? Now that is something I hold very dear. It is my most beautiful trinket. I must say, I've never had occasion to use it however . . . Actually, I believe I can make you a deal.");	
	elseif(e.message:findi("deal")) then	
		e.self:Say("I know of a stone that I could use in its stead, but before we go into that I must ask something of you. If you truly desire this piece of crystal, you must bring me the heart of a twisted stoneservant. I have heard stories of invaders that have infested this newly found continent of Taelosia, where they have managed to turn their very servants against them. This sort of utter control is very interesting to me, and I would like to study it. Once I have the heart, I know where you can find a gem to replace my crystal.");					
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 54239}) and e.other:HasItem(52952) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(119184) == false) then
		e.self:Say("How very interesting. There is a geonid of great beauty that I have seen nearby in the caves. I have coveted its shining gem for some time. Destroy it and bring me the stone and I shall let you have your fragment.");
		e.other:AddEXP(10000);
		eq.spawn2(119184,0,0,-16,-2730,-4,48); -- NPC: #a_luminescent_geonid
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 52949}) and e.other:HasItem(52952)) then
		e.self:Say("It is even more beautiful from up close. Look at the way it sparkles! Take your fragment then, and leave me in peace.");
		e.other:AddEXP(10000);
		e.other:SummonItem(52955); -- Item: Purifying Crystal Fragment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
