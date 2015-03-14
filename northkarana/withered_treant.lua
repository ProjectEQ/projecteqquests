function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes. My bark is blackened and cracked by sickness. If only I were the only one to be afflicted this way. Throughout the lands this is happening. Agents of some dark god are twisting the lands and their creatures.");
	elseif(e.message:findi("dark god")) then
		e.self:Say("Not long ago, a human passed through this area. Around him swarmed some aura of sickness. Few could see it but with my age I could recognize a bringer of the plague. He seeded the area with pestilence before I could lift a branch to stop him. I believe it was he, and others in other lands, who has helped bring about this sickness.");
	elseif(e.message:findi("sickness")) then
		e.self:Say("I have kept in touch with friends of Tunare and Karana. It seems something is building amid the darkness. Some pact between gods to corrupt. All I know for sure is that you can stop the sickness in this land. I can feel it, vaguely. Somewhere, in the mountain and lake areas, and far north amid the cold mountains is where the land hurts most. Go, find the sources of corruption, and bring them back to me. Three should be their number.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20690,item2 = 20689,item3 = 20688})) then
		e.self:Say("My heart cleansed of Corruption can interrupt the Flow of the corruption between the priest and his dark god, force it upon him quickly, I can sense him, he is in the Karana's somewhere.");
		e.other:SummonItem(20695);
		e.other:Ding();
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
