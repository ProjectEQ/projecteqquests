function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("HA! Greetings there. " .. e.other:GetName() .. "!  How are ya this fine day?  Me?  I'm doing all right.  Guard duty down here always reminds me of home.");
		eq.signal(382197,1); -- Signal to Beur_Tenlah
	elseif(e.message:findi("message")) then
		e.self:Say("Ok, " .. e.other:GetName() .. ", I need you to take this message to Janam in West Freeport. He is usually hanging out in front of the Theater of the Tranquil with that good-for-nothing Rebby. Anyway, give this note to Janam and bring his reply back to me.");
		e.other:SummonItem(18015); -- Note to Janam
	end
end

function event_signal(e)
	-- Signal from Beur_Tenlah
	e.self:Say("Bah! Don't listen to this fool. Listen, I've something a little more important for you to do than buy ales. I need you to take a [message] to my friend Janam over in West Freeport.");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18016})) then -- Note to Harkin
		e.self:Say("Ah, good work, " .. e.other:GetName() .. ". And quick too, I'll makes sure that Elisi hears of your loyal work. Here... take this for your efforts.. it's not much, but it's all I have on me right now.");
		e.other:SummonItem(1054); -- Used Merchants Gloves
		e.other:Ding();
		e.other:Faction(48,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(47,1,0); -- Coalition of Trade Folk
		e.other:Faction(31,1,0); -- Carson McCabe
		e.other:Faction(53,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,1,0); -- Freeport Militia
		e.other:AddEXP(100);
		e.other:GiveCash(6,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:freporte  ID:10107 -- Harkin_Duskfoot
