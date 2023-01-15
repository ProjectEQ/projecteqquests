-- Part of Ghoulbane quest
-- items: 2417, 2414

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(qglobals["Llara"] ~= nil) then
		if(e.message:findi("kanthuk")) then
			e.self:Say("I take it you're here to find out more about [Amstaf].");
		elseif(e.message:findi("amstaf")) then
			e.self:Say("I've known Amstaf since he was a child. We grew up in the same city together. Ever since I've known him there's always been something [unusual] about him.");
		elseif(e.message:findi("unusual")) then
			e.self:Say("When we were growing up we used to venture outside the city gates. Some times we would encounter a wandering ghoul or an undead spirit of some sort. He was always able to quickly dismiss the undead being with very little effort. I [learned] many things growing up with Amstaf.");
		elseif(e.message:findi("learn")) then
			e.self:Say("Amstaf told me many things when we were younger. Once Amstaf told me that life isn't about how you get there, it's about where you end up. I miss my dear friend. Its been a long time since I've seen him. The night of the snowstorm I dreamt about him. I remember seeing Amstaf's face. I saw something I've never [seen] before.");
		elseif(e.message:findi("see")) then
			e.self:Say("I saw desperation. I spoke to many people who knew Amstaf trying to find out if anyone heard anything about that night. No one knew anything about it. When I had reached the dwarven hunting grounds I ran into a woman named Walnan. She kept rambling on and on about the power of the Orb and something about Magi`kot. I didn't understand what she was saying. She didn't know anything about my situation either, but she did tell me that there were others that may be able to help me. She told me that I should find [Ruathey].");
		elseif(e.message:findi("ruathey")) then
			e.self:Say("Ruathey is known for her ability to look into people's souls and find truth. Though I wasn't able to find Amstaf, I was able to recover his sword. I believe that by having his sword I am closer to finding him. Take this note to Ruathey and tell her that I sent you.");
			e.other:SummonItem(2417); -- Item: Note to Ruathey
			eq.delete_global("Llara");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 2414})) then
		e.self:Say("Oh my, this belongs to Amstaf! Where did you get it?");
		e.other:Ding();
		e.other:AddEXP(500);
		eq.set_global("Llara","ghoul",0,"D30");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF #Llara : Cauldron