-- items: 26010, 28060
function event_say(e)
	if (e.other:GetFaction(e.self) <= 5) then
		if(e.message:findi("hail")) then
		  e.self:Say("Hmm, I have been watching you. You made it further than I thought you would. I will have to work on my defenses in the future. So, what do you seek of me?");
		elseif(e.message:findi("Jaled Dar")) then
		  e.self:Say("Jaled Dar is quite dead, you know. But he was tasty, I feasted on his remains long ago. I do wish his spirit would go away, his incessant wailing disturbs me, and worse, it makes other dragons wary of this place. I have not eaten as well as I would have liked since his shade came to stay. If you wish to speak with him yourself, I can arrange that, for I hold a key that will unlock his tomb.");
		elseif(e.message:findi("key")) then
		  e.self:Say("This IS my realm, after all. Nothing is barred to me. But I did not become who I am by doing something for nothing. If you wish to talk to Jaled Dar, you will have to do something for me first. Are you willing to do this task?");
		elseif(e.message:findi("task")) then
		  e.self:Say("There is an annoying uprising taking place among the Chetari and Paebala. This is affecting my diet. I get cranky when I don't eat right. I am VERY cranky right now. The rebellion is led by a Paebala named Neb. He has taken his followers into a part of the Necropolis that I have difficulty reaching, and he has somehow tamed the goo there as well, preventing my Chetari followers from assaulting them directly. If Neb were to fall, I am certain the rebellion would quickly falter. Bring me Neb's head, and I will give you the key to Jaled Dar's tomb.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 26010})) then  -- Nebs Head
	   	e.self:Say("Excellent work! Here is your key, go bother that prattling fool Jaled Dar, and leave me be.");
		  e.other:Ding();
		  e.other:SummonItem(28060);	-- Jaled Dars Tomb Key
		  e.other:Faction(462,50,0); 	-- Chetari
		  e.other:Faction(464,500,0); 	-- Zlandicar
		  e.other:Faction(430,-50,0);	-- CLaws of Veeshan
		  e.other:Faction(304,-50,0); 	-- Ring of Scale
		  e.other:AddEXP(250000);
		  end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
