--dulak/Ritald.lua NPCID 225230
--Shadowknight Epic Prequest
--alot of this logic is to prevent doing this quest if you already have your 1.0 or if you've previously done the prequest
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:Class() == "Shadowknight") then
		if(e.other:HasItem(41000)) then --Have Epic 1.0 Innoruuk's Curse
		else --Doesnt have epic 1.0 Innoruuk's Curse
			if(e.message:findi("hail") and qglobals["shadowknight_pre"] == nil) then
				e.self:Say("Greetings, dark one. Do you feel it? I am sure you do. Innoruuk's voice is so distant now. His voice is merely a whisper. This disturbs me greatly. How will the evil ones do their master's bidding without his dark guidance? I fear the end is almost near for true champions of darkness such as yourself. We cannot let that happen! I believe I know of a way to slow down the diminishing of our master's voice. There is a sword of great evil. It is however not of this world. I believe I can summon it to this plane of existence, but I will need several items first. Will you [take on this task]? Your future and the future of all our dark brethren depends on obtaining this sword!");
				eq.set_global("shadowknight_pre","1",5,"F"); --Flagged for Prequest
			end
			if(e.message:findi("take on this task") and qglobals["shadowknight_pre"] == "1") then 
				e.self:Say("Excellent. There is no time to waste. The first item I need is an ancient flamberge of hatred. I believe a trollish pirate named, Captain Varns, here in Dulak's Harbor is in possession of one. Destroy him and return this item to me. The second item is an essence of hate. You should be able to find such an essence in the Plane of Hate. The last item I need is a stormborn phylactery. You should be able to find one in the Plane of Storms. When you have all these items, hand them to me so that I may begin the summoning of the sword.");
			end
			if(e.message:findi("have done it") and e.other:HasItem(22944))	then
				e.self:Say("This sword known as Innoruuk's Voice emanates great evil. It should help to generate enough evil to sustain the mysterious powers that make one a shadowknight. It is not at full power yet however. I am now trusting you to take this sword and help to recover its full power. You will be its new champion. Take it to Sienn Kastane in the Plane of Knowledge. I believe she should be able to help you with returning the sword to its full power.");
			end
		end
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 55902, item2 = 21870, item3 = 21782}) and qglobals["shadowknight_pre"] == "1") then --hand in Ancient Flamberge of Hatred (drops from Captain Varns in dulaks), Essence of Hate (Drops from nameds in PoHate), and Stormborn Phylactery (drops from Olidan in PoStorms)
		e.self:Say("You have done well. The flamberge you have brought to me will act as a vessel for the summoning of the sword. The essence of hate will help generate hatred needed to fuel the summoning, and the phylactery should hopefully help contain that hate to be used in the summoning.");
		e.self:Emote("Ritald holds the flamberge above his head with both hands and begins to chant. Dark storm clouds gather overhead as a flash of lightning momentarily blinds you. When you regain your sight, Ritald holds the summoned sword of Innoruuk's Voice.");
		e.self:Say("I [have done it]!");
		e.other:SummonItem(22944); --statless Innoruuk's Voice
		eq.set_global("shadowknight_pre","2",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	