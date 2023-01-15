-- epic expedition version of Struggles within the Progeny
-- Game Update Notes: April 19, 2017
-- Valdoon Paladin Epic 2.0 (Raid) - Lowered the minimum number of players necessary to request this raid from 10 to 6.
-- items: 69975, 69976, 69981, 69956
local paladin_minimum_players = 10

local paladin_mmcc = {
  expedition = { name="The Asylum of Invoked Stone", min_players=paladin_minimum_players, max_players=54 },
  instance   = { zone="mmcc", version=50, duration=eq.seconds("3h") },
  compass    = { zone="lfaydark", x=3877.23, y=-127.446, z=-53.598 },
  safereturn = { zone="lfaydark", x=3847, y=-56, z=-50, h=0 },
  zonein     = { x=-424.0, y=-108.0, z=1.25, h=0 }
}

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			e.self:Say("Hail to you, " .. e.other:GetName() .. ". I'm very glad to see a paladin such as yourself here in Felwithe. There have been some [" .. eq.say_link("odd occurrences") .. "] as of late.");
		elseif(e.message:findi("occurrences")) then
			e.self:Say("Yes, about a week ago, I was helping Nora close up for the night at the Shop of All Holos. I left the shop and decided to take a quick stroll around Felwithe before going home to sleep, and I found something odd outside of the cleric's guild. I saw a Vampire! He was walking around and for a second our eyes met. . .I ran to get the guards. By the time I returned he was gone and the guards didn't believe that a Vampire was able to get this far into Felwithe. The next day I went and spoke to Lord Tynkale and [" .. eq.say_link("explained") .. "] to him what I saw.");
		elseif(e.message:findi("explained")) then
			e.self:Say("I told him how I saw a Vampire near the cleric's guild and how he wasn't there when the guards returned. Lord Tynkale didn't believe me, however, he did promise to give me a chance to prove what I saw. You will need to assist me in proving what I saw, " .. e.other:GetName() .. ", for I think that Vampire may have been scouting for an invasion of Felwithe. Go to all the cities in Faydwer and investigate any odd occurrences there, for I think there might be other Vampire sightings throughout the continent. Take this bag and fill it with any proof you find. Good luck crusader.");
			e.other:SummonItem(69975); -- Item: Galrun's bag
		elseif(qglobals["paladin_epic_mmcc"] == "1" and e.message:findi("valdoon")) then
			-- this expedition request requirement is unverified, based on a log posted to allakhazam
			local is_gm = (e.other:Admin() > 80 and e.other:GetGM())
			if not is_gm and e.other:GetRaidMemberCountInZone() < paladin_minimum_players then
				e.self:Say("I'm sorry, " .. e.other:GetCleanName() .. ", but you need more people before we can begin this.")
			else
				e.self:Say("Very well, " .. e.other:GetName() .. ". The fate of all of the residents of this continent are now in your hands. Cleanse the Mistmoore Catacombs of the Vampire infestation and put an end to Valdoon Kel`Novar. Bring me his heart when you are finished, for I need proof to show Lord Tynkale that Vampire invasion has been stopped.");
				e.other:CreateExpedition(paladin_mmcc)
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	
	if(qglobals["paladin_epic"] == "9" and item_lib.check_turn_in(e.trade, {item1 = 69976})) then --Mana Battery - Class Six
		e.self:Say("Ah, I see now. . .this is the proof I needed. It appears that these Vampires are planning an attack on all four cities in Faydwer. These battle plans show that the Orcs are assisting the Vampires on the Kelethin front, while the Teir`Dal in Lesser Faydark are helping the Vampires with their attack on Felwithe. In Ak`anon and Kaladim, they are using a more deceptive approach by sneaking into the cities or cloaking themselves as dwarves. This attack may come any day now! We must stop this attack before it happens. " .. e.other:GetName() .. ", it appears that Valdoon Kel`Novar is leading this attack against the residents of Faydwer. The fate of the residents of Faydwer now rest on your shoulders. Gather a party of adventurers such as yourself and return to me. When you are [" .. eq.say_link("ready to fight Valdoon") .. "] I will open a passageway for you to enter the Mistmoore Catacombs. I will only be able to open this passageway once, so make sure to be ready. Good luck " .. e.other:GetName() .. ", and may Tunare bless thee.");
		eq.set_global("paladin_epic_mmcc", "1", 5, "F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 69981})) then --valdoon heart
		e.self:Say("Amazing, " .. e.other:GetName() .. ". You have cleansed all of the Mistmoore Catacombs of the impeding Vampire attack, as well as defeated their leader, Valdoon Kel`Novar. I shall take this to Lord Tynkale now and explain everything to him. You have saved us from a potential travesty. Take this, it may aide you in your journeys.");
		e.other:SummonItem(69956); --Token of Cleansing
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end