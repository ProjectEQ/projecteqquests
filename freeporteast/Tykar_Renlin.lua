function event_say(e)
	if(e.message:findi("lucan")) then
		e.self:Say("That man is no just ruler. He has jailed me and my friend Zimel for merely begging.");
	elseif(e.message:findi("hail")) then
		e.self:Say("Do you have any spare coppers for a thirsty soul?");
	elseif(e.message:findi("tell me of zimel")) then
		e.self:Say("What?! You know my friend Zimel?! I would like to speak of him, but my mouth is so parched. Maybe a fine grog would loosen my lips. I am uncertain which flavor shall do the trick.");
	end
end

function event_trade(e)
	local champagne = 0;
	local morechampagne = 0;
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13829,item2 = 13829,item3 = 13829,item4 = 13829})) then
		morechampagne = 1;
		champagne = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13829,item2 = 13829,item3 = 13829})) then
		champagne = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13829,item2 = 13829})) then
		champagne = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13829})) then
		champagne = 1;
	end
	
	if(champagne > 0) then
		repeat
			e.self:Say("Oooh!! That is the taste. My lips are almost loose. Maybe another will do the trick.");
			champagne = champagne - 1;
		until champagne == 0
	end
	
	if(morechampagne == 1) then
		e.self:Say("Ahh!! That was good. Now where were we?. Oh yes. My friend Zimel is a fellow beggar. He was locked up in the arena. They were going to let him go when the Freeport Militia came for him. Ha!! He is crazy as a troll now. I took this blanket from his cell before I was released. I no longer need it and my guilt has reached its peak. I do not want crazy old Zimel to freeze. Perhaps you can return it to him.");
		e.other:Ding();
		e.other:SummonItem(12196); -- Bunker Cell #1 (Zimel's Blanket)
		e.other:AddEXP(10);
		morechampagne = 0;
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END if FILE Zone:freporte -- Tykar_Renlin