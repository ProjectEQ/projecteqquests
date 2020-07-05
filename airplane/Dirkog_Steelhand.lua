-- items: 20943, 20869, 20868, 2716
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Leave me be, ye orc kissin' son o' Innoruuk!");
	elseif(e.message:findi("I am not a son of Innoruuk")) then
		e.self:Say("Eh? Ye say that ye ain't one o' the cursed dark elf dogs? Well then, laddie, are ye ready to get started or are ye here fer somethin' else??");
	elseif(e.message:findi("holy swords")) then 				--paladin epic
		e.self:Say("Eh, lad? What was that? Ye wish to hear o' holy swords? Well, lad, I ain't the one ye be needin' t' talk to!");
	elseif(e.message:findi("who do I need to talk to")) then 	--paladin epic
		e.self:Say("A follower o' the water god he be, an' one o' the most powerful holy knights e'er to walk Norrath. His name be Inte Akera, an' he kin tell ye what ye be wantin' t' know.");
	elseif(e.message:findi("where is inte akera")) then  		--paladin epic
		e.self:Say("Ah, I see ye wish t' speak with him! Why didn't ye say that earlier, laddie? It would've saved ye some trouble! If ye wish to speak with him, ye must donate some spare change t' me ale.. er, t' me holy crusade fund! Well, lad, what d' ye say?");
	elseif(e.message:findi("donate")) then  					--paladin epic
		e.self:Say("Eh? Oh, 500 platinum will be plenty, laddie!");
	elseif(e.message:findi("ready to get started")) then  		--paladin test of spirit
		e.self:Say("Well then! You best go out an get me a silvery girdle, a diaphanous globe, an a ivory sky diamond! Come on back with them and you'll get a nice belt.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20943, item2 = 20869, item3 = 20868})) then --paladin test of spirit using silvery girdle, diaphanous globe, ivory sky diamond 
		e.other:SummonItem(2716);  --girdle of faith
		e.other:AddEXP(100000);
		e.self:Say("There ya go laddie!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {platinum = 500})) then
		e.self:Say("Thank ye, laddie! He's awaitin' ya up top!");
		eq.spawn2(71091,0,0,-586,767,176,128); -- NPC: Inte_Akera
		eq.depop();
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
