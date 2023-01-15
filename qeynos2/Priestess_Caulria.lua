-- items: 13949, 13298, 15226, 13950, 13951
function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the holy Temple of Life. Your presence shows an interest in our ways. We are the followers of the [Prime Healer] and would gladly open our arms to any who [serve Rodcet Nife]. Do we not all owe our lives to the sustaining force of the Prime Healer?");
	elseif(e.message:findi("serve the prime healer") or e.message:findi("serve the rodcet nife")) then
		if(fac < 5) then
			e.self:Say("Then you are commanded by the Prime Healer to go into the surrounding terrirories of Qeynos and destroy any rabid creatures you may encounter. There will not be an outbreak of disease within reach of the Temple of Life, see to it! Bring me pelts of any rabid beast as proof of your good deed.");
		else
			e.self:Say("The Temple of Life smiles upon you, friend.. but such a delicate matter can only be entrusted to our most loyal members.");
		end
	elseif(e.message:findi("prime healer") or e.message:findi("rodcet nife")) then
		e.self:Say("The Prime Healer is Rodcet Nife. The one whose power flows through your body. He is the air that you breathe. To serve Him is to serve every living creature. Do you wish to [serve the Prime Healer] or do you [need more time for contemplation]?");
	elseif(e.message:findi("contemplation")) then
		e.self:Say("I understand. Sometimes a person can be filled with the lies of so many other false deities that he cannot see the truth when it lies in front of him.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);

	if(item_lib.check_turn_in(e.trade, {item1 = 13949})) then
		if(fac < 5) then
			e.self:Say("I see you have rid our land of a beast tainted with the blood of Bertoxxulous. The Prime Healer shall look favorably upon your soul. Here is our thanks and just in case the beast may have bitten you...");
			e.self:CastSpell(213,e.other:GetID()); -- Spell: Cure Disease
			e.other:Ding();
			e.other:Faction(219,1,0);   -- Antonius Bayle
			e.other:Faction(262,2,0); -- Guards of Qeynos
			e.other:Faction(221,-1,0); -- Bloodsabers
			e.other:Faction(280,1,0); -- Knights of Thunder
			e.other:Faction(341,5,0); -- Priests of Life
		else
			e.self:Say("The Temple of Life smiles upon you, friend.. but such a delicate matter can only be entrusted to our most loyal members.");
			e.other:SummonItem(13949); -- Item: Diseased Wolf Pelt
		end
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13298})) then
		if(fac < 5) then
			e.self:Say("Oh dear. The disease has spread to the realm of the Treefolk. It must have been difficult to kill such a large and rabid beast. Here. Take one of my personal scrolls as thanks for such a brave act of devotion. I pray you can use it. If not, then perhaps one of your fellow adventurers can.");
			e.self:CastSpell(213,e.other:GetID()); -- Spell: Cure Disease
			e.other:SummonItem(15226); -- Item: Spell: Endure Disease
			e.other:Ding();
			e.other:Faction(219,1,0);   -- Antonius Bayle
			e.other:Faction(262,2,0); -- Guards of Qeynos
			e.other:Faction(221,-1,0); -- Bloodsabers
			e.other:Faction(280,1,0); -- Knights of Thunder
			e.other:Faction(341,5,0); -- Priests of Life
		else
			e.self:Say("The Temple of Life smiles upon you, friend.. but such a delicate matter can only be entrusted to our most loyal members.");
			e.other:SummonItem(13298); -- Item: Putrid Bear Hide
		end
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13950})) then
		e.self:Say("This is odd. This could explain the increase in the number of beasts within the lands surrounding Qeynos. You must take this to Freeport. Here. You must speak with Lorme Tredore. Show him this pellet. You had best gear up for the trip. Freeport is very far away. Here is some gold. Outfit yourself at our expense.");
		e.other:SummonItem(13951); -- Item: Fleshy Orb
		e.other:Ding();
		e.other:Faction(219,1,0);   -- Antonius Bayle
		e.other:Faction(262,2,0); -- Guards of Qeynos
		e.other:Faction(221,-1,0); -- Bloodsabers
		e.other:Faction(280,1,0); -- Knights of Thunder
		e.other:Faction(341,5,0); -- Priests of Life
		e.other:AddEXP(500);
		e.other:GiveCash(0,0,6,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
