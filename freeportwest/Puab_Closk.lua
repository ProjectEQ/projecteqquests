function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18746)) then
		e.other:Message(15,"As you get your bearings, a lightly armored man that appears to be in incredible shape turns to greet you. 'Welcome traveller. I am Puab Closk. If you wish to learn the ways of the Ashen Order, read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am Puab Closk, Master of the Ashen Order.  Our home is your home, friend. Feel free to stay as long as you like.  Learn our ways as many have done in the past.  To fight like the tiger and strike like the cobra are your goals.");
	elseif(fac < 4) then
		if(e.message:findi("treant fists")) then
			e.self:Say("You desire the treant fists?  I have them and I will offer them to any [skilled monk of the Ashen House].");
		elseif(e.message:findi("who is clawfist ")) then
			e.self:Say("Clawfist is a Kerran, a catman. He braved the dangers of Norrath to reach the Ashen Order. He sought knowledge of our disiples. He learned well.");
		elseif(e.message:findi("where is clawfist")) then
			e.self:Say("Clawfist has been banished by the Kerrans of Odus. Where they have sent him I am unsure.");
		elseif(e.message:findi("skilled monk of the Ashen House")) then
			e.self:Say("Then you shall aid our family. My former pupil [Clawfist] has been banished by his people. You will go to him and hand him this token as proof of your origin. He shall be expecting you.");
			e.other:SummonItem(12369); -- Puab's Token
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18746})) then -- A tattered note
		e.self:Say("Welcome to the house of the Ashen Order. We are a small guild of monks who have devoted our lives to refining our minds, souls, and physical beings to their maximum potential. Please see Brother Torresk as soon as you get a chance. He is in charge of helping our newer members begin their training. Good luck, " .. e.other:GetName() .. ".");
		e.other:SummonItem(13507); -- Torn Cloth Tunic
		e.other:Ding();
		e.other:Faction(12,100,0); -- Ashen Order
		e.other:Faction(184,15,0); -- Knights of Truth
		e.other:Faction(300,5,0); -- Silent Fist Clan
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 28055})) then -- Tattered Parchment
		e.self:Say("You have performed a great service to one who is your brother. Your loyalty shines brightly, as does your skill. Take the treant fists. They are yours now.");
		e.other:SummonItem(12344); -- Treant Fists
		e.other:Ding();
		e.other:Faction(12,10,0); -- Ashen Order
		e.other:Faction(184,5,0); -- Knights of Truth
		e.other:Faction(300,5,0); -- Silent Fist Clan
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw -- Puab_Closk