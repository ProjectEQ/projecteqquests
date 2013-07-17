function event_say(e)
	local corpse = 0;
	local corpse = eq.get_player_burried_corpse_count(e.other:CharacterID());
	
	if(e.message:findi("hail")) then
		e.self:Emote("smiles at you broadly. It is my pleasure to bid you greeting from the Council of New Tanaan. I have been granted the task of working as this region's gatekeeper to Shadowrest. Until recently, the Keeper held tightly onto all things that we lost. Thanks to the council, this is no longer true. The Keeper may grant you access to your lost corpses if you ask him. When you are [ready], I will transport you.");
		e.other:Message(15, string.format("You have %i bodies available in Shadowrest.",corpse));
	elseif(e.message:findi("ready")) then
		e.other:Message(13, "The world stretches and twists around you as you feel yourself being pulled from this world.");
		e.other:MovePC(187,-27,-245.6,8,192);
	end
end
