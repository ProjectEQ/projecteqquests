function event_say(e)
 local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		if(qglobals["paladin_epic"] == "1") then
			e.self:Say(e.other:GetName() .. "! I'm glad you are here. Something terrible has occurred recently. Would you like to know [" .. eq.say_link("what happened") .. "]?");
		else
			e.self:Say("Hail! These are the sacred grounds of the Temple of Life. Please do not cause any disturbances while on our grounds. I would hate to have to hurt you. In the name of Rodcet Nife, of course. Now excuse me, I have a [" .. eq.say_link("problem") .. "] to attend to.");
		end
	elseif(e.message:findi("problem")) then
		e.self:Say("I have been charged with the duty of protecting the [" .. eq.say_link("Pool of Jahnda") .. "] and its fish. Now it seems as though a beast by the name of [" .. eq.say_link("Frostbite") .. "] has slurped up another one of the sacred fish, the [" .. eq.say_link("Koalindl") .. "]. If I do not get the little corpse of this fish back, I could be in trouble. Any respected member of this temple who aids me will be rewarded greatly.");
	elseif(e.message:findi("pool of jahnda")) then
		e.self:Say("The Pool of Jahnda is not meant for public use. It is a sacred pool created for the [Koalindl]. They say that, every so often, the Prime Healer visits our plane in the guise of a Koalindl. He swims in our pool.");
	elseif(e.message:findi("koalindl")) then
		e.self:Say("The fish called Koalindl were a gift to Priestess Jahnda from the Prime Healer. They come from the plane of health. To kill one Koalindl is to bring the wrath of Rodcet Nife and the Priests of Life down upon you.");
	elseif(e.message:findi("frostbite")) then
		e.self:Say("Frostbite is a dog. He belongs to some barbarian who visits the city every so often. I know not where they are from. I cannot see them coming from Halas. Their visits are too frequent.");
	elseif(e.message:findi("donate")) then
		e.self:Say("I would be glad to help you out. The Knights of Thunder are a respected order.");
		e.other:SummonItem(13292);
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("what happened")) then
		e.self:Say("A few nights ago, I was standing guard at the Pool of Jahnda like any other night, but something was different. The night air was cooler than usual and the sky was barely visible because of all of the dark clouds. Sometime around midnight, a flash occurred near the pool and I saw an Iksar run off with a Koalindl. As I chased him, he casted a portal spell and disappeared. This is grave indeed! I will need your help, " .. e.other:GetName() .. ". Will you help [" .. eq.say_link("track down") .. "] this Iksar and return the Koalindl?");
	elseif(qglobals["paladin_epic"] == "1" and e.message:findi("track down")) then
		e.self:Say("Very well, " .. e.other:GetName() .. ". Unfortunately, I cannot offer you any hints. My only guess is that this Iksar might be near a large body of water, for the Koalindl needs to be kept near water at all times. I fear that the Koalindl may have been destroyed. Go now and find the Koalindl or the remnants of that great servant of the Prime Healer!");	
		eq.set_global("paladin_epic","2",5,"F");
	end	
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5) then -- requires amiably
		if(item_lib.check_turn_in(e.trade, {item1 = 13383})) then
			e.other:Ding();
			e.self:Say("Thank you my friend! Every Koalindl must be accounted for, even the dead. Rodcet Nife shall be pleased and I shall reward you. Nothing much. Just a token of gratitude.");
			e.other:Faction(257,100); -- Priest of Life
			e.other:Faction(183,30); -- Knight of Thunder
			e.other:Faction(135,50); -- Guards of Qeynos
			e.other:Faction(21,-25); -- Bloodsabers
			e.other:Faction(9,15); -- Antonius Bayle
			e.other:SummonItem(eq.ChooseRandom(13297,13296));
			e.other:GiveCash(0,0,2,0);
			e.other:AddEXP(400);
		end
	end	

	if(qglobals["paladin_epic"] >= "3" and item_lib.check_turn_in(e.trade, {item1 = 69929, item2 = 69930, item3 = 69931, item4 = 69932})) then
		e.self:Say("So this is what happened to the Koalindl? This is sad indeed. I have heard that you have stopped a greater tragedy from occuring by treating the pestilence that was being brought to the seas. You have done a very good job, " .. e.other:GetName() ..". I present you with a seal of nobility that was given to me long ago. This seal has granted me audiences with many of the different races of Norrath, including the Ring of Scale. Perhaps it will aide you in your journeys. Thank you again, sir.");
		eq.set_global("paladin_epic","4",5,"F");
		e.other:SummonItem(69933);
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end
