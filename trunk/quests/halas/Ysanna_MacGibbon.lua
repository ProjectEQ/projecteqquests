--Added faction requirement of Indifferent or better as per allakhazams

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The mammoth calf hides are used to shield our beasts of burden from the icy wind. You are probably now asking what shields us Northmen from that same icy wind eh? Well, along with many other furs and leathers, we have come to find that [gnoll fur] of all things is a good insulator against the cold. Look at their tiny bodies and it's obvious their fur does something good.");
	end
end

function event_say(e)
	if(e.message:findi("gnoll fur") and e.other:GetFaction(e.self) < 6) then
		e.self:Say("You should not be asking where or what a gnoll is, but asking how I make use of that patch fur I find on their corpse. It is quite simple, take four pieces of gnoll fur and sew them together. Take the result and sew four of them together. And again with that product. In the end you will have a bundle of tailored gnoll fur. You can either return it to me or keep it for yourself.");
	end
	if(e.message:findi("dark assassin") and e.other:GetFaction(e.self) < 6) then
		e.self:Say("That poor lad! I saw him in the tundra being chased by that big bear of Tundra Jack. I never liked that bear of his since the day he ate my poor dog Thunderpaw. Anyways i say Iceberg chasing the assassin and grabbed my trusty ahlspiess and threw it, aiming right for his big head. Can you believe I missed?? I hit his side instead. Iceberg ripped my ahlspiess out and ripped it into pieces and then went whining of to Tundra Jack. Serves that bear right! He ate my dog!");
	end
	if(e.message:findi("ahlspiess") and e.other:GetFaction(e.self) < 6) then
		e.self:Say("Ahhhh my beloved shrieking ahlspiess, it was nice i was able to help a fellow assassin out but i really do miss it. The dark assassin gave me a sketch of paper he said was very valueable but it still pains me to be without my favourite throwing weapon. If you go get me another I would gladly part with this sketch.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--I changed this statement to use the plugin now.  Maybe I shouldn't have, but I wanted things to be uniform. -Kilelen
	if(item_lib.check_turn_in(e.trade, {item1 = 1330}) and e.other:GetFaction(e.self) < 6) then	-- Patched Gnoll Fur Bundle
		e.self:Say("You have done well. Here is a small reward for your effort.");
		e.other:AddEXP(125);
		e.other:Ding();
		e.other:GiveCash(0,2,2,1);
		e.other:Faction(275,10);						-- 275 : Faction Rogue's of the White Rose
		e.other:SummonItem(1349);						--Fang of the Wolf
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 7507}) and e.other:GetFaction(e.self) < 6) then	--Shrieking Ahlspiess
		e.self:Emote("beams 'Thank you, take this.'"); 	--text made up
		e.other:SummonItem(24097);						--Sluggish Sketch
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
