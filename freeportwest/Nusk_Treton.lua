function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say("Freeport!!  Great trade city of Norrath!!  What a wondrous place!  How do you do?  You are an [arcane scientist]. are you not?");
	elseif(fac < 5) then
		if(e.message:findi("arcane scientist")) then
			e.self:Say("Grand!! I remember my younger days within this great academy. I have spent many years of research here in Freeport. I compiled a [locked journal] of my research. Alas, I am still awaiting its return.");
		elseif(e.message:findi("locked journal")) then
			e.self:Say("I lent it to an old colleague of mine in Ak'Anon. He was to send it back aboard a private vessel. One Lenka Stoutheart was to return it to me. It has already been one month and counting. I wish there was a young wizard who could [seek out Lenka].");
		elseif(e.message:findi("seek out Lenka")) then
			e.self:Say("What luck!! I would be most appreciative if you could find Lenka Stoutheart in Freeport and inquire where the journal strongbox might be. I do so look forward to its return.");
		end
	elseif(fac == 5) then
		if(e.message:findi("arcane scientist") or e.message:findi("locked journal") or e.message:findi("seek out Lenka")) then
			e.self:Say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us.  Perform a tasks for the great Tara Neklene.");
		end
	elseif(fac > 5) then
		if(e.message:findi("arcane scientist") or e.message:findi("locked journal") or e.message:findi("seek out Lenka")) then
			e.self:Say("You had best leave my sight.  I am a faithful member of the Academy of Arcane Science and you are no ally of ours.");
		end
	end
end

function event_trade(e)
	local fac = e.other:GetFaction(e.self);
	local item_lib = require("items");

	if(fac < 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 13860})) then -- A Strongbox
			e.self:Say("Grand and fantastic!! You have made my day complete. Here is what little I can offer. Most of my money goes into my research. Thank you.");
			e.other:Ding();
			e.other:Faction(11,3,0); -- Arcane Scientists
			e.other:Faction(11,1,0); -- Arcane Scientists
			e.other:Faction(184,1,0); -- Knights of Truth
			e.other:Faction(235,-5,0); -- Opal Dark Briar
			e.other:Faction(105,-5,0); -- The Freeport Militia
			e.other:AddEXP(100);
			e.other:GiveCash(2,10,0,0);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freeportwest -- Nusk_Treton