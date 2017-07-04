function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		if(qglobals["mage_epic"] ~=nil and tonumber(qglobals["mage_epic"]) >= 9) then		
			e.self:Say("Hello again. So, you are looking for the Primal Elemental essences? That has a nice ring to it Transon has always had a penchant for the dramatic. I do not believe that you will find these beings in Discord however, if they exist at all. I do believe that your staff will resonate when you approach the creatures, so travel the world you know. Elementals tend to gravitate to areas that reflect their element best, I don't see why the [" .. eq.say_link("Primals") .. "] would behave any differently.");
		else
			e.self:Say("The magic here is quite unique. I am thrilled I've had the opportunity to study it.");
		end
	elseif(qglobals["mage_epic"] >= "8" and e.message:findi("bantil")) then
		e.self:Say("Yes, Bantil told me you would be coming. Perhaps we can help each other. There are two tribes of elemental beings here. They have an unprecedented ability to channel elemental energy. I have yet to see one with my own eyes, but they may just contain [" .. eq.say_link("power") .. "] that will help you unleash the staff's true power.");
	elseif(qglobals["mage_epic"] >= "8" and e.message:findi("power")) then
		e.self:Say("They use the elements in a way we have yet to understand. I suspect something in their essence that allows them to tap into the elements in a different manner than we understand. If my suspicions are true, these creatures should leave behind a small portion of their essence, when their spirits leave their bodies. If you find anything like that, bring it to me. They may be rather small, so bring me two from each type for good measure.");
	elseif(qglobals["mage_epic"] >= "9" and e.message:findi("Primals")) then
		e.self:Say("Were I to venture a guess, I'd say look for Chaos near the ruins of a fallen empire, as order would tend to oppose chaos, I would look for the Order elemental near the ranks of a well regimented army, probably an ancient army, it is a creature of prestige. The Spirit elemental would find someplace where death and decay have a strong foothold. The Body Elemental may be the most elusive, as there is life everywhere. I would assume that its strong ties with this realm would pull it to a place where there are Muramites. When you find them, bring their remains to me and I'll see what else needs to be done.");
		eq.set_global("mage_epic","10",5,"F");
	end		
end
function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["mage_epic"] == "7" and item_lib.check_turn_in(e.trade, {item1 = 19092})) then --epic 1.5
		e.self:Say("My goodness, I did not realize you were the one [" .. eq.say_link("Bantil") .. "] sent to me! This is truly amazing! I was shocked when Magi'Kot's dream had been realized. I never thought it would be surpassed. My, so much focused elemental energy. This is truly amazing. You have accomplished quite a feat.");
		eq.set_global("mage_epic","8",5,"F");
		e.other:SummonItem(19092); --Give back epic 1.5
	elseif(item_lib.check_turn_in(e.trade, {item1=19099,item2=19099,item3=19093,item4=19093})) then
		e.self:Emote("grinds the small crystals into a fine powder, 'This is like nothing I have ever seen. It will take some time for me to analyze this, but thank you. I have more here than I will need. Take this pouch to Bantil, along with this note. If he doesn't know how this will help you, he may know someone who does.");
		e.other:SummonItem(19149); --Pouch of Powdered Riftseeker Essence
		e.other:SummonItem(19438); --Note from Iilivina
	elseif(item_lib.check_turn_in(e.trade, {item1=19547,item2=19447,item3=19444,item4=19544})) then
		eq.set_global("mage_epic","11",5,"F");
		e.self:Say("You work so fast! Amazing work you have done.' She looks at the 4 essences for a moment, 'Yes, these can probably be used to bind to your staff, but we'll need some sort of binding. Something that can be used to keep large amounts of energy bound together. I have no idea where you'd find such a thing, but if you do bring it to Bantil with your staff, and he'll be able to finish your journey.");
	end	
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
