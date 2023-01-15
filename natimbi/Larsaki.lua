-- Cragbeast Queen: Lizardscale Plated Girdle
function event_say(e)
    if(e.message:findi("hail") and e.other:HasItem(52125) == true) then --scale of the cragbeast queen
        e.self:Emote("yelps with surprise as she notices the bundle of scales you carry.");
        e.self:Say("How? Where did you acquire those ancient cragbeast scales? As long as I've lived in Taelosia I've never seen any so enormous. The beast must have been several centuries old!' She pauses a moment to regain her composure, 'It would be my honor to fashion those scales into something more practical for you. They are intact enough to create a scale plated belt. All I need are the remaining raw [materials].");
    elseif(e.message:findi("hail") and e.other:HasItem(52125) == false) then
        e.self:Emote("smiles and extends her arm to welcome you.");
        e.self:Say("Pleased to have you in our quaint makeshift camp, ".. e.other:GetCleanName() ..". Stay as long as you like. The Wayfarers always seem busy, but there's not much for me to do here other than work on my [weaving].");
   elseif(e.message:findi("materials")) then
        e.self:Say("Splendid. This is what will be required of you, ".. e.other:GetCleanName() ..". Bring me the raw materials necessary to forge the belt. Combine them in this container and then return the box to me. The work will require three Polished Stonemite Shells, a pair of Untainted Spectral Essences, and the Cragbeast Queen's Scales.");
        e.other:SummonItem(52130); --Larsaki's empty box
    elseif(e.message:findi("weaving")) then
        e.self:Say("Yes. You may have heard of my skill. Among my tribe I was an expert seamstress, the most talented seamstress that has existed for generations. While I can work with a variety of materials, my forte lies in weaving the scales from cragbeasts into decorative attire.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 52132})) then --Larsaki's Box of Raw Materials
		e.self:Emote("bows slightly and hands you a hefty belt. 'This is my finest work, ".. e.other:GetCleanName() ..". Wear it with pride and know that it was my distinct honor to assist you in this fashion.");
		e.other:QuestReward(e.self,0,0,0,0,52123,200000); --Item: Lizardscale Plated Girdle
        end
  item_lib.return_items(e.self, e.other, e.trade)
end
