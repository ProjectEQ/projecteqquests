-- Fixxin Followigs Silvery Blades
-- items: 16500, 18178

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s! Fixxin is my moniker. Nice ta see ya. I am a member of the [Fangbreakers] and we are hunting [werewolves]. We run into lots of other [creepies] out here as well.",e.other:GetName()));
	elseif(e.message:findi("fangbreaker")) then
		e.self:Say("Fangbreakers? You have not heard of us? We are the best [werewolf] hunters there are!");
	elseif(e.message:findi("werewolves")) then
		e.self:Say("Those blasted fiends hide among normal folk during the day, but at night their bloodlust is set free on an innocent populace. Some claim there is a cure for their condition but the only one we know of is an [enchanted blade] through the bellies of the beasts.");
	elseif(e.message:findi("enchanted blade")) then
		e.self:Say("Interested in an enchanted blade? You wouldn't be planning on hunting the moon beasts without a strong, well-oiled party to back you up, now, would you? Well, in any case, I'll gladly lend you a copy of my book, Fixxin Followigs Silvery Blades, if you will fetch me a bar of silver. My supply is running low and our weapons are in need of repair after the deaths of so many lycanthropes.");
	elseif(e.message:findi("creepies")) then
		e.self:Say("Besides the occasional werewolf, we also tend to run across many griffons and hill giants out this way. Those giants can be bruisers but against a trained team such as we, they don't stand a chance. Especially with my enchantments protecting us.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 16500})) then
		e.self:Say(string.format("thanks %s heartily. 'Here is the book as promised. I wish you luck with your enchanted weapons. May they slay many lycanthropes before they go dull.'",e.other:GetName()));
		e.other:SummonItem(18178); -- Item: Fixxin Followigs Silvery Blades
		e.other:Ding();
		e.other:Faction(345,10,0); -- karana residents
		e.other:Faction(262,10,0); -- guards of qeynos
		e.other:Faction(341,10,0); -- priests of life
		e.other:Faction(280,10,0); -- knights of thunder
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: northkarana ID: 13063 NPC: Fixxin_Followig 

