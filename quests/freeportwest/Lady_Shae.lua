function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. It is always good to meet someone new. I am Lady Shae of the House of Dumas. And what [house] are you from?");
	elseif(e.message:findi("no house")) then
		e.self:Say("Good. I care not to hang around any snobs this evening. Would you be so kind as to buy me some wine?");
	elseif(e.message:findi("steel warriors sent me")) then
		e.self:Say("Thank you for checking into this matter. I told the Militia, but they just ignored me. It appears the dark elves keep coming in leaving mail for [Shintl] Lowbrew. Before I tell you more could you please buy me A white wine please.");
	elseif(e.message:findi("shintl")) then
		e.self:Say("Oh, please!!  Do not mention that horrid little person!  My stay here has turned into a nightmare because of her.  She gets mail delivered to her room every so often by dark elves, of all things.  I cannot stand the Teir'Dal!  I wonder what is in that mail.  If I just had her room key I could walk right up to the innkeeper and say, 'Mail for room two please.' That is all it would take.  But enough about her.  Let's talk about you buying me some drinks.");
	elseif(e.message:findi("house of pancakes")) then
		e.self:Say("I can tell. You look like you ATE a house of pancakes.");
	elseif(e.message:findi("house of style")) then
		e.self:Say("I would of never guessed by the way you look.");
	elseif(e.message:findi("dyllin")) then
		e.self:Say("Dyllin was the name of a Qeynos guard who was sent to pick up the list I was holding for dear, sweet Antonius. He left just yesterday. If you wish to meet up with him, I heard him say he was going to stop at Highpass Hold.");
	end
end

function event_trade(e)
	local wine = 0;
	local morewine = 0;
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13031})) then
		e.self:Say("Thank you. Pandos has been telling me to try white wine forever. I mostly only drink red wine. Pardon me for getting off track. Anyway, it is a good thing you showed up. The lady in room 2 has been receiving mail from a Dark Elf. You [need the mail for room two]. The Innkeeper usually holds it for the guests.");
		e.other:Ding();
		e.other:Faction(100,2,0);
		e.other:AddEXP(150);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13030,item2 = 13030,item3 = 13030,item4 = 13030})) then
		morewine = 1;
		wine = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13030,item2 = 13030,item3 = 13030})) then
		wine = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13030,item2 = 13030})) then
		wine = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13030})) then
		wine = 1;
	end
	
	if(wine > 0) then
		repeat
			e.self:Say("Thank you... Oh my! A few more of these and I will be spilling my secrets.");
			wine = wine - 1;
		until wine == 0
	end
	
	if(morewine == 1) then
		e.self:Say("Oh my.. You are so kind. I can not tell you the last time I had so much fine wine. Well, there was the time Antonius Bayle told me he no longer had the time for a committed relationship. Mister big ruler of the world. Make it to the top and find someone younger. I know his plan. I hate him. I will never trust another human again. After all that, he goes and asks me to hold on to this list for him. Well I am glad it was taken from me by that [Dyllin]. Antonius Bayle has no ties to me any more!! Good riddance! Oooooh! I love him.");
		e.other:Ding();
		e.other:Faction(100,2,0);
		e.other:AddEXP(150);
		morewine = 0;
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end
