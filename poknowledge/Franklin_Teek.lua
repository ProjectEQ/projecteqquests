-- Franklin_Teek (202449) Hot Zone NPC
-- On live he offers the hot zone quests.  Here we will tell the user
-- the current hotzone calendar set up.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. "!  Are you seeking an adventure?  If so just tell me if you want to learn about opportunities for calendar dates [" .. eq.say_link("1st - 10th",false,"1st - 10th") .. "], [" .. eq.say_link("11th - 20th",false,"11th - 20th") .. "], or [" .. eq.say_link("21st - last day of the month",false,"21st - last day of the month") .. "].")

	elseif(e.message:findi("21st")) then
		e.self:Say("The hotzones for the 21st through the end of the month are: The Burning Wood (35-50), Crystal Caverns (25-45), Erud's Crossing (7-17), Great Divide (30-50), Ruins of Old PaineelThe Hole (40-65), Kerra Isle (10-25), Najena (20-35), Permafrost Keep (15-50), Siren's Grotto (50-65), South Karana (15-35), Timorous Deep (15-50), Warsliks Woods (8-30), The Plane of Disease (45-65), The Akheva Ruins (45-65), Velketor's Labyrinth (45-65), Riwwi Coliseum of Games (60-70), Bastion of Thunder (60-70), Eryslai, the Kingdom of Wind (65-70)")

	elseif(e.message:findi("1st")) then
		e.self:Say("The hotzones for 1st-10th are: Befallen (5 - 20), Howling stones (45 - 60), Crypt of Dalnir (25 - 35), Frontier Mountains (22 - 45), Lower Guk (30 - 50), Iceclad Ocean (28 - 45), Lake of Ill Omen (1 - 30), Northern Plains of Karana (8 - 40), Western Plains of Karana (3 - 35), Solusek's Eye (25 - 45), South Ro (8 - 25), The Wakening Lands (40 - 55), Chardok (40-60), Plane of Nightmare (45-65), The Deep (50-60), Veksar (40-60), Infected Paw (65-70), Kod'Taz Broken Trial Grounds (65-70)")

	elseif(e.message:findi("11th")) then
		e.self:Say("The hotzones for the 11th - 20th are: Gorge of King Xorb (10 - 25), West Commonlands (7 - 40), Eastern Plains of Karana (10 - 35), Tower of Frozen Shadow (30 - 55), Kaesora (30 - 50), Lake Rathetear (15 - 25), Oasis of Marr (8 - 40), Runnyeye Citadel (12 - 35), Nagafen's Lair (40 - 55), Stonebrunt Mountains (15 - 40), Guk (15 - 40), Warrens (5 - 30), Grieg's End (45-60), Crypt of Nadox (50-65), Old Sebilis (40-60), Barindu Hanging Gardens (55-65), Halls of Honor (60-65), Reef of Coirnav (65-70)")

	end
end