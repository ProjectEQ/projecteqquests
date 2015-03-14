-- Quest for Akbaq_Salid in erudnint - Titan Samples (good) 


function event_say(e)
	if (e.other:GetFaction(e.self) <= 5) then --Require indifferent or greater faction    
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, " .. e.other:GetName() .. ". I have recently returned to Erudin since hearing word of the titan spirits that inhabit the Stonebrunt Mountains. Should you be heading in that direction there are some [samples] that I am interested in acquiring."); 
		elseif(e.message:findi("sample")) then
			e.self:Say("The titan spirits of the Stonebrunt Mountains appear in several various animal forms seemingly with different areas of influence in the spirit world. I am interested in conducting some experiments on the hides of the giant leopard titan and the giant sabretooth titan. Once I have acquired those hides I will seek to conduct experiments on the [others]."); 
		elseif(e.message:findi("other")) then
			e.self:Say("Once I have finished my studies of the feline titans pelts I am interested in experimenting with the hides of the strongest of the stonebrunt titans. the gigantic gorilla and the gargantuan panda. The [ancient snake] that inhabits those mountains is another matter that you may be interested in as well."); 
		elseif(e.message:findi("ancient snake")) then
			e.self:Say("I believe I have uncovered a process with which to harness the mystical properties of the scales of the snake titan so that they can be fashioned into a powerful robe. If you bring me the ancient snake skin and some platinum thread I am sure there will be enough material to craft multiple robes and I shall reward you with one for your assistance."); 
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if (e.other:GetFaction(e.self) <= 5) then -- Require indifferent or greater faction 
		if(item_lib.check_turn_in(e.trade, {item1 = 6960,item2 = 6946})) then -- astral cloak of the titans 
			e.self:Say("These are the pelts of the most powerful of the known Titan spirits. You have done well, $name, and you will be rewarded for your services."); 
			e.other:Ding();
			e.other:Faction(60,10,0); -- Crimson hands 
			e.other:Faction(145,10,0); -- High Council of Erudin 
			e.other:Faction(143,-30,0); -- Heretics decreased 
			e.other:Faction(147,10,0); -- High Guards of Erudin 
			e.other:AddEXP(500); 
			e.other:SummonItem(2573); 
		elseif(item_lib.check_turn_in(e.trade, {item1 = 6958,item2 = 6964})) then -- astral leggings of the titans 
			e.self:Say("Excellent! These pelts are in fine condition. I was unsure what would happen to the physical forms of the titans when slain in this realm.");      
			e.other:Ding();
			e.other:Faction(60,10,0); -- Crimson hands 
			e.other:Faction(145,10,0); -- High Council of Erudin 
			e.other:Faction(143,-30,0); -- Heretics decreased 
			e.other:Faction(147,10,0); -- High Guards of Erudin 
			e.other:AddEXP(500); 
			e.other:SummonItem(2575); 
		elseif(item_lib.check_turn_in(e.trade, {item1 = 6947,item2 = 12097})) then -- scaled robe of the elder serpent 
			e.self:Say("Ah! I have been anxiously awaiting the oppurtunity to craft some powerful robes from these mystical scales."); 
			e.other:Ding();
			e.other:Faction(60,10,0); -- Crimson hands 
			e.other:Faction(145,10,0); -- High Council of Erudin 
			e.other:Faction(143,-30,0); -- Heretics decreased 
			e.other:Faction(147,10,0); -- High Guards of Erudin 
			e.other:AddEXP(500); 
			e.other:SummonItem(2574); 
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
 
-- END of FILE Zone:erudnint  ID:23077 -- Akbaq_Salid