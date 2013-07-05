function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! These are the sacred grounds of the Temple of Life. Please do not cause any disturbances while on our grounds. I would hate to have to hurt you. In the name of Rodcet Nife, of course. Now excuse me, I have a [problem] to attend to.");
	elseif(e.message:findi("problem")) then
		e.self:Say("I have been charged with the duty of protecting the [Pool of Jahnda] and its fish. Now it seems as though a beast by the name of [Frostbite] has slurped up another one of the sacred fish, the [Koalindl]. If I do not get the little corpse of this fish back, I could be in trouble. Any respected member of this temple who aids me will be rewarded greatly.");
	elseif(e.message:findi("pool of jahnda")) then
		e.self:Say("The Pool of Jahnda is not meant for public use. It is a sacred pool created for the [Koalindl]. They say that, every so often, the Prime Healer visits our plane in the guise of a Koalindl. He swims in our pool.");
	elseif(e.message:findi("koalindl")) then
		e.self:Say("The fish called Koalindl were a gift to Priestess Jahnda from the Prime Healer. They come from the plane of health. To kill one Koalindl is to bring the wrath of Rodcet Nife and the Priests of Life down upon you.");
	elseif(e.message:findi("frostbite")) then
		e.self:Say("Frostbite is a dog. He belongs to some barbarian who visits the city every so often. I know not where they are from. I cannot see them coming from Halas. Their visits are too frequent.");
	elseif(e.message:findi("donate")) then
		e.self:Say("I would be glad to help you out. The Knights of Thunder are a respected order.");
		e.other:SummonItem(13292);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13383})) then
		e.other:Ding();
		e.self:Say("Thank you!"); -- text made up
		e.other:SummonItem(eq.ChooseRandom(13297,13296));
		e.other:GiveCash(0,0,2,0);
		e.other:AddEXP(400);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
