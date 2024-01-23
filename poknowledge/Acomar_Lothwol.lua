--Beginner Magic Manual

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:DoAnim(70);
		if(e.other:HasItem(28745) and e.other:GetLevel() > 19) then -- must have Planar Traveler's Manual for this response
			e.self:Say("It is good to see you. " .. e.other:GetCleanName() .. ". As a teacher, my job is to share the knowledge of all things mystical with eager students. I sense you have obtained the basics of planar knowledge, you are now ready to begin your first lesson in the ways of magical ability. Are you [willing to learn] what life has to offer?");
		else
			e.self:Say("It is good to see you. " .. e.other:GetCleanName() .. ".  I trust the people of New Tanaan have treated you well thus far.  It is refreshing to see so many people of different cultures coming together in harmony. don't you think?  So many shared experiences from all corners of the universe provide us with a great benefit of wisdom.  As a teacher, my job is to share the knowledge of all things mystical with eager students.  If you are truly interested in knowledge, you should prepare yourself with the basics first. A solid foundation leads to a new heights of achievement.");
		end
	elseif(e.other:HasItem(28745) and e.other:GetLevel() > 19 and e.message:findi("willing to learn")) then
		e.self:DoAnim(57);
		e.self:Say("The use of magic can be a taxing ordeal on the body, and quite often may leave you in a weakened state. Fortunately, I happen to know of a rather rejuvenating meal that will grant new power to your condition. If you are not familiar with the recipe for [Hobgoblin Surprise], I can tell you. What you must do is bring me some as well as your Planar Traveler's Manual. I hope you won't be long, for I am beginning to get quite hungry.");
	elseif(e.other:HasItem(28745) and e.other:GetLevel() > 19 and e.message:findi("hobgoblin surprise")) then
		e.self:DoAnim(57);
		e.self:Say("Don't be put off by the name, it's actually quite tasty. To make Hobgoblin Surprise, get a pie tin, some bread, add some hobgoblin meat and brown gravy. Cook it in the oven and enjoy the results. Mmm mmm, it waters my mouth just thinking about it.");
	elseif(e.message:findi("willing to learn")) then
		e.self:DoAnim(48);
		e.self:Say("I am glad to see you are willing to learn, however I'm afraid you are not ready for my teachings. Come back when you have acquired the proper tools of learning.");
	elseif(e.message:findi("hobgoblin surprise")) then
		e.self:DoAnim(64);
		e.self:Say("I am glad to see you are willing to learn, however I'm afraid you are not ready for my teachings. Come back when you have acquired the proper tools of learning.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetLevel() > 19 and item_lib.check_turn_in(e.trade, {item1 = 29751, item2 = 28745})) then--Hobgoblin Surprise, Planar Traveler's Manual
		e.self:Say("How delicious! You have done well here, I can't remember how long it's been since I've tasted a meal so fine. Take this book, it will certainly help you in your use of the magical arts. When you are ready, Cadelid Etord will give you your next lesson, so be sure to speak to him. Do not lose your book or else he may not appreciate you coming to class unprepared.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),math.random(0,5),28795,500000); --Beginner Magic Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
