function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("You must leave this place. As you can see, elementals have invaded our lair! Damn that [Farsoth]");
		elseif(e.message:findi("Farsoth")) then
			e.self:Say("Farsoth is the son of the Ishva Mal. He sought to be leader and opened a portal to the elemental planes. He made a grave mistake however and the elementals that poured through the portal were not to be under his control. We are all doomed now! Grrrr.");
		end
	else
		if(e.message:findi("hail")) then
			rand = math.random(2);
			if(rand == 2) then
				e.self:Say("Oh look, a talking lump of refuse. How novel!");
			else
				e.self:Say("Is that your BREATH, or did something die in here? Now go away!");
			end
		end
	end
end
