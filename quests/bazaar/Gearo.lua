function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(e.message:findi("hail")) then
		e.self:Say("Hello there friend. My name is Gearo and as you can see I'm a Gnome, so what can I do for ya?");
	elseif(qglobals["DeliveredToGearo"] == "1") then
		if(e.message:findi("take the gem")) then
			e.self:Say("Good " .. e.other:GetName() .. "! Here they are, please take them back to that gargantuan barbarian and let him know I want a raise for all this hard work!");
			e.other:SummonItem(4767);
			eq.delete_global("DeliveredToGearo"); --Remove global
		end
	end

end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 4766})) then --Assorted Tailoring Supplies
		e.self:Say("Ah you were sent from Steaon I see. So what's that tall drink of water up too? He must be busy at the store if he has you delivering his supplies for him. Well enough about all that. If he has trusted you to bring his supplies here I suppose I can give you these gems I picked up for him. Will you [take the gems] to him?");
		e.other:Faction(338, 100); 	--Traders of the Haven
		e.other:Faction(152, 5); 	--House of Fordel
		e.other:Faction(153, 15); 	--House of Midst
		e.other:Faction(154, 15); 	--House of Stout
		e.other:AddEXP(1000);		--This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step
		eq.set_global("DeliveredToGearo","1",0,"D30");--Set a variable here.
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
