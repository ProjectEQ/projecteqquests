-- items: 18833, 17941, 13882, 13816
function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:QuestSay(e.other, "Peace and tranquility be with you. " .. e.other:GetName() .. ".  Are you a [" .. eq.say_link("new acolyte of peace") .. "] or are you [" .. eq.say_link("here to pay homage") .. "] to the child of tranquility?");
	elseif(e.message:findi("new acolyte of peace")) then
		e.self:QuestSay(e.other, "Then you shall learn the ways of Quellious and learn to do as you are told by higher ranking members. It is time for you to do the lesser duties of a young priest. Which will it be? [" .. eq.say_link("Retrieve the Peacekeeper staffs") .. "] or [" .. eq.say_link("battle the undead") .. "]?")
	elseif(e.message:findi("retrieve the Peacekeeper staffs")) then
		e.self:QuestSay(e.other, "Then take this note to the woodworker in Toxxulia Forest. His name is Emil Parsini. He shall have the staff to be returned to the temple.");
		e.other:SummonItem(18833); -- A Sealed Letter for Emil Parsini
	elseif(e.message:findi("battle the undead")) then
		e.self:QuestSay(e.other, "Then you shall venture to Toxxulia Forest. There has been an increase in skeleton sightings lately. I do not know their origin, but I believe that your efforts will reduce their numbers! Take this box. Return it to me when you have filled it with the bones of these undead creatures and combined it. May Quellious' light guide you.");
		e.other:SummonItem(17941); -- Box for Bones
	elseif(fac <= 4) then
		if(e.message:findi("important missions")) then
			e.self:QuestSay(e.other, "We have need of skilled priests. We have learned that a High Guard battle staff has been stolen. We require a priest to [" .. eq.say_link("track down the staff") .. "].")
		elseif(e.message:findi("here to pay homage")) then
			e.self:QuestSay(e.other, "Then respect our temple and keep your prayers silent.");
		else
			e.self:QuestSay(e.other, "You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.")
		end
	end
end


function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13882})) then -- A Box of Bones
		e.self:QuestSay(e.other, "This is fabulous work, my friend! You have served your people well. Take this as a gift. I hope it can be of use to you. We need proof of these skeletons' origins. Continue the eradication of the undead and find out who creates them. Once you know, bring their head to me.");
		local item = eq.ChooseRandom(17005, 17002, 10018, 2144, 2145, 2146, 6011, 6016, 15203, 15207, 15201, 15208, 15209, 15014, 15205, 15210, 6012);
		e.other:QuestReward(e.self, {itemid = item, exp = 500, silver = 12, gold = 3}); -- cash reward per alla
		e.other:Faction(298, 10, 0);  -- Peace Keepers (Quellious temple)
		e.other:Faction(266, 2, 0);  -- High Council of Erudin
		e.other:Faction(265, -2, 0);  -- Heretics
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13816})) then -- The completed Peacekeeper Staff
		e.self:QuestSay(e.other, "You have done well, neophyte.Let me add the touch of harmony to finish the job.. Here, then. Take these supplies. I am sure you'll need them. Soon you may be able to assist us in [" .. eq.say_link("important missions") .. "].");
		local item = eq.ChooseRandom(17005, 17002, 10018, 2144, 2145, 2146, 6011, 6016, 6012);
		e.other:QuestReward(e.self, {itemid = item, exp = 600, copper = 12, silver = 11});
		e.other:Faction(298, 10, 0);  -- Peace Keepers (Quellious temple)
		e.other:Faction(266, 2, 0);  -- High Council of Erudin
		e.other:Faction(265, -2, 0);  -- Heretics
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98045 -- Lumi_Stergnon
