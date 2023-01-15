-- Quest: Qeynos Badge of Nobility (Badge #5)
-- items: 8283, 8199, 8198, 8278

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yeah. Hi. Lovely place this. Humid, dark, wild animals all over the place, man eating plants, snakes and bugs finding their way into my armor and biting me where a man ought not be bit. And if [Bossamir] is right, we're soon to be cut down by ravaging gnolls. Why-oh-why did I get assigned to this job? Why wasn't I assigned to Qeynos where a man can get a decent meal and sleep in a nice bed at night? Oh I'm sorry. Did I say that out loud?");
	elseif(e.message:findi("bossamir")) then
		e.self:Say("Hmm. . . Yeah, I have this tendency to prattle on when I'm completely miserable. According to what my colleague Bossamir has heard, these gnolls may be tougher then we thought. But that would be par for the course anyway with the way my pitiful life is going. Woe is me. The people in this backward settlement hate me, Sergeant Caelin hates me and I assume Kane hates me too because he sent me to the armpit of Antonica on a suicide mission.");
	elseif(e.message:findi("pate")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Oh yes! That would be great. Bring me some Pate and let me see that warning again and maybe I can actually read the whole thing without feeling faint.");
		elseif(e.other:GetFaction(e.self) < 7)then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 8283}, 0)) then
		e.self:Say("So he wants to send me to jail simply because I'm not filling out some silly reports? How can I be expected to think in such a decrepit state? Maybe you could help me. If I had a meal worthy of someone of my breeding then maybe I could think. Bring me something elegant, I don't want anything dull and pedestrian. I don't know what I want though. Do you have any suggestions?");
	elseif(e.other:GetFaction(e.self) < 5 and (item_lib.check_turn_in(e.trade, {item1 = 8199}, 0) or item_lib.check_turn_in(e.trade, {item1 = 8198}, 0))) then -- Dryad Pate or Potameid Pate
		e.self:Say("hmm... This is interesting... The taste is very refined but sort of... odd... We're almost there but I don't think you have the recipe quite right. Rather than that peasant Brandy, use this in your recipe instead. And rather than whatever other 'meat' you were using before use a Panther Liver. You do seem to have some skill as a chef, mayhaps you could work for me some day. Prepare some Panther Pate for me. Give me the Panther Pate and let me read that warning again.");
		e.other:QuestReward(e.self,{items = {8284,8283}}); -- Finewine Family Brandy
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 8278}, 0)) then -- Panther Pate
		e.self:Say("Ah yes, this is perfect! I feel my head clearing already. Wait, is that the sun poking through the trees there or the moon? Hard to tell in this hideous jungle... Oh wait, yes. My shift reports for the last few weeks. Why don't you go ahead and turn these into Sergeant Caelin for me? I'm going to enjoy this fine pate.");
		e.other:QuestReward(e.self,0,0,0,0,8279); -- Stack of Shift Reports
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
