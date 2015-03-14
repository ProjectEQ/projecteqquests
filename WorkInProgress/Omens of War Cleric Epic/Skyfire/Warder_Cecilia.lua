-- Cleric 1.0 // 2.0 Epic Quest NPC // --Drogerin

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:HasItem(9955)) then  -- If cleric has 1.5 then continue with 1.5 quest, if not continue with 1.0 quest.
			e.self:Say("You are not the one that I seek, return when you have news of Zordak.");
		else
			e.self:Say("Greetings, you have made excellent time. We received word that Zordak was gathering his power here, and we still have little knowledge of his true intentions. Scattered throughout these mountains there are small Pearlescent Shards, binding four of these shards together within a Box of Binding should allow me to create a Seal. This seal, when fused with a Swirling Pearl inside Zordak's heart should allow our seers to divine his true intentions, even after he has been slain. Once you have the seal I will release Zordak, make haste I will not be able to hold him for long.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
		
		if(item_lib.check_turn_in(e.trade, {item1 = 24996})) then  -- Turn in Assembled Pearlescent Shard
			e.other:SummonItem(24997); -- Pearlescent Seal
			eq.spawn2(91096,0,0,-3226,3011,-148,66); -- Spawns Zordak Ragefire ( Human Form ) Who attacks the cleric.
			eq.depop_with_timer();  -- Despawn Warder Cecilia.
		elseif(item_lib.check_turn_in(e.trade, {item1 = 12509})) then  --Turn in Robe of Plasmatic Priesthood
			e.self:Say("Yes, Omat told me you were coming. Let me see what I can divine from the robe.' She holds the robe to her temple and closes her eyes. You notice a brief glow from behind her eyelids before her eyes shoot open. 'This is truly terrible news. The Plasmatic Priests are still fighting for the destruction of Norrath. Fennin Ro's voice is silent to them now. The remainder of their power faded with the Pantheon's interest in mortal affairs. In their mad pursuit of power, they have allied themselves with Mata Muram. They plan on trading their home-world for the promise of power. Even now their leader is within the Muramite Trials. Trying to earn a position of rank within the Legion. Stop him, once he completes the trials we may lose our opportunity to stop him. I am afraid you will have to visit the Labrynth's trials and stop him before he is able to complete them. Best of luck to you.");
		end
		item_lib.return_items(e.self, e.other, e.trade);
end