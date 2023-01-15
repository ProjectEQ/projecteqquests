-- Converted to .lua by Speedz
-- items: 10989, 10993, 11080

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". It is my duty to train young gnomes that have been called to they ways of Bertoxxulous, the Plague Bringer, and wish to [serve as a cleric] of the Dark Reflection. The faithful of the Plague Bringer are gifted with the sight of the Dark Reflection. The ability to recognize the importance of the powerful forces of disease and decay, and the role they play in the cycles of deterioration and renewal, death and life, destruction and creation.");
	elseif(e.message:findi("serve as a cleric")) then
		e.self:Say("We have been blessed by Bertoxxulous with the vision of the Dark Reflection. We are the prophet and protectors of all who serve the Plague Bringer and have devoted our lives to spreading disease and decay for the glory of Bertoxxulous and the balances that must be maintained. Take this parchment to Glerbella Gibblix, she will assist you with the construction of a suit of armor to aid in protecting you from the weapons of those who would see us destroyed. When you have been properly outfitted return to me for your [next task].");
		e.other:SummonItem(10989); -- Item: Parchment to Glerbella
	elseif (e.message:findi("next task")) then
		e.self:Say("We faithful of Bertoxxulous are misunderstood even by the majority of the gnomes of Ak'Akanon. The Eldrich Collective and the Deep Muses would have us chased from the Mines of Malfunction and exiled from these lands. They are not gifted with the vision of the Dark Reflection and thus are blind to the necessity of our actions. In the Steamfont Mountains you will find a Cleric of the Deep Muses, Vyntok Bonkle. Vyntok has been aiding others of our enemies in their mission to eliminate the Dark Reflection from Ak'Anon. Find Vyntok and slay him. When you have accomplished this task return to me with Vyntok's Mace.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10993})) then
		e.self:Say("It is good you returned with this. I almost thought you had lost to Vyntok, or worse become merciful to his cause. I suppose a reward is in order. A mace for a mace, now go forth and spread the word of Bertoxxulous.");
		e.other:SummonItem(11080); -- Item: Plague Raiser Mace
		e.other:AddEXP(100);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
