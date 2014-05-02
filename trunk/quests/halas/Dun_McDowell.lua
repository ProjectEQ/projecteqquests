function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18762)) then
		e.other:Message(15,"Dun McDowell turns to address you. 'Welcome. I trust ye are ready for training in the ways of the rogue? Well read the note in your inventory and hand it to me when ye are ready to begin training.'");
	end
end

function event_say(e)
	if(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18762})) then
		e.self:Say("Ah.. ye wish to be a member o' the White Rose, then. eh? Well, let's train ye fer a bit. and see if ye've got what it takes. Once you are ready to begin adventuring make sure you see Lysbith first, she might have a few tasks for you.  Return to me for guidance anytime, I have much to teach you, from the secrets of the profession, to the various [trades] you may wish to dabble in.");
		e.other:Ding();
		e.other:SummonItem(13513);	-- torn white tunic
		e.other:Faction(275,100); 	-- Rogues of the White Rose
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:halas  ID:29069 -- Dun_McDowell 