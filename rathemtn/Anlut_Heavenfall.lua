function event_say(e)
	if (e.message:findi("hail")) then
		if (e.other:Race() == "Froglok") then
			if (e.other:Class() == "Wizard" and e.other:GetLevel() >= 20) then
				if (e.other:HasItem(63115)) then
					e.self:Say("Bah! You think I'll accept you back so easily after that error? Everyone is talking about it! Those smug scions are STILL chuckling. I'll give you a task you can actually accomplish. Go get me 3 fresh Twilight Blooms from Odus. Return them and the prism to me. Perhaps such an inane task will jolt your lazy mind!");
				elseif (e.other:HasItem(63116)) then
					e.self:Say("AMAZING!  'Frogs falling from the sky', the bards are crying. I didn't imagine you could make a bigger fool of yourself. Again, you've proven me wrong. I'll not let you off with some simple job this time. No! Go to the Direlands and slay the Time Torn Acolyte. It is a dangerous land and you will have to use your wits . . .I hope! Find some proof of your success. Return both the prism and the proof to me. I shall consider, one last time, to continue your learning.");
				elseif (e.other:HasItem(63117)) then
					e.self:Say("Hmph.  We shall see how expert you are.  Now it is time for greater subtlety of skill.  Are you [well prepared]?");
				else 
					e.self:Say("I see that you've chose the arcane path, young wizard. Very well. I cannot dissuade you now. Only the gods know how much I regret my [own choice].");
				end
			else
				e.self:Say("You are not ready for my instruction yet, young one.");
			end
		else
			-- Teleport non-Guktan Clients to random Rathe Mountains locations
			rand = math.random(99);
			if (rand <= 33) then
				e.other:MovePC(50, 1756.00, 1517.00, 200.00, e.self:GetHeading());
			elseif (rand <= 66) then
				e.other:MovePC(50, 1226.00, 160.00, 183.21, e.self:GetHeading());
			else
				e.other:MovePC(50, 371.00, -1024.00, 28.34, e.self:GetHeading());
			end
		end
	elseif (e.message:findi("own choice")) then
		e.self:Say("This power, this mantle of responsibility we wield. This yoke. Truth be told, I know why you've chosen this path. You want the power. You beg for the yoke. Well, I will not teach you as I was taught. There are other, more important, lessons to [learn].");
	elseif (e.message:findi("learn")) then
		e.self:Say("First and foremost you must master your budding control of time and space. The other energies you wield pale in comparison to this. You will find practice for them enough in your common experience. It is not the same with [teleportation].");
	elseif (e.message:findi("teleportation")) then
		e.self:Say("Even though you may have learned to gate in retreat or take the broad bridges of the spires, you are far from ready. Let us see if you can use the unwritten knowledge in your blood. Take this Portal Prism. Study it. When you think you've learned its secrets, give it back to me and we shall test your learning.");
		e.other:SummonItem(63114); -- Portal Prism
	elseif (e.message:findi("well prepared")) then
		e.self:Say("Good.  No more precipitous plunges, I hope.  Now, even though you may feel you know how to take others with you as you step through the threads of the universe, there is still much to learn.  Give me your prism so that I may attune it.");
	elseif (e.message:findi("growing power")) then
		e.self:Say("Very good. Focus. . .harder. Imagine it surrounding Igok . . .weave the unseen threads. . .good. . .yes . . .wait. Wait! No! Not like that! INCREDIBLE! I cannot believe it! Not only did you miscast the spell, you've sent poor Igok to who know's where! He's been shattered, made into three! There. I was able to snatch one piece before he completely dispersed. Use all of your powers to find the other two. Give each facet you find the prism to hold. It will reconcile the dimensional dissonance and you will be able to capture his fragments. Return both fragments to me so that I can help him. . . What are you still standing here for!?!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	-- Portal Prism (63114)
	if (item_lib.check_turn_in(e.trade, {item1 = 63114})) then
		e.other:Message(15, "Anlut Heavenfall tells you, 'Let us see if you've learned the hidden way or if you must return the crystal to me and beg for further guidance. . .");
		e.other:SummonItem(63115); -- Portal Prism
		e.other:MovePC(152, 0.00, 0.00, -30.25, 180); -- Teleport to Nexus
	-- Portal Prism (63115), Twilight Bloom x3
	elseif (item_lib.check_turn_in(e.trade, {item1 = 63115, item2 = 63125, item3 = 63125, item4 = 63125})) then
		e.other:Message(15, "Anlut Heavenfall tells you, 'Hmph. Well, I hope that you've studied it more carefully this time . . .");
		e.other:SummonItem(63116); -- Portal Prism
		e.other:MovePC(37, -910.00, 886.00, 350.00, 0); -- Teleport to Oasis of Marr (Change needed when Oasis is eventually removed)
	-- Portal Prism (63116), Time Torn Skull
	elseif (item_lib.check_turn_in(e.trade, {item1 = 63116, item2 = 63124})) then
		e.self:Say("Well, at least you are honest. And that deserves some reward. Here is your prism. Your lessons have changed it, see? Keep it. And take this spell. Study the scroll more carefully than you did the stone. When you've grown some in ability, return and we will continue your lessons.");
		e.other:SummonItem(63117); -- Purged Portal Prism
		e.other:SummonItem(15562); -- Spell: North Portal
	-- Purged Portal Prism
	elseif (item_lib.check_turn_in(e.trade, {item1 = 63117})) then
		e.self:Say("Yes. It grows in power. As do you. Now, I've started a spell within it. Let's have you experiment a bit. Use Igok. He's daft and nearly useless. A perfect test subject. Take the prism and focus your energies on it, but keep me as your target. You must split your concentration. Good. Now, slowly, allow those energies to extend towards Igok there. Do you feel the [growing power]?");
		e.other:SummonItem(63118); -- Attuned Portal Prism
	-- Attuned Portal Prism, First Igok Fragment, Second Igok Fragment
	elseif (item_lib.check_turn_in(e.trade, {item1 = 63118, item2 = 63127, item3 = 63128})) then
		e.self:Say("Always repairing your blunders doesn't make up for them! Bah! If it weren't for your obvious talent, I would end you myself. Leave me! Go and search the world. Perhaps you'll find some grain of intelligence, some iota of wisdom. Do not return to me until you've gained many, many seasons. And here. . .keep this with you as a token from me.");
		e.other:SummonItem(63126); -- Anlut's Hint
	-- Anlut's Hint
	elseif (item_lib.check_turn_in(e.trade, {item1 = 63126})) then
		e.other:SetGlobal("time_terror", "1", 4, "S30");
		e.other:MovePC(86, 9722.00, 1136.00, 2626.00, 0); -- Teleport to Dreadlands
	-- Time Terror Essence
	elseif (item_lib.check_turn_in(e.trade, {item1 = 63130})) then
		e.self:Say("Go away! You are not the one finishing the trial!");
		e.self:Emote(". .amazing. . . I knew there was some gift within you, some desire to do more. Well, now you've proven it. It is good to see you succeed after so much failure. I cannot deny it. Nor can I deny that you deserve recognition for your efforts. Here, take this. Perhaps it will keep you safe. Good luck, " .. e.other:GetName());
		e.other:SummonItem(63129); -- Heavenfall Girding
	end
	
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end