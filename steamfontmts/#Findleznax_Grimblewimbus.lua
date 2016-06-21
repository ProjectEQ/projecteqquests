function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if( e.message:findi("hail")) then
		e.self:Emote("attempts, most unsuccessfully, to hide the shovel behind his back. 'I wasn't doing anything! You have to understand . . . This isn't what it looks like. It was a wonderful night for a stroll! Oh wait, you're not one of the authorities, are you? Phew. In my [" .. eq.say_link("line of work") .. "], you never can be too careful. Say. . . You look like you might be morally flexible. Why don't you lend old Findleznax a hand and keep a watch out while I dig. Something's buried here, I know it. I can SENSE it, and I'll be swizzle-swaggled if some other rotbag is going to get ahold of it before me. Whaddya say? Find it in your heart to [" .. eq.say_link("help") .. "] me?");
	elseif(e.message:findi("line of work")) then	
		e.self:Say("Self-employed treasure seeker. I relieve the dead of their valuables after they no longer need them. My efforts aren't appreciated in many places which requires me to practice discreetly. There are some that would call me 'gravedigger', but I don't particularly care for the connotations associated with that moniker. You know, it's funny. . . A Wayfarer trespasses in the hallowed crypts of Mistmoore, plunders their treasure and walks away a hero. I exhume a single fresh corpse and suddenly become a criminal - does that sound like justice to you?");

	elseif(e.message:findi("help")) then
		e.self:Emote("thrusts his shovel into the dank earth and begins digging. For his size, he works fast");
		if(	qglobals["Fatestealer_forge"] == "1") then
			e.other:Message(15,"The dirt shudders and a decomposing hand breaks the surface. By Bertoxxulous bile, we've got a live one! Defend yourself!'");
			eq.spawn2(448203,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); 
		else
			e.self:Emote("stops digging and sits down to rest. 'Hmph, nay. There's nothing here after all. Sorry to have troubled you.");
		end
	elseif(e.message:findi("favor")) then
		e.self:Say("Let's get one thing straight, right now, $name. I do NOT work for Stanos, and I do NOT work for you. It's a simple matter of repaying a favor, and I'd suggest you not press the issue lest I change my mind.");
	end
end