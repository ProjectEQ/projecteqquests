--abysmal/Rewina_Jalmoy.lua NPCID 279199 or 279271
--Warrior Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Hello" .. e.other:GetName() .. ". What's that I see? Are you [smirking] at me? That's not very nice of you.");
	elseif(e.message:findi("smirking")) then
		e.self:Say("Well, I don't think it's very nice to laugh at someone just because of his name. I didn't pick it, you know. Go laugh at my parents.");
	end	
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["warrior_epic"] >= "2" and item_lib.check_turn_in(e.trade, {item1 = 60295, item2 = 60296, item3 = 60297, item4 = 60298}) ) then --Decomposing Page 1,2,3 and Decomposing Cover (returned during last step)
		e.self:Say("Oh my, what is this? Someone looking to interact with me who isn't making fun of my name?! I'm shocked! So what have you brought me, hmm? Ooo, what a collection of fine specimens! Where on Norrath did you find these? Did you find them on Norrath? Oh wordy me! I always seem to get sidetracked, but I did manage to decipher what these pages say for you. Don't be a stranger, come back and see me any time you like!");
		e.other:SummonItem(60299); --Recounted History of War
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	