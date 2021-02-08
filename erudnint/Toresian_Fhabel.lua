-- Inert Potion
-- items: 13983

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. my friend! We are the Craftkeepers. We study the circle of magic called enchantment. What circle do you [study]?");
	elseif(e.message:findi("study enchantment")) then
		e.self:Say("Then I welcome you into our circle. It is good to see new blood. I have a favor to ask of you. Do you wish to [assist Toresian] or do you not have the time?");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(23080) == false or eq.get_entity_list():IsMobSpawnedByNpcTypeID(23001) ==  false) then
			eq.unique_spawn(eq.ChooseRandom(23080,23001),0,0,575,683,-12.13,156); -- NPC(s): Slansin (23080), Slansin (23001)
		end
	elseif(e.message:findi("assist Toresian")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Ahhhhh " .. e.other:GetName() .. ". Slansin used to have need of those potions, however he mysteriously disappeared long ago. The only person I know of who still wants them is a cleric of the Church of Marr in Freeport.");
			e.other:SummonItem(13983); -- Item: Inert Potion
		else
			e.self:Say("You are lucky to be standing. Leave here immediately or suffer grave consequences! You are not welcome amongst the Craftkeepers.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:23073 -- Toresian_Fhabel
