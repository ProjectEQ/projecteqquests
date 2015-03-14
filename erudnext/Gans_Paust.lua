function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18724)) then
		e.other:Message(15,"A commanding, yet kind looking Erudite turns towards you as you attempt to get your bearings. 'Do not be startled. I am Gans Paust, Guild Master of the Deepwater Knights and you are to become one of us. Read the note in your inventory and hand it to me when you are ready to begin your training. I look forward to working with you.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances at you and hurriedly makes a gesture of religious meaning before you and says, 'Yes, yes, I hereby bless you in the name of Prexus. May your catch be plentiful and your nets never snag. Are there any other fishermen seeking a blessing? I'm very busy.'");
	elseif(e.message:findi("your brother")) then
		e.self:Say("What? How do you know fo my brother? Ahh I assume Breya told you. He's been gone for quite some time with no word sent on his progress or his wellbeing. I need to find someone to [check on him].");
	elseif(e.message:findi("check on him")) then
		e.self:Say("Thank you, " .. e.other:GetName() .. ". He's one of our people's most knowledgeable geologists and has left to survey an island out in Erud's Crossing. He was sending monthly reports until two weeks ago when his report never showed up. I'm worried something may have happened to him. Take this note to Yelesom and bring back something to assure me of his safety. A reward fitting a Deepwater Knight shall be yours upon your success.");
		e.other:SummonItem(18173);
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18724})) then -- Tattered Note
		e.self:Say("Yes. welcome friend! Here is your guild tunic. You'll make a fine addition to the Deepwater Knights.  Go see Lumi Stergnon, he will get you started in your studies. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13544); -- Old Blue Tunic*
		e.other:Ding();
		e.other:Faction(79,100,0); -- Deepwater Knights
		e.other:Faction(145,15,0); -- High Council of Erudin
		e.other:Faction(143,-15,0); -- Heretics
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1771})) then
		e.self:Say("Excellent! Thank you for checking on my brother, I am glad to hear that he is well.  Here is something that shall help you on your way.");
		e.other:SummonItem(1763);
		e.other:Ding();
		e.other:AddEXP(300);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98061 -- Gans_Paust