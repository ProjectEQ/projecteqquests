function event_say(e)
	local fac = e.other:GetFaction(e.self);
	local class = e.other:Class();
	local level = e.other:GetLevel();
	
	if(fac <= 5) then
		if(e.message:findi("hail")) then
			e.self:Emote("looks at you suspiciously. 'Yeah? Whacha want?'");
		elseif(e.message:findi("see stanos") and class == "Rogue" and level >= 50) then
			e.self:Say("This better be important.");
			eq.spawn2(5088,0,0,336,10,45,225);
		end
	else
		e.self:Say("Go away! We don't have time for the likes of you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28014}) and e.other:Class() == "Rogue" and e.other:GetLevel() >= 50) then
		e.self:Say("Ah, we have been expecting this. Let me get Stanos, he will want to inspect it first, but here are your coins.");
		e.other:Ding();
		e.other:Faction(149,5,0);
		e.other:Faction(31,10,0);
		e.other:Faction(214,5,0);
		e.other:Faction(53,5,0);
		e.other:Faction(105,5,0);
		e.other:AddEXP(500);
		e.other:Message(15,"You receive 100 gold from Anson McBale.");
		e.other:Message(15,"You receive 25 platinum from Anson McBale.")
		e.other:AddMoneyToPP(0, 0, 100, 25, true);
		eq.spawn2(5088,0,0,336,10,45,225);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Vilnius has always had a good eye for talent. I think we can trust this one. But will he trust us? You have to wonder if he even knows who we are...");
	eq.signal(5088, 0); --stanos
end