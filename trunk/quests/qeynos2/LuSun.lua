function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18712) == true) then
		e.other:Message(15,"As you get your bearings, a lightly armored man that appears to be in incredible shape turns to greet you. 'Welcome traveller. I am LuSun. If you wish to learn the ways of the Silent Fist, read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah.. Greetings.. I am Lu'Sun, Guild Master of the Silent Fist Clan. Here, our goal is to train our body, mind, and soul to the peak of perfection.");
	elseif(e.message:findi("tomer instogle")) then
		e.self:Say("Tomer? I think Seta needs someone to go find him.. Go ask her.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18712})) then -- Note with Fist Insignia
		e.self:Say("Greetings, and welcome to the Silent Fist Clan. Don our guild tunic, purge your mind and soul, and begin your lifelong devotion to the Clan. Brother Esrinap will introduce you to our lifestyle and begin your training. Be sound, allow your spirit to open up and guide you.");
		e.other:SummonItem(13507); -- Torn Cloth Tunic*
		e.other:Ding();
		e.other:Faction(300,100,0); -- Silent Fist Clan
		e.other:Faction(135,15,0); -- Guards of Qeynos
		e.other:Faction(12,15,0); -- Ashen Order
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2077 -- LuSun