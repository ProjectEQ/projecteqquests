-- items: 14334, 18169, 14335, 18168, 14337, 14338, 14339, 14340
function event_spawn(e)
	eq.set_timer("ArantirDepop",640000);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(e.message:findi("hail")) then
		if(qglobals["wizepicB"] == "1") then
			e.self:Say("Ah yes, you again. Do you have the items? Give me the three you possess and I'll combine them with my own.");
		elseif(qglobals["wizepicA"] == "1") then
			e.self:Say("Ah, but it pains my heart to see this. How I could love a women like that is beyond me. And yet, I still do love her. It was on the day I was to ask her to marry me that I lost my powers. When I was about to cast my greatest spell to prove my love to her, my magic failed. She ran out on me that day. But enough of me, do you wish to hear my story?");
		else
			e.self:Say("Before I tell you anything, I require you to help me. Seek a woman named Challice. Give her this ring and then return to me.");
			e.other:SummonItem(14334); -- Item: Arantir's Ring
		end
	elseif(e.message:findi("story")) then
		e.self:Say("I once was one of four true followers of Solusek Ro. So great were the four of us that Solusek Ro himself made us each a special item. We did not know what the others' items were, but we realized that was for our own safety. Each one of us, after receiving the item, began to plot against Solusek Ro. Each of us believed we had enough power to dominate Norrath. Solusek Ro saw this and at the time we needed our powers most, he stripped us of them. Now I know two of the other wizards by name. One was called Sylen Tyrn, the other's name was Demunir Scry. The last wizard was a gnome, but I can't think of his name.");
	elseif(e.message:findi("Sylen Tyrn")) then
		e.self:Say("Sylen was a high elf wizard, and like many high elves, he believed himself to be better than others. Because of his birth, he thought he was more noble and more intelligent than anyone else. I heard how met his demise - while flying over a vast area of water, his powers were stripped from him in midflight. He fell and was captured by a rival wizard who specialized in magics of the water. Search for that wizard and you could find a trace of Sylen.");
	elseif(e.message:findi("Demunir Scry")) then
		e.self:Say("Demunir was a human in a rush for power. He was extremely intelligent and resourceful but, unfortunately, was more interested in destructive magic. Hearing of an ancient land, he immediately traveled to it, believing there to be powerful relics left undiscovered there. While exploring, he came upon a dwelling that housed a powerful warrior. Believing himself to be more powerful, he attempted to take this dwelling for himself. While in battle with this warrior, Solusek Ro stole his powers and left him helpless. It is said that Demunir's item is the warrior's most prized trophy.");
	elseif(e.message:findi("the gnome") and e.other:Class() == "Wizard") then
		e.self:Say("Ah, the gnome I know very little about. I know he was small and crafty, and that he had a brother. His brother's craft was that of making fireworks, and he was the unfortunate victim of one of his own experiments. His firework exploded, leaving his mind diminished in capacity, even for a gnome. I remember others calling him 'Old Stewpot' in jest. I do not know if this is his birth name, but it may help you to locate him. I hear he also stays close to water because of the explosion. You never know when another gnomish invention will go awry. Give him this letter to help motivate him to remember.");
		e.other:SummonItem(18169); -- Item: Note from Arantir
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
		
	if(item_lib.check_turn_in(e.trade, {item1 = 14335})) then		--Return Love Note handin
		eq.set_global("wizepicA","1",1,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18168})) then	--Return Oil Note handin
		eq.delete_global("wizepicA");
		eq.set_global("wizepicB","1",1,"F");
	end
	if(qglobals["wizepicB"] ~= nil) then
		if(item_lib.check_turn_in(e.trade, {item1 = 14337, item2 = 14338, item3 = 14339})) then --Staff of Gabstik, Blue Crystal Staff, Gnarled Staff
			e.self:Say("Here, this pack contains all of our items. You will never be able to open it again, so you must deliver the pack, intact, to Solomen. He will then reward you. Now that I have helped you, leave me in peace.");
			e.other:Ding();
			e.other:SummonItem(14340); -- Item: Magically Sealed Bag
			e.other:Faction(404, 30,0); 									--Truespirit
			eq.delete_global("wizepicA");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("ArantirDepop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
