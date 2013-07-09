function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(e.message:findi("follow")) then
		if(e.message:findi("bristlebane")) then
			e.self:Say("To be like the king of thieves is the path on which you stray. Go to Crow's after sundown. It is better than in day.");
		elseif(e.message:findi("Bertoxxulous")) then
			e.self:Say("The catacombs contain safe haven for you and me. It is our place. To you, I tell no lie.");
		elseif(e.message:findi("brell")) then
			e.self:Say("The place of true power is usually beneath your feet. Stay in this city and a rare enemy you just may meet.");
		elseif(e.message:findi("cazic" or "thule")) then
			e.self:Say("You will find an acquaintance who is elvish and dark. Be forewarned that in this city it is best not to bark.");
		elseif(e.message:findi("innoruuk")) then
			if(fac < 5) then
				e.self:Say("To hate is your way. Just as the father of the dark race. To Nektulos is where you should head at good pace.");
			else
				e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			end
			
		elseif(e.message:findi("karana")) then
			e.self:Say("You will be very safe in this city of thunder. Travel to the catacombs for easy plunder.");
		elseif(e.message:findi("marr")) then
			if(e.message:findi("erollisi")) then
				e.self:Say("To be strong in the ways of love is truly the only way. Go into Karana's Paw and enjoy your day.");
			elseif(e.message:findi("mithaniel")) then
				e.self:Say("As is your god you are one of true valor from which you cannot part. Go forth into the catacombs and say hail Mister Bloodheart.");
			else
				e.self:Say("Which Marr? Come on, work with me here!");
			end
			
		elseif(e.message:findi("prexus")) then
			e.self:Say("He created the Kedge freaks which are now gone from this land. Go deep into the caves of the Jaggedpine and someone will take your hand.");
		elseif(e.message:findi("quellious")) then
			e.self:Say("The tranquility and peace of the child lies in your heart. By fighting the opal elves you shall be doing your part.");
		elseif(e.message:findi("rodcet nife")) then
			e.self:Say("The power of healing is brought forth in your mass. Go past the gates and tell Zutros you are from Highpass.");
		elseif(e.message:findi("tribunal")) then
			e.self:Say("The tranquility and peace of the child lies in your heart. By fighting the opal elves you shall be doing your part.");
		elseif(e.message:findi("tunare")) then
			e.self:Say("From the mother of all elves you find comfort and peace. Walk the fields of Karana where troubles shall cease.");
		elseif(e.message:findi("veeshan")) then
			e.self:Say("The blood of the mother of all wyrms runs deep in great cities. Be aware that you are not alone in this town of no pity.");
		elseif(e.message:findi("zek")) then
			e.self:Say("To die in battle is the true and only way. Go into Blackburrow and join the fray.");
		elseif(e.message:findi("ro")) then
			e.self:Say("To set foot upon his land would set your body ablaze. Go far north of Freeport to find the eye in days.");
		end
		
	end
	
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {gold = 50})) then
		e.self:Say("Fifty gold? You must want a rune of fortune. If you want another one, give fifty gold to Mizr N'Mar in the Neriak library.");
		e.other:Ding();
		e.other:SummonItem(10531);
		e.other:AddEXP(100);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
