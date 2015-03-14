-- Cleric Epic 1.0 // Cleric Epic 1.5 // Cleric Epic 2.0  NPC --Drogerin

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("bows deeply. 'I have been expecting you. " .. e.other:GetName() .. ", The waters have foretold your arrival. I am High Priest Omat Vastsea of the [Triumvirate] missionaries. Please feel free to enjoy the quiet solitude of this inn.");
	elseif(e.message:findi("Triumvirate")) then
		e.self:Say("The Triumvirate of Water are: E'ci, the mistress of ice; Tarew Marr, the lord of water; and Povar, the formless master of vapor and mist. We Triumvirate missionaries are granted great divinatory powers and wisdom through our devotion to the Triumvirate and must defend the waters of Norrath from the ravages of the Tyrant of Fire, [Fennin Ro].");
	elseif(e.message:findi("Fennin Ro")) then
		e.self:Say("The Tyrant of Fire, Fennin Ro, is the merciless lord of fire in all its forms. The rivalry between the tyrant and the Triumvirate is as old as the gods themselves and is an eternal battle. We witness the struggle every moment of our lives as the Oasis of Marr succumbs to the heat of the surrounding desert and is replenished by the swelling of the Lifire River. That fragile balance between the elements must be maintained but the [Plasmatic Priesthood] threatens that balance.");
	elseif(e.message:findi("Plasmatic Priesthood")) then
		e.self:Say("The Plasmatic Priesthood are worshipers of the Tyrant of Fire, but they have been driven mad by their fanaticism and have forgotten the importance of the balance. In their madness they would set the whole world aflame, leaving nothing but lifeless ash.");
	elseif(e.message:findi("Tavon sent me")) then
		e.self:Say("I received word from my brother that you would be coming. I have just the task for you. I am sure you heard of the [Plasmatic Priests]");
	elseif(e.message:findi("Plasmatic Priests")) then
		e.self:Say("The Plasmatic Priests were worshippers of Fennin Ro. Their numbers were all but destroyed by adventurers, and with the silence of the Pantheon they no longer draw power from the Tyrant of Fire. However they are still a danger, please find the last remnants of their order and bring me proof of their [destruction].");
	elseif(e.message:findi("destruction")) then
		e.self:Say("They are in hiding, the few alcoves that I managed to find were shrouded and hidden. Take this signet and find the keeper for each alcove. Show it to him and he will drop the veil. Strike fast and exterminate the camp before he is able to cloak the camp again. Return the talisman to me with proof of the deaths of the three remaining high priests. Once you have done this, I will send you to my brother with my blessings.");
		e.other:SummonItem(56010); -- Summon Talisman of the Plasmatic Priests for Player.
	end
end		
		
		
		
function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.trade, {item1 = 28047})) then -- This Identifies as Ornate Sea Shell I
			e.self:Say("So, you are a friend of Natasha's? That is good to see. She is a very wise and gifted woman. The Riptide goblins have adopted a new king but are still in a vulnerable state until his subjects accept his rule. The Plasmatic Priesthood is aware of the weakened state of the Riptides and has convinced the Fire Peak goblins to strike against them. Although I do not agree with the mannerisms or actions of any goblin clan, such a war would be detrimental to all who are caught in its path. Lord Gimblox of the Fire Peak clan has been meeting with a member of the Plasmatic Priesthood in the Temple of Solusek Ro. Locate the Plasmatic Priest, hand him this statue to hinder his powers, then eliminate him and bring me his robe.");
			e.other:SummonItem(28051); -- Coral Statue of Tarew Marr given to Player.
		elseif(item_lib.check_turn_in(e.trade, {item1 = 1299})) then
			e.self:Say("You have proven yourself to be one who is willing to take responsibility for his own actions. Such a trait is desired by all deities to be present in their faithful. I pray that you had the wisdom to slay Lord Gimblox as well as the Plasmatic Priest in order to prevent further advancement in the incursion against the Riptides. Priestess Natasha awaits inside the inn for Lord Gimblox's ring, make haste for she is a busy women and will depart soon.");
			e.other:SummonItem(28049); -- Orb of Frozen Water given to Player.
			eq.spawn2(96080,0,0,-2198,-11601,76); -- Spawns NPC Natasha Whitewater
		elseif(item_lib.check_turn_in(e.trade, {item1 = 18170, item2 = 28017})) then -- Singed Scroll  // Sceptre of Ixiblat Fer
			e.self:Say("I commend you on your success over the fire elemental lord, Ixiblat Fer. The fact that the Plasmatic Priesthood has mustered up the power to summon such a being means drastic actions must be taken to stop the fanatic cult of Fennin Ro. I wonder what kind of favor Zordak Ragefire performed for the sarnak summoners to convince them to assist in the ritual that brought forth Ixiblat Fer. The dragon Iksar hybrid abominations are not beings who ally with others easily. All I have seen in my divinations of the High Plasmatic Priest are riddles, and signs that the one who slays him may be awarded an Orb of the Triumvirate. If you are the one whom my visions foretell, then seek Zordak Ragefire and bring me his heart");
			e.other:SummonItem(28048); -- Orb of Clear Water given to Player.
			eq.spawn2(96080,0,0,-2198,-11601,76); -- Spawns NPC Natasha Whitewater
		elseif(item_lib.check_turn_in(e.trade, {item1 = 28019})) then -- Heart of Zordak Ragefire
			e.self:Say("I see now that Zordak Ragefire and the exiled elder dragon Zordakalicus were the same being. That explains how he resisted our attempts to divine his affairs and past. Each of these orbs I have granted you represents one of the Triumvirate. Jhassad Oceanson awaits on the shore below to perform the ritual that will merge the orbs into a single Orb of the Triumvirate and summon an avatar from the Plane of Water. Present the Orb of the Triumvirate to the Avatar of Water when it arrives and allow your destiny to be unraveled.");
			e.other:SummonItem(28050); -- Orb of Vapor Given to Player
			eq.spawn2(96074,0,0,-1781,-11959,14.3,1); -- Spawns Jhassad Oceanson for Player
		elseif(item_lib.check_turn_in(e.trade, {item1 = 5768, item2 = 6506, item3 = 6505, item4 = 56010})) then  -- Heads of the 3 Plasmatic Priests & the Talisman of Plasmatic Priest
			e.self:Say("Excellent. I think this was the last of the organized Plasmatic Priests. You have done well, I will send you to my brother with my blessing. Thank you for your assistance.");
			e.other:AddEXP(10000); -- End of 1.5 Prequest - Will need to Grant flag to start 1.5
		elseif(item_lib.check_turn_in(e.trade, {item1 = 12433})) then -- Turn in Dark Red Robe to Omat.
			e.self:Say("What? You found this on a Disciple in Discord? This is a robe of the Plasmatic Priesthood, without question. Bring this to Cecilia quickly, hopefully she will be able to divine their intentions.");
			e.other:SummonItem(12509); -- Receive Robe of Plasmatic Priesthood
		elseif(item_lib.check_turn_in(e.trade, {item1 = 56013})) -- Turn in Ethereal Disciple's Journal.
			e.self:Emote("grows pale as he reads the journal, 'It is just as a feared. I can't believe he is on his way here.");
			e.other:Message(15, "The walls of the cove tremble as the Prime Disciple appears before Omat. 'Well this is an unexpected surprise, I came looking for Omat, however revenge on you " .. e.other:GetName() .. ", will be that much sweeter.");
			eq.spawn2(0,0,-1755.7,-11888.2,13.5,62);   -- Summon Gefaari Drokaz // Need NPCID here
		end
	item_lib.return_items(e.self, e.other, e.trade);
end
		