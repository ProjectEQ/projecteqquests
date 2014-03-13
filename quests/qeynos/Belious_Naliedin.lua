function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18717) == true) then
		e.other:Message(15,"As you get your bearings, you hear a beautiful song. It almost seems to draw you towards it. It's as if you can hear a voice in your head as the music surrounds you. 'Welcome to the Wind Spirit's Song. I am Belious Naliedin. Read the note in your inventory and hand it to me when you are ready to begin your training as a bard.' The music then fades as quickly as it had begun.");
	end
end

function event_signal(e)
	e.self:Say("Sure. Go Ahead and play it now, while the stage is clear.");
end

function event_say(e)
	elseif(e.message:findi("hail")) then
		e.self:Say("Welcome, my name is Belious Naliedin of the League of Antonican Bards. A few years ago, I had finally saved up the money, and I bought this place. I settled in, and have been [working] here ever since.");
	elseif(e.message:findi("working")) then
		e.self:Say("Ah, this is my shop. I am a musician, well known for my ability both in tuning, and [building instruments.]");
	elseif(e.message:findi("building")) then
		e.self:Say("Young bards are often not the wealthiest people in Norrath, and oftentimes, they have nothing to accompany their beautiful voices when they sing. If young bards are able to locate, and bring to me the [various parts] to assemble a lute with, I provide the labor for free.");
	elseif(e.message:findi("parts")) then
		e.self:Say("If you are able to find an unfinished lute body, an unfinished lute neck, a box of lute strings, and a set of fine lute tuners I will be able to craft for you one of the best sounding lutes that you have ever heard in your young life, and it will be yours, free of charge. It has long been my desire to help out any young men and women who wish to explore the bardic arts.");
	elseif(e.message:findi("famous bard")) then
		e.self:Say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
	elseif(e.message:findi("audience with him")) then
		e.self:Emote("laughs briefly. 'Ah! In order to gain an audience with him, you must have a letter of introduction from me, otherwise he will not give you the time of day.'");
	elseif(e.message:findi("letter of introduction")) then
		e.self:Emote("looks around. 'Well, you want a letter of introduction, eh? I think that fifty shiny platinum pieces sounds like a good introduction to me, my friend.'");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18717})) then -- Tattered Note
		e.self:Say("Good day friend, and welcome to the Wind Spirit's Song. Thank you for joining our cause. Go speak with Jusean Evanesque. I'm sure you'll fit in well. And once you are ready to test your hunting and gathering abilities please see Sollari Bekines, she will have some work for you. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13502); -- #Brown Tunic*
		e.other:Ding();
		e.other:Faction(192,10,0); -- League of Antonican Bards
		e.other:Faction(184,10,0); -- Knights of Truth
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(273,-15,0); -- Ring of Scale
		e.other:Faction(207,-15,0); -- Mayong Mistmoore
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20374})) then
		e.self:Say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
		e.other:Ding();
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {platinum = 50})) then
		e.self:Say("Ah! Here is that letter of introduction I was looking for! Baenar likes to frequent a serene fountain in the southern Karanas. He finds the peace there accommodating to his work. He may even sing a tale for you if the mood strikes him.");
		e.other:Ding();
		e.other:SummonItem(20373);
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13775, item2 = 13776, item3 = 13777, item4 = 13778})) then
		e.self:Say("Here is your custom lute, use it well " .. e.other:GetName() .. ".");
		e.other:Ding();
		e.other:SummonItem(13105);
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1133 -- Belious_Naliedin