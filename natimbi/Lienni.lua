-- Cragbeast Queen: Lizardscale Woven Sash

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:HasItem(52125)) then --scale of the cragbeast queen
			e.self:Emote("gasps when she catches a glance at the scales you carry. 'Unbelievable! Those are authentic ancient cragbeast scales. Why, they're absolutely humongous. Some of the scales are a bit charred or damaged in places, hmm. She chuckles, The beast didn't go down without a fight, I take it? There are enough scales in good shape to fashion a sash. I could do so with the right [materials], if you wish.");
		else
			e.self:Emote("nods in your direction. 'Greetings. This is a place of peace and safety. Feel free to have a seat in our camp and relax. The Wayfarers have rescued me from the clutches of the Legion of Mata Muram. We owe them so much. I wish there were some way I could [repay] them.");
		end
	elseif(e.message:findi("repay")) then
		e.self:Emote("sighs with discontent. 'I am not a warrior, and that's what is truly needed in these dark times. There's nothing I can do except weave. In our tribe I was an expert seamstress. I can work with nearly any material, but my specialty is decorative clothing woven from scales of the cragbeast.");
	elseif(e.message:findi("materials")) then
		e.self:Emote("hands you a compact box. 'This shouldn't be too difficult for someone like yourself. I will need you to bring me the raw materials to weave the sash. Combine them in this box and then return the box to me. The work will require three Pristine Hynid Manes, a pair of Untainted Spectral Essences, and the Cragbeast Queen's Scales.");
		e.other:SummonItem(52129); --Lienni's empty box
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 52131})) then --Lienni's Box of Raw Materials
		e.self:Say("This is my finest work, ".. e.other:GetCleanName() ..". Wear it with pride and know that it was my distinct honor to assist you in this fashion."); --need actual text
		e.other:QuestReward(e.self,0,0,0,0,52124,200000); --Item: Lizardscale Woven Sash
        end
  item_lib.return_items(e.self, e.other, e.trade)
end
