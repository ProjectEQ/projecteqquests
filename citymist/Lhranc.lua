-- Part of SK Epic 1.0
function event_say(e)
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) > 42) then--True Spirit
		if(e.message:findi("hail")) then
			e.self:Say("Ahh, finally! He has sent you. No time to waste now, you must help me lift the curse at once!");
		elseif(e.message:findi("curse")) then
			e.self:Say("Can you not see my condition! I have been unjustly sentenced to an eternity in this wretched form you see before you, never to leave these walls. In exchange for the cure for this curse, I swear to show you a secret that would make you the most powerful of your kind.");
		elseif(e.message:findi("cure")) then
			e.self:Say("I require only four things of you, dark one, and one of them you hold now. Bring me the heart of an innocent, the head of the valiant, and the will of Innoruuk. With these, my curse shall be lifted at last and I will craft a weapon that will cast a shadow over all of Norrath.");
		end
	else
		e.self:Emote("seems to ignore you."); --Emote made up
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 72) then --True Spirit
		if(item_lib.check_turn_in(e.trade, {item1 = 14367, item2 = 14368, item3 = 14369, item4 = 14370})) then --Corrupted Ghoulbane, Heart of the Innocent, Head of the Valiant, Will of Innoruuk
			e.self:Say("Ahh, at last I can free myself of this prison! Centuries have passed since I enjoyed the fruits of mortality.' He hurls the components above his head where they remain suspended in midair. They hover in place while he chants the words of an ancient spell. As he speaks, the items begin to rotate around his head, slowly at first, then faster as the chanting grows louder, until it spins in a blur. Soon, the room is filled with a deafening shriek that pierces you to the core.");
			e.other:Faction(404, 10); --True Spirit
			e.other:QuestReward(e.self,{itemid = 14384}) --Lhranc's Token
			eq.spawn2(90187, 0, 0, 85.1, 0.9, 7.8, 192); ---- #Lhranc
			eq.depop_with_timer();
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
