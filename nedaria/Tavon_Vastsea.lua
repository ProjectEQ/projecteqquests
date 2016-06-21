-- Cleric 1.5 Pre-quest // Cleric 1.5 Epic // Cleric 2.0 Epic --Drogerin
							
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:Class() == "Cleric") then
		if(e.message:findi("hail")) then
			if(e.other:HasItem(9955)) then -- has 1.5 Harmony of the Soul, start 2.0
				e.self:Say("I hear you were able to put that shield to some use. That is good to hear. I was able to find some news on the leader, someone matching his description has been seen on the other side of the Wayfarer's portal in the Realm of Discord. Please visit my friend Cryssa, at the camp in Discord. She has been working on tracking the Disciple's movement in Discord.");
			elseif(e.other:HasItem(5532)) then -- has 1.0 Water Sprinkler of Nem Ankh, or Prequest Finished // Will need a flag entered. Prequest granted no item.  Start 1.5
				e.self:Say("Greetings " .. e.other:GetName() .. ", I see you helped my brother in eradicating the Plasmatic Priests, stopping Zordak Ragefire, and saved Norrath from an eternity of flames. We need to [call] you to [duty] again");
				if(qglobals["cleric_epic"] == nil) then
					eq.set_global("cleric_epic","1",5,"F"); --Flagged to start epic
				end		
			else -- Has no epics, Start Prequest for 1.5
				e.self:Say("Greetings "  .. e.other:GetName() .. ", I am afraid that I need someone that I can [trust] with this task, these are dark times, and it is hard to tell friend from foe.");
			end
		elseif(e.message:findi("call to duty")) then
			e.self:Say("This time the crisis threatens not only Norrath, but all of existence as we know it. Invaders from the Realm of Discord have transversed time and space to conquer this realm. The invaders, these Muramites, are not where the true threat lies. All of Norrath has banded together to stop these invaders, we have managed to halt their incursion for the time being. There are, however, whispers of a [dark faction] within our own, Norrathians who see our fight as futile, and are looking to swear fealty to the forces of the Legion.");
		elseif(e.message:findi("dark faction")) then
			e.self:Say("We don't know much more about them. As I said, they are just whispers, but whispers in unison are loud enough for deaf ears. We cannot afford to present anything short of a unified front, should the Legion push toward Norrath with its full force. We need your assistance to find and exterminate these traitors. I can give you what little [information] I have, hopefully you will be able to track these betrayers to their leader.");
		elseif(e.message:findi("information")) then
			e.self:Say("Travel to Taelosia. There you will find a young native, named Jomaj who had some suspicious dealings with someone claiming they were with the wayfarer's brotherhood. This is the closest I have to direction, gather information from this Taelosian, and bring it to my friend Shav on the Thorn. Find proof as to whether or not these traitors actually exist and return it to me.");
		elseif(e.message:findi("trust")) then
			e.self:Say("Hmmm, well I think I have a task I can entrust you with. Speak to my brother, tell him that I sent you to him. Earn his trust, and you shall have mine");
		end
	else
		e.self:Say("I'm sorry you are not the appropriate class for this quest."); -- added this to prevent classes that cannot do this epic from continuing quest.
	end
end

									
function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.trade, {item1 = 9585})) then -- Turn in for Magically Sealed Letter
			e.self:Emote("opens the envelope and pulls out a short letter, his brow furrows as his eyes dance across the pages. 'This is truly grim news. Until now I held hopes that the rumors held no truth, but this is irrefutable evidence of their existence. They call themselves the Disciples of Discord. As we speak they are gaining information for the Legion, gathering information about races that would prove to be powerful allies or enemies for the Legion. Bring this note to Plavo, I do not know where he is, but he must be found. His scouts may already have found what they are looking for, so make haste.");
			e.other:SummonItem(9591); -- Dark Disciples Note of Service
		elseif(item_lib.check_turn_in(e.trade, {item1 = 9954})) then -- Aegis of Chaotic Worship Turn in.
			e.self:Say("Interesting, I heard about your fight with the leader of the Disciples. I've never seen anything like this. Take it to Borik Darkanvil in the Plane of Knowledge. Return to me when you are done with him, in the meantime I will try to find information on where he went after your fight.");
			e.other:SummonItem(9954); -- Returns Aegis of Chaotic Worship to player
		end
		item_lib.return_items(e.self, e.other, e.trade);
end