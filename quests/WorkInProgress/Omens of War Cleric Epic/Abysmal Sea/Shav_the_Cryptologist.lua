-- Harmony of the Soul // 1.5 Cleric Epic Quest NPC -- Drogerin

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I'm a little busy, you have something you need translated?");
	end
end
		
				
		
function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.trade, {item1 = 7135})) then -- Encrypted Note 
			e.self:Say("Interesting, you say someone who claims to be part of the Brotherhood wrote this? This is one of the dialects used by the Legion. I am the only one able to read or write any of their languages, and this is the first I have seen of this note. From what I can tell, the author is trying to arrange a meeting with the Muramites. It sounds like the contact spot is pre-arranged, as it is only vaguely referred to here. I doubt this is the first note of this nature, perhaps if you could find earlier correspondence we can find the location of the camp.");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 9476, item2 = 9447, item3 = 9477, item4 = 8778})) then   -- Ripped Quarter of a Map // Shredded Quarter of a Map // Tattered Quarter of a Map // Torn Quarter of a Map
			e.self:Say("Ahh yes, this is exactly what we needed.' She scratches a few notes down on a piece of paper. 'Bring this to Tweister in Nedaria's Landing. She will tell you the location of the camp.");
			e.other:SummonItem(56015);  -- Player receives an Assembled Map.
		end
		item_lib.return_items(e.self, e.other, e.trade);
end