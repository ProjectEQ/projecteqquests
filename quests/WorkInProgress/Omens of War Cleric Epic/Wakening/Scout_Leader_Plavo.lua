	-- Cleric 1.5 Epic Quest // Harmony of the Soul // --Drogerin
	
function event_say(e)
	if(e.message:findi("aid")) then
		e.self:Say("They will research and learn about the greatest mortal beings in this realm. Learning about the creatures that may prove to be friend or foe, so they prepare for either. Our scouts have gathered most of the information that they need, but there are a few creatures that we still need to harvest brains from. Currently scouts are attempting to find the brain of the Shissar, a dragon, and an Akhevan. I am sure any of the scouts would welcome your assistance. I will send runners ahead to notify them you may be arriving.");
	end
end	
			
			
function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 9591})) then  --Dark Disciples Notice of Service
		e.self:Say("You are from the Faydwer camp are you? I'm not terribly familiar with the faces from there. Anyway, the scouts have been sent out, and are gathering the "parts" that we believe the Legion will need to prepare for the incursion into our realm. If we are to find their good graces, we must prove that we will stop at nothing to [aid] them.");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 9945, item2 = 9948, item3 = 9597})) then -- Shissar Cerebral Cortex // Dragon Cerebrum // Akhevan Brain Stem
		e.self:Say("Excellent work! The leader will be pleased. He should be here any moment to collect them.");
		eq.spawn2(NPCID,0,0,-3085.40,761.99,28.06,0); -- need NPCID of Dark Disciple Master // he spawns here, at Scout Leader Plavos exact location - heading I set to 0, he is facing West North West on Test.  Have x/y/zloc correct.
		eq.depop_with_timer(); -- Conflicting reports on Alla as always about spawn timer, some say 2 hours, some say "very quickly" some say "back to back"
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
	