function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("rustles and looks up at you in acknowledgment.");
		eq.signal(19052, 0); -- Reebo_Leafsway
	end
end

function event_trade(e)
	local item_lib = require("items");
    local class = e.other:GetClass();

	if(item_lib.check_turn_in(e.trade, {item1 = 14321})) then
		e.other:SummonItem(eq.ChooseRandom(13980, 13980, 14031));
		e.other:Ding();
		e.other:AddEXP(500);
	elseif((class == 8 or class == 9) and item_lib.check_turn_in(e.trade, {item1 = 11139})) then
		e.other:Message(0,"You remove the dilapidated pumpkin from Shakey's wooden neck post and replace it with the new one. A haunting voice rings in your ears");
		e.self:Say("Who has given me a voice once again? I can sense your presence but cannot see your form. Allow me but a moment to explain. I have been trapped in this golem of hay for many years. Ever since the horrible bloodbath in the forest I have been bound to this horrible fate, and I cannot find rest until the person responsible for my murder has been dealt with! Our fates are intertwined, you and I. We can both find peace if you listen to what I have to say. Find the blue orb. It yet retains its dark power. Go into the woods and seek out the one with a fragment.");
		e.other:SummonItem(52355,2); -- Dilapidated Head of Shakey
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
