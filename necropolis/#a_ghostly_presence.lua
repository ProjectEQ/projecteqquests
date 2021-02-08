-- items: 2063
function event_spawn(e)
	eq.set_timer("depop",600000);
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 2063}, 0)) then
		e.self:Say("Graaahhhh!' as the air about you begins to shudder violently. The blood from the vial is held suspended in mid air, swirling about the chamber. It begins swirling faster and faster until the blood is spattered upon some discarded dragon bones. All is then quiet, and suddenly the bones spring to life in vigorous animation. They form a great dragon skeleton and immediately attack you!");
		eq.spawn2(123194,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0):AddToHateList(e.other,1); --#Garzicor`s_Corpse (123194)
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
end
