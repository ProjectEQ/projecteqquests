-- items: 18710, 18809, 6357
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18710) == true) then
		e.other:Message(15,"As you glance about the large temple, Runethar Hamest greets you. 'Why hello there. Are you perhaps a new recruit? If you wish to follow the ways of Karana and become a paladin, read the note in your inventory and hand me your note to start your training.'");
	end
end

function event_signal(e)
	e.self:Say("Hire one soon, Wolten. We need to get in touch with Drosco!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?"); 
	elseif(e.message:findi("need guidance")) then
		e.self:Say("Then go forth into the church and speak with Gehna Solbenya. She will assist you."); 
	elseif(e.message:findi("follower of karana") or e.message:findi("wish to assist") or e.message:findi("retrieve")) then
		if(e.other:GetFaction(e.self) <= 4) then
			if(e.message:findi("follower of karana")) then
				e.self:Say("So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also [wish to assist Lord Bayle]?");
			elseif(e.message:findi("wish to assist") or e.message:findi("retrieve")) then
				e.self:Say("Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of Qeynos Guard and speak with him of the [gnolls of Blackburrow]. I believe he is at the arena. My loyal friend, if you have earned your Thunder Staff, I urge you to [retrieve the Bayle list].");						
			end		
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end			
	elseif(e.message:findi("drosco")) then
		e.self:Say("Have you knowledge of Sir Drosco? He is a Knight of Thunder and reports to Sir Wolten. He has been missing for quite some time. I believe Sir Wolten has begun a search for him."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18710},0)) then
		e.self:Say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder! Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper.");
		e.other:Faction(280,100,0); -- Faction: Knights of Thunder
		e.other:Faction(221,-100,0); -- Faction: Bloodsabers
		e.other:Faction(341,75,0); -- Faction: Priests of Life
		e.other:Faction(262,75,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13505,100); -- Old Gray Tunic*
	elseif(e.other:GetFaction(e.self) < 3 and item_lib.check_turn_in(e.trade, {item1 = 18809,item2 = 6357},0)) then
		e.self:Say("Antonius Bayle will be pleased. The Temple is also pleased. Here is the enchanted staff we call Bonethunder. Should you find the enchantment gone, just ask Kasine to [enchant Bonethunder]. We need more disciples like you! Go forth to tell the world of the Rainkeeper.");
		e.other:Faction(280,-50,0); -- Faction: Knights of Thunder
		e.other:Faction(221,50,0); -- Faction: Bloodsabers
		e.other:Faction(341,-37,0); -- Faction: Priests of Life
		e.other:Faction(262,-37,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,6358,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
