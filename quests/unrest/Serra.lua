function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("H..h..hello? Can you help me? I lost [something] and I need it so I can go back home.");
	elseif(e.message:findi("something")) then
		e.self:Say("I never got my doll for my birthday. Before he could bring it to me I was h..hurt by the bad man. I cannot leave without my doll. Will you please help me?");
	elseif(e.message:findi("doll")) then
		e.self:Emote("claps her hands. 'Oh goody! But... I cannot seem to remember his name. He gave me this note before I...");
	elseif(e.message:findi("note")) then
		e.self:Say("I hope it will help you out. Please find him so I can leave this place?");
		e.other:SummonItem(20374);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 20370})) then
		e.self:Say("Oh! You have the dolly! Thank you! Thank you! Thank you! I can go home now. Please give this to my father, Baenar. He will understand when he gets it.' Serra begins to fade away. 'Bye bye!");
		e.other:Ding();
		e.other:SummonItem(20371);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:unrest  ID:63029 -- Serra