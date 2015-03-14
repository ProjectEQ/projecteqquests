function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hello.' Jasmine lowers her head. 'Sorry, I am not really in best form today. I am in a bit of a [big predicament].");
	elseif(e.message:findi("big predicament")) then
		e.self:Say("'I work for the League of Antonican Bards. As you may or may not know, we are sometimes tasked with the delivery of mail to various cities around Norrath. A shipment of mail was to be delivered from here to Qeynos. It was supposed to arrive several days ago but I have received word that it never arrived. I have recently been informed by the guards that the ship was stolen before it could leave port. The guards reported seeing a large number of trolls board the ship and sail away with it in the dead of the night. The League and myself would be most appreciative of such a brave adventurer's [help].");
	elseif(e.message:findi("help")) then
		e.self:Emote("gives you a warm smile. 'That is the first time I have smiled in days, this mess has me so worried. Not only are we missing the mail but now an entire ship. Please take this note to Guard Bribbely. He is probably still near the docks investigating this matter.'");
		e.other:SummonItem(55003); -- Note to Guard Bribbely
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 55002})) then -- Bundle of Mail
		e.self:Say("'I am so happy to see that you have returned, and with the mail! You are truly a hero. I will make certain that the other members of the League hear about you. You didn't find the missing ship you say? Guard Bribbely will not be pleased, but you did all that you could. Please take this for payment of your brave deeds. May we meet again.");
		e.other:SummonItem(55027); -- Seawind Necklace
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end