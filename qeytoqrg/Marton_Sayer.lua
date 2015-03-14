function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. Please stock up on provisions, especially if you are headed toward the lair of the vile gnolls. If so, I wish you much luck and many gnoll pelts!! I also have knowledge of a [powerful dog]. I pray you do not encounter him.");
	elseif(e.message:findi("powerful dog")) then
		e.self:Say("I have encountered a gnoll who spoke the common tongue. He dared to call himself Lord Elgnub. He swore that some day we would cross paths and he would snatch my infant son Joseph from our home. He would stand no chance against me and the mighty [Gnoll Slayer].");
	elseif(e.message:findi("gnoll slayer")) then
		e.self:Say("Gnoll Slayer is the mighty longsword which was passed down unto me through generations of Sayers. My days of battle are over, but I can still wield her with ferocity. The only thing more precious would be my son, Joseph Sayer. I would trade Gnoll Slayer only for him to be safe and sound at home.");
	elseif(e.message:findi("potential")) then
		e.self:Say("The true potential of Gnoll Slayer is an enchantment which was once imbedded into a gnoll's eye which was placed into the hilt of the blade. The spell would help you fight off disease and call forth a wolf to fight beside you. Alas, the gnoll eye was stolen from the blade by a great, one-eyed, white gnoll. Alone with the eye, the only book which explained how to return the enchantment was also stolen. I know not where this gnoll might be. If you can find the journal and the eye, return them with the Gnoll Slayer to me for I have been searching for decades.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12204})) then
		e.self:Say("Baby Joseph!! Look, Momma!! Baby Joseph has been rescued by this good adventurer!! That evil Lord Elgnub made good on his word and snatched my son from under our noses. You saved the day!! For this you shall wield 'Gnoll Slayer'!! Be aware of its [true potential].");
		e.other:SummonItem(5416);
		e.other:Ding();
		e.other:Faction(217,10,0);
		e.other:Faction(33,-10,0);
		e.other:Faction(9,10,0);
		e.other:Faction(47,10,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 8357,item2 = 8356,item3 = 5416})) then
		e.self:Say("'The eye and the journal! What a great day! The Gnoll Slayer shall be returned to full strength because of you. Your service to Qeynos will not soon be forgotten.");
		e.other:SummonItem(5417);
		e.other:Ding();
		e.other:Faction(217,10,0);
		e.other:Faction(33,-10,0);
		e.other:Faction(9,10,0);
		e.other:Faction(47,10,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
