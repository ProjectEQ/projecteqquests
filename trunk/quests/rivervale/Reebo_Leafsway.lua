function event_say(e)
	if(e.message:findi("hail") and e.other:HasItem(52355) == true) then
		e.self:Say("You took care of our problem, " .. e.other:GetName() .. ", and for that you have my eternal thanks. With the new head you supplied, we should be able to squeeze a few more years out of Shakey. Not sure what you'd want to do with the old one. That dilapidated pumpkin is worthless. Moldy, dried out . . . doesnt hold a light. He shrugs empahtically. Go ahead and hold onto the thing if that tickles your fancy, though. May Karana watch over you in your travels!");
	elseif(e.message:findi("hail")) then
		e.self:Say("Greetings and salutations, " .. e.other:GetName() .. "! My name is Reebo Leafsway, loyal Druid of [" .. eq.say_link("Karana",false,"Karana") .. "]. I am in charge of helping young druids who wish to get started down the [" .. eq.say_link("trail to Karana's wisdom",false,"trail to Karana's wisdom") .. "]. I also do my share of tending the [" .. eq.say_link("crops",false,"crops") .. "].");
	elseif(e.message:findi("shakey")) then
		e.self:Say("Shakey is our protector and friend. He is just getting old. Losing his [" .. eq.say_link("stuffing",false,"stuffing") .. "]. His [" .. eq.say_link("head",false,"head") .. "] is getting very cracked and dry as well.");
	elseif(e.message:findi("stuffing")) then
		e.self:Say("The hay he requires is difficult to obtain. It must have been harvested from the Plains of Karana, then cursed by a high priest of the Faceless, [" .. eq.say_link("Cazic-Thule",false,"Cazic-Thule") .. "]. Finally, you must cast the hay and a flask of blessed Oil of Life into an armorer's forge. Only then will the hay be ready. We Stormreapers will reward you greatly if you could accomplish this task. Remember, you must give the scarecrow stuffing to Shakey only after it has been properly prepared.");
	elseif(e.message:findi("trail to karana's wisdom")) then
		e.self:Say("Good. First you should learn that Karana's work is just that.. work. Karana provides us with the tools but it is by the sweat of our brows that we prosper. Common sense and hard work are two things that are highly prized by our people. Time for you to sweat, young one. Take this crate of carrots over to Blinza Toepopal in the Fool's Gold. They need our finest carrots for Mayor Gubbin's stew. When you return I will teach you a lesson of the Rainkeeper.");
		e.other:SummonItem(13971); 
	elseif(e.message:findi("karana")) then
		e.self:Say("Karana is known as the Rainkeeper. It is through His will that our [" .. eq.say_link("crops",false,"crops") .. "] and our children grow big and healthy. He watches over us and protects us. calling down the fury of a tempest on those who wish harm upon His followers.");
	elseif(e.message:findi("crops")) then
		e.self:Say("The crops we grow here are mostly carrots, lettuce and squash. We also are the only place on all of Norrath where the soil can support the mystical Jumjum Stalk.");
	elseif(e.message:findi("head")) then
		e.self:Say("The head of a scarecrow is difficult to replace. We do not know what is needed and all of our attempts have failed. Perhaps you could [" .. eq.say_link("research",false,"research") .. "] this for us and bring back a new head for our old friend Shakey?");
	elseif(e.message:findi("research")) then
		e.self:Say("We have heard of a great forbidden tome penned by an evil necromancer that holds the secrets of instilling life into scarecrows. We have recovered pages from that book. That is how we know about Shakey's hay. But the pages detailing the creation of a scarecrow's head are missing. We believe that the Erudites possess at least some of the pages and might know where the rest of them may be found. Start your search in their city of Erudin.");
	elseif(e.message:findi("nillipuss")) then
		e.self:Say("Nillipuss is a brownie that lives in the area who often steals and destroys our JumJum Stalk. Will you teach him a [" .. eq.say_link("lesson",false,"lesson") .. "]?");
	elseif(e.message:findi("lesson")) then
		e.self:Say("Good. Bring me back some of the JumJum he has stolen and I will reward you for your trouble.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13971})) then
		e.self:Say("Very good. Very good indeed. Karana does not need the blind obedience that so many deities require. Trust your instincts, they are more often right than not. Here, take this to Blinza. Hurry, she is expecting them. You may keep the donation she gives you in return.");
		e.other:SummonItem(13957);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13972})) then
		e.self:Say("These carrots are rotten. They were rotten when I gave them to you. Why would you waste time and energy on such a fool's errand? Because I asked you to? Many, even those you trust will ask you to do things which you should not. Use the common sense that Karana has blessed you with to know which tasks can benefit our people and which could harm them. Learn this lesson well. You will need it if you plan to adventure beyond the vale. Now take these fresh carrots to Blinza and apologize for your error. You may keep the donation she gives you as payment.");
		e.other:SummonItem(13958);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13974,item2 = 13974,item3 = 13974,item4 = 13974})) then
		e.self:Say("Excellent!!  You must have taught ol' Nillipuss a great deal!  But he never seems to learn..  Oh well.  The Stormreapers and all of Rivervale owe you a debt of gratitude.  Please accept this token of our appreciation.");
		e.other:SummonItem(eq.ChooseRandom(10308,8303,8304,10302,10303,10304,10305,10306,10309,17302,12001,10301,17301,17300,12002));
		e.other:Ding();
		e.other:AddEXP(27440);
		e.other:GiveCash(0,4,6,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13974,item2 = 13974,item3 = 13974}) or item_lib.check_turn_in(e.trade, {item1 = 13974,item2 = 13974}) or item_lib.check_turn_in(e.trade, {item1 = 13974})) then
		e.self:Say("Oh good! I see you have taugh that nasty Nillipuss a thing or two! Good. But it seems to me that he has stolen more jumjum than this. Perhaps he needs another lesson?");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 12 or e.wp == 33 or e.wp == 51 or e.wp == 73 or e.wp == 96 or e.wp == 120) then
		e.self:Emote("whistles a happy hafling tune.");
	end
end

function event_signal(e)
	e.self:Emote("shakes his head sadly, 'Poor old [" .. eq.say_link("Shakey",false,"Shakey") .. "] just isn't what he used to be.'");
end

-- END of FILE Zone:rivervale  ID:19056 -- Reebo_Leafsway