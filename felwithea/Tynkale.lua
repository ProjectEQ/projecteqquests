function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18781)) then
		e.other:Message(15,"As you get your bearings, Tynkale, an important looking High Elf turns to greet you. 'Welcome young paladin of Tunare. I am Guild Master Tynkale. Read the note in your inventory and once you are ready to begin your training, hand me your note. I welcome you to our crusade against evil.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail noble, " .. e.other:GetName() .. "!  Can you be of [service to the Clerics of Tunare] or are you not from our order?");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	elseif(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("service to the clerics of tunare")) then
			e.self:Say("That is good. Prove yourself, then.  Are you [new to Felwithe] or have I been conversing with a [veteran of the good fight]?");
		elseif(e.message:findi("new to felwithe")) then
			e.self:Say("Then stand at attention when I speak.  I want you to venture to Kelethin and seek out Tandan Nybright.  He is an old member of ours.  He had some hardships and he fell from Tunare's grace, yet he is still a member of our family.  He will be the one who reeks of elven wine.  Greet him by name.  We are worried for him.");
		elseif(e.message:findi("veteran of the good fight")) then
			e.self:Say("I command you to venture to Innothule and seek a beast called Jojongua, a name penned by the trolls.  It is said to be ten feet tall and nothing but fury.  Some say it resembles a kobold, but how can that be?  You bring this beast's hide to me and then I will believe you to be a veteran.  Beware!  Innothule is a very dangerous place even for a noble veteran.");
		end
	elseif(e.other:GetFaction(e.self) > 4) then
		if(e.message:findi("service to the clerics of tunare") or e.message:findi("new to felwithe") or e.message:findi("veteran of the good fight")) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare. we shall make conversation.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18781})) then -- Tattered Note
		e.self:Say("Greetings. young paladin!  I am Master Tynkale of the Clerics of Tunare.  Here. we shall teach and train you in the skills needed to defeat our evil and diseased enemies.  Take this, our guild tunic - it will help protect you.  Once you are ready to begin your training please make sure that you see Seria Woodwind, she can assist you in experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13591); -- Used Gold Training Tunic*
		e.other:Ding();
		e.other:Faction(43,100,0);  --Clerics of Tunare
		e.other:Faction(178,100,0); --King Tearis Thex
		e.other:Faction(8,75,0);   --Anti-mage
		e.other:AddEXP(100); 
	elseif(e.other:GetFaction(e.self) < 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 13351})) then
			e.self:Say("So you have proven yourself to be a great slayer of beasts.Now it is time to prove yourself to be an asset to the Crown. You are to meet a man named Tolon Nurbyte.He will be at the local inn. Go to him and repeat the phrase, 'The glory of the Mother shines bright.' I can say no more. Oh.. and here. This may help you on your upcoming adventure.");
			e.other:Ding();
			e.other:Faction(43,10,0);  --Clerics of Tunare
			e.other:Faction(178,10,0); --King Tearis Thex
			e.other:Faction(8,10,0);   --Anti-mage
			e.other:AddEXP(150); 
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwithea  ID:61018 -- Tynkale