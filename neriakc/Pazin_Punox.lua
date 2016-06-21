--Pazin_Punox.pl
--Rogue Tome Handin/Rogue Master Sketch

function event_say(e)
local qglobals = eq.get_qglobals(e.self,e.other);

	if(e.message:findi("Hail")) then
		if(qglobals["Fatestealer"] == "1") then	
		e.self:Say("So, ".. e.other:GetName() ..". You have finally come - no doubt to steal away with my darkest secrets. The rumors you may have heard, they are true. I do carry with me the ability to capture tormented spirits and enslave them in cold steel. The deadliest Teir`dal weapons have been twisted to a dark sweet purpose by my hand. You'd like to know how, wouldn't you? ".. e.other:GetName() ..", I would rather perish than share that knowledge with anyone.");
		else e.self:Say("Welcome to the Hall of the Ebon Mask. You had best be a rogue or you have no business here. We have nothing to say to outsiders.");
		end
	elseif(e.message:findi("dark assassin")) then
		e.self:Say("Aye we were visited by that dark assassin, he left some sketch in my safekeeping, I would gladly give you a copy if you would take care of a problem that has been vexing me.");
	elseif(e.message:findi("vexing you")) then
		e.self:Say("An old student of mine who goes by the name Lon has disgraced this House; his betrayal to Innoruuk and Neriak is unforgivable.' Pazin grins 'He must be punished through deceit and trickery. Make him your friend, do as he asks, and pretend to be Redeemed as he calls it. Once you are Redeemed take the cursed blade of Ro and run it through his heart. Bring me his rapier and his head and I shall know the task is complete.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7041, item2 = 9438})) then--Burning Rapier, Lon's Head
		e.self:Emote("laughs. 'Here, take this then!'");--text made up
		e.other:QuestReward(e.self,0,0,0,0,24095); --Vein Rot Sketch
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42075 -- Pazin_Punox
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
