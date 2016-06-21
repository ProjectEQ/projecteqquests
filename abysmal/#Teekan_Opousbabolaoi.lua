-- 1.5 Berserker Epic Quest

function event_say(e)
	if(e.message:findi("hail") and e.other:Class() == "Berserker") then
		e.self:Say("Hail to thee friend! No doubt you sought me out for my expertise in enchanting though I admit to wondering what need a bersrker like yourself would have of me. Pray tell how may I serve thee?");
	end
end
		
						
function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);	
		if(item_lib.check_turn_in(e.trade, {item1 = 18976, item2 = 11999}) and qglobals["berserk_epic"] == "5") then 
			e.self:Emote("takes the axe and the Soul Gem and begins the chant in low, near inaudible tones. Smoke begins to swirl around the axe as the orb twists and writhes like a serpent around the haft of the axe, melding itself to the dark wooden handle. When the smoke clears, she hands the axe back to you and says, 'This should be what you're looking for! Be sure to show this to Keras and give him my regards. Tell him he should stop by and visit sometime!");
			e.other:SummonItem(18398); -- Raging Taelosian Alloy Axe (Epic 1.5)
			e.other:AddAAPoints(5);
			e.other:Ding();
			e.other:Message(15,'You have gained 5 ability points!');
			e.other:SetAATitle('Axe Master');		
			eq.set_global("berserk_epic","7",5,"F");			
		end
		item_lib.return_items(e.self, e.other, e.trade);
end