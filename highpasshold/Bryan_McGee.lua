-- items: 12366, 17984, 12365, 12348
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I do not know what you are doing up here, but I am a busy man. Please return to the bar downstairs and enjoy the atmosphere.");
		eq.signal(407027,2) -- NPC: Beef new highpasshold
	elseif(e.message:findi("oblong bottle")) then
		e.self:Say("The oblong bottle is a legend. They say one drink and you're off to oblivion, but just before that you feel the best you've ever felt and relive all your finest memories in the blink of an eye. The last I heard, some guy by the name of Turgin Swillfod turned up in Freeport spouting that he had found it. He was never heard from again.");
	elseif(e.message:findi("never stop chopping")) then
		e.self:Say("Hey!! You must be the one I traded my axe to. Funny, I thought you were much shorter. If you have my axe then I will return my your gem to you. Well, let's have it. ");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12366})) then -- Never Stop Chopping
		e.self:Say("On second thought.. You can do a little favor for me first. An associate of mine has asked me to acquire a case of spirits for him. Take this box and seek out what is needed to fill it. Inside you will combine the spirits of Lendel's Grand Lager, Gator Gulp Ale, Blackburrow Swig, Tunare's Finest, Underfoot Triple Bock, Frozen Toe Rum, Blood Spirit, Vasty Deep Ale, Clockwork Oil Stout and the legendary..[Oblong Bottle].");
		e.other:SummonItem(17984); -- Bottle Crate
		e.other:Ding();
		e.other:Faction(336,10,0); -- Coalition of Tradefolk Underground
		e.other:Faction(229,10,0); -- Coalition of Tradefolk
		e.other:Faction(329,1,0); -- Carson McCabe
		e.other:Faction(230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(330,1,0); -- The Freeport Militia
		e.other:AddEXP(15000);
		e.other:GiveCash(0,0,0,0);
		
		eq.signal(407027,3) -- NPC: Beef new highpasshold
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12365})) then
		e.self:Say("I cannot believe you actually acquired all those drinks!! You do good work, kid. Here is the gem as I promised. And a few plat for good measure. Don't let it be said that the Axe doesn't treat his friends right.");
		e.other:SummonItem(12348); -- Item: Gem of Stamina
		e.other:Ding();
		e.other:Faction(336,25,0); -- Coalition of Tradefolk Underground
		e.other:Faction(229,25,0); -- Coalition of Tradefolk
		e.other:Faction(329,2,0); -- Carson McCabe
		e.other:Faction(230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(330,3,0); -- The Freeport Militia
		e.other:AddEXP(15000);
		e.other:GiveCash(0,0,0,7);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		local stanos = eq.get_entity_list():GetMobByNpcTypeID(5088); -- Stanos_Herkanor
		if ( stanos.valid ) then
			e.self:MoveTo(stanos:GetX(), stanos:GetY(), stanos:GetZ(), -1, false);
		end
	end
end
