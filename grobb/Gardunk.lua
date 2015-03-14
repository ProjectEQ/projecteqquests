function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18845)) then
		e.other:Message(15,"As your eyes adjust to the darkness, a large troll covered in scars turns towards you. 'I be Gardunk. You read note in inventory and hand to me to start training. Me make you strong like animal!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 18845})) then -- A tattered note
		e.self:Say("You fight like alligator and tear enemy limb from limb!  Wear tunic that smell of swamp an devour enemy wit brodder Dark Ones!  You go see Gargh now, he got work for you!");
		e.other:SummonItem(13576);	-- Molding Tunic
		e.other:Ding();
		e.other:Faction(70,15,0);	-- Dark Ones
		e.other:Faction(292,3,0);	-- Shadowknights of Night Keep
		e.other:Faction(106,-2,0); -- Frogloks of Guk
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:grobb  ID:6084 -- Gardunk