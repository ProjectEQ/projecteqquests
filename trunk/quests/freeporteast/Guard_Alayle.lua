function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, citizen! You should not be in the Militia House. These are restricted grounds. Please leave at once unless you have business here.");
	elseif(e.message:findi("truth is good") and e.other:Class() == "Paladin") then
		e.self:Say("Ssshhh!! Pipe down. The others might hear you. You must have something for me. Kalatrina must have given you something if you serve the Hall of Truth. If you have nothing please leave. You will blow my cover.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:Class() == "Paladin") then
		if(item_lib.check_turn_in(e.trade, {item1 = 18817})) then -- Sealed Letter
			e.self:Say("This is not good news. I must leave immediately. Here. Take this to Kala.. I mean my father. I found it on the floor of Sir Lucan D'Lere's quarters. Thanks again, messenger. I got this just in time.");
			e.other:SummonItem(18818); -- A Tattered Flier
			e.other:Ding();
			e.other:Faction(311,1,0); -- Steel Warriors
			e.other:Faction(135,1,0); -- Guards of Qeynos
			e.other:Faction(53,-1,0); -- Corrupt Guards of Qeynos
			e.other:Faction(105,-1,0); -- Freeport Militia
			e.other:Faction(184,1,0); -- Knights of Truth
			eq.unique_spawn(382245,56,0,820,-931,-23,128); -- spawns Krazen Loosh
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("'Oh no!! It is too late!! Run!!");
	eq.signal(382245,1,5000);
end

-- freeporteast version - Guard_Alayle