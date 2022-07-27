-- items: 57919, 52951, 57920
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and qglobals["ench_epic"] == "9") then 
		e.self:Say("I have been expecting you. There are still a few things more for you to do before the staff is properly prepared. For the next step you will need to travel into Discord and gather two items that I need to perform the next step in the purification process. A great beast by the name of Cipheron has hoarded an incantation for many years. I believe he killed one of our students who was unfortunate enough to get in his way... Reguardless, I will need it. You will also need to gather a noxious secretion from a withering murkglider. It is a strange fluid they begin to secrete as they are dying, and it is very powerful. Bring me this incantation and the secretion and we shall get started.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["ench_epic"] == "9" and item_lib.check_turn_in(e.trade, {item1 = 57919,item2 = 52951})) then
		e.self:Emote("murmurs in a strange tongue as she scans the incantation. She draws an intricate design along different portions of the staff, using the strange secretion, from which rises a pale green smoke. At last she stops and opens her eyes. 'Perfect. This tool has been consecrated and protected in the best way I know. There is but one thing left to do, for the staff is ready but not yet tested. Take this channeling crystal and venture into the land riddled with discord. When you encounter great evil there, you will recognize the energy of discord. Channel this energy into your staff, and it will become something more powerful than this world has seen. I wish you luck.");
		e.other:SummonItem(57920); -- Item: Channeling Crystal
	end
	item_lib.return_items(e.self, e.other, e.trade)
end