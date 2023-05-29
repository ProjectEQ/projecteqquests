-- Yilbit Gerbigo
-- Marr's Blessing
-- items: 55035, 55036
function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.other:Race() ==  "Froglok" or fac < 5) then
		if(e.message:findi("hail")) then
			e.self:Say("Salutations. Come sit with me and have a drink. I am just going over some [business] right now.");
		elseif(e.message:findi("business")) then
			e.self:Say("You look like a stout follower of Marr's teachings. This document was just delivered to me. It seems the Paladins in Freeport wish for us to assist them. Let's see what this scroll says.");
			e.self:Emote("begins to read the scroll.");
			e.self:Say("Hmm, yes. Interesting. Most unfortunate. Have you ever heard of Castle [Mistmoore]?");
		elseif(e.message:findi("mistmoore")) then
			e.self:Say("It is an ancient castle on the continent of Faydwer, eternally covered in magical darkness. The castle's origins are shrouded in mystery to this day. According to this scroll, many years ago, Sir Bronthas, a Paladin of Marr took up the crusade to wipe Castle Mistmoore and its minions off the map once and for all. After a tiring journey he finally made his way to the castle. He was never heard from again. Rumors say that the brave if not foolish knight was killed and then raised from the dead to serve Lord Mistmoore. Still others say that his bones were used to decorate the dark halls of the castle. Truth be said, no one really knows what happened to him. That is why the Paladins in Freeport need our [assistance].");
		elseif(e.message:findi("assistance")) then
			e.self:Say("They wish for us to venture to the castle and find any sign of what happened to Sir Bronthas. I am afraid however that I was wounded in the war with the Trolls and can no longer fight and Shin Master Grubbus has his hands full training the influx of new recruits. Perhaps you could find some time to [look into this] for us?");
		elseif(e.message:findi("look into this")) then
			e.self:Say("You are a true follower of Marr. However I worry for your safety. If you do accept this task, please make sure you are ready. The castle is a deadly place. Should you find any trace of Sir Bronthas's remains, please bring them back to me. There is apparently a reward for completing this. Marr's blessing be with you.");
		end
	else
		e.self:Say("Hmm... there is something about " .. e.other:Race() .. "s that I don't exactly trust...");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);
	
	if(e.other:Race() ==  "Froglok" or fac < 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 55035})) then -- Sir Bronthas's Remains
			e.self:Say("You actually found his remains?! You are remarkable. We must get Sir Bronthas a proper burial. As promised, here is your reward.");
			e.other:Faction(1718,10,0); -- Guktan Elders
			e.other:Faction(1709,10,0); -- Protectors of Gukta
			e.other:Faction(1716,10,0); -- High Council of Gukta
			e.other:Faction(1717,10,0); -- Lorekeepers of Gukta
			e.other:QuestReward(e.self,0,0,0,0,55036,1750000); -- Item #55036 (Marr's Blessing) and 1750000 exp
		end
	else
		e.self:Say("Hmm... there is something about " .. e.other:Race() .. "s that I don't exactly trust...");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of File Zone:rathemtn -- Yilbit Gerbigo
