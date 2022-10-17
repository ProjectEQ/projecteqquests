-- items: 31435, 31436, 31437, 31438, 1224
function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(127098);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
	elseif(e.signal == 2) then
		eq.stop_follow();
	end
end

function event_say(e)
	if(e.other:GetLevel() >= 55) then
		if(e.message:findi("hail")) then
			e.self:Say("I welcome thee, " .. e.other:GetCleanName() .. ". Is there something I can assist you with? I am afraid my tireless searching for the incantations is going to be endless.");
		elseif(e.message:findi("searching")) then
			e.self:Say("For quite some time now I have been seeking the teachings and scribings of Conjurers and Summoners of great power. As I continue my personal quest towards enlightenment there is absolute knowledge that evades me to this day.");
		elseif(e.message:findi("knowledge")) then
			e.self:Say("There is believed to be a tome that contained only the most spectacular and powerful summoning. Many great magicians of time passed were believed to be contributors to this magical tome. During the meeting called by these select few something went terribly wrong.");
		elseif(e.message:findi("wrong")) then
			e.self:Say("Of those in attendance, there was one servant of Innoruuk whose intentions were to steal the research and knowledge of his peers and use it to benefit himself and his Dark god. This selfishness led to numerous Intellectual conflicts and the Arch-Magi decided to go their separate ways, only to perish so close to the answer for which they sought.");
		elseif(e.message:findi("answer")) then
			e.self:Say("As time progressed the Elementalists continued their studies and research only to soon discover that there was always something missing. As each of them decended upon the Skyshrine they continued to look, not knowing that what they were searching for was each other.");
		elseif(e.message:findi("i will look")) then
			e.self:Say("That is a kind gesture indeed my friend, but be warned the journey that lies ahead of you will not be easy. But I have faith that this tome will one day be assembled as it was always meant to be and never was. I have faith that the pages do still exist, waiting to be unearthed.");
		elseif(e.message:findi("journey")) then
			e.self:Say("Search the lands for the remains of these Arch-mages, " .. e.other:GetCleanName() .. ". Only when I have these teachings and am able to once again construct this tome may I bring myself closer to my Enlightenment and Arcane Mastery.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 31435,item2 = 31436,item3 = 31437,item4 = 31438}) and e.other:GetLevel() >= 55) then
		e.self:Emote("whispers, like wind through the tree tops, as it speaks hushed words to the tree."); -- Not sure if this is the right response
		e.other:SummonItem(1224); -- Item: Chord of Vines
		e.other:AddEXP(2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
