--Inte Akera, paladin Epic quest turn-in NPC

function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I am Inte Akera. I have retired to the Plane of Sky after a long life toiling on Norrath's soil. Have you retreated here as well, or are you merely visiting?");
	elseif(e.message:findi("toil")) then
		e.self:Say("Long ago, before I came to this plane, I fought in the name of Prexus against all the evils that plagued Norrath. In that time, I have done everything one can do. I have fought for the causes of good. I gained the esteem of kings and lords. The sword I hold is but one example of the treasures I have sought and won. I have accomplished all that I can, have all that I desire. My toil is done and now I sit among the clouds in peace, occasionally blessing those who seek it and are found worthy.");
	elseif(e.message:findi("blessing")) then
		e.self:Say("Many come seeking my blessings. No matter how minor the blessing they ask, all must prove that they embody the qualities of a paladin before I bless them.");
	elseif(e.message:findi("prove myself")) then
		e.self:Say("I believe the two most important qualities of a paladin are nobility and sacrifice. Hand me an item of yours that proves you understand what nobility and sacrifice are. Be warned however, if I do not think as you do, I will simply accept the item as a gift, and give you no blessing.");
	elseif(e.message:findi("nobility")) then
		e.self:Say("Ah nobility. A true measure of a paladin. If you are wondering what to bring me, then perhaps you should look within yourself. Look into your soul for a great, burning fire of nobility and you will know.");
	elseif(e.message:findi("sacrifice")) then
		e.self:Say("Sacrifice is a virtue all paladins should strive for. The sacrifice of something dear to you will show your devotion. Perhaps something you use to smite the unholy undead.");
	elseif(e.message:findi("accomplish")) then
		e.self:Say("I accomplished many great deeds; far too many to name. I saved kings and kingdoms; I helped the weak and destitue; I accomplished all I sought to do, save one at which I failed.");
	elseif(e.message:findi("failed")) then
		e.self:Say("No.. I was unable to kill my most hated foe, Miragul. The head of this wretched, foul necromancer is forever out of the reach of justice. It would be worth restoring him to his former state for the chance to take his head as a trophy.");
	elseif(e.message:findi("miragul")) then
		e.self:Say("You think you can succeed where I cannot? Perhaps you can noble one.. Bring me the head of Miragul, his robe and hand me back the two blessings I gave you, and in return I shall bequeath to you this sword I carry. Good luck my friend.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) == 1) then
		if(item_lib.check_turn_in(e.trade, {item1 = 5504})) then		--soulfire
			e.other:SummonItem(18033); 									--inte's first blessing
			e.other:AddEXP(100000);
			e.self:Say("You have chosen wisely, my friend. Take this note as a token of my blessing upon you.");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 5403})) then 	--ghoulbane
			e.other:SummonItem(18034); 									--inte's second blessing
			e.other:AddEXP(100000);
			e.self:Say("You have chosen wisely, my friend. Take this note as a token of my blessing upon you.");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 18033, item2 = 18034, item3 = 19073, item4 = 1254})) then --inte's first blessing, inte's second blessing, miragul's head, miragul's robe
			e.other:SummonItem(11050); 									--fiery avenger
			e.other:AddEXP(1000000);
			e.self:Say("Long have I awaited this moment. You have done what even I thought impossible. Take this sword, the Fiery Avenger. You have earned both it and my deepest respect.");
			eq.depop();
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
