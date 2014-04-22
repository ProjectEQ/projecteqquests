function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18780)) then
		e.other:Message(15,"As you enter a darkly lit room, a stern, important looking High Elf greets you.  'Welcome to you. I am Yeolarn Bronzeleaf, Guild Master for the Clerics of Tunare here in Felwithe. Read the note in your inventory and when you are ready to begin your training, please hand me your note.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! We of Tunare are charged with protecting the Great Mother from the forces of Innoruuk. Even now, the evil minions of this foul deity are despoiling our great forest. Will you help us [protect the Mother]?");
	elseif(e.message:findi("protect")) then
		e.self:Say("Just outside the gates of Felwithe, the forces of Innoruuk gather in the guise of decaying skeletons. Bring me four sets of bone chips as proof of your vigilance. I assure you, your faith shall not go unrewarded.");
	elseif(e.message:findi("initiate of tunare")) then
		e.self:Say("The Teir'Dal behind the undead plague in our forest have discovered a means of creating a terrible undead called a Ghast. These Ghasts have been sighted in the Lesser Faydark and must be destroyed. Bring me four of the vile creatures hearts.");
	elseif(e.message:findi("slay the necromancer")) then
		e.self:Say("The Fier'Dal rangers that inhabit the Lesser Faydark have spotted a courier making deliveries to the Teir'Dal camp near Castle Mistmoore and to a necromancer that lingers near the ancient obelisk. We believe that the crates he carries are supplies needed for the creation of more Ghasts. Another shipment should be arriving soon. Seek out the necromancer at the obelisk and take his head then take the head of the courier and return them to me with the crate that the courier carries and your Initiate Symbol of Tunare.");
	elseif(e.message:findi("warden of tunare")) then
		e.self:Say("The crate that the you recovered from the Courier contained this black candlestick that radiates an aura of great magical power. I request that you deliver the candlestick to Lady Trilani who is studying with the High Men in Erudin. Perhaps she can divine the nature of the candlestick and offer aid in defeating its power. The remaining contents of the crate have been given to Crusader Swiftmoon to be delivered to a gnome in steamfont that is purchasing them on behalf of the Eldrich Collective. When you return be sure to present your Disciple Symbol to me with anything that Trilani may ask you to deliver.");
		e.other:SummonItem(1598); -- Black Stone Candlestick
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13073,item2 = 13073,item3 = 13073,item4 = 13073})) then --Bone Chips x 4
		e.self:Say("Praise Tunare! I knew you would be victorious. I reward you with this spell, and pray that it will help you in your fight against the unholy forces of Innoruk. When you are ready you will make a fine [Initiate of Tunare].");
		e.other:SummonItem(15014); --Spell: Strike
		e.other:Ding();
		e.other:Faction(43,15,0);  --Clerics of Tunare
		e.other:Faction(178,15,0); --King Tearis Thex
		e.other:Faction(8,15,0);   --Anti-mage
		e.other:AddEXP(2500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10199,item2 = 10199,item3 = 10199,item4 = 10199})) then --Putrescent Heart x 4
		e.self:Say("Praise Tunare!! You have done well young Initiate. Here the symbol of your station within our faith. Return to me when you are ready to [slay the necromancer] that has been creating the undead.");
		e.other:SummonItem(1570); --Initiate Symbol of Tunare
		e.other:Ding();
		e.other:Faction(43,15,0);  --Clerics of Tunare
		e.other:Faction(178,15,0); --King Tearis Thex
		e.other:Faction(8,15,0);   --Anti-mage
		e.other:AddEXP(3250);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1570,item2 = 12514,item3 = 19065,item4 = 12513})) then --Initiate Symbol of Tunare, Larik Z`Vole's Head, Teir`Dal Couriers Head, Teir`Dal Crate
		e.self:Say("Praise Tunare! The Mother smiles on you this day Disciple Angelsyn! I present you with the symbol of your new station among the Priests of Tunare. Return to me when you are ready to become a [Warden of Tunare]?");
		e.other:SummonItem(1571); -- Disciple Symbol of Tunare
		e.other:Ding();
		e.other:Faction(43,15,0);  --Clerics of Tunare
		e.other:Faction(178,15,0); --King Tearis Thex
		e.other:Faction(8,15,0);   --Anti-mage
		e.other:AddEXP(4000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1571,item2 = 1599})) then --Disciple Symbol of Tunare, Powder of Unanimation
		e.self:Say("Praise Tunare!! I will have our sorcerers examine this power immediately to see if we can reproduce it in quantities enough to eliminate the undead plague. I award you the rank of Warden of Tunare, the All Mother smiles upon you, $name!");
		e.other:SummonItem(1572); -- Warden Symbol of Tunare
		e.other:Ding();
		e.other:Faction(43,15,0);  --Clerics of Tunare
		e.other:Faction(178,15,0); --King Tearis Thex
		e.other:Faction(8,15,0);   --Anti-mage
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18780})) then --Tattered Note
		e.self:Say("Welcome, friend, to the Clerics of Tunare. I am Yeolarn Bronzeleaf, head of the guild and devout follower of Tunare. Here is your guild tunic - it will help to protect you against this world's evils. Once you are ready to begin your training please make sure that you see Terren Starwatcher, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13590); --Faded Gold Training Tunic*
		e.other:Ding();
		e.other:Faction(43,100,0);  --Clerics of Tunare
		e.other:Faction(178,100,0); --King Tearis Thex
		e.other:Faction(8,75,0);   --Anti-mage
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwithea  ID:61025 -- Yeolarn_Bronzeleaf.pl