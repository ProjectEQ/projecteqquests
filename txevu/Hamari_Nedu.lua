local tacvi = "Tacvi, Seat of the Slaver"
local tacvi_raid = {
	expedition = { name="Tacvi, Seat of the Slaver", min_players=18, max_players=54 },
	instance   = { zone="tacvi", version=0, duration=eq.seconds("6h") },
	compass    = { zone="txevu", x=-133.21, y=-210.36, z=-421.04 },
	safereturn = { zone="txevu", x=-325, y=0, z=-422.12, h=128 },
	zonein     = { x=4, y=9, z=-6.87, h=376 }
}

function event_say(e) 
	if e.message:findi("hail") then
		if e.other:HasItem(64034) then
			e.self:Say("You hold a Signet of Command! I can use the power of the signet to [" .. eq.say_link("open the way") .. "] for you to the upper reaches of the temple once you are prepared to face the Tunat'Muram.");
		else
			--#if don't have signet of command		
			e.self:Say("Aaaaahh! You frightened me! I've spent days hiding in the rubble here waiting for someone to come. Thank Trushar it's you and not one of those monsters! I didn't know how much longer I could hold out, but I have information that may [" .. eq.say_link("help") .. "] you rid our island of those vile Muramites and help me get out of this cursed place.");
		end
	elseif e.message:findi("help") then
		e.self:Say("I know the monster that guards this place. He calls himself [" .. eq.say_link("Tkarish") .. "]. I was held captive by the two-headed beast. I don't know exactly what fate awaited me, but the cries of my fellow prisoners were enough to know that it wouldn't have been pleasant.");
	elseif e.message:findi("Tkarish") then
		e.self:Say("I believe the full title he demanded his servants use is Zun'Muram Tkarish Zyk. Fortunately, he's as arrogant as he is strong and I was able to slip away when he thought me secure. Unfortunately, he has gained control over the sacred [" .. eq.say_link("constructs") .. "] in the temple so I haven't been able to leave.");
	elseif e.message:findi("constructs") then
		e.self:Say("There are special constructs within this temple that allow access to other areas. The one next to us would normally allow me to leave the temple entirely, but it is under the sway of the Muramites. I overheard Tkarish speaking of a Tunat'Muram, a kind of commander as far as I could tell, that resides within the upper levels of the temple only reachable via the constructs. But Tkarish holds a [" .. eq.say_link("Signet of Command") .. "] which gives him control over the constructs. As long as he has that Signet, the way to the Tunat'Muram is closed to you and the way out is closed to me.");
	elseif e.message:findi("signet of command") then
		e.self:Say("If you can wrest the signet from Tkarish's grasp, the constructs will allow you passage to the upper levels of the temple. Should you claim a Signet of Command for yourself, I can use it to activate a nearby construct. From here, the influence of your signet would be stronger than the one Tkarish wields in the chapel above and I should be able to convince the construct to grant you passage to the upper levels of the temple.");
	elseif e.message:findi("open the way") then
		local is_gm = e.other:GetGM();

		if e.other:HasItem(64034) then
			if not is_gm and e.other:GetRaidMemberCountInZone() < 18 then
				e.other:Message(MT.NPCQuestSay, "Hamari Nedu says, 'I'm sorry, but you don't have enough comrades with you to venture into this dangerous area. Come back when you have at least eighteen friends to join you on this perilous journey.")
			elseif not is_gm and e.other:DoesAnyPartyMemberHaveLockout(tacvi, "Replay Timer", 54) then
				e.other:Message(MT.NPCQuestSay, "Hamari Nedu says, 'I'm afraid I cannot allow you to begin, someone in your party has been on this expedition too recently and cannot yet go again.'")
			else
				e.other:Message(MT.NPCQuestSay, "Hamari Nedu says, 'Place your hands on one of the altars behind me and the way will be revealed. Be wary for you are about to encounter some of the most vicious trusik known. If for any reason you wish to return, place your hands on the golem within the temple.'");
				local dz = e.other:CreateExpedition(tacvi_raid)
			end
		end
	end
end
