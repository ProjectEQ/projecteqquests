-- Created by noudess
-- items: 12211, 12213, 12217, 12214, 12198, 12216

function event_say(e)
	local pfaction = e.other:GetFaction(e.self);

	if(e.message:findi("Hail")) then
		if (e.self:GetNPCTypeID() == 52056) then
			e.self:Say("Sorry.  Nothing t' sell at this time.  Maybe later.  Good day.");
		elseif (e.self:GetNPCTypeID() == 52118) then
			e.self:Say("Step right up! I am the best butcher you have ever seen.  Well, are you the next to be fileted?");
		elseif (e.self:GetNPCTypeID() == 52119) then
			e.self:Say("Here I stand high and above, a minstrel supreme, my words offer love. Love between all, troll and ogre alike. I sing to all, except Tabaz, so take a hike!");
		end
		
	elseif(e.message:findi("come back to the closet")) then
		if (pfaction > 5) then
			e.self:Say("I would like to assist you, but my masters say you are no friend of the Darkones and would rather see you dead.");
		elseif (pfaction > 4) then
			e.self:Say("You're going to have to prove yourself a stronger aid to my masters, the Darkones.");
		else
			if (e.self:GetNPCTypeID() == 52056) then
				e.self:Say("Back to the closet?!  I just got out.  I would go back if I had a pair of oven mittens.");
			elseif (e.self:GetNPCTypeID() == 52118) then
				e.self:Say("Darn!  I was just starting to have fun.  Tell you what, you find me a nice ogre butcher apron and I will gladly go back to my cramped quarters.");
			elseif (e.self:GetNPCTypeID() == 52119) then
				e.self:Say("Back to the closet?! Not until I can get an instrument. You get me... hmm, I know. Get me a lizardman scout fife. Not just one, but four. Then my friends can also play along with me. Do this and I promise you I shall return.");
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if (e.self:GetNPCTypeID() == 52056 and item_lib.check_turn_in(e.trade, {item1 = 12211})) then -- Mittens
		e.self:Say("Ahh! Oven mittens! Kinda' large, don't you think?! Oh well, now I can bake all I want without burning my hands. OKAY! Lets go. I overheard some basher named Nanrum saying he spotted my friend, the butcher. You should ask him [where the skeleton] is.");
		e.other:SummonItem(12213); -- Item: The Baker
		eq.depop();
	elseif (e.self:GetNPCTypeID() == 52118 and item_lib.check_turn_in(e.trade, {item1 = 12217})) then -- butcher arpron
		e.self:Say("Great! Thanks a lot, pal. Lets get moving. I hear my bonehead roomie called the Captain was spotted by Basher Sklama. Go ask [where the Captain] is.");
		e.other:SummonItem(12214); -- Item: The Butcher
		eq.depop();
	elseif (e.self:GetNPCTypeID() == 52119 and item_lib.check_turn_in(e.trade, {item1 = 12198, item2 = 12198, item3 = 12198, item4 = 12198})) then -- fifes
		e.self:Say("All right! I was kinda hoping the lizards would finish you off and I could stay free, but a deal is a deal. Let's go.");
		e.other:SummonItem(12216); -- Item: The Minstrel
		eq.depop();
	end
end
