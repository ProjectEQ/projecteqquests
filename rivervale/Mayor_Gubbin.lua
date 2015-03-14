function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. "!  Welcome to Rivervale!  I hope you plan to stay on and assist us in any way you can.  We all have talents to aid in the prosperity of the hollow.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 9475})) then -- rogue 1.5 handin
		e.self:Say("Ah, thank you. I was a bit parched.' Mayor Gubbin unstops the flask and takes a healthy swig of the brew. He makes a strange face and licks his lips while staring at the bottle. 'Wow, this is delicious. Like no other drink I've ever tried. This is even better than that Spiced Jumjum that Lanena is so fond of. Wait a moment . . . Is this the brew that Deeppockets keeps trying to hawk in my town? Well now, I suppose it's not so bad. Hmm. Why don't you tell him I've changed my mind. Tell Lendel he has my blessing and is welcome to bring in as much of this as he can sell.");
		e.other:SummonItem(13588);
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19104 -- Mayor_Gubbin 
