function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Peace and tranquility be with you. $name.  Are you a [new acolyte of peace] or are you [here to pay homage] to the child of tranquility?");
	elseif(e.message:findi("new acolyte of peace")) then
		e.self:Say("Then you shall learn the ways of Quellious and learn to do as you are told by higher ranking members. It is time for you to do the lesser duties of a young priest. Which will it be? [Retrieve the Peacekeeper staffs] or [battle the undead]?")
	elseif(e.message:findi("retrieve the Peacekeeper staffs")) then
		e.self:Say("Then take this note to the woodworker in Toxxulia Forest. His name is Emil Parsini. He shall have the staff to be returned to the temple.");
		e.other:SummonItem(18833); -- A Sealed Letter for Emil Parsini
	elseif(e.message:findi("battle the undead")) then
		e.self:Say("Then you shall venture to Toxxulia Forest. There has been an increase in skeleton sightings lately. I do not know their origin, but I believe that your efforts will reduce their numbers! Take this box. Return it to me when you have filled it with the bones of these undead creatures and combined it. May Quellious' light guide you.");
		e.other:SummonItem(17941); -- Box for Bones
	elseif(fac <= 4) then
		if(e.message:findi("important missions")) then
			e.self:Say("We have need of skilled priests. We have learned that a High Guard battle staff has been stolen. We require a priest to [track down the staff].")
		elseif(e.message:findi("here to pay homage")) then
			e.self:Say("Then respect our temple and keep your prayers silent.");
		else
			e.self:Say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.")
		end
	end
end

			
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13882})) then -- A Box of Bones
		e.self:Say("This is fabulous work, my friend! You have served your people well. Take this as a gift. I hope it can be of use to you. We need proof of these skeletons' origins. Continue the eradication of the undead and find out who creates them. Once you know, bring their head to me.");
		e.other:Faction(247,10,0);  -- Peace Keepers (Quellious temple)      
		e.other:Faction(145,5,0);  -- High Council of Erudin      
		e.other:Faction(143,-10,0);  -- Heretics
		e.other:AddEXP(200);      
		e.other:GiveCash(0,12,3,0); -- 12 silver 3 gold per Allakhazam
		e.other:SummonItem(eq.ChooseRandom(17005,17002,10018,2144,2145,2146,6011,6016,15203,15207,15201,15208,15209,15014,15205,15210,6012));
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13816})) then -- The completed Peacekeeper Staff
		e.self:Say("You have done well, neophyte.Let me add the touch of harmony to finish the job.. Here, then. Take these supplies. I am sure you'll need them. Soon you may be able to assist us in [important missions].");
		e.other:Faction(247,10,0);  -- Peace Keepers (Quellious temple)      
		e.other:Faction(145,5,0);  -- High Council of Erudin      
		e.other:Faction(143,-10,0);  -- Heretics      
		e.other:AddEXP(600);      
		e.other:GiveCash(12,11,0,0);
		e.other:SummonItem(eq.ChooseRandom(17005,17002,10018,2144,2145,2146,6011,6016,6012));
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98045 -- Lumi_Stergnon