local escort = 0;

function event_spawn(e)
	escort = 0;
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(115148)) then
		eq.depop(115148); --#Loremaster_Sarl_ (115148)
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahhh, hello there. What can I do for you, " .. e.other:GetCleanName() .. "");
	elseif((e.message:findi("name of the slain") or e.message:findi("name of a slain")) and e.self:GetGrid() == 22) then
		e.self:Say("The name of Dragon, you say? One that was slain? Hmmm, sounds interesting. Like I said, we've had little contact with Dragons, but I vaguely recall an ancient legend about a slain dragon and one of our people meeting. Follow me to the Library and we'll talk along the way.");
		e.self:AssignWaypoints(32);
		eq.start(32);
	elseif(e.message:findi("dragon")) then
		e.self:Say("Dragons, ye say? Well, you might just be in luck. I'm the resident Lore Keeper on the subject of dragons, though we don't know very much about them as a community. We've had very little contact with the majestic beasts. Only the Bravest of our kin have ever found the guts to stand their ground when facing a Dragon, let alone speak with them. What are you looking for exactly?");
	elseif(e.message:findi("black") and escort == 1) then
		e.self:Say("Excellent, I know what we're lookin fer now.");
		eq.spawn2(115148,33,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --#Loremaster_Sarl_ (115148)
		eq.depop_with_timer();
	end	
end

function event_waypoint_arrive(e)
	if(e.self:GetGrid() == 32) then
		if(e.wp == 7) then
			e.self:Say("There are only a few myths we've recorded havin to do with Dragons, many less legends. There's a story of an ancestor of the Dain ridin a 'Wurm' into battle against Giants. A Wurm be a lesser form of a Dragon, not able to use magic or fly, but still just as mean. There's another story, more recent, about a pair a Coldain that rampaged through the countryside along side a magical sea turtle, undoing evil and saving this and that. Heheh, more likely a drunken wive's tale.");
		elseif(e.wp == 11) then
			e.self:Say("'Ye may not know this, but we didn't always make our home here in Thurgadin. Centuries ago we lived deep down in the ground, close to Brell. That was our first home after we became stranded on this chunk of ice. We lived there peacefully for a while, until the Giant kin found us. They drove us out, though we didn't leave without a fight. This statue coming up here is of a hero that sacrificed his life in that battle to bring a great cavern down on the heads of many o those giants.");
		elseif(e.wp == 15) then
			e.self:Say("I brung up our old home o Froststone because we had many books and tablets that were lost when we were forced to flee. We had a long history during our peaceful time there, much of it is lost to us now. Still, we were able to save a few slim volumes. I'm thinkin we may find yer answer in o those old recordings. We'll see...Ahhh, here we are. Remember to keep yer voice down, it is a library ye know.");
		elseif(e.wp == 17) then
			e.self:Say("If we Coldain just work together, obeying Brell's teachings, nothing can stop us from overcoming our enemies. Even the Kromrif will fall before us if we are undivided. It is only when we stray from our fundamental knowledge that we are vulnerable.");
		elseif(e.wp == 19) then
			e.self:SetAppearance(4);
		elseif(e.wp == 22) then
			e.self:Say("Ok, here we are. Let me see.' Sarl runs a finger along the book labels searching for a particular volume...");
		elseif(e.wp == 23) then
			e.self:Say("Do ye know anythin about this dragon? Ye need his name right? Some o these older ones are organized in strange ways. I love me fore fathers, but they made some funny kinda rules. Do you know what color this dragon was?");
			escort = 1;
		end
	end
end
