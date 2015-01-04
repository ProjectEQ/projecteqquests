--twilight/Tikl_Huk.lua NPCID 170265
--Shaman Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("elder spirit sent me") and qglobals["shaman_epic"] == "1") then
		e.self:Say("Yous sent by spirit? Me surprised it send so quick. Me no time to get da shrub yets. Yous will needs to get three of dem. Da shrub only grow nearby in only few spots. Gib dem to me when yous nab dem.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 57080, item2 = 57080, item3 = 57080})) then -- hand in 3x Twinkling Shrub (Groundspawns around Twiligt Sea, these already spawning)
		e.self:Say("Me proud! Now you must protect dat for da spirit. It need it badly. You be careful. Dere might be some baddies out dere dat may want to take dat from you. Spirit said dere are evils working against us. I hab tied da shrub for you so dat it don't get ruined.");
		e.other:SummonItem(52920); --Tied Twinkling Shrubs
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	