--############################################
--# ZONE: East Karana (eastkarana)
--# LAST EDIT: 1/9/2014
--# Converted to Lua by robregen
--# *** NPC INFORMATION ***
--#
--# NAME: Tenal_Redblade
--# ID: 15077
--# TYPE: Warrior
--# RACE: Human
--# LEVEL: 50
--# *** QUESTS INVOLVED IN ***
--#1 - Warrior Epic Quest
--############################################
-- items: 18083, 20680, 10549, 20681, 11622, 11582, 20683, 20676, 20684

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("What brings you to my home, %s? Do you seek knowledge of Rallos Zek and the great wars to come?",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18083})) then -- Redblade's Legacy
		e.self:Say("So, you know my brother Kargek. He is weak and does not believe the legend that our family was chosen by Rallos Zek to bear the great scabbard. Yet he still holds it. Very well, I shall give you the first test since my 'dear' brother seems to have forgotten it. Travel to the fortress where the children of Rallos were first cursed by the Rathe and bring me the heart of one of the goblins who have made it their new home. Do not return without the heart of your foe and this war totem.");
		e.other:SummonItem(20680); -- Totem of the Freezing War
		e.other:Ding();
		e.other:AddEXP(100000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20680,item2 = 10549})) then -- Totem of the Freezing War & Heart of Frost
		e.self:Say("Very good, you have wreaked havoc on your foes in the ancient land of the giants. Rallos Zek must have guided your blade. (Tenal's voice is suddenly silenced and you feel as if your body is frozen. From Tenal's lips issues a voice that is not his own.) 'Bring this mortal the scales of the children of Veeshan. The red and green as well as my war totem. I will guide your blade.' Your movement returns as Tenal falls to the ground, gasping for breath.");
		e.other:SummonItem(20681); -- Totem of Fiery War
		e.other:Ding();
		e.other:AddEXP(100000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20681,item2 = 11622,item3 = 11582})) then -- totem of fiery war, red/green dragons scales
		e.self:Emote("looks at you oddly as you hand him the scales. 'What are..? 'You have done well, mortal, and you will be rewarded if you are truly brave. Travel to the Plane of Hatred and slay the ancient bard who lives there. Do not return without his hand and this mark or you will never be a true warlord.' Tenal drops to the ground as the last words leave his lips.'");
		e.other:SummonItem(20683); -- Mark of the Sword
		e.other:Ding();
		e.other:AddEXP(100000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20683,item2 = 20676})) then
		e.self:Emote("looks horrified as you give him the hand of the Maestro of Rancor and show him the mark of the sword.  The godlike voice returns, 'You have done well to acquire this. One final task must be completed before you hold the red scabbard in your mortal hands.' Tenal reaches out and hands you a note. 'Take this note and a wingblade of the spirocs to Kargek. When he receives them, I will speak to you one last time.'");
		e.other:SummonItem(20684); -- Tenal's Note to Kargek
		e.other:Ding();
		e.other:AddEXP(100000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:eastkarana  ID: 15077 -- Tenal_Redblade