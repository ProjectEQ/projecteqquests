function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18714) == true) then
		e.other:Message(15,"As you get your bearings, a healing energy seems to sweep over you and an almost etheral voice seems to echo in your mind. 'Welcome young cleric of Rodcet. I am Priestess Jahnda. Read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Life. where the will of Rodcet Nife, the Prime Healer, is carried out.  I am the High Priestess Jahnda.  If you require any training in our ways. please talk to any of our priests or any of the paladins of the Temple of Life.");
	elseif(e.message:findi("blessed oil")) then
		e.self:Say("I do not distribute the blessed oil of life. Please speak with Nomsoe Jusagta. Tell Nomsoe that Brother Estle needs the blessed oil.");
	elseif(e.message:findi("hayle mool")) then
		e.self:Say("Brother Hayle Mool is one of our finest clerics. He could convert anyone to the ways of Rodcet Nife. Recently, he has been out in the [Plains of Karana] trying to befriend the [Splitpaw clan]. I pray he has not become their prisoner or even worse, their dinner.");
	elseif(e.message:findi("paw")) then
		e.self:Say("Paw is a gnoll burrow. It is said to be located somewhere in the Plains of Karana. The gnolls of this burrow is rarely seen. The fur of these gnolls is white, unlike their brothers in Blackburrow.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18714})) then -- Tattered Note
		e.self:Say("Welcome to the Temple of Life. I am Jahnda. the High Priestess of the Clerics of Nife. Wear this tunic with pride and carry out the will of Nife. Please. see Tonmerk Plorsin or Nomsoe Jusagta. They will help get you started spreading the will of The Prime Healer.");
		e.other:SummonItem(13506); -- Faded Tunic*
		e.other:Ding();
		e.other:Faction(257,100,0); -- Priest of Life
		e.other:Faction(183,30,0); -- Knight of Thunder
		e.other:Faction(135,50,0); -- Guards of Qeynos
		e.other:Faction(21,-25,0); -- Bloodsabers
		e.other:Faction(9,15,0); -- Antonius Bayle
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
