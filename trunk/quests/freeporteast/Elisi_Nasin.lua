function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18745)) then
		e.other:Message(15,"As your eyes adjust to the darkness of the cave, a woman with a serious look on her face looks your way. 'You there. What is your business down here? You are here for training you say? Read the note in your inventory and hand it to me if you wish to begin.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Listen. this is a pretty busy [operation] I run here.  I certainly don't have any spare time to sit around and chit-chat with you all day. got it?");
	elseif(e.message:findi("operation")) then
		e.self:Say("Look. " .. e.other:GetName() .. ". I don't have time for this.  Let's just say importing exotic goods is our main interest. along with a few other profitable ventures.  Now quit pestering me. or you'll force me to sic Grenny here on ya.");
		eq.signal(382208,10);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18745})) then -- A tattered note
		e.self:Say("Welcome to the Coalition of Tradesfolk underground. We like to keep a low profile around here and not draw any unneeded attention to our operations. you following me? I hope so. for your sake. Anyways. Nestral T'Gaza is in charge with helping out our newest members. Go see her as soon as you get a chance.");
		e.other:SummonItem(13568); -- Brown Faded Tunic
		e.other:Ding();
		e.other:Faction(48,10,0); --Coalition of TradeFolk Underground
		e.other:Faction(47,10,0); --Coalition of Trade Folk
		e.other:Faction(31,10,0); --Carson McCabe
		e.other:Faction(53,10,0); --Corrupt Qeynos Guards
		e.other:Faction(105,10,0); --The Freeport Militia
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10108 -- Elisi_Nasin